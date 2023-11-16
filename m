Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980A2C197A0
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 21:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20A6E40191;
	Thu, 16 Nov 2023 21:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20A6E40191
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TItfWHsP6ViH; Thu, 16 Nov 2023 21:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7063F41527;
	Thu, 16 Nov 2023 21:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7063F41527
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C60A61BF3DA
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 21:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EF13415FD
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 21:50:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EF13415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0VE3CJsSPks for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 21:50:04 +0000 (UTC)
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5EBC415BA
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 21:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5EBC415BA
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3kFKrrYQ1xypA3kFLrvdw3; Thu, 16 Nov 2023 22:49:59 +0100
Message-ID: <309e8ae9-47a4-4c49-9e69-09eec14b225a@benettiengineering.com>
Date: Thu, 16 Nov 2023 22:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
References: <20231116192104.2618421-1-pevik@seznam.cz>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231116192104.2618421-1-pevik@seznam.cz>
X-CMAE-Envelope: MS4xfCpv5vHUEA+i7BUu0/lNgwpeGseKvM9znbUBDAoQeWGKOzoNFOPQ/bOfKDD8KMNkMLj5pqlq0TMFf8hfzXl7V2RvnmQIgG7VXZ/9knPcV+S+gQuBAsYM
 6lXZ2fM7ni77eX7CmMrBQ11gLVLciNO5ZSWsemNSQYVyNmNDuKJ/FM4W5Y6U4YTC7nLme7AE7PwkC0Wh7xLjMdLqAL3SNJSGcYfHSBdRk8AC+0VyHFPhHUj6
 XnIVS+VuRrvszOeh3aHkrq11jyJ1mzeY37JlWdMVioQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700171399; bh=er83zJ3hdP9ZhewarFZH0f+WDcaqD/HMFQCTQCun6Kc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=K9mIPHeN4nA1C2NhXvlL+FFsi8iKRt3Z1bUOeCksNppNuPkHsSgiXwfQGTC9d6TIg
 zKeCHribaDHyrp8+019jgTp73UxwL7LiCDT/rcFsYjik0r5OoNtfg3mZAd8jVB71iG
 3EmpCOtu4lvCUGdDTuTy+W4+G6l9YzK5+5BeTkv4VONF/Jed53Gqwqrkrv+IFVUOTY
 D6yXakXAOPyzDVon7zJsnULtzcdAU3FDPf0t5GUtuha0CcNY4d7Z1/dzlFM9i1wJY7
 CqMdtreA2NsjsHxs7hQNYEN9PAfoAcYWYy7aDxnGgoVPw1ZM8B97zVwsBiAWLyg+HM
 CWnEM/z3tHW6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=K9mIPHeN
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
Cc: Petr Vorel <petr.vorel@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

On 16/11/23 20:21, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Backport upstream patches that check if <sys/random.h> exists or not. If
> it doesn't exist it uses uses the corresponding syscall.
> 
> NOTE: This would not be enough on Linux kernel < 3.17, but that's old
> enough.
> 
> Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
> 
> NOTE: I was not able to test the build, therefore it *should* fix it.

thanks for the patch, I've just give a try but I think that the patches
that remove the headers are too aggressive. Indeed the build results in
this log:
https://pastebin.com/FAkLGE8d

To reproduce the build failure you have to issue:
$ wget 
http://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build
$ chmod a+x br-reproduce-build
$ ./br-reproduce-build c5fde6099a8b228a8bdc3154d1e47dfa192e94ed

and then you can try to apply this patch on:
c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/buildroot

and try again to fix the build failure.

For what it's worth there is a pending patch containing 2 local patches
that have not been applied upstream because your patches were better
to deal with getrandom(), but it fixes this problem:
https://patchwork.ozlabs.org/project/buildroot/patch/20231026121235.567459-1-giulio.benetti@benettiengineering.com/

Can you take a look and check the difference between my patches
and yours?

Thank you!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Kind regards,
> Petr
> 
>   ...export-fsidd.c-Remove-unused-headers.patch |  42 +++++++
>   ...ort-reexport.c-Remove-unused-headers.patch |  43 +++++++
>   ...kend_sqlite.c-Add-getrandom-fallback.patch | 113 ++++++++++++++++++
>   3 files changed, 198 insertions(+)
>   create mode 100644 package/nfs-utils/0003-reexport-fsidd.c-Remove-unused-headers.patch
>   create mode 100644 package/nfs-utils/0004-support-reexport.c-Remove-unused-headers.patch
>   create mode 100644 package/nfs-utils/0005-support-backend_sqlite.c-Add-getrandom-fallback.patch
> 
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

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
