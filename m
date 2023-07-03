Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D70C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70C2160AFC;
	Mon,  3 Jul 2023 20:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70C2160AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E0aJZGxH858A; Mon,  3 Jul 2023 20:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7157360BCC;
	Mon,  3 Jul 2023 20:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7157360BCC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A498C1BF951
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A0008188D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A0008188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2quxtp5rdOa for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:36:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 834B68186B
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:36:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834B68186B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FDA6865B1; Mon,  3 Jul 2023 20:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 22:36:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ebb7c37526348fc0ed1359d1c07f12059e416a4
X-Git-Newrev: 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4
X-Patchwork-Hint: ignore
Message-Id: <20230703203616.6FDA6865B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/putty: bump version to 0.78
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html

Removed patch, the patched file does not exist anymore in this release.

Updated license hash due to copyright year bump:
https://git.tartarus.org/?p=simon/putty.git;a=commitdiff;h=ce59d8bb4f7a1c6aff677d1431ec84a803a24091

Switched build system to cmake.

Added optional dependency to libgtk3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-unix-uxutils.h-fix-build-on-uclibc.patch  | 41 ----------------------
 package/putty/Config.in                            |  6 ++--
 package/putty/putty.hash                           | 11 +++---
 package/putty/putty.mk                             | 13 ++++---
 5 files changed, 14 insertions(+), 58 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d3e5af4129..24adeeb70d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1239,7 +1239,6 @@ package/pulseaudio/S50pulseaudio ConsecutiveEmptyLines EmptyLastLine Indent Vari
 package/pulseview/0001-Replace-obsolete-deprecated-Qt-methods.patch Upstream
 package/pulseview/0002-Fix-broken-build-due-to-C-template-behind-C-linkage.patch Upstream
 package/pulseview/0003-Support-glibmm-2.68.patch Upstream
-package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch Upstream
 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch Upstream
 package/python-automat/0001-Remove-uneeded-dependency-to-wheel.patch Upstream
 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch Upstream
diff --git a/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
deleted file mode 100644
index 78cef8b908..0000000000
--- a/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3f30f3a7e3f07f5ca3cef0f405b02e22a018c6e4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 9 May 2021 15:22:29 +0200
-Subject: [PATCH] unix/uxutils.h: fix build on uclibc
-
-Build on uclibc is broken since version 0.75 and commit
-65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
-even if <sys/auxv.h> is not available:
-
-unix/uxutils.c: In function 'platform_aes_hw_available':
-unix/uxutils.c:13:22: error: 'AT_HWCAP2' undeclared (first use in this function)
-   13 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
-      |                      ^~~~~~~~~
-
-To fix this build failure, include <elf.h>
-
-Fixes:
- - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to Simon Tatham <anakin@pobox.com>]
----
- unix/uxutils.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/unix/uxutils.h b/unix/uxutils.h
-index c9acff53..b80bf972 100644
---- a/unix/uxutils.h
-+++ b/unix/uxutils.h
-@@ -18,6 +18,8 @@
- 
- #if defined __arm__ || defined __aarch64__
- 
-+#include <elf.h>
-+
- #ifdef HAVE_SYS_TYPES_H
- #include <sys/types.h>
- #endif
--- 
-2.30.2
-
diff --git a/package/putty/Config.in b/package/putty/Config.in
index cd8b3bb213..f89283b99a 100644
--- a/package/putty/Config.in
+++ b/package/putty/Config.in
@@ -3,10 +3,10 @@ config BR2_PACKAGE_PUTTY
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	help
-	  PuTTY is a free SSH and Telnet client. Without GTK2
+	  PuTTY is a free SSH and Telnet client. Without GTK2 or GTK3
 	  activated, only the commandline tools plink, pscp, psftp,
-	  and puttygen are built; enable GTK2 for the graphical
-	  client.
+	  and puttygen are built; enable GTK2 or GTK3 for the
+	  graphical client.
 
 	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
 
diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 861d45cb76..c691a4f975 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,8 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.76/{md5,sha1,sha256,sha512}sums
-md5  9d22f8c56c1eaa1c0af3098438f25908  putty-0.76.tar.gz
-sha1  de09f50aee330eb05ad0cb81b970d0cc8e5c9b25  putty-0.76.tar.gz
-sha256  547cd97a8daa87ef71037fab0773bceb54a8abccb2f825a49ef8eba5e045713f  putty-0.76.tar.gz
-sha512  4576b359593928c6eba923f2d7b66ac0f2cf00e0c217cdbbb124471c3b35feb090e623847bfc507a4ef106cb3067aac47419e241b11dd8bf4ae554061fa93c25  putty-0.76.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.78/{sha1,sha256,sha512}sums
+sha1  198f01db6bea708e480fb11dd23026eda7b3f49f  putty-0.78.tar.gz
+sha256  274e01bcac6bd155dfd647b2f18f791b4b17ff313753aa919fcae2e32d34614f  putty-0.78.tar.gz
+sha512  d7a3e2eabd5f1f65fc0f3f1ee0789c30fbe891b57f63ddeac0b92befcb6aecd4a748f04a21c76ee42d992deb77c2e1a0454a71cc620ef26fbf23af660bd84bb5  putty-0.78.tar.gz
 
 # Locally calculated
-sha256  3f3e870dd3d0867d79370b1d433602c60bb91b59de04e5d8f2a149b788530d53  LICENCE
+sha256  7b10c93f0d582e820a9e6f8c6abbcff54192e41e60644f4d09b96b14fdbc74f8  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index e57a78be96..82b7464bb4 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,18 +4,17 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.76
+PUTTY_VERSION = 0.78
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
 PUTTY_CPE_ID_VENDOR = putty
-PUTTY_CONF_OPTS = --disable-gtktest
+PUTTY_DEPENDENCIES = host-pkgconf
 
-ifeq ($(BR2_PACKAGE_LIBGTK2),y)
-PUTTY_CONF_OPTS += --with-gtk=2
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+PUTTY_DEPENDENCIES += libgtk3
+else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
 PUTTY_DEPENDENCIES += libgtk2
-else
-PUTTY_CONF_OPTS += --without-gtk
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
