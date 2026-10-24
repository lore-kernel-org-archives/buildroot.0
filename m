Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9E0606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 17:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e1pkBkRb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F3EB40528;
	Sat, 24 Oct 2026 17:54:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AysYgK8jJfNU; Sat, 24 Oct 2026 17:54:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 661D640692
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792864455;
	b=qz/hFColeaOSHBGwm3poLJBycSZfaU6Al7s98J3DKBv0FhLkQ93CI2DkrzGKNb9gOgBf
	 TbQcq/5pZhvxvPjYKGCkTC8xS27pxIX4WQSOG5XRLgDSvJm3XpwqBAMfakV4eZtWuNsUD
	 DiS+NroMOASvvISKdW6nCFOhCbYn+B6HMzXDfmmJ3GUsPtu7/trWRL5T4RAiVFsZC+/yT
	 33iF+CXSFWkzFgRMLT8jevKd+51jlGXFL8jBWCSqFX+5wZuvTU6ZqIisHgKoF1TNwxupa
	 L53x4YtPxyGRPd0Eo3blNg2/wU69fVIcd+vl9E0h05bfJYh0SdcJZJrNZnVI1dmvVnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792864455;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r+q9zTHqhXebXlI5H45WWyI10pRTauPHET8rh/xlCbo=;
	b=ZLOt30LhTtSoiibfaI/3k0sJf/KyfCCQ51U9SCifdcDng0vm5ua6ze/fu4DltouzwnTt
	 vYlfe80TLeT50jIvQGAWpvQn1OpTOlo0kJs7xSb306NzrRB3adHUrpwWn1ewiUL1T8wF7
	 aSzfP0mPM0FvG+iddzQvDRb3qDkpWYT3dkpc9WVxxbnxoe+uIc+In+3jEUOp1XJqsJgNc
	 eufAWEqD9DQXj6eHUTsSOvnvhgtfXiXW0sYYKD3Thwm/3cY3pO68JoyY9k24sUhuKk3p+
	 u1rhrKWDfmBS4c18qEUHIF2Kmo42TZRikLZtgVvUACMfQz48wS/xpm1Snw3ooSW8+ng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792864455;
	bh=r+q9zTHqhXebXlI5H45WWyI10pRTauPHET8rh/xlCbo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e1pkBkRbFzxZhODYxRdpvGgDI3JGqSDr9v7XbcCxQOu/00V9utYXxN8u8s23RmQGt
	 mo7qSvGpWfd/p+0QbBHNf0cfGhubBrSNOO0l+69fmRBzEfUpw4Ti7pssIv/1zYzSid
	 shjNFVpZp3famvBLz4VnBrWQLuZRj71ZEOtatqPQnw1Tk/1eJRpjISOQZ+tSscAPo2
	 e3ibPdsSN26JMPMv1Sp+mvV85nx0+kQguhdUgnOB9uD82XyV+6sRHDEWx7iGBMpBW0
	 bQOgXwEhRu61wC77dPiOYvifpXLV98BcSw8GbafKZtLjPSHE9EZH7edjmmLY1l5NCw
	 zRRS4YOQFG+1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 661D640692;
	Sat, 24 Oct 2026 17:54:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B6D3D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1113F811B1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hbchs6s-xDrb for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 22A6A8124D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792864453;
 b=YnwCeO3XPc2mYmpZOlPHIcEjk2c7XuxJ0uWsBe+O30ih3FcQlAjEd8LwV8ay5oKERMvs
 8UzgBFcew/wytM/KAtueevaLVowaFbHslnGv4SASSmfJP94PJbm+gAzAB4bIRtD+o1oMw
 VARVCXiOybZeUok86QwM3mlZknv50PBe1tyk2vcl48KCDG3TIkwg0FRhJJJws6E7pu/71
 xPg4TFFfN0TaqgNXy5F1EmBPm19zH0uT7aNh7FuvlhAyRai+I8/X/11xOPt63kCYVYyz8
 n0zKp7SqsWe0dtmplxUjaW6fBa1ow0ZGvzOc8jbcQ4/BPCyYOO46+BtY3m7p86VPAdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792864453;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7Scg/3Gvn97SW1xPc6y3mVHTanXthtc3xRTKiIGof94=;
 b=SHb56VEQ/RGOKXckBnbAdWpmStjeuqMt7ZR4vHbFKpS0wEWuOfqZQQCnw+XuXV9diK86
 GFeY7yFySxQ8MotET9JNBKy0O7UEF09t+b7oMKStDqEbtP0j14Pru+bGHP864Hvxz8ubh
 RKBqUjSvRqXPTbVUXMcOer3Vw7fFDDdKnSBMUa6t4hhjrlPY5CJlg0gCJTn+NBCsTknPA
 5axYNpiZJXB6Q2IWonv+/u5/PmxJu1NWwA859emJMC8pm/mV9dD2fMp3s2GG+EEU0+NQQ
 TqBmqSFifJSzBDAj19o3SSEZGO89Ie4j2bzT+cAWYRbWj1eSfzutA5TAiqdyHNvpYRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22A6A8124D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 17:54:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0960C9C7BD; Sat, 24 Oct 2026 17:52:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 19:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 105c0187151202fcb2f79a11e9f4d4b21f85f3ed
X-Git-Newrev: 80a5e7af62e6bb4b963173391d3547a1f879fe25
X-Patchwork-Hint: ignore
Message-Id: <20261024175248.0960C9C7BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: precomp-compiler does not
 need target llvm
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80a5e7af62e6bb4b963173391d3547a1f879fe25
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Inspired by and fixes
https://gitlab.com/buildroot.org/buildroot/-/work_items/180

To build binaries provided by the host-mesa3d package we do not need to
build llvm packages for the target arch.

Added configure options for rtti support to fix build error when
BR2_PACKAGE_LLVM_RTTI is not enabled:

output/build/host-mesa3d-26.2.3/meson.build:2042:8: ERROR: Problem
 encountered: LLVM was built without RTTI, so Mesa must also disable
 RTTI. Use an LLVM built with LLVM_ENABLE_RTTI or add cpp_rtti=false.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d/Config.in | 46 ++++++++++++++++++++++++++--------------------
 package/mesa3d/mesa3d.mk |  8 +++++++-
 2 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index cb86e6a2a4..feed6b68fe 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,8 +23,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS
 
 config BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	bool
-	select BR2_PACKAGE_SPIRV_LLVM_TRANSLATOR
-	select BR2_PACKAGE_SPIRV_TOOLS
+	select BR2_HOST_CMAKE_AT_LEAST_3_20 # host-llvm
 
 config BR2_PACKAGE_MESA3D_LLVM
 	bool "llvm support"
@@ -147,15 +146,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
-comment "iris driver needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "iris driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
@@ -189,15 +190,17 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
 
-comment "panfrost driver needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "panfrost driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
 	bool "Gallium Radeon R300 driver"
@@ -360,46 +363,49 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_IMAGINATION
 	bool "Vulkan imagination driver"
 	depends on BR2_arm || BR2_aarch64
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan imagination driver.
 
-comment "imagination vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "imagination vulkan driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
-comment "intel vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
-
-comment "intel vulkan needs a glibc toolchain w/ headers >= 3.17"
+comment "intel vulkan driver needs a glibc toolchain w/ headers >= 3.17, host gcc >= 7"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST
 	bool "Vulkan panfrost driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_LLVM_RTTI if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	help
 	  Vulkan panfrost driver.
 
-comment "panfrost vulkan needs llvm"
-	depends on !BR2_PACKAGE_MESA3D_LLVM
+comment "panfrost vulkan driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST
 	bool "Vulkan swrast driver"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c103345e86..04112eea8e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -178,7 +178,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER),y)
 MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
-MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
+MESA3D_DEPENDENCIES += host-mesa3d
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
@@ -347,6 +347,12 @@ HOST_MESA3D_CONF_OPTS = \
 	-Dglx=disabled \
 	-Dvulkan-drivers=""
 
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=true
+else
+HOST_MESA3D_CONF_OPTS += -Dcpp_rtti=false
+endif
+
 HOST_MESA3D_DEPENDENCIES = \
 	host-libclc \
 	host-libdrm \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
