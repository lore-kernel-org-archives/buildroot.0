Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FB1EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE243836EA;
	Thu, 27 Jul 2023 21:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE243836EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_ukH3JIOi3Y; Thu, 27 Jul 2023 21:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C2284059;
	Thu, 27 Jul 2023 21:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C2284059
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD4B1BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62FA541F2D
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62FA541F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDlV_gmJtr6l for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:26:07 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 168C341EE5
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 168C341EE5
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1EC4EA4C1064;
 Thu, 27 Jul 2023 23:25:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39874)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qP8UZ-0003wM-2O;
 Thu, 27 Jul 2023 23:25:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:25:51 +0200
Message-Id: <20230727212551.2279683-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727212551.2279683-1-bernd@kuhls.net>
References: <20230727212551.2279683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690493152;
 bh=R7jtq490E3+KgGyKdPNNKTJeNHIIFZsYjD7gqrQm3iU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fDmzdljL4S6JZcPBOhcFcVmV66TXFhJd+ywxc+iGIu1K+VFr9ySJcpACfVN+ocRzK
 AkGJPvAUB2ebcKMF3NA3/PBc8/iNM3mRqVoXpKqxYV5sDv9WdKPAgNYW8+t93crocY
 sHEuTgqayLBxIpoaeAQsfPR8vSk/lEkpTEPpjAByTAQ2MBkBhf6TQ9U4rAzvkakxRG
 xCYxCE8YuGx/DM2j9zxXv85OPCq2j/ChQWmsT728gMsliCQUSg026Lnh/6uR0l63uo
 kGtyzffAmc5HMo1inOVX8PTptHIwYyP5XzvsV9yB62f73wOW4FRESvV7DGJ4tO9mq0
 TSeXjwh+y24CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fDmzdljL
Subject: [Buildroot] [PATCH v4 2/2] package/kodi: needs host-cmake >= 3.24
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
v4: no changes
v3: no changes
v2: removed patch 0002

 ...2-cmake-modules-fix-python-detection.patch | 28 -------------------
 package/kodi/Config.in                        |  1 +
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 package/kodi/0002-cmake-modules-fix-python-detection.patch

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
index 710add0568..6b68e6d504 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
