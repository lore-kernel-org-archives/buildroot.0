Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F259CCD18D
	for <buildroot@archiver.kernel.org>; Mon,  6 Oct 2025 20:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4270A6156D;
	Mon,  6 Oct 2025 20:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xs4kOga2MYJh; Mon,  6 Oct 2025 20:57:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B7061528
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B7061528;
	Mon,  6 Oct 2025 20:57:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC778272
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1D8C84233
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3yoAwuWmmml for <buildroot@buildroot.org>;
 Mon,  6 Oct 2025 20:57:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC4AC841FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC4AC841FD
 for <buildroot@buildroot.org>; Mon,  6 Oct 2025 20:57:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBDA5869B9; Mon,  6 Oct 2025 20:57:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Oct 2025 22:56:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1780555445896ab07d2cba85f4bc4ad907efe75
X-Git-Newrev: b1c77090efa4c712d1332c1786f27faf1f4d1708
X-Patchwork-Hint: ignore
Message-Id: <20251006205724.BBDA5869B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeglut: bump version to 3.6.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6151198585773870970=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6151198585773870970==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b1c77090efa4c712d1332c1786f27faf1f4d1708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes, see:
https://github.com/freeglut/freeglut/releases/tag/v3.6.0

Removed patch 0001 which is included in this release, renumbered
remaining patch.

Added upstream commit to fix build with CMake 4.x.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Tested-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Plug-memory-leak-that-happens-upon-error.patch | 54 ----------------------
 ...PlatformDestroyContext-prototype-for-C23.patch} |  0
 ...now-we-are-aware-there-are-newer-versions.patch | 26 +++++++++++
 package/libfreeglut/libfreeglut.hash               |  2 +-
 package/libfreeglut/libfreeglut.mk                 |  2 +-
 5 files changed, 28 insertions(+), 56 deletions(-)

diff --git a/package/libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch b/package/libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
deleted file mode 100644
index d09e9befb3..0000000000
--- a/package/libfreeglut/0001-Plug-memory-leak-that-happens-upon-error.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 9ad320c1ad1a25558998ddfe47674511567fec57 Mon Sep 17 00:00:00 2001
-From: Sebastian Rasmussen <sebras@gmail.com>
-Date: Mon, 12 Feb 2024 14:46:22 +0800
-Subject: [PATCH] Plug memory leak that happens upon error.
-
-If fgStructure.CurrentMenu is set when glutAddMenuEntry() or
-glutAddSubMenu() is called the allocated menuEntry variable will
-leak. This commit postpones allocating menuEntry until after the
-error checks, thereby plugging the memory leak.
-
-This fixes CVE-2024-24258 and CVE-2024-24259.
-Upstream: https://github.com/freeglut/freeglut/commit/9ad320c1ad1a25558998ddfe47674511567fec57
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
----
- src/fg_menu.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/fg_menu.c b/src/fg_menu.c
-index 53112dc2..0da88901 100644
---- a/src/fg_menu.c
-+++ b/src/fg_menu.c
-@@ -864,12 +864,12 @@ void FGAPIENTRY glutAddMenuEntry( const char* label, int value )
- {
-     SFG_MenuEntry* menuEntry;
-     FREEGLUT_EXIT_IF_NOT_INITIALISED ( "glutAddMenuEntry" );
--    menuEntry = (SFG_MenuEntry *)calloc( sizeof(SFG_MenuEntry), 1 );
- 
-     freeglut_return_if_fail( fgStructure.CurrentMenu );
-     if (fgState.ActiveMenus)
-         fgError("Menu manipulation not allowed while menus in use.");
- 
-+    menuEntry = (SFG_MenuEntry *)calloc( sizeof(SFG_MenuEntry), 1 );
-     menuEntry->Text = strdup( label );
-     menuEntry->ID   = value;
- 
-@@ -888,7 +888,6 @@ void FGAPIENTRY glutAddSubMenu( const char *label, int subMenuID )
-     SFG_Menu *subMenu;
- 
-     FREEGLUT_EXIT_IF_NOT_INITIALISED ( "glutAddSubMenu" );
--    menuEntry = ( SFG_MenuEntry * )calloc( sizeof( SFG_MenuEntry ), 1 );
-     subMenu = fgMenuByID( subMenuID );
- 
-     freeglut_return_if_fail( fgStructure.CurrentMenu );
-@@ -897,6 +896,7 @@ void FGAPIENTRY glutAddSubMenu( const char *label, int subMenuID )
- 
-     freeglut_return_if_fail( subMenu );
- 
-+    menuEntry = ( SFG_MenuEntry * )calloc( sizeof( SFG_MenuEntry ), 1 );
-     menuEntry->Text    = strdup( label );
-     menuEntry->SubMenu = subMenu;
-     menuEntry->ID      = -1;
--- 
-2.48.1
-
diff --git a/package/libfreeglut/0002-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch b/package/libfreeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
similarity index 100%
rename from package/libfreeglut/0002-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
rename to package/libfreeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch
diff --git a/package/libfreeglut/0002-Let-cmake-know-we-are-aware-there-are-newer-versions.patch b/package/libfreeglut/0002-Let-cmake-know-we-are-aware-there-are-newer-versions.patch
new file mode 100644
index 0000000000..45f2fcf541
--- /dev/null
+++ b/package/libfreeglut/0002-Let-cmake-know-we-are-aware-there-are-newer-versions.patch
@@ -0,0 +1,26 @@
+From 2294389397912c9a6505a88221abb7dca0a4fb79 Mon Sep 17 00:00:00 2001
+From: John Tsiombikas <nuclear@member.fsf.org>
+Date: Thu, 20 Mar 2025 09:28:29 +0200
+Subject: [PATCH] Let cmake know we are aware there are newer versions and we
+ don't care
+
+Closes issue #207
+
+Upstream: https://github.com/freeglut/freeglut/commit/2294389397912c9a6505a88221abb7dca0a4fb79
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for version 3.6.0]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 791771e7..e5903ef4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-CMAKE_MINIMUM_REQUIRED(VERSION 3.1 FATAL_ERROR)
++CMAKE_MINIMUM_REQUIRED(VERSION 3.1...3.5 FATAL_ERROR)
+ PROJECT(freeglut LANGUAGES C)
+ 
+ if (POLICY CMP0072)
diff --git a/package/libfreeglut/libfreeglut.hash b/package/libfreeglut/libfreeglut.hash
index 249a780f04..233fa55457 100644
--- a/package/libfreeglut/libfreeglut.hash
+++ b/package/libfreeglut/libfreeglut.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec  freeglut-3.4.0.tar.gz
+sha256  9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf37d269e3288a6c3ea52  freeglut-3.6.0.tar.gz
 sha256  b6593d5ec4c113a274abb85b10e8615895cb0ddb89f7912af5fe5aa8df38a275  COPYING
diff --git a/package/libfreeglut/libfreeglut.mk b/package/libfreeglut/libfreeglut.mk
index 09309aeceb..bcca8b4abe 100644
--- a/package/libfreeglut/libfreeglut.mk
+++ b/package/libfreeglut/libfreeglut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFREEGLUT_VERSION = 3.4.0
+LIBFREEGLUT_VERSION = 3.6.0
 LIBFREEGLUT_SOURCE = freeglut-$(LIBFREEGLUT_VERSION).tar.gz
 LIBFREEGLUT_SITE = https://github.com/FreeGLUTProject/freeglut/releases/download/v$(LIBFREEGLUT_VERSION)
 LIBFREEGLUT_LICENSE = MIT

--===============6151198585773870970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6151198585773870970==--
