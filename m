Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B393CAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E343661706;
	Thu, 25 Sep 2025 20:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBSnI8kG-Q9c; Thu, 25 Sep 2025 20:31:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A74E36170A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74E36170A;
	Thu, 25 Sep 2025 20:31:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1130812D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0E1F41602
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgnymBCwEaSX for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A36534152C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A36534152C
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A173383B7E; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:41:12 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 2a81f918393c1233d5de100b7782f80c4c15a1e6
X-Git-Newrev: 232718e303904683a06c7c6cff7476923c5a6fcf
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.A173383B7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/chocolate-doom:
 bump to 3.1.1 to fix GCC 15.x issues
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=232718e303904683a06c7c6cff7476923c5a6fcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Changes in 3.1.0:

  https://github.com/chocolate-doom/chocolate-doom/releases/tag/chocolate-doom-3.1.0

Changes in 3.1.1:

  https://github.com/chocolate-doom/chocolate-doom/releases/tag/chocolate-doom-3.1.1

The SDL2_mixer and SDL2_net dependencies are now optional since 3.1.0,
so adjust the packaging accordingly.

Also, the license file was renamed upstream in commit:
https://github.com/chocolate-doom/chocolate-doom/commit/91a66a7ecba5e0dea87c8d98237d6a224f13347a
So _LICENSE_FILES and the .hash file are also updated to reflect
that change.

Fixes:

  https://autobuild.buildroot.net/results/90a01c5925e7f5f50b3ea06d6ea7b0da66814a15/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: fix license file and hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit be466c265ba09ed47ec1eb40f006dd17753e69d1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  1 -
 ...01-Remove-redundant-demoextend-definition.patch | 29 ----------------------
 package/chocolate-doom/Config.in                   |  2 --
 package/chocolate-doom/chocolate-doom.hash         |  4 +--
 package/chocolate-doom/chocolate-doom.mk           | 24 +++++++++++++++---
 5 files changed, 22 insertions(+), 38 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4bb387422b..54a167c9cc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -295,7 +295,6 @@ package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch l
 package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
 package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
-package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
 package/chrony/S49chronyd lib_sysv.Variables
 package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
 package/cmocka/0001-Don-t-redefine-uintptr_t.patch lib_patch.Upstream
diff --git a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
deleted file mode 100644
index 06bf54c583..0000000000
--- a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a8fd4b1f563d24d4296c3e8225c8404e2724d4c2 Mon Sep 17 00:00:00 2001
-From: Jordan Christiansen <xordspar0@gmail.com>
-Date: Sun, 15 Mar 2020 16:55:33 -0500
-Subject: [PATCH] Remove redundant demoextend definition
-
-GCC 10 enables -fno-common by default, which causes the linker to fail when
-there are multiple definitions of a global variable.
-
-See https://gcc.gnu.org/gcc-10/porting_to.html
-
-[Retrieved from:
-https://github.com/chocolate-doom/chocolate-doom/commit/a8fd4b1f563d24d4296c3e8225c8404e2724d4c2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/hexen/mn_menu.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/hexen/mn_menu.c b/src/hexen/mn_menu.c
-index 059f45b3e..a97b7fcd1 100644
---- a/src/hexen/mn_menu.c
-+++ b/src/hexen/mn_menu.c
-@@ -131,7 +131,6 @@ boolean MenuActive;
- int InfoType;
- int messageson = true;
- boolean mn_SuicideConsole;
--boolean demoextend; // from h2def.h
- 
- // PRIVATE DATA DEFINITIONS ------------------------------------------------
- 
diff --git a/package/chocolate-doom/Config.in b/package/chocolate-doom/Config.in
index 406b04ecf1..3cefd057ec 100644
--- a/package/chocolate-doom/Config.in
+++ b/package/chocolate-doom/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_CHOCOLATE_DOOM
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # sdl2
 	select BR2_PACKAGE_SDL2
-	select BR2_PACKAGE_SDL2_MIXER
-	select BR2_PACKAGE_SDL2_NET
 	help
 	  Chocolate Doom is a set of conservative source ports for Doom,
 	  Heretic, Hexen and Strife, with a philosophy of preserving the
diff --git a/package/chocolate-doom/chocolate-doom.hash b/package/chocolate-doom/chocolate-doom.hash
index 79eb1c6a3f..a86a86b790 100644
--- a/package/chocolate-doom/chocolate-doom.hash
+++ b/package/chocolate-doom/chocolate-doom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d435d6177423491d60be706da9f07d3ab4fabf3e077ec2a3fc216e394fcfc8c7  chocolate-doom-3.0.1.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  1edcc41254bdc194beb0d33e267fae306556c4d24110a1d3d3f865717f25da23  chocolate-doom-3.1.1.tar.gz
+sha256  aef8b4222b79d0dbf6bf17cfff71c90a6a6bb8917a4162abe417b469ed22da2e  COPYING.md
diff --git a/package/chocolate-doom/chocolate-doom.mk b/package/chocolate-doom/chocolate-doom.mk
index 581b2c51c2..abe0e128b2 100644
--- a/package/chocolate-doom/chocolate-doom.mk
+++ b/package/chocolate-doom/chocolate-doom.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-CHOCOLATE_DOOM_VERSION = 3.0.1
-CHOCOLATE_DOOM_SITE = http://www.chocolate-doom.org/downloads/$(CHOCOLATE_DOOM_VERSION)
+CHOCOLATE_DOOM_VERSION = 3.1.1
+CHOCOLATE_DOOM_SITE = $(call github,chocolate-doom,chocolate-doom,chocolate-doom-$(CHOCOLATE_DOOM_VERSION))
 CHOCOLATE_DOOM_LICENSE = GPL-2.0+
-CHOCOLATE_DOOM_LICENSE_FILES = COPYING
+CHOCOLATE_DOOM_LICENSE_FILES = COPYING.md
 CHOCOLATE_DOOM_CPE_ID_VENDOR = chocolate-doom
 CHOCOLATE_DOOM_CPE_ID_PRODUCT = chocolate_doom
-CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl2 sdl2_mixer sdl2_net
+CHOCOLATE_DOOM_DEPENDENCIES = host-pkgconf sdl2
+# Fetch from git
+CHOCOLATE_DOOM_AUTORECONF = YES
 
 # Avoid installing desktop entries, icons, etc.
 CHOCOLATE_DOOM_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
@@ -23,6 +25,20 @@ endif
 
 CHOCOLATE_DOOM_CONF_ENV += CFLAGS="$(CHOCOLATE_DOOM_CFLAGS)"
 
+ifeq ($(BR2_PACKAGE_SDL2_MIXER),y)
+CHOCOLATE_DOOM_DEPENDENCIES += sdl2_mixer
+CHOCOLATE_DOOM_CONF_OPTS += --enable-sdl2mixer
+else
+CHOCOLATE_DOOM_CONF_OPTS += --disable-sdl2mixer
+endif
+
+ifeq ($(BR2_PACKAGE_SDL2_NET),y)
+CHOCOLATE_DOOM_DEPENDENCIES += sdl2_net
+CHOCOLATE_DOOM_CONF_OPTS += --enable-sdl2net
+else
+CHOCOLATE_DOOM_CONF_OPTS += --disable-sdl2net
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 CHOCOLATE_DOOM_DEPENDENCIES += libpng
 CHOCOLATE_DOOM_CONF_OPTS += --with-libpng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
