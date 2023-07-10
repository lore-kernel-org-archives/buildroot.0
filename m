Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37098EB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95C481FB4;
	Mon, 10 Jul 2023 17:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95C481FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olW_xlu0LC4h; Mon, 10 Jul 2023 17:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBEA5820F4;
	Mon, 10 Jul 2023 17:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBEA5820F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80C011BF955
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67BE560F39
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67BE560F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 70pntwBVaYaR for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53385606E6
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53385606E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40C9C86C7A; Mon, 10 Jul 2023 17:45:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:44:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c1b141c2900fa8085b1bc148ad54c2e7ff85a96
X-Git-Newrev: 506f018b3a8709190f79f19c8d7824b3cfa18191
X-Patchwork-Hint: ignore
Message-Id: <20230710174525.40C9C86C7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libasplib: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=506f018b3a8709190f79f19c8d7824b3cfa18191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added in 2015 to be used by Kodi ADSP addons these efforts have stopped:
https://forum.kodi.tv/showthread.php?tid=252871&pid=3053658#pid3053658
so this package is no longer needed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  6 ++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 ...0001-asplib_CPUTimer.h-Fix-time.h-include.patch | 39 ----------------------
 package/libasplib/Config.in                        | 11 ------
 package/libasplib/libasplib.hash                   |  3 --
 package/libasplib/libasplib.mk                     | 21 ------------
 8 files changed, 6 insertions(+), 77 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b583c3db6a..3d8924c4e8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -687,7 +687,6 @@ package/libabseil-cpp/0001-force-position-independent-code.patch Upstream
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
