Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF33E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=An+tr6VT
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D94AC406A1;
	Sat, 24 Oct 2026 17:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ctxQDHjCkl3R; Sat, 24 Oct 2026 17:54:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A37B44077C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792864459;
	b=rdgnL7uy7noaRLo6ioCYr9mBBDxVGmpp4xsi2d2YTH0kyWaRZnpw5VdJljxlRCgwTNRN
	 Uon8naCVgQI752Em+RVOyZ5hiGWeRuBfhlR4vV1kvuD7FjH2imy1Ph1LDtC62sIQmCMPS
	 4KrmuMQ4J4XLpD3zBraQF/12KvI+fjUk1A5g+nck520sMnGzehl5p8EimlefLsO6RHkws
	 W1CdvYY19e+98RL8tmBBnpMYYoXnbPgxlcaoFiK465BW0PmNh7KlsSt2sHOs6UKeOtuoF
	 fd38Nw+Q7FwHKKeH212Ds6tVqHICV1MChCSQ+4l1A6NDaqS/A8v2Gl6OJDI01up6Lwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792864459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4h2d8PyEW9EaYEL1mYdgWXua604Am5TLNr5Uktb+m8Y=;
	b=AjDyBPakM724dOuqWQ0bLciYMEEqK0GpjLx2Jq0FoKdVvPMQ+Oojh540lOobZOmXQI9l
	 M+fGbkHCuEqvkr8DNaRDM4CAdxoe9YQ6rkKWWo4VZ/we3XtYfLfpQJj/DtJrbrzNor0os
	 uDJixpAOP6YfV7Rap+DJmZe+RMMEGaEJKRpm+PuP9kFWe79bh+uSJhO3qQLHAW2lOitvb
	 oQwGN9gSOTV6hY01vSbL5DbHqHWCzdKzOOu5vLDpJuHGNZg9VVhHD56O1ClmU9P4XfPsP
	 MgIYeC42FcQs124ZKyAcyCpZTLW2vFHyQTeCnjobOfJKNGZEX7SqMWTY68AtcZz0zjQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792864459;
	bh=4h2d8PyEW9EaYEL1mYdgWXua604Am5TLNr5Uktb+m8Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=An+tr6VT4qI006ecRzv1C17DZEIHO2c+Bu8wLEhSkIdp5ydE+eYxq1pwyOjYpSUUO
	 qAylCWPyqKKgiQyakdOGWux4r9fuCblmHoAZhRelhDHCm8P4PhbCotcxJW0WAQ9lAt
	 0sjN4OGsJkNKlm0f+wMPY4J0PXxtdjfNvIESZeJw/OnTMjTFG3WcUOGKxiktpr5bpY
	 3lI2SO6pWsRjSv6DCNBUgF9us8TuF7IYQ9yoyYt7ut/7i9VHrtJ3QTvCzy4lzc6F5I
	 aJjcJSpvZ62H+Vphd9g+VWDbfgLb3qcxQgoQLE9FeU7yoyr16HfctK9Mcl360BenOb
	 EKDoGTByjO58g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A37B44077C;
	Sat, 24 Oct 2026 17:54:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39097D35
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A4A0811B1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeBtG9PtZChq for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 20786811E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792864453;
 b=GbKK/m0IsqX0qeOMLpDxYe1qUnW7oZvGicfdJG+lsNtVQuqGjQ2XTGogfMfihXbsi492
 aS9h5qGoHoR8CvXVQAZk5UEsv4qWhNCpByeT/x0p8RtEKVPGK4btvJ8GeIfxbR+hgnxqS
 aRE09SMPIJDR4uiKROyydJiVR/a4Cmcs5Pi2HWLnF3LeaeU5Fp9bRHcuKWTbYNT1Dut6Y
 UOcC1XCvQf6eOMKv2skUkDI8xt+7HGT+3cJZAWSXZb2HhCSd1TGIYNH7OlzWNFhjjzYv8
 5z3oY+oX59StdV3WtN8e6/Xws6iBuIL7c0MvHTbIgPDUpIugXOyoNnlCJwhdLPIlgNQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792864453;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=g7A/rv3gyA6RsfS6vzCBbilQCN5jsf6Ns2o/BzQqx8s=;
 b=AafegBWHKDe+8heh9kYUysLvcpj3+Ck2KtUaDp6F0n/8S8XK4f5fUO+8U5avrQoRt8DY
 c9mrOJU/AkCGL/pBp1em76cRxNYdQEenBKIVaBi/qP+xQnzzqTOgdAJXE7HaqtK2+r8YN
 NONnNaf44yDbRe0IETEiCYqv5jW81pgMuF0yR1deLa7sadIQ1VFwrIHN2Ey1GjAAG8DY6
 UxM1fYOlCZDnM8oA4hAFAkW+rdj/vpeCMP83Bz2RxvbuyDlCXB9VyBJCBrUMhvaI3qLRv
 x5FytZgSqJGwUks2QIR+/4Ec74bvdBecfKH+CE3+KS4les63FwPGmpZLmdJUX4Kzm1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20786811E7
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C21D09C8B2; Sat, 24 Oct 2026 17:52:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 26a8be28c05ced9d63d7086b522e07c79fbfe4de
X-Git-Newrev: 105c0187151202fcb2f79a11e9f4d4b21f85f3ed
X-Patchwork-Hint: ignore
Message-Id: <20261024175247.C21D09C8B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: rework OpenCL handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/105c0187151202fcb2f79a11e9f4d4b21f85f3ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 Config.in.legacy                             |  9 ++++++++
 package/mesa3d/Config.in                     | 32 ++++++----------------------
 package/mesa3d/mesa3d.mk                     |  8 +++----
 support/testing/tests/package/test_mesa3d.py |  1 -
 4 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d94041edd4..29c9b7f9e7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "Mesa3D OpenCL support is now provided by RustiCL"
+	select BR2_LEGACY
+	help
+	  Mesa3D removed the old Clover OpenCL implementation and
+	  replaced it by RustiCL. This option served no other purpose
+	  than allowing access to the RustiCL sub-option which was moved
+	  to the main options section.
+
 config BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
 	bool "EDK2 platform ARM SGI-575 has been removed"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
