Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D16CECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70F6060E25;
	Sat, 27 Aug 2022 20:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70F6060E25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3zVZI3a9XU_R; Sat, 27 Aug 2022 20:45:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836D660E15;
	Sat, 27 Aug 2022 20:45:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 836D660E15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F04381BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9D8C60C0F
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9D8C60C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jeRgFiW2MuCj for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:45:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE42360D89
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE42360D89
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 950C087E3F; Sat, 27 Aug 2022 20:30:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 22:44:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96f50e65f3d51d40759b1ebf4259789b14951dc3
X-Git-Newrev: 204002f672a7acb9af326b3ad4e378246cdc65ca
X-Patchwork-Hint: ignore
Message-Id: <20220827203010.950C087E3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: needs gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=204002f672a7acb9af326b3ad4e378246cdc65ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcamera needs gcc >= 8 since bump to
8a845ab078c3fe12ac4edd16c8cbac5b7ec03b98 in commit
64f67ede01699c47ca3c8801ae5dd440295f1874 and
https://git.libcamera.org/libcamera/libcamera.git/commit/?id=a7ab5ef1d2f9b05056db450e631a99a73382d589:

../output-1/build/libcamera-ba6435930f08e802cffc688d90f156a8959a0f86/meson.build:82:8: ERROR: Problem encountered: gcc version is too old, libcamera requires 8.0 or newer

Fixes:
 - http://autobuild.buildroot.org/results/f8eba0e564d03b83fcda4085baec16a4857c7d25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera-apps/Config.in | 6 +++---
 package/libcamera/Config.in      | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
index 492a99cf55..711fd6de05 100644
--- a/package/libcamera-apps/Config.in
+++ b/package/libcamera-apps/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
 	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libcamera
 	depends on !BR2_STATIC_LIBS # gnutls/libcamera
 	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
 	select BR2_PACKAGE_BOOST
@@ -24,7 +24,7 @@ config BR2_PACKAGE_LIBCAMERA_APPS
 
 	  https://github.com/raspberrypi/libcamera-apps
 
-comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 0febfef4bc..63c06173db 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -10,7 +10,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	select BR2_PACKAGE_GNUTLS
@@ -92,7 +92,7 @@ comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
