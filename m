Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5ABE88D8B
	for <buildroot@archiver.kernel.org>; Sat,  4 Apr 2026 10:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D951608AB;
	Sat,  4 Apr 2026 10:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPQWRZkFULx4; Sat,  4 Apr 2026 10:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C75E6089E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775296912;
	bh=0Vs1JiZTuiejOd6cxCqhf0tTuHMdtRXGomddY3s3H/E=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WVW1eGOfA+aQUNs1G7M3qCcgZbMRyIcUcr2rzeuJ2n5qRbDO/3NnejhI0Rro/HIf/
	 JPybXqNmdfgwe1wVBdXkf05pSDHBEEpTskF3ykJDrrJGoQDJ/z2Mu9mAD4R9WPIsww
	 NEdAdrqmQhg8dkbcQJzT4/7BntDtyDYEKISrTWm/R5tYrK+SYxuwe/1n3Ad4SZ8bIp
	 DAXfXfPUV1Ot4xG+NwVlW4h6F3XaP98U0kADCOILR6Z1j6W4+Sizz3WNHJE4L30CHH
	 6VjwPzLkUBPufoUjb4h/PuiuJp14w8AeJ2W4GAXrFaQTjQGnEWaAGB6uzNJspgahox
	 BMWKBS6bN1ERQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C75E6089E;
	Sat,  4 Apr 2026 10:01:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 623CA91B
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B8166089E
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vACDjf2IQEh2 for <buildroot@buildroot.org>;
 Sat,  4 Apr 2026 10:01:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EB906071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB906071E
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EB906071E
 for <buildroot@buildroot.org>; Sat,  4 Apr 2026 10:01:49 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-3590042fa8eso1770905a91.1
 for <buildroot@buildroot.org>; Sat, 04 Apr 2026 03:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775296908; x=1775901708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ylf7a8h+oRudqIwKo8dndil6QAyr7M+PzqEQj+pddGc=;
 b=nWsJfbLQKpMJ4lgC1lYc7QMzNzWnpxZdE/4+5u0cpV9TWg5IXQDuAwJBJc7dbw+KsW
 KIng3tPPZNOZAhReu91Z2mOVpRqeo/S9JuXW16gtqDksPBwxfOr3/GZXCuLr6ZQYl0vG
 ZsYTtqKtL05E2w5k59Soug1SdMSaB0vtEh29FGBXiWr5D5pvRKSNY3Lzf+aNIMFRT//G
 vldAhegrVEoQy5HQCtnVtC2+S3eaXbdW0IBucnwq3+dTqfzRIqx12xJADZc7q2GoXvgY
 JmvwYEJad+apizUcojrCbq94ZrddFJaRhrYm/1SikLgpyZ61dCbjAjcTC4SQasoUBugd
 iXSQ==
X-Gm-Message-State: AOJu0YwdeRNk169Ynz31c2Dn0/KTsgeBsEJmRa/t5OCXETNWsTtW5buH
 L3JBed60yYTcyj4UGFd0KDs03lThw6RjayZrtG5vGIl4OVbYw1uxX34GXZDT8w==
X-Gm-Gg: AeBDiesoEnxD42CWYdxVKLHC+nt+x1UNPaEC7TbVi0S1nLxQOyC4wZpDvRd81mC+SF6
 XE80Dl3nrGBwWgCd57fUTsyW8ZO8nF6vFAgt2GZuIVxHbM5QOcBi8r8kjzKhplflUyDbJn6bR9h
 jThtkjhx0YPKxz/1OoZ7V2zcMAjvy5zI3Orf8an2qs8TywxLGuZgx0itssoAe149526D3uV5Q5f
 lXp2TBCwsMIkB1ctRuDF9leyRd3Zq1l64uFI+fmfuMefM7EQTxMZOlsB0WbN2duTfQERVtt5oMH
 fVTURmnxnFYJ46uLm7rWaOvunJJH5laLmFlnojpQNgCUkI1mHGlkG5eNaq72YHriC840gdDKfeh
 FPkh8r724386RO9bGkI1kS98mrKvJYSUBGiT1QvgDxmXVGT9IKQpcchIyF+cRmZaYngsVk3rQ/z
 PHeMyCBFTmWAN/FGw9U8uI4o0Ds2mErdTo
X-Received: by 2002:a17:90b:2e49:b0:35a:189b:43db with SMTP id
 98e67ed59e1d1-35de6810e49mr5185277a91.4.1775296907548; 
 Sat, 04 Apr 2026 03:01:47 -0700 (PDT)
Received: from fedora ([47.31.82.126]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dd368f538sm11950376a91.14.2026.04.04.03.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2026 03:01:46 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat,  4 Apr 2026 15:31:26 +0530
Message-ID: <20260404100127.75303-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775296908; x=1775901708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ylf7a8h+oRudqIwKo8dndil6QAyr7M+PzqEQj+pddGc=;
 b=UyTWLA48u8d6v11fJkooLmtj1l2E8B1F72fzVmSp+aNd7Rwh1xr0xtU/nb3Tc295lL
 yPcOFSRr9axugTNuhsfK2hB/kuUksQXV0nF97vu1X6Zm31aEV/fIuTSnxOiwhr9ROqbR
 vyxXR9xFcMArsWjpBVoHFm0WuTN04TmhtcGqAPnUfd3UO81Zn6pp03qvyeTNZ6dpfZ2m
 5tYfQQd0WYauuqeg0Y9ayeif/msjizgQa+j8qxNUdSCGVHX71RCH2a8XP0m3zfafBH9H
 fLDvuPW0jqM6vrZXgFOhD+n6WORLTgXHebrHYMFegV3YdHI9pStIelNfNo+p+VcRULQ0
 u3nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UyTWLA48
Subject: [Buildroot] [PATCH] package/eigen: bump to version 5.0.1
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
---
 ...ptions-for-controlling-build-compone.patch | 88 -------------------
 package/eigen/Config.in                       |  7 +-
 package/eigen/eigen.hash                      | 11 ++-
 package/eigen/eigen.mk                        |  6 +-
 4 files changed, 12 insertions(+), 100 deletions(-)
 delete mode 100644 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch

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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
