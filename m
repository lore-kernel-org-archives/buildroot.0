Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79FC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 02:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44E3D6137D;
	Wed, 17 May 2023 02:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44E3D6137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPKxI4M6AJaJ; Wed, 17 May 2023 02:15:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589F0605A5;
	Wed, 17 May 2023 02:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 589F0605A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57CF01BF405
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 02:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E6FC82000
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 02:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6FC82000
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LT0LSLb3dxek for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 02:15:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0470B81FC4
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0470B81FC4
 for <buildroot@buildroot.org>; Wed, 17 May 2023 02:15:14 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-24e09b4153eso257871a91.2
 for <buildroot@buildroot.org>; Tue, 16 May 2023 19:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684289714; x=1686881714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqu2hy2RJt63Q2S+EPjN7o36hEclnUF9uKTpoww0CUs=;
 b=kc9tUaeJhiWhM8OvRS6LNl3H6bhvyc/oQAxrGgrwLBIuOCultbPQrVdfGejL3M7wVN
 avM+9rg5VPP/UJhDDYDltZeAsoEA4CCl5p4o+u254qDKjxMma9XqMhl3EQbACOPHcdwN
 Ied3OWwizvxAl2eHf/t65tptGS+t6jqddHvvkX1xkKYHdKpefDQjyupUl8Z0foBcYl9J
 NKs8OmsbGeBh/9J6RQOjQbCOpWet1qfmLoASP9wAGRa6LdghMlBxQd1XsunXtjdD5aBG
 tzhAI8jurkZFSrHZllPj47y272gmGCEGHK77BSDwiQ8yJEqcUkeYGN/K0claLlFnE3go
 nBbQ==
X-Gm-Message-State: AC+VfDxqVq91INhVmPc0geOx0fpOiJGNVjwVnP7M0BKRlObfnl7RlEqB
 EB7wxt4d8kOi07OGagM64HiVNyrVtxpJkgcviKvXe6zc
X-Google-Smtp-Source: ACHHUZ6Qax1evfNJfFz9fHMLANlu35bVi/BI8kaJtDCi+/SxhQpPT95sy2DzUoY8j0X75qxkpCQwzQ==
X-Received: by 2002:a17:903:1247:b0:1ac:3605:97ec with SMTP id
 u7-20020a170903124700b001ac360597ecmr51962227plh.62.1684289713466; 
 Tue, 16 May 2023 19:15:13 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jo13-20020a170903054d00b001a641e4738asm16250834plb.1.2023.05.16.19.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 19:15:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 19:15:10 -0700
Message-Id: <20230517021510.3016394-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1684289714; x=1686881714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mqu2hy2RJt63Q2S+EPjN7o36hEclnUF9uKTpoww0CUs=;
 b=B2QaaLNSeNIlH/mojpID3s1vfT4fVG3SHpHtUDbtk1LbALVhVSNLR71c0RpXiy/5Mi
 oWXoz1Gqyu5/O/Kt24ZnR9oHdaaOl2SyxsZRU+I/AYrwicwp/HX/SqGnXumkUM4PYQwp
 b0h0fsy7FQ1wYq+oZBc5YQxTXI6/I7FGaVDdV3X8gZwOhkdMa1hh9Hqt5FIwZRwKZSUr
 eZFRR58PlMciAFhO0qyNjH6LBWHC33ykT9wLwuFfbjo5SgexYCDtSE4YYqXYFAKE6lRO
 YAiNzkvAweL1HBSMCTBYK3khXJDmp6buhM3qLzu6LsJtC8QFEL2mQ4xGI0ykOuGLxhbV
 6exA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=B2QaaLNS
Subject: [Buildroot] [PATCH v1 1/1] linux: add support for building device
 tree overlays
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some kernels have device tree overlay files:

make arch/arm64/boot/dts/amlogic/overlays/odroidn2/i2c0.dtbo

Add an option to add these dtbo files to the LINUX_DTBS list.

BR2_LINUX_KERNEL_INTREE_DTS_OVERLAY_NAME="amlogic/overlays/odroidn2/i2c0"

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 linux/Config.in | 19 +++++++++++++++++++
 linux/linux.mk  |  5 +++++
 2 files changed, 24 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index abb4bf922f..2b27781128 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -434,6 +434,25 @@ config BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
 	  Choose this option to support Device Tree overlays
 	  on the target system.
 
+if BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
+
+config BR2_LINUX_KERNEL_INTREE_DTS_OVERLAY_NAME
+	string "In-tree Device Tree Overlay Source file names"
+	help
+	  Name of in-tree device tree source file, without
+	  the trailing .dts. You can provide a list of
+	  dts overlay files to build, separated by spaces.
+
+config BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY_PATH
+	string "Out-of-tree Device Tree Overlay Source file paths"
+	help
+	  Paths to out-of-tree Device Tree Source (.dts) and Device Tree
+	  Source Include (.dtsi) files, separated by spaces. These files
+	  will be copied to the kernel sources and the .dts files will
+	  be compiled from there to dtb overlays (.dtbo).
+
+endif
+
 endif
 
 config BR2_LINUX_KERNEL_INSTALL_TARGET
diff --git a/linux/linux.mk b/linux/linux.mk
index cc36b5251d..4bea7d6449 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -198,6 +198,11 @@ LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_K
 
 LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
 
+LINUX_DTS_OVERLAY_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_OVERLAY_NAME))
+LINUX_DTS_OVERLAY_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_OVERLAY_PATH)))))
+
+LINUX_DTBS += $(addsuffix .dtbo,$(LINUX_DTS_OVERLAY_NAME))
+
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
 LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
