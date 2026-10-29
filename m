Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91C606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sxvBn8Ac
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 089C381760;
	Fri, 30 Oct 2026 14:20:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id He5W-5j11InB; Fri, 30 Oct 2026 14:20:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2A308175C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370009;
	b=WWMcR5OE50e+upHhIeiIrTVBsG6dHt7yRmvLHWco2QVCIIw0kHMt+vq4rUvKKpGeX9km
	 J0uvVqtvHPPsOaZzCBbvHtXNgq54sLOgDQMcugSg9Z/l8xTd8pQIIoOIcQtStqchs/Tcr
	 ZpPpFNWZcEjVKrZcrUwmxagSOZBfs1iT3E+CaDvQM9ZwY5YidIIW2X+tRg5chdXsaoQZc
	 Fag8DRsfLfYdxB3O+ihNon3+Aslicev2Vz60PYJqqN7O5dF6ax706B7gD3U3TxDJ4Qfx3
	 /QrtxvyLhFpZ5bNOtPUk7PnV9sRNxtqsnZxbi93sK8Q8xaOU02omcN8NjlgnMN/afVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370009;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=h3Z1qHCSUL3jEUVmu3ac8/xvwcCpPyWP9KutEwn6xTE=;
	b=jDou7sKld/0qSf7lj54yzR3PvVA8q+3ob2PD09JNpK8R0wTDCIt/ZmYkhn4nlsRY2XCd
	 UrX4+texowL1FjqjhQpNWGYvSvKKS+/tJYxK6LkSbpFJpyJXkUphITyV9u5FvX0HmtA5k
	 s7XZ23H/r3V+7BkpF/kwstSDWqxlJ3ZlXvRX5eB3hw5t8IsfYgQ9cGCzufKmtBn29cK1X
	 nR3Fi4YhwTSJN3bFzyRfflp8+vM4GVfgHa7msbQJyZmzGgJEoU5l/7F06YdPlOykrb+NB
	 DYDrv0zCBmIQtePK2b1fKXd5SIAFPKRCyVl6ERi2deilDJWSjnM5vA+SaMljMDCXzhA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370009;
	bh=h3Z1qHCSUL3jEUVmu3ac8/xvwcCpPyWP9KutEwn6xTE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sxvBn8AcRsUKHmCVzfZZVcltcXsQ0kIOKdXrYYzQBDErewVXGx07YQ6MUpuTv91Qt
	 4YIs6TopbBDgZYS6lZJpF98P+t6cuOzSsJpTqaHhzZrmlsFwpjqRNve9xspyDNxChv
	 wSRnw2AxaG/6e9ylEXaqjNkQRmLFdDE0EFp5TySY8zz+cPF8sAP1QDxSylm3gwoP7+
	 Vgv3bZi5P7M2M+3co8VttDVcNpW4j5R5lNRgvZlW9m+G8Peb4KO7rBUP1AAJv/VsJp
	 CyT3XpCdh63ogOXEgJjL+M9AzLAbP3qYAgMJES2j7gz7tvZvQWyuihMwgyJMFdQPoV
	 SDYriiRfokH8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2A308175C;
	Fri, 30 Oct 2026 14:20:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2AFD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDBE460B69
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMTNdJ259LOy for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2028860B22
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=TIg7yIBvcFzQeS8idMe4HM2j7Hbt468i94w30lmSWfPQAUKO26PhMlonGL3FoZA6fUzD
 G9J86MLq+fsBQGASe0ryxl5B6D5ZJdEFsrdMHHWMimstuDJzo1JGhyiJc6o7ZxXNbApss
 beCZ3cu0eNOiyctd4FG2qxZy+FD3t+bTvn7cDIt+Tckx5Jqk2F+BQIWKQM9oIPL1IzBdx
 ymVPOcdZ7IdriFsfnqjyswcY9++gdMNNs99Owa+ARNi2SajaKS0zPhYyaHSO1m02ForlC
 qh0Pyg917B7cqn3k3GucJVnluKVlfS6KeyRqULYCQC+LoJBWiupAUhmSnyVhPzSmVsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7b4asA+EH4CdHvVW42uJWaTHkaVr4ovcVOtlRMX47+Q=;
 b=Yj9Y2bKomL52BzoFEDmNBclnhEISiFESNkFVgdiflqNCp5eIbRRvteFwXPsOcohIcf1W
 TQyQWHhj+mW1ZOlesgBAFTrHRmrGJMMxgR+74SmnRBbLj+rVdL8+olgmdpyVlXztIg2iW
 txFy7S+BSQsqOyF2fshcnrd//nHozBi18hDQxT+IGtMyts/AqGw429gKpZdLr2gR2lxth
 CBh/xj9Ma5iu1ItloKo5fQYzXDrIHvV8paLfyfcNZ/diYIaVzV4DzhUEc9Zh4NK4M1D9F
 ni8Ygq8T40LQ38lWrKxhr3zt0/eh73Mjif19hkC+Vc9DKbtm+meWT5ilQnTArG262Rw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2028860B22
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31F2F9D389; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: c1ebe46ddc17aa77fe7b237ec942cacf34014482
X-Git-Newrev: 4810c499198bda0ac1189257fb6525b8d5d87e04
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.31F2F9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/mesa3d:
 precomp-compiler does not need target llvm
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
Content-Type: multipart/mixed; boundary="===============4755686397532560497=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4755686397532560497==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4810c499198bda0ac1189257fb6525b8d5d87e04
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 80a5e7af62e6bb4b963173391d3547a1f879fe25)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============4755686397532560497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4755686397532560497==--
