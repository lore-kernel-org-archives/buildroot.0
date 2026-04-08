Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707DDFD5F7F
	for <buildroot@archiver.kernel.org>; Wed,  8 Apr 2026 06:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12EE182393;
	Wed,  8 Apr 2026 06:28:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iPyqKVq8RIW2; Wed,  8 Apr 2026 06:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEB98238F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775629731;
	bh=SPeY3pDXIHLXAVsUWoYTHPQTXOAKCK1NPjdHS+L6hkI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8YbIqX8fpNJ7qu4v8gvJ12osj8I3JBiR4fhaGG1F7SJ2dw/VeTuFhUxJV57dDA5W
	 zZQ2fG+PmU6uq55LYBr05QKaku4fK7kHFopaLSSeJ7qMKmAKBrjHfJdo54t3+Ytnnn
	 R9DwZzd4ArCqDm5Tpwp7dpss3x1Wy+BBcjlVHkdSSHvpUUhgD9yg1ank3g1oBxsZkN
	 h+thVb5crV/i8RzFBX85b0/AX5m782TU/cA+eyeQGCZsXgVJpUNUl2Xj9EVzHe7mFG
	 6Aw3S/1wXt1VajvIjQwrubbrmAOIUVKCaoibISRAQlb2P8VC2Mt5zMK5mK5v8AhsFL
	 qnFz8Z84ampqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCEB98238F;
	Wed,  8 Apr 2026 06:28:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E76237
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDD1C8238F
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wckPju8AHy8p for <buildroot@buildroot.org>;
 Wed,  8 Apr 2026 06:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A96FA8238B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A96FA8238B
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A96FA8238B
 for <buildroot@buildroot.org>; Wed,  8 Apr 2026 06:28:48 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2ad21f437eeso3803275ad.0
 for <buildroot@buildroot.org>; Tue, 07 Apr 2026 23:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775629727; x=1776234527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZinMan9V9SMrs32cnaDC1mZqjeaX+nxyeQhjbwRBmBA=;
 b=rYba1OTpeiZOfCsZKpCNVGu7Zp/pj9lNOWgQqGbDWtyuiMFGkPZSPHJwaJDJmL1Hdo
 5NpjZrfs5lELyqqi2SPpRpdzaCyMYiXoh95sUidvDXifYRha50423IdEDngy8I8oUdJr
 cXGLIeIAeyJ4Ts6bD91bTaEzveXq1sHrkEtbb4sYxO0DkcnTRGC25e/29Jd1Vnqp9Exu
 JMkRVVAqT2nKCCfh9Z9Ejiu+SjOP4yGbQG7opxqKwn3369F/4+rVcQC6/7gj1Q0L6yqM
 iyJp/pTpO2irdEG4PjQZCfqxWZXozcv79pcEkISrJwJmZhWMywOoCwySJO88HDDq1EJF
 gYEw==
X-Gm-Message-State: AOJu0Yw8uZ6RXtgNannKg2Da0PB5DcFrMqIIhb+EdF9/1KrL9QAT8913
 WtQvHVvjNBSwdIMc7bbqptctahVK+cWBHXDBZ7kYpRPXeJmdtELNNsSeqjGIdq+G
X-Gm-Gg: AeBDieuMbDi94iJgAju23y2pJ9lkGr3MVwkciFFNqShy6k7SMSMhny5XJGvUJrwcJeb
 +7xXdL96AjiawQ0QarpIjk1YSvAFdy44kbrrS74JQPdPRCwgvdtVn/HrR0jiRyRoSkvqNJj5LTo
 FrRkC/L+vv67xwrI32GClN89TkLBLZTFeXSpUxT+PoiMiKBmmRAg842F/C742InPX+s8hcpDArf
 vySZjpO6Cz32fdX2K3g/W/+t3nckj7faxX9rWMh75oKzl2GbIEe2uSupfTGkacPlMISW4kOwsMH
 RiAEUJ7Um0ks5QEGAzGt/8iR79BFqaCUYwnOVW07ZqeTQFcK+HGraqyipqTzXBkevQp8gVsU9Pa
 q6jOOV/JndsO/+7UQFR/ck91GMH/0FsNQsJhcCUeyzOh1VxrX6eiT78Tshfj7+Eashm+7OJuskz
 Bt/Wy+Eewfo+TKfs56gUuK+Jo6s7n1k8o=
X-Received: by 2002:a17:902:d2c6:b0:2b2:53f5:461f with SMTP id
 d9443c01a7336-2b277e566a8mr202140985ad.25.1775629727189; 
 Tue, 07 Apr 2026 23:28:47 -0700 (PDT)
Received: from fedora ([47.31.83.28]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2747612b7sm190719035ad.23.2026.04.07.23.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 23:28:46 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed,  8 Apr 2026 11:58:31 +0530
Message-ID: <20260408062831.8587-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404100127.75303-1-chakrabortyshubham66@gmail.com>
References: <20260404100127.75303-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775629727; x=1776234527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZinMan9V9SMrs32cnaDC1mZqjeaX+nxyeQhjbwRBmBA=;
 b=q7/Ht2DBlPRVv4dZdlwgDJ146GvoblVLgcX5QieGE40w4FX0M6mXJQ/G5dskTXwh/j
 TS4UnqLRQ9bTGwwfUeACHygTkDoEAHK6vMiN+rLPnG634lWK5dUn3GO9kf7NdrUS5sgw
 LLTSl1KfJVtOXT+X97eLkffFf6e8UrOKcsXhX8oYM+il9oaddeZKvCXGSSDVHOj2LT3k
 2HImflntXNwjmySwUPuUECy6yINozHJhh8j1kNH8eGrgOhiNMPUGmvMpjnYub4UHTIBX
 KAGZYt/tq0tQAY7QUnGyG2RxCmmhllrv402kmvObA2GMIZo3ZajD7RGAmlAO7E/WaNZ3
 fdDA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=q7/Ht2DB
Subject: [Buildroot] [PATCH v2] package/eigen: bump to version 5.0.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update Eigen from 3.4.0 to 5.0.1.

Remove the downstream CMake patch because the BLAS, LAPACK and
CMake package toggles are now provided upstream in 5.0.1.

Refresh the source and license hashes to match the new release and
update the package license metadata to reflect the current upstream
licensing files.

Add a gcc >= 5 dependency in Config.in because Eigen 5.x requires
C++14 support.

Update the project homepage to the current upstream GitLab URL.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
-----------
Changes v1 -> v2:
 - remove stale .checkpackageignore entry for deleted eigen patch
 - propagate eigen gcc >= 5 dependency to gtkiostream
 - propagate eigen gcc >= 5 dependency to opencv4-contrib sfm
 - no change needed for tensorflow-lite since it already depends on gcc >= 8
---
 .checkpackageignore                           |  1 -
 ...ptions-for-controlling-build-compone.patch | 88 -------------------
 package/eigen/Config.in                       |  7 +-
 package/eigen/eigen.hash                      | 11 ++-
 package/eigen/eigen.mk                        |  6 +-
 package/gtkiostream/Config.in                 |  4 +-
 package/opencv4-contrib/Config.in             |  3 +-
 7 files changed, 17 insertions(+), 103 deletions(-)
 delete mode 100644 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index e9a002f766..3c3afed86a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -308,7 +308,6 @@ package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patc
 package/ecryptfs-utils/0001-musl.patch lib_patch.Upstream
 package/ecryptfs-utils/0002-openssl110.patch lib_patch.Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
-package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
 package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
diff --git a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch b/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
deleted file mode 100644
index 737e7d39b7..0000000000
--- a/package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From f49d5c1a6b7c22be359189cd0b1e2e766bd05365 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Antonio=20S=C3=A1nchez?= <cantonios@google.com>
-Date: Sat, 5 Mar 2022 05:49:45 +0000
-Subject: [PATCH] Adds new CMake Options for controlling build components.
-
-[Retrieved from:
-https://gitlab.com/libeigen/eigen/-/commit/cf82186416d04ea5df2a397d8fe09dc78d40ca65]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Julien: rebased patch on 3.4.0]
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- CMakeLists.txt        | 6 ++++++
- blas/CMakeLists.txt   | 3 ++-
- lapack/CMakeLists.txt | 5 +++++
- 3 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f3e69b845..74ff755f5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -495,6 +495,9 @@ if(BUILD_TESTING)
-   add_subdirectory(failtest)
- endif()
- 
-+include(CMakeDetermineFortranCompiler)
-+option(EIGEN_BUILD_BLAS "Toggles the building of the Eigen Blas library" ${CMAKE_Fortran_COMPILER})
-+option(EIGEN_BUILD_LAPACK "Toggles the building of the included Eigen LAPACK library" ${CMAKE_Fortran_COMPILER})
- if(EIGEN_LEAVE_TEST_IN_ALL_TARGET)
-   add_subdirectory(blas)
-   add_subdirectory(lapack)
-@@ -612,6 +615,8 @@ set_target_properties (eigen PROPERTIES EXPORT_NAME Eigen)
- 
- install (TARGETS eigen EXPORT Eigen3Targets)
- 
-+option(EIGEN_BUILD_CMAKE_PACKAGE "Enables the creation of EigenConfig.cmake and related files" ON)
-+if(EIGEN_BUILD_CMAKE_PACKAGE)
- configure_package_config_file (
-   ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Eigen3Config.cmake.in
-   ${CMAKE_CURRENT_BINARY_DIR}/Eigen3Config.cmake
-@@ -647,6 +652,7 @@ install ( FILES ${CMAKE_CURRENT_SOURCE_DIR}/cmake/UseEigen3.cmake
- # Add uninstall target
- add_custom_target ( uninstall
-     COMMAND ${CMAKE_COMMAND} -P ${CMAKE_CURRENT_SOURCE_DIR}/cmake/EigenUninstall.cmake)
-+endif()
- 
- if (EIGEN_SPLIT_TESTSUITE)
-   ei_split_testsuite("${EIGEN_SPLIT_TESTSUITE}")
-diff --git a/blas/CMakeLists.txt b/blas/CMakeLists.txt
-index f3a94ec4a..d07090f69 100644
---- a/blas/CMakeLists.txt
-+++ b/blas/CMakeLists.txt
-@@ -1,6 +1,7 @@
- 
- project(EigenBlas CXX)
- 
-+if(EIGEN_BUILD_BLAS)
- include(CheckLanguage)
- check_language(Fortran)
- if(CMAKE_Fortran_COMPILER)
-@@ -59,4 +60,4 @@ if(BUILD_TESTING)
- endif()
- 
- endif()
--
-+endif()
-diff --git a/lapack/CMakeLists.txt b/lapack/CMakeLists.txt
-index e48497fda..71255d96d 100644
---- a/lapack/CMakeLists.txt
-+++ b/lapack/CMakeLists.txt
-@@ -1,6 +1,8 @@
- 
- project(EigenLapack CXX)
- 
-+if(EIGEN_BUILD_LAPACK AND EIGEN_BUILD_BLAS)
-+
- include(CheckLanguage)
- check_language(Fortran)
- if(CMAKE_Fortran_COMPILER)
-@@ -450,3 +452,6 @@ if(EXISTS ${eigen_full_path_to_testing_lapack})
- 
- endif()
- 
-+elseif(EIGEN_BUILD_LAPACK AND NOT EIGEN_BUILD_BLAS)
-+ message(FATAL_ERROR "EIGEN_BUILD_LAPACK requires EIGEN_BUILD_BLAS")
-+endif() #EIGEN_BUILD_LAPACK
--- 
-2.45.2
-
diff --git a/package/eigen/Config.in b/package/eigen/Config.in
index ef0a16f2f7..b1746da9e9 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EIGEN
 	bool "eigen"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	help
 	  Eigen is a C++ template library for linear algebra: vectors,
 	  matrices, and related algorithms. It is versatile, fast,
@@ -11,7 +12,7 @@ config BR2_PACKAGE_EIGEN
 	  right away. There is no binary to link to. Eigen is a pure
 	  template library defined in the headers.
 
-	  http://eigen.tuxfamily.org/
+	  https://gitlab.com/libeigen/eigen
 
-comment "eigen needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "eigen needs a toolchain w/ C++, gcc >= 5"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/eigen/eigen.hash b/package/eigen/eigen.hash
index ad7d6da9dc..09d23ef7e6 100644
--- a/package/eigen/eigen.hash
+++ b/package/eigen/eigen.hash
@@ -1,8 +1,7 @@
 # Locally computed
-sha256  b4c198460eba6f28d34894e3a5710998818515104d6e74e5cc331ce31e46e626  eigen-3.4.0.tar.bz2
+sha256  e4de6b08f33fd8b8985d2f204381408c660bffa6170ac65b68ae1bd3cd575c0a  eigen-5.0.1.tar.bz2
+sha256  03379001a7b12a2ec997a25554247d985270b353c10d5bafee9ac8d6519820b7  COPYING.APACHE
 sha256  51928dce36213c5333ba3172e847d735d4c6e9b7ff2722a326c49067155b82eb  COPYING.BSD
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.GPL
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  f5b330efdad110cdd84d585ec61220b0650461fa599e36b13e1726c9346dcfb9  COPYING.MINPACK
-sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  COPYING.MPL2
-sha256  c83230b770f17ef1386ea1fd3681271dd98aa93646bdbfb5bff3a1b7050fff9d  COPYING.README
+sha256  c87b7f8ee88f6195e91743820c00354833583aef091b72e2d4a49c8e28e798a0  COPYING.MINPACK
+sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  COPYING.MPL2
+sha256  db640ff2bd90c6abd6a4d3fbb351e0ee4d555417cf840492054d1cbb2ea85644  COPYING.README
diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 7fe3fbdac6..df83db70fa 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-EIGEN_VERSION = 3.4.0
+EIGEN_VERSION = 5.0.1
 EIGEN_SOURCE = eigen-$(EIGEN_VERSION).tar.bz2
 EIGEN_SITE = $(call gitlab,libeigen,eigen,$(EIGEN_VERSION))
-EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1
-EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
+EIGEN_LICENSE = MPL-2.0, BSD-3-Clause, Apache-2.0, Minpack
+EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.APACHE COPYING.MINPACK COPYING.README
 EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
 EIGEN_SUPPORTS_IN_SOURCE_BUILD = NO
diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
index 334b4dc331..41426e06bd 100644
--- a/package/gtkiostream/Config.in
+++ b/package/gtkiostream/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GTKIOSTREAM
 	bool "gtkiostream"
 	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # eigen
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # eigen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_EIGEN
@@ -18,7 +19,8 @@ config BR2_PACKAGE_GTKIOSTREAM
 
 	  https://github.com/flatmax/gtkiostream
 
-comment "gtkiostream needs a toolchain w/ C++, threads"
+comment "gtkiostream needs a toolchain w/ C++, gcc >= 5, threads"
 	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/opencv4-contrib/Config.in b/package/opencv4-contrib/Config.in
index 529687dd96..8f8156f1e8 100644
--- a/package/opencv4-contrib/Config.in
+++ b/package/opencv4-contrib/Config.in
@@ -259,6 +259,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SALIENCY
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
 	bool "sfm"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # eigen
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # glog
 	select BR2_PACKAGE_OPENCV4_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV4_LIB_IMGCODECS
@@ -271,7 +272,7 @@ config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SFM
 	  the module is a light version of Libmv.
 
 comment "sfm needs a toolchain w/ gcc >= 6"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_PACKAGE_OPENCV4_CONTRIB_LIB_SHAPE
 	bool "shape"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
