Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E0C7EE2E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 11:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3009E60AA8;
	Sun, 11 Jun 2023 11:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3009E60AA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9ICxXMn6udp; Sun, 11 Jun 2023 11:22:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E3CA60AB0;
	Sun, 11 Jun 2023 11:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E3CA60AB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A525F1BF5DC
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 777B683947
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 11:22:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 777B683947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7JslEW_zuTc for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 11:22:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B03B838DB
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B03B838DB
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 11:22:27 +0000 (UTC)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout07.t-online.de (Postfix) with SMTP id C2BE65E310
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 13:22:24 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd79.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q8J9K-2EvXyT0; Sun, 11 Jun 2023 13:22:23 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40740)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q8J9K-0006nW-1s
 for buildroot@buildroot.org; Sun, 11 Jun 2023 13:22:22 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 11 Jun 2023 13:22:22 +0200
Message-Id: <20230611112222.717546-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1686482543-40FFB266-313E5872/0/0 CLEAN NORMAL
X-TOI-MSGID: d4c99146-5eaa-4a91-95b2-ba42227f7d56
Subject: [Buildroot] [PATCH 1/1] package/libasplib: remove package
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy                              |  8 ++++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 ...asplib_CPUTimer.h-Fix-time.h-include.patch | 39 -------------------
 package/libasplib/Config.in                   | 11 ------
 package/libasplib/libasplib.hash              |  3 --
 package/libasplib/libasplib.mk                | 21 ----------
 7 files changed, 8 insertions(+), 76 deletions(-)
 delete mode 100644 package/libasplib/0001-asplib_CPUTimer.h-Fix-time.h-include.patch
 delete mode 100644 package/libasplib/Config.in
 delete mode 100644 package/libasplib/libasplib.hash
 delete mode 100644 package/libasplib/libasplib.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index ac2e302a6b..2e5c76616d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,14 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2023.08"
+
+config BR2_PACKAGE_LIBASPLIB
+	bool "libasplib removed"
+	select BR2_LEGACY
+	help
+	  libasplib is no longer needed.
+
 comment "Legacy options removed in 2023.05"
 
 config BR2_KERNEL_HEADERS_6_2
diff --git a/DEVELOPERS b/DEVELOPERS
index 7aa5980df7..084a533506 100644
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
index aa25405947..4d24584be3 100644
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
