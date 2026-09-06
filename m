Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504CAC79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 23:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B79CE60640;
	Sun,  6 Sep 2026 23:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZsYTu_j3GIN; Sun,  6 Sep 2026 23:30:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 06544605F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788737457;
	b=M7giQbfYJu4nP94tWgJqZRXkVPi6FG75eYaJ4rP4vRhE96F8zpziExZRHrzf5Jeez4Tu
	 0DF9UNkk6tcjfsmvKtcUR08ejL/brLB6ASzNH8QDgJ52Q8DNtveTaNo5h28vcBsUbQwls
	 hNFX1pRuzyvcSwICUMgDtzEpnh5Pi4ZFKkYa6zD3DC7UY5EZxeAsYxd9WRZEwBkHzAAdr
	 eSz3IXtxuPBWmom+KHwrW011FToC1BNjyEix5p7OxVTf7BtISjpkByKuzT5rafVNvEAD6
	 jiaX8AYKYO94Rywo7m0LQ9X/Z+Z6Dg6V1oCyAe+0lXcDIS0UncpE1ENQAzYvEx9Wntw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788737457;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tKgT0y63URq7BvQXRhkffg87/fUzS+umsd4Fl7qQ6ss=;
	b=nK2t+4i4d4nSeCMGysQqg2vfmkTEFAHAxmaZJjpo9ee7W7sBYxxFZ0vQbZpRY4b5/vG8
	 gDHTd5D/jE48c7F6Rv1tX2sP+pHefRHP8TNhIno+eprDZmst1+OWCY7f2mIe4B5nS3Z3X
	 VnP8zeu52c+AerP4Fa6MGAXNwafS2a0R340jp7/XfBVkgtRWFqhsxweRYIH4apkYcCKhC
	 Q0Y6C5YuJ+V0Igtvkg4U6KSFuzwfXY1opM8y+oDenxGAG2nXz+WtDzc8QmkQAb8YtjISf
	 pOc0ztkBN/jBM9iFTUZBQeBrDnxnTGyNhss/xEBkd0LscLZshRZ2mSXCdYOL5bbkEHA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788737457;
	bh=tKgT0y63URq7BvQXRhkffg87/fUzS+umsd4Fl7qQ6ss=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3XVEvF8On5u1E7c6ECAG39Ruwe8K8NMeaxvNpPAOYuvoPUH7I4LJ8C6iuXDyhzqD
	 hDWeKClnnoyuKYdAFFtFBGgSLZ3fOduaJCpitmG6s0UZgzv/Ge7xInILk4IG8udG4W
	 U4mVJvgWfGXD6SdB5HwaLeRIIZwD+/qqKdYXUiS4hasYyT5/ELrJhtl88DYuexGEcC
	 RF2jd+V+Dy0NWk3L4ggc8+lx9G9r9XkP5W1+XsF39X+zLMRUzkbSWkr7sYIOYjLcEh
	 TiAx0uSheHhyaMJCTt29ZALeDr8ogjXYa+WjOAAvudNBtDYvzWokZUf/pPz8YaRruM
	 tqAGGNa6WzYvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06544605F5;
	Sun,  6 Sep 2026 23:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33F67970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 194CA4051D
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKJ2MRzAy633 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 23:30:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5380040503
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788737454;
 b=iz9n4pqFsPxVCtN0pMVdKAtetqMOsAf0WSXROVddXawUoI8hd81RezvVkqpneyYN5zl+
 jGYfbTa8qtgaZASEnnBD61ezKippgowc48KiUNQUf+3wzNmz5mnXO5hVxnxDgZ+UIy39I
 Vh81BHozLJFAiYuQmYmtMORd74eHBciGMhx2BRNtRB+3C1JCmujSm4ArC4WR087kJiF8i
 B4IMyVpNQaooHW4DafM5eXTsVNvhmQtwKCRZQ6cNgc1et/4RLjyGllllenzqEr0Owkjxu
 DvjbihnR0UdR7hn3Az9GMwf3Chi9WtlmAdAHYdzeM21m/kXWrdHoyhRB9RtiV7/E5Sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788737454;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cNE0j1Vq9gSofwfmifEx84dwK6XRz/qxKF/t2U82AJQ=;
 b=pXqz4MwAZIJVau5orffCEjCPNyQzRrJRBjL5fKypdy1tuhI8Y66VbZ5E70gMHp/3FcjN
 Vgcn12/OP8Q4nI/ZdkeCrr+TPhrNGJ/YbSc2mmH9j3fmMQq8s+qcaeerh+xKTGBn6nYgk
 G93qwOzjBghpTGkQkiIBVBCFTvueXW5R7Bg6YBuyATzBxEvTUAdhXCzatkIvrvwKo4Kyk
 hg78RqpMT3I7bZYdymZtak8bYNpBsm11RHXh9/QC9IF7ER9EgHvsoYEojppiKq9URE35n
 tu3goYLqOCLO3QxiULlCzvFYOfj7cucvOEaz9Zr7mbV5meOCb07fqv0yYjRTBaBMghg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bU0rZHIZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bU0rZHIZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5380040503
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 23:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788737449;
 bh=cNE0j1Vq9gSofwfmifEx84dwK6XRz/qxKF/t2U82AJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bU0rZHIZvnvnosR9YPnlMAu0Zq3CNGNIYmgzBLmzt+HyjCMzvTXff9m0JNe+G+Xs7
 hGh4pODodNStjXVxw+7IuvCV6ly5/4R7QEgN5JWz5OO7Df1DMEdIc6cg9DMOwXW3gx
 tySR0/iAeBz+ztWG5I2WqCnVzk8uC7rEDZ1xzxf7R2hF/I/ALjdiXeN6wuRTVN3D5I
 7zowtiJoPnNljME77q9FhRRJpauFMI4diiBsMsxCC5GEt2xIML4A4xHINdUpnuzGQk
 wX+uc07zT2JbM28Dq6bp9n18ysWXO7sj9aqpSD+ylxuihgEamJ331s2YUOF8ytqF5F
 3fOOnItHAwPJg==
Received: from fli4l.lan.fli4l (p5b3a02ab.dip0.t-ipconnect.de [91.58.2.171])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 216F3A4C2F62;
 Mon,  7 Sep 2026 01:30:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44132)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x3MK0-000000007cf-3gfR;
 Sun, 06 Sep 2026 23:30:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Mon,  7 Sep 2026 01:30:44 +0200
Message-ID: <20260906233048.692559-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260906233048.692559-1-bernd@kuhls.net>
References: <20260906233048.692559-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/6] package/mesa3d: precomp-compiler does not
 need target llvm
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

Inspired by and fixes
https://gitlab.com/buildroot.org/buildroot/-/work_items/180

To build binaries provided by the host-mesa3d package we do not need to
build llvm packages for the target arch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d/Config.in | 46 +++++++++++++++++++++++-----------------
 package/mesa3d/mesa3d.mk |  8 ++++++-
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
index 8c78167685..779ea9f111 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -181,7 +181,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER),y)
 MESA3D_CONF_OPTS += -Dmesa-clc=system -Dprecomp-compiler=system
-MESA3D_DEPENDENCIES += host-mesa3d spirv-llvm-translator spirv-tools
+MESA3D_DEPENDENCIES += host-mesa3d
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
@@ -350,6 +350,12 @@ HOST_MESA3D_CONF_OPTS = \
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
