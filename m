Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A9EC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 803CE837C4;
	Mon, 20 Feb 2023 23:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 803CE837C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDzhMWonxzWR; Mon, 20 Feb 2023 23:26:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A175283829;
	Mon, 20 Feb 2023 23:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A175283829
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 507191BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F45C4174D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F45C4174D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D5_FT7qktf3q for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D5D941594
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D5D941594
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B0D786495; Mon, 20 Feb 2023 20:52:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 21:18:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: af8200a4c3543403ca653f4064f6649a052440e1
X-Git-Newrev: 04fc02a8b7a70bc0afe17fe0625cfd2b4c55b776
X-Patchwork-Hint: ignore
Message-Id: <20230220205236.3B0D786495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sscep: fix linking
 error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=04fc02a8b7a70bc0afe17fe0625cfd2b4c55b776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Apply the patch to fix the following build failure raised since the
addition of the package in commit
72fa60dc102679f51b228336ec38f5af78ff7646:

uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `__GI_getopt':
getopt.c:(.text+0x598): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here

The patch has been submitted and accepted upstream to address this issue.

Fixes:
 - http://autobuild.buildroot.net/results/844c7dd79f69ef2ea8f293bb73a2d4b7533aa97c

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[yann.morin.1998@free.fr: do an actual bacport]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sscep/0001-Fix-getopt-linking-error.patch | 57 +++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/sscep/0001-Fix-getopt-linking-error.patch b/package/sscep/0001-Fix-getopt-linking-error.patch
new file mode 100644
index 0000000000..9427593cc3
--- /dev/null
+++ b/package/sscep/0001-Fix-getopt-linking-error.patch
@@ -0,0 +1,57 @@
+From 65561b53344b834877e6b63320066a1e26038a3c Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Fri, 9 Dec 2022 18:18:27 +0100
+Subject: [PATCH] Fix getopt linking error
+
+The buildroot project, to which the sscep application was added, has
+configurations that raise the following linking error:
+buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os):(.data+0x8): multiple definition of `optind'; src/getopt.o:(.data+0x0): first defined here
+buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `__GI_getopt':
+getopt.c:(.text+0x5a4): multiple definition of `getopt'; src/getopt.o:getopt.c:(.text+0x0): first defined here
+buildroot/output/host/lib/gcc/arc-buildroot-linux-uclibc/11.3.0/../../../../arc-buildroot-linux-uclibc/bin/ld: buildroot/output/host/bin/../arc-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(getopt.os): in function `getopt_long':
+getopt.c:(.text+0x5b0): multiple definition of `getopt_long'; src/getopt.o:getopt.c:(.text+0x128): first defined here
+collect2: error: ld returned 1 exit status
+make[2]: *** [Makefile:507: sscep] Error 1
+make[1]: *** [package/pkg-generic.mk:293: buildroot/output/build/sscep-0.10.0/.stamp_built] Error 2
+
+The patch re-added a check that commit
+81f56f635259b9 ("Replaced GNU getopt by a BSD licensed alternative")
+removed.
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+[yann.morin.1998@free.fr: make that an actual backport]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/getopt.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/getopt.c b/src/getopt.c
+index eae36a6..0109406 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -31,6 +31,16 @@
+ #include <stddef.h>
+ #include <string.h>
+ 
++#define GETOPT_INTERFACE_VERSION 2
++#if !defined _LIBC && defined __GLIBC__ && __GLIBC__ >= 2
++# include <gnu-versions.h>
++# if _GNU_GETOPT_INTERFACE_VERSION == GETOPT_INTERFACE_VERSION
++#  define ELIDE_CODE
++# endif
++#endif
++
++#ifndef ELIDE_CODE
++
+ char* optarg;
+ int optopt;
+ /* The variable optind [...] shall be initialized to 1 by the system. */
+@@ -226,3 +236,5 @@ int getopt_long(int argc, char* const argv[], const char* optstring,
+   ++optind;
+   return retval;
+ }
++
++#endif	/* Not ELIDE_CODE.  */
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
