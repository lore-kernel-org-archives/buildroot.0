Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15145C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95CB084050;
	Fri, 12 Jul 2024 19:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7QA-0pa5sj4; Fri, 12 Jul 2024 19:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC33C82163
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC33C82163;
	Fri, 12 Jul 2024 19:45:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EB041BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CC756065D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:45:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2N7ejTGTeYK1 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:45:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5090E605AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5090E605AD
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:45:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 392A786146; Fri, 12 Jul 2024 19:45:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:44:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 430921120fdd6285c07557fcae010e10b7715235
X-Git-Newrev: 9ede791756a9c7a24da2d88667d813a0dc2c43ff
X-Patchwork-Hint: ignore
Message-Id: <20240712194514.392A786146@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglfw: update the patches to be
 applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ede791756a9c7a24da2d88667d813a0dc2c43ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libglfw fails to build with output:

    Applying 0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch using patch:
    patching file src/CMakeLists.txt
    Hunk #1 FAILED at 75.
    1 out of 1 hunk FAILED -- saving rejects to file src/CMakeLists.txt.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                  |  1 -
 ...yland-Remove-extra-cmake-modules-dependency.patch | 18 +++++++++++-------
 ...Lists.txt-allow-override-of-wayland-pkgdata.patch | 20 +++++++++++---------
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9546391d1f..69b8dece38 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -763,7 +763,6 @@ package/libfuse/0001-fix-aarch64-build.patch lib_patch.Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch lib_patch.Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_patch.Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch lib_patch.Upstream
-package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch lib_patch.Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch lib_patch.Upstream
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
diff --git a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
index d5ee7c829a..ffa1d13f51 100644
--- a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
+++ b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
@@ -1,4 +1,4 @@
-From 2747e47393cbca2d09db56223e735bd94b21e2eb Mon Sep 17 00:00:00 2001
+From 8ebf1067390948d03330a5a0c814e5f7f860e678 Mon Sep 17 00:00:00 2001
 From: Joel Winarske <joel.winarske@gmail.com>
 Date: Mon, 28 Sep 2020 22:23:02 -0700
 Subject: [PATCH] Wayland: Remove extra-cmake-modules dependency
@@ -8,17 +8,18 @@ Fixes #1774.
 [Retrieved (and backported) from:
 https://github.com/glfw/glfw/commit/2747e47393cbca2d09db56223e735bd94b21e2eb]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0 dropping all Hunks]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- .gitignore         |  4 ---
  CMakeLists.txt     | 16 ++++++------
  src/CMakeLists.txt | 62 ++++++++++++++++++++++++++++------------------
- 3 files changed, 45 insertions(+), 37 deletions(-)
+ 2 files changed, 45 insertions(+), 33 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 42bfa1806d..394827520b 100644
+index 75069161fc36..b315eaa15305 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -191,20 +191,18 @@ endif()
+@@ -249,20 +249,18 @@ endif()
  # Use Wayland for window creation
  #--------------------------------------------------------------------
  if (_GLFW_WAYLAND)
@@ -47,10 +48,10 @@ index 42bfa1806d..394827520b 100644
      include(CheckIncludeFiles)
      include(CheckFunctionExists)
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 2f2bdd883d..e834506c6c 100644
+index b6dd86c54512..29be6515ae58 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -45,30 +45,44 @@ if (_GLFW_X11 OR _GLFW_WAYLAND)
+@@ -40,30 +40,44 @@ elseif (_GLFW_WAYLAND)
                       posix_time.c posix_thread.c xkb_unicode.c
                       egl_context.c osmesa_context.c)
  
@@ -119,3 +120,6 @@ index 2f2bdd883d..e834506c6c 100644
  elseif (_GLFW_OSMESA)
      set(glfw_HEADERS ${common_HEADERS} null_platform.h null_joystick.h
                       posix_time.h posix_thread.h osmesa_context.h)
+-- 
+2.43.0
+
diff --git a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
index 4bcb5e4eb7..268b124851 100644
--- a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
+++ b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
@@ -1,4 +1,4 @@
-From 46aaf2b2b4d3ec240b9aad175bb3eddb6ae11ead Mon Sep 17 00:00:00 2001
+From a2c88988b6cfe4023fe78f13519b56a8ac9f568b Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 4 Mar 2022 17:59:19 +0100
 Subject: [PATCH] src/CMakeLists.txt: allow override of wayland pkgdatadir
@@ -7,17 +7,19 @@ Allow the user to override WAYLAND_{PROTOCOLS_BASE,CLIENT_PKGDATADIR}
 (needed when cross-compiling)
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/glfw/glfw/pull/2053]
+Upstream: https://github.com/glfw/glfw/pull/2053
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- src/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
+ src/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 01f191c9..475ce882 100644
+index 29be6515ae58..1767b3c8ad8f 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -75,7 +75,9 @@ if (GLFW_BUILD_WAYLAND)
-     include(FindPkgConfig)
+@@ -42,7 +42,9 @@ elseif (_GLFW_WAYLAND)
+ 
      find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
      pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
 -    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
@@ -26,7 +28,7 @@ index 01f191c9..475ce882 100644
 +    endif()
  
      macro(wayland_generate protocol_file output_file)
-         add_custom_command(OUTPUT "${output_file}.h"
+           add_custom_command(OUTPUT ${output_file}.h
 -- 
-2.34.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
