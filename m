Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E641606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RFIaIJg/
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F40A40DBB;
	Fri, 30 Oct 2026 14:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VEBGP9P1tBf; Fri, 30 Oct 2026 14:20:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F1B4640CC2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370043;
	b=m6LKXpiPmWAyTl/YqZQSvcE7XHEvztYe5NJvTtEUmX0QxobvSRQ1mw951CDj7bpvU4rP
	 OfQL0sBr2jB/GL7tLA/kklpukK7ZVNGp97RzXGUO2Ls5/kGOdWQgVECAZma6wrKK6GvPA
	 7vlB6W6zW0ONflEO37bNIVOC6Od/sucfHvzJmCje6EEQ1jTha8Bxmx59zUbnRMhagV+RR
	 4g4x6eHjGaliC+YZUi7zxOQPaG73pXsOMsVmg15xVnP8Pg2cK4dUz7dWA6lWpbNtYOHKR
	 G7PqRhPxipDnJUJLJgTqneFG8GQ0RQjq6aq25y5I+GFKCk7kypi+bZsClkaE+7i/FCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370043;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5wFBxVp6dm5al+aERcHJYzJi847aiDesafffMHKfqzE=;
	b=owvdc1EZJBnNnHcOsOa7jWTwJgCQc36F5Mw2RZc98aXpWtOjjpCqMoknbw/3Jbh085RM
	 XeATP00DXMyHan9Nq8WNWXPLME/AG1hw5mB+n4Be/MAVC7JsJf5oh3J67LJwVjbMQPSjl
	 koFoxEdjoJ8UT3LZ6kzfj7RjoLwstS0FqdoDaGL4Bf2xIjFQa0dhk0zt3uAgI4u3fPJUQ
	 yfgJkg95To/gXrqdIPPIINWREJLzc+pC8PlRM8x+np6XqPeiF0WsweAgHNwdel7Fr2wup
	 I6vbLngg+dM3jPHRwiuCZZPRBEZbPaokHaH2xMyu3r1thH9bSLeu6v6IkNeOJn3/7tA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370043;
	bh=5wFBxVp6dm5al+aERcHJYzJi847aiDesafffMHKfqzE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RFIaIJg/MGRWf7qs/c1irVahdBHdysvE1oRkBBh3C99x1gDa9ikMyQhp1b+1PUOeO
	 drzfFH0CAbjNglun/ZeiU7Q9vlMLA4oatqiOSEFCOb0K+Tg2EAZvIl2MZ2OgT77d83
	 0NSIbIKdSScl2qKDjh+mYosfBfDdOi/uaiLJ9oSJGAf2s1FmPB3nr76V9sbOHMO07U
	 S9MQu6ooOIHhME8zM2B0nXJmAHhtAzAFpFf51+RqVzI7m/hbk6bX4oN8FMKj/DOuMk
	 ZZsVuDQjcO5K3SAhz0WoUVCMSLa7ZrB9ByG151FlAdTfRsLETHxOFUAi9XFTqf3HzX
	 HEG1tqljdIYcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B4640CC2;
	Fri, 30 Oct 2026 14:20:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99827D47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88DF4812E4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UufT7_1gSn55 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0D78E812E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=MIjM1m5Wy3ZxteOKUwD7GnMJ+szY/soEv595vyTUPAG2DxBR5tSC/G/47ZgoxFdGIPIn
 pC3MJlPD+XXY/uzhXIezEnKqsrTL5Q0nvSa1h89I6UmOhkqsyzEZgybKSYNjv6jgdIcDb
 vI0qliR88QTojcfI9ZgTAMxgSnrdcNdGx/kZrNHsv61hPxACcS3noP45Y8fXBOajv6Mkp
 MMa+Y8OinAvGYFuWgMbZ6pHn3YGs9N2273byYy5D7XrQ+dIOghEJgTSdWeEbxFuV0acJO
 mM/rlq2+JcO/1fC26uVgZf12tE2jxQJOhRSMkcgrqOPrQI7iBZk3N56MYFhnrneJJtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZQSIVWyIHdmQ8NvW3K5/KyfU1nd1e/Bo16yBeAXnlFo=;
 b=tHe9vgwZjZqpiZ/Jw8/+3fo4V6eIs4qZMvJoUBmfr+o/8h6DP0KHDKIEgQaATdOatmoF
 5SSnAFGWLEyFuYSJU6C+p/gZpy9PoDf4tH4B3xwy4spnHzjYNFOLwCgbbvk+tMCUC8Jx0
 zcATSkrhocdFRNpwu6TAfLfDks+e711khik37p5cz6sPKZZ4wBWFe2wds6LRT7UOGSSkz
 EyjmmIeY4LgMexhY33PbYQ8RcUorlox9He3P1vic6dcoCVKY0JH1HvBE2SrUwdOgaNYz9
 RAuiqWIvNBHmM/TRFlGP9GzKcIma/tGdfRlHYc3MYIEIlN+bGzrbBnNFqkWKe43akKw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D78E812E1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2041B9D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c647377c5391db982e804f41f49e595b3eeaef64
X-Git-Newrev: c1ebe46ddc17aa77fe7b237ec942cacf34014482
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.2041B9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mesa3d: rework
 OpenCL handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6948653746833935169=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6948653746833935169==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1ebe46ddc17aa77fe7b237ec942cacf34014482
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Mesa3D removed the old Clover OpenCL implementation in version 25.2.0
and kept only RustiCL:

https://lists.freedesktop.org/archives/mesa-announce/2025-August/000815.html
"[...] the Clover OpenCL implementation has been deleted. RustiCL is now
 the only OpenCL implementation available [...]"

Since then the option BR2_PACKAGE_MESA3D_OPENCL served no other purpose
than allowing access to the RustiCL sub-option. This commit merges both
options and their dependencies.

Fixes https://gitlab.com/buildroot.org/buildroot/-/work_items/180#note_3501740032

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 105c0187151202fcb2f79a11e9f4d4b21f85f3ed)
[Raphaël: Config.in.legacy entry moved to the 2026.08 section.]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 Config.in.legacy                             |  9 ++++++++
 package/mesa3d/Config.in                     | 32 ++++++----------------------
 package/mesa3d/mesa3d.mk                     |  8 +++----
 support/testing/tests/package/test_mesa3d.py |  1 -
 4 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6386a4147b..dea68d0e2e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "Mesa3D OpenCL support is now provided by RustiCL"
+	select BR2_LEGACY
+	help
+	  Mesa3D removed the old Clover OpenCL implementation and
+	  replaced it by RustiCL. This option served no other purpose
+	  than allowing access to the RustiCL sub-option which was moved
+	  to the main options section.
+
 config BR2_PACKAGE_PYTHON3_2TO3
 	bool "python module 2to3 has been removed"
 	select BR2_LEGACY
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e184039150..cb86e6a2a4 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 
 config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	bool
-	select BR2_PACKAGE_MESA3D_OPENCL
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_SPIRV_TOOLS
 
@@ -56,35 +55,20 @@ config BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY
 	help
 	  Legacy Wayland EGL_WL_bind_wayland_display support.
 
-menuconfig BR2_PACKAGE_MESA3D_OPENCL
-	bool "OpenCL support"
-	depends on BR2_PACKAGE_MESA3D_LLVM
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI || \
-		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION || \
-		BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST || \
-		(BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS && \
-		 BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER)
-	select BR2_PACKAGE_LLVM_RTTI
-	select BR2_PACKAGE_CLANG
-	select BR2_PACKAGE_LIBCLC
-	select BR2_PACKAGE_HAS_LIBOPENCL
-if BR2_PACKAGE_MESA3D_OPENCL
-# libclc dependency is satisfied by
-# BR2_PACKAGE_MESA3D_LLVM
 config BR2_PACKAGE_MESA3D_RUSTICL
-	bool "RustiCL"
+	bool "RustiCL OpenCL support"
+	depends on BR2_PACKAGE_MESA3D_LLVM
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	select BR2_PACKAGE_HOST_RUSTC
 	select BR2_PACKAGE_LLVM_DUMP
+	select BR2_PACKAGE_LLVM_RTTI
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_LIBCLC
 	select BR2_PACKAGE_SPIRV_TOOLS
 	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
 	select BR2_PACKAGE_OPENCL_ICD_LOADER
+	select BR2_PACKAGE_HAS_LIBOPENCL
 	help
 	  RustiCL is an OpenCL implementation written in Rust.
 	  By default, devices are disabled in RustiCL. If you want
@@ -93,8 +77,6 @@ config BR2_PACKAGE_MESA3D_RUSTICL
 
 	  https://docs.mesa3d.org/envvars.html#envvar-RUSTICL_ENABLE
 
-endif # BR2_PACKAGE_MESA3D_OPENCL
-
 config BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	bool
 
@@ -554,7 +536,7 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_RUSTICL
 
 endif # BR2_PACKAGE_MESA3D
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 87c7f427e4..c103345e86 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -50,13 +50,11 @@ else
 MESA3D_CONF_OPTS += -Dllvm=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
-MESA3D_PROVIDES += libopencl
-MESA3D_DEPENDENCIES += clang libclc
-endif
-
 ifeq ($(BR2_PACKAGE_MESA3D_RUSTICL),y)
+MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += \
+	clang \
+	libclc \
 	host-rustc \
 	host-rust-bindgen \
 	spirv-tools \
diff --git a/support/testing/tests/package/test_mesa3d.py b/support/testing/tests/package/test_mesa3d.py
index 24fc6df59e..193aa7a373 100644
--- a/support/testing/tests/package/test_mesa3d.py
+++ b/support/testing/tests/package/test_mesa3d.py
@@ -17,7 +17,6 @@ class TestMesa3DRusticl(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_PACKAGE_MESA3D=y
         BR2_PACKAGE_MESA3D_LLVM=y
-        BR2_PACKAGE_MESA3D_OPENCL=y
         BR2_PACKAGE_MESA3D_RUSTICL=y
         BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LLVMPIPE=y
         BR2_PACKAGE_CLINFO=y

--===============6948653746833935169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6948653746833935169==--
