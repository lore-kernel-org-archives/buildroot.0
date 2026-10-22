Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328B606ACC1
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=borOi4aL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259C440993;
	Thu, 22 Oct 2026 15:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCqm_HvlhC9d; Thu, 22 Oct 2026 15:22:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B2DF040877
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792682524;
	b=LFlsX701UqUjb1x7vtP9c4vd4gFG7190dNVGWXf/dVqVhtCRpvIjA2YFKNjCOQClJfbH
	 CMgnCINXb+F6DMHIAMF7+cqBWQIPT4yoY+qND9UPqS5IdQDmYfluJVwrhCZ/tZ52chxZK
	 p0oYb9MXMk6Uk6wSAc3VRrYkQKN7eo00vKPSmlA/aiadFdBas1veLQRd+BhaK5OGyYyMY
	 mMHHmXrTu91D2t7aryYPH6o2SjCEqbRS8d8bSA9En2/+oh2E5eIozVVbr60z1uyN2zCNm
	 NlHIv3yjrBTG9xFATuryE7zKHz+cSxCWNAOV406vFuMvD4QguF1IoVUV+xZshYhox9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792682524;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UoUOzP8zpt2TbS2aDS2qW5/PE+gJqHDtAURKT3JbR4M=;
	b=NPkgbM7oogD31BooqWBUIl3ZaRDRpki0sycDiucRutrt7NyzhDPqDriHKcYzdeGzAf8x
	 Wp9izRxQDMSTF9Dr0rDIV2Hvh62E4DvXUzYlhcW/k0p3SZRV5y7O1VT4egpl6vlAgJ9oA
	 NeDjmj7bTP7HVc6wyH7/voqoTO4w9a7aUOYTsppAjNE+PL/A2v2wz4N9YpuNGw3tJrLkw
	 gg6Wq4TivB2wQYN2JZlmVeddufYzqP+5VD4nMKuHZ/7XLu2t77Lj0ZMbBAmE2lpk8DIK8
	 6V/7nfVmjygle+7bPX5SO+7iJ1Yn8YEK+6xek5zbxyCagZ0uFtzaBoKkGHdsuRSZNKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792682524;
	bh=UoUOzP8zpt2TbS2aDS2qW5/PE+gJqHDtAURKT3JbR4M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=borOi4aLa1a4YxDlS94LTj+l6+zceVnqSHkI7BWTJ70j7qn3wgEolHFJxNwMS0BOQ
	 Pklc7EaOqQdeDHSj5CREGzkhgUa0n6Lqu6Z2ZXsvWzOSlRGNYDQ9UUv2vyxh95VrBm
	 ee/6RLJCHcnJBJH7CDMltNBuD15V1+tnx/gCNxdMqE+W/x/sNk56ZPMyxKdyBhji/z
	 vuNHurIWnI19CyXXXlclwcnfW0xsX6S6hHDrF9yyVNn2wBUv5XUQTKdgAhSaMkULR4
	 a3Dmhm2q1KdxNwgoRUXA7U3xZTz/k4n+VZ00X2/MK3g15QmkphSQR2u7/uIdsIcw+d
	 pGQx679cBM28Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DF040877;
	Thu, 22 Oct 2026 15:22:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF3D3A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 821E640877
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIJz3L3kSeQw for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:22:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 804A840800
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792682522;
 b=phEz8IHSAd2ACTlG7tcTFAX50eQTrNoWMDrf0d0HuWjEzrnx3gEuKz0I8lZTcQE9eAo2
 hxbpvjsXoZ1PS4kT3J9e+XL9XrtdQ55Mrj1rZJWoFYoL6Wmb1P4uGchKnIq3x0HvfMWMm
 w49qj1ukr4PdAZEjUamFpPEPBZ7KWifhK6HHk1hyMqStzMAJ8F5pU2HEuI910if7OQknW
 pa/7ICiLeOsWtQPCfNiM1HhC+6wX7S2/yIMXMyTfRnYgXd3qjaF3EtQYgcy2xIiPdiAX7
 Rexrn651Thb2A/NXDKEGqFTWHgHV5iHtOt25IUyIKzZKrYvXd2ytMxYtDvjB++2vUuQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792682522;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0jnv5fjlvRmy7B4TS7Z+UaxTNcpyu84QTQMaAf91nG4=;
 b=RBLr1hiXFghqg/W8ZyiGOKZ2vtqdjhQkaxRXbm+pblDtXpsqznxZ1w/0zbuzazU5FuOV
 whkbs9OPea7/gqcEgAJLfoUE/lB3fVmswmkyCnALbKjjvMKwtYNPXi0s4I2sbMQGeRaSj
 1O0ptpRCKJwzJbci0X6FcyDpqKt2egIZA7KBd/ztoGeXok4kmKAHxqTXZTsWk5GtYgQR5
 CM8yE0Y8LJaLruZ4mBIcRFnez2o2Y3tNkBkC1friIsCTn9YVlTpERORRXsKNjsmR2srjw
 cj0Q5UJNk27L6wj0I5gg9p8F9ccf6jzp18YAPnZU2T1eMzyvtqX+IgOMPz7GI7mZsPA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 804A840800
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:22:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 746809B9F9; Thu, 22 Oct 2026 15:20:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 16:21:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 638c9592cff955c3aadcf509186b86330c36f176
X-Git-Newrev: 83142f3f79537de47593f34fb5a90affe0ffa8ae
X-Patchwork-Hint: ignore
Message-Id: <20261022152038.746809B9F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eigen: bump to version 5.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83142f3f79537de47593f34fb5a90affe0ffa8ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update Eigen from 3.4.0 to 5.0.1.

Remove the downstream CMake patch because the BLAS, LAPACK and
CMake package toggles are now provided upstream in 5.0.1.

Refresh the source and license hashes to match the new release and
update the package license metadata to reflect the current upstream
licensing files.

Add a gcc >= 6 dependency in Config.in because Eigen 5.x requires
C++14 support.

Update the project homepage to the current upstream GitLab URL.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...ake-Options-for-controlling-build-compone.patch | 88 ----------------------
 package/eigen/Config.in                            |  7 +-
 package/eigen/eigen.hash                           | 11 ++-
 package/eigen/eigen.mk                             |  6 +-
 package/gtkiostream/Config.in                      |  4 +-
 6 files changed, 15 insertions(+), 102 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bdeef49192..5fff512d93 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -293,7 +293,6 @@ package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patc
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
index ef0a16f2f7..f1b5937a0e 100644
--- a/package/eigen/Config.in
+++ b/package/eigen/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EIGEN
 	bool "eigen"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # C++14
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
+comment "eigen needs a toolchain w/ C++, gcc >= 6"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_6
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
index 334b4dc331..0ebd85b525 100644
--- a/package/gtkiostream/Config.in
+++ b/package/gtkiostream/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GTKIOSTREAM
 	bool "gtkiostream"
 	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # eigen
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # eigen
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ALSA_LIB_MIXER if BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_EIGEN
@@ -18,7 +19,8 @@ config BR2_PACKAGE_GTKIOSTREAM
 
 	  https://github.com/flatmax/gtkiostream
 
-comment "gtkiostream needs a toolchain w/ C++, threads"
+comment "gtkiostream needs a toolchain w/ C++, gcc >= 6, threads"
 	depends on BR2_PACKAGE_GTKIOSTREAM_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
