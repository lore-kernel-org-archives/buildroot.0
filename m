Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEB6C36008
	for <buildroot@archiver.kernel.org>; Wed, 26 Mar 2025 20:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28D7D83A77;
	Wed, 26 Mar 2025 20:14:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KISAb9gB6n-F; Wed, 26 Mar 2025 20:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3975283A9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3975283A9B;
	Wed, 26 Mar 2025 20:14:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71C8E12A
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5394D608B9
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kA80vimn7Cza for <buildroot@buildroot.org>;
 Wed, 26 Mar 2025 20:14:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AFD760899
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AFD760899
 for <buildroot@buildroot.org>; Wed, 26 Mar 2025 20:14:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4526A8347B; Wed, 26 Mar 2025 20:14:41 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Mar 2025 20:58:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 01ef4c44108a60479fd72416d89d90cd68091736
X-Git-Newrev: f8bc27111531e9607f79121414f61c0c2d5f83c0
X-Patchwork-Hint: ignore
Message-Id: <20250326201441.4526A8347B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncftp: bump to version 3.2.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=f8bc27111531e9607f79121414f61c0c2d5f83c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patches.

Autoreconf is broken. Hence, use the configure script directly.

Fixes:
https://autobuild.buildroot.org/results/60c3dbe02af354ff9820258ffd00eec088114d69/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch | 19 -------
 package/ncftp/0002-ncftp-3.2.7-fix-clang.patch | 72 --------------------------
 package/ncftp/ncftp.hash                       |  2 +-
 package/ncftp/ncftp.mk                         | 13 +----
 4 files changed, 3 insertions(+), 103 deletions(-)

diff --git a/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch b/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
deleted file mode 100644
index e2cda631d4..0000000000
--- a/package/ncftp/0001-ncftp-3.2.7-fix-gcc14.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-fix select arg detection
-
-Reference:
- https://bugs.gentoo.org/921487
-
-Upstream: N/A, unresponsive contact email address.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---- a/autoconf_local/aclocal.m4
-+++ b/autoconf_local/aclocal.m4
-@@ -4196,7 +4196,7 @@
- #include <sys/select.h>
- #endif
- #include <sys/socket.h>	/* MG: always incl */
--extern select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
-+extern int select ($ac_cv_func_select_arg1,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg234,$ac_cv_func_select_arg5);],,dnl
-         [ac_not_found=no ; break 3],ac_not_found=yes)
-       done
-      done
diff --git a/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch b/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
deleted file mode 100644
index bed103609c..0000000000
--- a/package/ncftp/0002-ncftp-3.2.7-fix-clang.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Fix compilation with clang-16
-
-aclocal.m4 contains code that no longer compiles: missing headers and missing
-return types.
-
-Reference:
- https://gitweb.gentoo.org/repo/gentoo.git/tree/net-ftp/ncftp/files/ncftp-3.2.7-fix-clang.patch
-
-Upstream: N/A, unresponsive contact email address.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---- a/autoconf_local/aclocal.m4
-+++ b/autoconf_local/aclocal.m4
-@@ -3057,6 +3057,7 @@
- #include <sys/uio.h>
- #include <sys/socket.h>
- #include <sys/un.h>
-+#include <string.h>
- ],[
- struct sockaddr_un uaddr;
- 
-@@ -3285,6 +3286,7 @@
- #ifdef HAVE_RESOLV_H
- #	include <resolv.h>
- #endif
-+#include <string.h>
- ],[
- 	/* function-body */
- 	int len;
-@@ -3363,6 +3365,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- 		 
-+			int
- 			main(int argc, char **argv)
- 			{
- 				/* Note:  don't actually call readline,
-@@ -5145,6 +5148,7 @@
- #ifdef HAVE_STDLIB_H
- #	include <stdlib.h>
- #endif
-+#include <string.h>
- 
- #ifdef HAVE_NCURSES_H
- #	define NCURSES_OPAQUE 0
-@@ -5176,6 +5180,7 @@
- #endif
- 
-  
-+int
- main(int argc, char **argv)
- {
- 	/* Note:  don't actually call curses, since it may block;
-@@ -6510,7 +6515,6 @@
- #endif
- #endif			/* MG */
- 
--int
- int  main(void)
- {
- 	char *data, *data2, *data3;
-@@ -6607,8 +6611,9 @@
- 	AC_CACHE_CHECK(whether setvbuf arguments are reversed,
- 	  ac_cv_func_setvbuf_reversed,
- 	[AC_TRY_RUN([#include <stdio.h>
-+	$include <stdlib.h>
- 	/* If setvbuf has the reversed format, exit 0. */
--	main () {
-+	int main (void) {
- 	  /* This call has the arguments reversed.
- 	     A reversed system may check and see that the address of main
- 	     is not _IOLBF, _IONBF, or _IOFBF, and return nonzero.  */
diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index 3e390b1015..a9414d62f5 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8  ncftp-3.2.7-src.tar.xz
+sha256  f1108e77782376f8aec691f68297a3364a9a7c2d9bb12e326f550ff9770f47a7  ncftp-3.2.9-src.tar.gz
 sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ncftp/ncftp.mk b/package/ncftp/ncftp.mk
index 57c3a5d08b..fa46bc3339 100644
--- a/package/ncftp/ncftp.mk
+++ b/package/ncftp/ncftp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NCFTP_VERSION = 3.2.7
-NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.xz
+NCFTP_VERSION = 3.2.9
+NCFTP_SOURCE = ncftp-$(NCFTP_VERSION)-src.tar.gz
 NCFTP_SITE = https://www.ncftp.com/public_ftp/ncftp
 NCFTP_TARGET_BINS = ncftp
 NCFTP_LICENSE = ClArtistic
@@ -14,15 +14,6 @@ NCFTP_LICENSE_FILES = doc/LICENSE.txt
 NCFTP_DEPENDENCIES = host-autoconf
 NCFTP_CONF_OPTS = --disable-ccdv
 
-# The bundled configure script is generated by autoconf 2.13 and doesn't
-# detect cross-compilation correctly. Therefore, we have to regenerate it.
-# We need to pass -I because of the non-standard m4 directory name, and
-# none of the other autotools are used, so the below is the easiest.
-define NCFTP_RUN_AUTOCONF
-	(cd $(@D); $(AUTOCONF) -I$(@D)/autoconf_local/)
-endef
-NCFTP_PRE_CONFIGURE_HOOKS += NCFTP_RUN_AUTOCONF
-
 ifeq ($(BR2_PACKAGE_NCFTP_GET),y)
 NCFTP_TARGET_BINS += ncftpget
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
