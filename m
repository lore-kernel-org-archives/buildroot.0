Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF56AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 18:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BA640336;
	Tue, 18 Jul 2023 18:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BA640336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id azq6AjXfwAhK; Tue, 18 Jul 2023 18:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AB2A40354;
	Tue, 18 Jul 2023 18:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AB2A40354
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33D841BF333
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D20560BE3
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D20560BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUBhiy-wJCM1 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 18:24:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8461260A98
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8461260A98
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 18:24:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AB7C7A4C0FE9;
 Tue, 18 Jul 2023 20:24:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43634)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLpMj-00030n-03;
 Tue, 18 Jul 2023 20:24:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 20:24:04 +0200
Message-Id: <20230718182404.687314-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718182404.687314-1-bernd@kuhls.net>
References: <20230718182404.687314-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689704645;
 bh=ZxvD112GO25XXGew4nXJtrGP4V1VutnocT8v9TZhuOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oyQd9KAcavC+5+LqBxU5BG4J4ZucU6cvIlELk2pdatuUaPyyHcUPlsHV5t98THtsf
 Ts6sOU7//xIEjK9X67EMFwXf7G9n3EGh5cduuM9IvlEdT5bci2ANO7vZ0rM2Trhwog
 7wiwij+hxq6caP/rReZWbchtKOVhfoVkgTTVNO/ZC/ouiFXmu64O5GVD/+HFYWAPvG
 9tbDYc6zSl/KIbE9L9Vp2lTEBrtdvNZnbGUkpmky79Szug8idlzeqdsqie/wb9k5+n
 uU9UvXf+NBQbkn9Nr8Tq/dcJxZZ8xXSsmGrUqqcVTJxFI1UGOhb0Mx0iBjZ96+q5yb
 EMQ8e6pywscmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=oyQd9KAc
Subject: [Buildroot] [PATCH 2/2] package/kodi: needs cmake >= 3.24
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
