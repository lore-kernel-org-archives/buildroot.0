Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EA6C4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 17:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACBD402C8;
	Mon, 27 Nov 2023 17:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACBD402C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SeCco1qkkfHs; Mon, 27 Nov 2023 17:09:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA363402FD;
	Mon, 27 Nov 2023 17:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA363402FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69AF71BF860
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 17:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42327405E1
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 17:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42327405E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ov1kQ6phwpAV for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 17:09:26 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5508D405D6
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 17:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5508D405D6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E0624B00596;
 Mon, 27 Nov 2023 18:09:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 18:09:18 +0100
Date: Mon, 27 Nov 2023 18:09:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Petr Vorel <pevik@seznam.cz>
Message-ID: <20231127170918.GS3177259@scaer>
References: <20231116201629.2623827-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231116201629.2623827-1-pevik@seznam.cz>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701104963;
 bh=ZBaVlYNgT8SG2UjelTwbodX8vJSHrPD1KRgI5KYKkwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCuxBEFcAC/uCjjDBt4Mt+LpPd97PAbe396hvgGIS3PJn2eu8tPUIsODXr0R+5QIt
 LHErfOiisn5IUusUfzDYXHH+68vFCUMYtgDl0UCBniSTs0CGHYv9AW0VJnVZ8DnRis
 5zQHuDsOxddbXwItVZWpUjYz5JDDe2RGtoBRlMGwtW+zOlBI0HT+Ie3Yun8+/sy4b+
 J3DaRlu2pEzPcu7l5LRuLEY3cpKJJ1mjaEUN5ANE6xFeqITwfYOcbUICIDL8MpGPEQ
 yPVMcuNqcexJ71LZ/vc5MWnr70dMSpS8y7p7vKffJbopzkyt8JbUqzVcFO24b5jzRH
 lQnp2Ny/395tA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uCuxBEFc
Subject: Re: [Buildroot] [PATCH 1/1] package/nfs-utils: fix build failure
 due to glibc <= 2.24
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Petr, All,

On 2023-11-16 21:16 +0100, Petr Vorel spake thusly:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Backport upstream patches that check if <sys/random.h> exists or not. If
> it doesn't exist it uses uses the corresponding syscall.
> 
> NOTE: This would not be enough on Linux kernel < 3.17, but that's old
> enough.

I guess that's about kernel headers, i.e. that would cause a build
filure, not a runtime one?

If so, that would need a dependency on kern el headers;

    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17

> Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> I'm sorry for the noise (I sent unsubscribed).
> 
> NOTE: I was not able to test the build, therefore it *should* fix it.

Giulio reported build failures with this patch applied, and also:

[--SNIP--]
> diff --git a/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch b/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
> new file mode 100644
> index 0000000000..0331a8c9f8
> --- /dev/null
> +++ b/package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
> @@ -0,0 +1,42 @@
> +From 1a4edb2aa6b9b88fcdcb8d82b262467d06527623 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Fri, 10 Nov 2023 10:35:33 -0500
> +Subject: [PATCH 1/3] reexport/fsidd.c: Remove unused headers

    $ make check-package
    package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch:4: generate your patches with 'git format-patch -N'
    package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch:4: generate your patches with 'git format-patch -N'
    package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch:4: generate your patches with 'git format-patch -N'

Regards,
Yann E. MORIN.

> +
> +Some of them are needed but included elsewhere, e.g. <string.h>
> +included in xcommon.h, but at least <sys/random.h> is removed due
> +further code simplification.
> +
> +Fixes: 6fd2732d ("export: Add fsidd")
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=1a4edb2aa6b9b88fcdcb8d82b262467d06527623
> +---
> + support/reexport/fsidd.c | 10 ----------
> + 1 file changed, 10 deletions(-)
> +
> +diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
> +index d4b245e8..3e62b3fc 100644
> +--- a/support/reexport/fsidd.c
> ++++ b/support/reexport/fsidd.c
> +@@ -7,16 +7,6 @@
> + #include <dlfcn.h>
> + #endif
> + #include <event2/event.h>
> +-#include <limits.h>
> +-#include <stdint.h>
> +-#include <stdio.h>
> +-#include <sys/random.h>
> +-#include <sys/socket.h>
> +-#include <sys/stat.h>
> +-#include <sys/types.h>
> +-#include <sys/un.h>
> +-#include <sys/vfs.h>
> +-#include <unistd.h>
> + 
> + #include "conffile.h"
> + #include "reexport_backend.h"
> +-- 
> +2.42.0
> +
> diff --git a/package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch b/package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch
> new file mode 100644
> index 0000000000..23d3e80ada
> --- /dev/null
> +++ b/package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch
> @@ -0,0 +1,43 @@
> +From bdc79f02c17fc9ec7461d48007105caac789cef4 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Fri, 10 Nov 2023 10:39:05 -0500
> +Subject: [PATCH 2/3] support/reexport.c: Remove unused headers
> +
> +Some of them are needed but included elsewhere, e.g. <sys/socket.h>
> +included in nfslib.h or <string.h> included in xcommon.h, but at least
> +<sys/random.h> is removed due further code simplification.
> +
> +Fixes: 878674b3 ("Add reexport helper library")
> +Reviewed-by: Richard Weinberger <richard@nod.at>
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bdc79f02c17fc9ec7461d48007105caac789cef4
> +---
> + support/reexport/reexport.c | 7 -------
> + 1 file changed, 7 deletions(-)
> +
> +diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
> +index d9a700af..78516586 100644
> +--- a/support/reexport/reexport.c
> ++++ b/support/reexport/reexport.c
> +@@ -5,16 +5,9 @@
> + #ifdef HAVE_DLFCN_H
> + #include <dlfcn.h>
> + #endif
> +-#include <stdint.h>
> +-#include <stdio.h>
> +-#include <sys/random.h>
> +-#include <sys/stat.h>
> + #include <sys/types.h>
> + #include <sys/vfs.h>
> +-#include <unistd.h>
> + #include <errno.h>
> +-#include <sys/socket.h>
> +-#include <sys/un.h>
> + 
> + #include "nfsd_path.h"
> + #include "conffile.h"
> +-- 
> +2.42.0
> +
> diff --git a/package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch b/package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch
> new file mode 100644
> index 0000000000..71c42f74b1
> --- /dev/null
> +++ b/package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch
> @@ -0,0 +1,113 @@
> +From f92fd6ca815025c435dabf45da28472ac0aa04a4 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Fri, 10 Nov 2023 10:59:29 -0500
> +Subject: [PATCH 3/3] support/backend_sqlite.c: Add getrandom() fallback
> +
> +Allow to compile reexport on systems with older libc. (getrandom()
> +wrapper is supported on glibc 2.25+ and  musl 1.1.20+, uclibc-ng does
> +not yet support it).
> +
> +getrandom() syscall is supported Linux 3.17+ (old enough to bother with
> +a check).
> +
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=f92fd6ca815025c435dabf45da28472ac0aa04a4
> +---
> + Makefile.am                       |  1 +
> + aclocal/getrandom.m4              | 16 ++++++++++++++++
> + configure.ac                      |  3 +++
> + support/reexport/backend_sqlite.c | 18 +++++++++++++++++-
> + 4 files changed, 37 insertions(+), 1 deletion(-)
> + create mode 100644 aclocal/getrandom.m4
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 00220842..72ad4ba7 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -10,6 +10,7 @@ EXTRA_DIST = \
> + 	autogen.sh \
> + 	\
> + 	aclocal/bsdsignals.m4 \
> ++	aclocal/getrandom.m4 \
> + 	aclocal/nfs-utils.m4 \
> + 	aclocal/kerberos5.m4 \
> + 	aclocal/tcp-wrappers.m4 \
> +diff --git a/aclocal/getrandom.m4 b/aclocal/getrandom.m4
> +new file mode 100644
> +index 00000000..bc0fe16a
> +--- /dev/null
> ++++ b/aclocal/getrandom.m4
> +@@ -0,0 +1,16 @@
> ++dnl Checks for getrandom support (glibc 2.25+, musl 1.1.20+)
> ++dnl
> ++AC_DEFUN([AC_GETRANDOM], [
> ++    AC_MSG_CHECKING(for getrandom())
> ++    AC_LINK_IFELSE(
> ++		[AC_LANG_PROGRAM([[
> ++		   #include <stdlib.h>  /* for NULL */
> ++		   #include <sys/random.h>
> ++		]],
> ++		[[ return getrandom(NULL, 0U, 0U); ]] )],
> ++		[AC_DEFINE([HAVE_GETRANDOM], [1], [Define to 1 if you have the `getrandom' function.])
> ++		AC_MSG_RESULT([yes])],
> ++		[AC_MSG_RESULT([no])])
> ++
> ++	AC_SUBST(HAVE_GETRANDOM)
> ++])
> +diff --git a/configure.ac b/configure.ac
> +index 6fbcb974..4bff679d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -277,6 +277,9 @@ AC_TCP_WRAPPERS
> + # Arrange for large-file support
> + AC_SYS_LARGEFILE
> + 
> ++dnl Check for getrandom() libc support
> ++AC_GETRANDOM
> ++
> + AC_CONFIG_SRCDIR([support/include/config.h.in])
> + AC_CONFIG_HEADERS([support/include/config.h])
> + 
> +diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
> +index 132f30c4..0eb5ea37 100644
> +--- a/support/reexport/backend_sqlite.c
> ++++ b/support/reexport/backend_sqlite.c
> +@@ -7,9 +7,16 @@
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <string.h>
> +-#include <sys/random.h>
> + #include <unistd.h>
> + 
> ++#ifdef HAVE_GETRANDOM
> ++# include <sys/random.h>
> ++# if !defined(SYS_getrandom) && defined(__NR_getrandom)
> ++   /* usable kernel-headers, but old glibc-headers */
> ++#  define SYS_getrandom __NR_getrandom
> ++# endif
> ++#endif
> ++
> + #include "conffile.h"
> + #include "reexport_backend.h"
> + #include "xlog.h"
> +@@ -20,6 +27,15 @@
> + static sqlite3 *db;
> + static int init_done;
> + 
> ++#if !defined(HAVE_GETRANDOM) && defined(SYS_getrandom)
> ++/* libc without function, but we have syscall */
> ++static int getrandom(void *buf, size_t buflen, unsigned int flags)
> ++{
> ++	return (syscall(SYS_getrandom, buf, buflen, flags));
> ++}
> ++# define HAVE_GETRANDOM
> ++#endif
> ++
> + static int prng_init(void)
> + {
> + 	int seed;
> +-- 
> +2.42.0
> +
> -- 
> 2.42.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
