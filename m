Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3357AEB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 07:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D01B60803;
	Sun,  2 Jul 2023 07:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D01B60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ZKNfinTadNG; Sun,  2 Jul 2023 07:04:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53DE060ADD;
	Sun,  2 Jul 2023 07:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53DE060ADD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 974B51BF5E9
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 07:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F75960ADD
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 07:04:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F75960ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4wFofRH6Mwza for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 07:04:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A072D60803
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A072D60803
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 07:04:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 68490A4C02CC
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 09:04:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46434)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qFr8J-0005ry-0I
 for buildroot@buildroot.org; Sun, 02 Jul 2023 09:04:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 09:04:30 +0200
Message-Id: <20230702070430.6389-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688281471;
 bh=w3kDWGOmwu1EcuCHBb+Lam0QdKlpRjCx5gpPyvR6PZU=;
 h=From:To:Subject:Date:From;
 b=GfoMvycMsW3VeTcUd19LE2iOZ+WS6EAeLY8BS7iliLCLphWeKRZs22R8IjNF11Yev
 S9B3w5h5HmDeD3rL+xFoIyGOGHOcbldvWVyBJN1OpdqLvaaUK7K0BEr3GKXvtt1oK6
 fbJDK8VV9EX6puW/j4abNuBjkGuRPO0YL/KCUXNjeuuyJcJm9lkfbBPkcYcm9siyXY
 yx4ahlxR36MI2ErgYOitiEi7MoS/9Drgo2jq2RKuypJlSH4FPEeH17eTAOE1DHdW0S
 u6xU+wLpi6Q0v0KTu5JfP8XfanyDLJQBMK/sZmcFkrDQntLT01g/Sy1K04i9XGDEas
 fMf1gQrKkcWQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=GfoMvycM
Subject: [Buildroot] [PATCH v2 1/1] package/libasplib: remove package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added in 2015 to be used by Kodi ADSP addons these efforts have stopped:
https://forum.kodi.tv/showthread.php?tid=252871&pid=3053658#pid3053658
so this package is no longer needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rebased, removed patch from .checkpackageignore

 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  6 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...asplib_CPUTimer.h-Fix-time.h-include.patch | 39 -------------------
 package/libasplib/Config.in                   | 11 ------
 package/libasplib/libasplib.hash              |  3 --
 package/libasplib/libasplib.mk                | 21 ----------
 8 files changed, 6 insertions(+), 77 deletions(-)
 delete mode 100644 package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
 delete mode 100644 package/libasplib/Config.in
 delete mode 100644 package/libasplib/libasplib.hash
 delete mode 100644 package/libasplib/libasplib.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 7d544a6e61..73e8d02d48 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -688,7 +688,6 @@ package/libabseil-cpp/0001-force-position-independent-code.patch Upstream
 package/libarchive/0001-autotools-do-not-add-iconv-for-Requires.private.patch Upstream
 package/libargon2/0001-libargon2-dont-fail-on-existing-symlink.patch Upstream
 package/libart/0001-art-config-cross.patch Sob Upstream
-package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch Upstream
 package/libatasmart/0001-strpool-cross-flags.patch Upstream
 package/libavl/0001-fix-makefile.patch Upstream
 package/libb64/0001-Integer-overflows.patch Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index d3a67aba83..7184d0a8b9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.08"
 
+config BR2_PACKAGE_LIBASPLIB
+	bool "libasplib removed"
+	select BR2_LEGACY
+	help
+	  libasplib is no longer needed.
+
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37.x has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 188c579010..e716642c6b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -357,7 +357,6 @@ F:	package/kodi*
 F:	package/lame/
 F:	package/leafnode2/
 F:	package/libaacs/
-F:	package/libasplib/
 F:	package/libass/
 F:	package/libbdplus/
 F:	package/libbluray/
diff --git a/package/Config.in b/package/Config.in
index bff090a661..9cdbd677ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1405,7 +1405,6 @@ menu "Audio/Sound"
 	source "package/caps/Config.in"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
-	source "package/libasplib/Config.in"
 	source "package/libbroadvoice/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcddb/Config.in"
diff --git a/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch b/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
deleted file mode 100644
index e0d0beccff..0000000000
--- a/package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 7291289ba0c052e45e2a0330642318798d6a4caf Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 27 Jan 2017 16:02:27 +0100
-Subject: [PATCH] asplib_CPUTimer.h: Fix time.h include
-
-According to https://linux.die.net/man/3/clock_gettime time.h needs to
-be included instead of sys/time.h.
-
-This patch fixes a build error found by buildroot autobuilders:
-
-http://autobuild.buildroot.net/results/cc0/cc0b928ee24a526b7c82fd3f391e2be024a14578//
-
-/home/peko/autobuild/instance-1/output/build/libasplib-be7fac89218a84b75f7598e3d76625ece99296f2/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.cpp: In member function 'void asplib::CCPUTimer::start_Timer()':
-/home/peko/autobuild/instance-1/output/build/libasplib-be7fac89218a84b75f7598e3d76625ece99296f2/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.cpp:69:19: error: 'CLOCK_REALTIME' was not declared in this scope
-     clock_gettime(CLOCK_REALTIME, &m_startTime);
-
-Patch sent upstream: https://github.com/AchimTuran/asplib/pull/34
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h b/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h
-index a61ff49..a9676e0 100644
---- a/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h
-+++ b/asplib_modules/Timer/asplib/Timer/asplib_CPUTimer.h
-@@ -29,7 +29,7 @@
-   #include <windows.h>
-   #include <time.h>
- #elif defined(TARGET_LINUX)
--  #include <sys/time.h>
-+  #include <time.h>
- #endif
- 
- namespace asplib
--- 
-2.11.0
-
diff --git a/package/libasplib/Config.in b/package/libasplib/Config.in
deleted file mode 100644
index 89d5448473..0000000000
--- a/package/libasplib/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBASPLIB
-	bool "libasplib"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  asplib (Achim's Signal Processing LIBrary), is a small and
-	  lightweight C++ library for digital signal processing.
-
-	  https://github.com/AchimTuran/asplib
-
-comment "asplib needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libasplib/libasplib.hash b/package/libasplib/libasplib.hash
deleted file mode 100644
index 251a50ee45..0000000000
--- a/package/libasplib/libasplib.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  68e117348fa17592dde7672477e927119a0e477103ced1d3a57d92e30880a147  libasplib-be7fac89218a84b75f7598e3d76625ece99296f2.tar.gz
-sha256  12ac5047f2af0522f06798b1589ffc4599bc29c91f954d7874e0320634e777c0  LICENSE
diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
deleted file mode 100644
index 5da85abe0c..0000000000
--- a/package/libasplib/libasplib.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# libasplib
-#
-################################################################################
-
-LIBASPLIB_VERSION = be7fac89218a84b75f7598e3d76625ece99296f2
-LIBASPLIB_SITE = $(call github,AchimTuran,asplib,$(LIBASPLIB_VERSION))
-LIBASPLIB_LICENSE = GPL-3.0+
-LIBASPLIB_LICENSE_FILES = LICENSE
-LIBASPLIB_INSTALL_STAGING = YES
-
-LIBASPLIB_CONF_OPTS = \
-	-DASPLIB_MODULES_TO_BUILD=some \
-	-DBUILD_BIQUAD=ON \
-	-DBUILD_IIR=ON \
-	-DBUILD_LOGGER=ON \
-	-DBUILD_SIGNALS=ON \
-	-DBUILD_TIMER=ON
-
-$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
