Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5646DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBC79840C9;
	Mon,  6 Jun 2022 10:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGtZjOAkWWJU; Mon,  6 Jun 2022 10:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B99E4840C4;
	Mon,  6 Jun 2022 10:02:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC31A1BF3C6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB24F840C4
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SfzuU4OTli4h for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:02:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C164B840C1
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:02:56 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p10so19135622wrg.12
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 03:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1/skVbS0M06vFOh/TPsZ7lRA5jB0G6sN+33Uw0C0oE=;
 b=WooTwWscDYslLuujdKhCMIa4ZP4nRj7ZVguV6wvOg7PkHN65v/OibmI0QlyUv1uXcT
 UTdXfRbFpwbN+gBU/3uG+luYYMxUlITkBG0ga/fMgX9PbQSpyvfu8+o5bMmXyx7aFb5a
 1Cp5PEdt1useaHg89YegSF7YtGdmygg3vZUNLsmQWfR5RqzDVIPz9ZxJkiJqHvJ6LRHN
 anzL3kVO075VU6ike/BRrCpUUP9wDu+j64bR/vpORrAChjl8Oj3A8e9Zsq/gQTsAfTyc
 UCP0S5CFy6VW8LSATCtGqYzhC2cLMfY5bkmetcph1RkwERWZDwDDL8IhfZrUofn2bhYN
 vQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1/skVbS0M06vFOh/TPsZ7lRA5jB0G6sN+33Uw0C0oE=;
 b=17U2ZRTwOiyxLONloglVsdfCYWexlaYSoImHF80qaMOgh5H5yy+v4k+KP67O8ggYbs
 uUalVH11fduLXiDe7MBtP4r+RVMWURcWYiwqiaxga5Ieb9Jv3nZFesXuiJoXZ3DykeSN
 gOFIAF/SU5NBU1GJ1K3uU63RW/dPSUU/Jij3642kVNp3B2e5OQnrEBTfje4DhqpsgXo6
 gnhGBfVl7TmwDQnjRhb1fNfAtpiMyt635Itw2qeZabH9yNyvHB+s4iN6MC/q/StAbtXE
 pR77yzbH7FUVj2rwiTE+fM102DTfUKwa//vcvGD/atIoW/162RX7OxM2rFfKyjxNSacR
 yjfw==
X-Gm-Message-State: AOAM533p68+/hEZD5mSGFOoN0El4UOZblSOTeIn/GeDefWh+x+FMQQQ1
 4CEmzJFB6TFdgPbFKV3F7CXSFH3TZ0I=
X-Google-Smtp-Source: ABdhPJxwgi+nJAYHpFeES9mGX/a2J/IpnGBoOLuOeuj7yhMWT5uEOds6HcCGbj7dUB1rQcGJ+G+9Ow==
X-Received: by 2002:a05:6000:1445:b0:20f:e3f6:ee34 with SMTP id
 v5-20020a056000144500b0020fe3f6ee34mr20549366wrx.270.1654509774465; 
 Mon, 06 Jun 2022 03:02:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c19cf00b003973b9d0447sm17225054wmq.36.2022.06.06.03.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 03:02:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 12:00:23 +0200
Message-Id: <20220606100023.365608-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/eigen: fix build without Fortran
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without a working Fortran compiler:

CMake Error at /nvmedata/autobuild/instance-17/output-1/host/share/cmake-3.18/Modules/CMakeTestFortranCompiler.cmake:51 (message):
  The Fortran compiler

    "/usr/bin/f95"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/37f3f40ee39739b5e557d634b71a448762107a4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ons-for-controlling-build-components.patch | 85 +++++++++++++++++++
 package/eigen/eigen.mk                        |  9 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch

diff --git a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
new file mode 100644
index 0000000000..693e610d0a
--- /dev/null
+++ b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-components.patch
@@ -0,0 +1,85 @@
+From cf82186416d04ea5df2a397d8fe09dc78d40ca65 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
+Date: Sat, 5 Mar 2022 05:49:45 +0000
+Subject: [PATCH] Adds new CMake Options for controlling build components.
+
+[Retrieved from:
+https://gitlab.com/libeigen/eigen/-/commit/cf82186416d04ea5df2a397d8fe09dc78d40ca65]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ CMakeLists.txt        | 6 ++++++
+ blas/CMakeLists.txt   | 3 ++-
+ lapack/CMakeLists.txt | 5 +++++
+ 3 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index de1c23e91..0af36a53a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -477,6 +477,9 @@ if(EIGEN_BUILD_TESTING)
+   add_subdirectory(failtest)
+ endif()
+ 
++include(CMakeDetermineFortranCompiler)
++option(EIGEN_BUILD_BLAS "Toggles the building of the Eigen Blas library" ${CMAKE_Fortran_COMPILER})
++option(EIGEN_BUILD_LAPACK "Toggles the building of the included Eigen LAPACK library" ${CMAKE_Fortran_COMPILER})
+ if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
+   add_subdirectory(blas)
+   add_subdirectory(lapack)
+@@ -611,6 +614,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
+ 
+ install (TARGETS eigen EXPORT Eigen3Targets)
+ 
++option(EIGEN_BUILD_CMAKE_PACKAGE "Enables the creation of EigenConfig.cmake and related files" ON)
++if(EIGEN_BUILD_CMAKE_PACKAGE)
+ configure_package_config_file (
+   ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3Config.cmake.in
+   ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
+@@ -655,6 +660,7 @@ install (FILES ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
+ # Add uninstall target
+ add_custom_target ( uninstall
+     COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/EigenUninstall.cmake)
++endif()
+ 
+ if (EIGEN_SPLIT_TESTSUITE)
+   ei_split_testsuite("${EIGEN_SPLIT_TESTSUITE}")
+diff --git a/blas/CMakeLists.txt b/blas/CMakeLists.txt
+index 8d3cb86dc..c530957fb 100644
+--- a/blas/CMakeLists.txt
++++ b/blas/CMakeLists.txt
+@@ -1,6 +1,7 @@
+ 
+ project(EigenBlas CXX)
+ 
++if(EIGEN_BUILD_BLAS)
+ include(CheckLanguage)
+ check_language(Fortran)
+ if(CMAKE_Fortran_COMPILER)
+@@ -59,4 +60,4 @@ if(EIGEN_BUILD_TESTING)
+ endif()
+ 
+ endif()
+-
++endif()
+diff --git a/lapack/CMakeLists.txt b/lapack/CMakeLists.txt
+index c8ca64001..8d6d75401 100644
+--- a/lapack/CMakeLists.txt
++++ b/lapack/CMakeLists.txt
+@@ -1,5 +1,7 @@
+ project(EigenLapack CXX)
+ 
++if(EIGEN_BUILD_LAPACK AND EIGEN_BUILD_BLAS)
++
+ include(CheckLanguage)
+ check_language(Fortran)
+ if(CMAKE_Fortran_COMPILER)
+@@ -457,3 +459,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
+ 
+ endif()
+ 
++elseif(EIGEN_BUILD_LAPACK AND NOT EIGEN_BUILD_BLAS)
++ message(FATAL_ERROR "EIGEN_BUILD_LAPACK requires EIGEN_BUILD_BLAS")
++endif() #EIGEN_BUILD_LAPACK
+-- 
+GitLab
+
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 9df286e11f..7fe3fbdac6 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -18,7 +18,14 @@ EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
 EIGEN_CONF_OPTS = -DPKGCONFIG_INSTALL_DIR=/usr/lib/pkgconfig
 
 ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
-EIGEN_CONF_OPTS += -DCMAKE_Fortran_COMPILER=$(TARGET_FC)
+EIGEN_CONF_OPTS += \
+	-DCMAKE_Fortran_COMPILER=$(TARGET_FC) \
+	-DEIGEN_BUILD_BLAS=ON \
+	-DEIGEN_BUILD_LAPACK=ON
+else
+EIGEN_CONF_OPTS += \
+	-DEIGEN_BUILD_BLAS=OFF \
+	-DEIGEN_BUILD_LAPACK=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
