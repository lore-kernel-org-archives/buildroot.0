Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADBEC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 10:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF67E80E26;
	Sun, 28 Jul 2024 10:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e_m5Om6QSbzd; Sun, 28 Jul 2024 10:26:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F4481839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F4481839;
	Sun, 28 Jul 2024 10:26:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1979F1BF94D
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B481B80BF7
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 10:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DzOb0n-mH_Tm for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC50F80C10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC50F80C10
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C957487543; Sun, 28 Jul 2024 10:25:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 28 Jul 2024 12:19:53 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4aed83070375bfa0e1e918529e1b7724cf12fd98
X-Git-Newrev: a02c8e337e3849968d2e0c30259c4d8fd440c052
X-Patchwork-Hint: ignore
Message-Id: <20240728102559.C957487543@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/ncftp: fix GCC
 14.x related build errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=a02c8e337e3849968d2e0c30259c4d8fd440c052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Patches were taken from Gentoo:

https://bugs.gentoo.org/921487
https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch

Fixes:
http://autobuild.buildroot.net/results/058578eae885ce6e206c25b5a24aa11b625adf88/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b2aa09a492cf0b1b481b754dcc5f0168a039bd3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch | 19 +++++++
 package/ncftp/0002-ncftp-3.2.7-fix-clang.patch | 72 ++++++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
new file mode 100644
index 0000000000..e2cda631d4
--- /dev/null
+++ b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
@@ -0,0 +1,19 @@
+fix select arg detection
+
+Reference:
+ https://bugs.gentoo.org/921487
+
+Upstream: N/A, unresponsive contact email address.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -4196,7 +4196,7 @@
+ #include <sys/select.h>
+ #endif
+ #include <sys/socket.h>	/* MG: always incl */
+-extern select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
++extern int select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
+         [ac_not_found=no ; break 3],ac_not_found=yes)
+       done
+      done
diff --git a/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
new file mode 100644
index 0000000000..bed103609c
--- /dev/null
+++ b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
@@ -0,0 +1,72 @@
+Fix compilation with clang-16
+
+aclocal.m4 contains code that no longer compiles: missing headers and missing
+return types.
+
+Reference:
+ https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
+
+Upstream: N/A, unresponsive contact email address.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+--- a/autoconf_local/aclocal.m4
++++ b/autoconf_local/aclocal.m4
+@@ -3057,6 +3057,7 @@
+ #include <sys/uio.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <string.h>
+ ],[
+ struct sockaddr_un uaddr;
+ 
+@@ -3285,6 +3286,7 @@
+ #ifdef HAVE_RESOLV_H
+ #	include <resolv.h>
+ #endif
++#include <string.h>
+ ],[
+ 	/* function-body */
+ 	int len;
+@@ -3363,6 +3365,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ 		 
++			int
+ 			main(int argc, char **argv)
+ 			{
+ 				/* Note:  don't actually call readline,
+@@ -5145,6 +5148,7 @@
+ #ifdef HAVE_STDLIB_H
+ #	include <stdlib.h>
+ #endif
++#include <string.h>
+ 
+ #ifdef HAVE_NCURSES_H
+ #	define NCURSES_OPAQUE 0
+@@ -5176,6 +5180,7 @@
+ #endif
+ 
+  
++int
+ main(int argc, char **argv)
+ {
+ 	/* Note:  don't actually call curses, since it may block;
+@@ -6510,7 +6515,6 @@
+ #endif
+ #endif			/* MG */
+ 
+-int
+ int  main(void)
+ {
+ 	char *data, *data2, *data3;
+@@ -6607,8 +6611,9 @@
+ 	AC_CACHE_CHECK(whether setvbuf arguments are reversed,
+ 	  ac_cv_func_setvbuf_reversed,
+ 	[AC_TRY_RUN([#include <stdio.h>
++	$include <stdlib.h>
+ 	/* If setvbuf has the reversed format, exit 0. */
+-	main () {
++	int main (void) {
+ 	  /* This call has the arguments reversed.
+ 	     A reversed system may check and see that the address of main
+ 	     is not _IOLBF, _IONBF, or _IOFBF, and return nonzero.  */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
