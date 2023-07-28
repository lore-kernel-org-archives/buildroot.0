Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB3AC001DE
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E216C41E8D;
	Fri, 28 Jul 2023 19:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E216C41E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QsFB60DSlHxw; Fri, 28 Jul 2023 19:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6174842172;
	Fri, 28 Jul 2023 19:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6174842172
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C650D1BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C40840363
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C40840363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QAR2JQQIkqzc for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:39:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C479340168
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C479340168
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2CF6838C5; Fri, 28 Jul 2023 19:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:34:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb90cbdaa37ab1c12dda592167a69910d96eac80
X-Git-Newrev: 327b6000416919db034a645800bb700e2736addd
X-Patchwork-Hint: ignore
Message-Id: <20230728193903.B2CF6838C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: needs host-cmake >= 3.24
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

commit: https://git.buildroot.net/buildroot/commit/?id=327b6000416919db034a645800bb700e2736addd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building kodi with cmake version 3.22.3 provided by buildroot is broken

-- Found Python3: /home/buildroot/br6/output/per-package/kodi/host/x86_
   64-buildroot-linux-gnu/sysroot/usr/include/python3.11 (found suitable
    exact version "3.11.4") found components: Development Development.
    Module Development.Embed
-- Could NOT find Python3 (missing: Interpreter) (Required is exact
     version "3.11")
    Reason given by package:
        Interpreter: Cannot run the interpreter "/home/buildroot/br6/
        output/per-package/kodi/host/x86_64-buildroot-linux-gnu/sysroot/
        usr/bin/python3"

CMake Error at cmake/scripts/common/Macros.cmake:432 (message):
  PYTHON enabled but not found
Call Stack (most recent call first):
  CMakeLists.txt:214 (core_optional_dep)

using this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_FORCE_HOST_BUILD=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y
BR2_PACKAGE_HOST_CMAKE=y

due to "BR2_FORCE_HOST_BUILD=y".

The cmake version provided by my distro is 3.25.1 which works fine.

Adding "CMAKE_FIND_DEBUG_MODE TRUE" to the "find_package(Python3 [...]"
call in Kodi's cmake/modules/FindPython.cmake and comparing the logfile
of both cmake versions shows that 3.25.1 adds

    CMAKE_FIND_USE_INSTALL_PREFIX: 1

while searching for python3.

This option was introduced in cmake 3.24:
https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_USE_INSTALL_PREFIX.html

After introducing this fix it turns out that
0002-cmake-modules-fix-python-detection.patch is not needed anymore so
we remove this patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-cmake-modules-fix-python-detection.patch  | 28 ----------------------
 package/kodi/Config.in                             |  1 +
 2 files changed, 1 insertion(+), 28 deletions(-)

diff --git a/package/kodi/0002-cmake-modules-fix-python-detection.patch b/package/kodi/0002-cmake-modules-fix-python-detection.patch
deleted file mode 100644
index fcf35b25b2..0000000000
--- a/package/kodi/0002-cmake-modules-fix-python-detection.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c29c1e762e126fdb46a19fc15bcb465cf1cd6c76 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 7 May 2023 11:18:00 +0200
-Subject: [PATCH] cmake/modules: fix python detection
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: https://github.com/xbmc/xbmc/pull/23230
----
- cmake/modules/FindPython.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindPython.cmake b/cmake/modules/FindPython.cmake
-index 782c0f51f6..a013cccf80 100644
---- a/cmake/modules/FindPython.cmake
-+++ b/cmake/modules/FindPython.cmake
-@@ -60,7 +60,7 @@ endif()
- 
- find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Development)
- if(CORE_SYSTEM_NAME STREQUAL linux)
--  if(HOST_CAN_EXECUTE_TARGET)
-+  if(HOST_CAN_EXECUTE_TARGET OR DEFINED PYTHON_EXECUTABLE)
-     find_package(Python3 ${VERSION} ${EXACT_VER} COMPONENTS Interpreter)
-   else()
-     find_package(Python3 COMPONENTS Interpreter)
--- 
-2.25.1
-
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a21733ea78..0bdb8c50ee 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -66,6 +66,7 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON3_PYC_ONLY
 	select BR2_NEEDS_HOST_JAVA
+	select BR2_HOST_CMAKE_AT_LEAST_3_24
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
 	select BR2_PACKAGE_FFMPEG_POSTPROC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
