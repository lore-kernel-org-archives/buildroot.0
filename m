Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A86C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 11:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F356681F0B;
	Sun, 25 Feb 2024 11:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgfNfUH3n0mN; Sun, 25 Feb 2024 11:44:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB6881EDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB6881EDC;
	Sun, 25 Feb 2024 11:44:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8522D1BF4E6
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 11:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7028F40732
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 11:44:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UhX8EeBeo0wR for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 11:44:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94C8440688
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C8440688
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94C8440688
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 11:44:19 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-412a332f7aeso1725465e9.1
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 03:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708861457; x=1709466257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgxUVkpQWMcMhf2bGFGyyLwn3Nu1cMkOFHyOxG7u2HU=;
 b=fsq3AqtfeLu83DVsr9PZZ6b3qtmv/IfLJrpwU+jUp3+DaMimmt0uVs+7/tLrFiWQjd
 ixxrGt9tc5HPr5yV4IeTOkWnFQJIGB8szEhY6CSzEPTcFDbJ5etSmvyIqt4AdYWqhKj2
 oQDm8waPIovsgjXPyPak8t8LkybtkxnElyM7x2BWv3Jw2IwC2mBSXjEyGcjnDiynCqhR
 djcmn5bW6h3EJrlkuVSKVm1hhtDNrXvSU4juM3NJ/IoKh5IYXxHk8IQvCKDNR6dV0eml
 BZSMfrw+hV9ubv59IqGEbKDqnOhk9zcrMsvJGC+tMRWqZ7bL61N6MVtDPZ+HwkbkP1eY
 DIkA==
X-Gm-Message-State: AOJu0YxoEBmwlyNFiJAsv0MpAUS6FT4y7a+jfbp7SdlCnJLpvPeckvKK
 XCNu2MhzmC7oQTudElgoO6WfToW18uYLLLpAwlwqrPLVQrQIdt9MWHBHt9mp/BFrEjT2YCyZ26y
 0
X-Google-Smtp-Source: AGHT+IEP6yTK+kCWym6xvlWzq1IvXRxfOup34M/Y2CBcrOJIilz1/iIxx08hKqjEdZfcYf4EA3sHdQ==
X-Received: by 2002:a05:600c:3d8f:b0:412:a348:cbd4 with SMTP id
 bi15-20020a05600c3d8f00b00412a348cbd4mr581233wmb.23.1708861457675; 
 Sun, 25 Feb 2024 03:44:17 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a05600c0a0e00b00412a37130ccsm1118658wmp.48.2024.02.25.03.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 03:44:17 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Feb 2024 12:44:13 +0100
Message-ID: <20240225114414.2556543-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708861457; x=1709466257;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jgxUVkpQWMcMhf2bGFGyyLwn3Nu1cMkOFHyOxG7u2HU=;
 b=1rLbCk1aN1u5+UOUiCpmJ2s1cECj+I7U/5BECfluzwm5Dg3CV3Wzx/8NwRSYTR5QIN
 urmVyXgnmkaPiORXFYN7atpmnHt/cNuaVmScs7vH0qC94LczkRbJCyKje4AApXCQaccR
 IpCra7Pb88O4jvH0iyawpn6or8s+Vbasx956QRg4ITohsJr7xlK1LxyXeKX3htqxt5lL
 Lo1jaT7eqFu5hgiCy9xTJVQ2bZLgrFUVWBpcQo7/LwWo2E1XCgtJSxQrPL0o5XRWerU6
 I/SuZLKKXlDQf1k91vdvgkyyuIwCjOj4Qzs0KK0Og+cxh4JcD6K9QsMhliK11+37d85Q
 ygpg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=1rLbCk1a
Subject: [Buildroot] [PATCH 1/2] configs/qemu_microblaze{be,
 el}: remove xilinx xemaclite patch needed for qemu < 2.2.0
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We carried a patch for xilinx xemaclite that was made initially for
qemu < 2.2.0 [1].

Indeed, between Qemu 0.11.0 and 2.2.0 the devicetree binary blob
petalogix-s3adsp1800.dtb (bundled in Qemu sources) used a
compatible string 'xlnx,xps-ethernetlite-2.00.b' that was not
supported by the Linux kernel [2].

Theses patches could have been removed since Buildroot 2015.02
when this defconfig was tested with Qemu 2.2.0 [3].

[1] https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
[2] https://gitlab.com/qemu-project/qemu/-/commit/c21fd2c79e1fcaf45582f2dd4deb491c257aa9f2
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/312990555c4d7d1cccd26e0728ad0d4ec86820a7

Cc: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...xilinx-xemaclite-add-2.00.b-revision.patch | 34 -------------------
 ...xilinx-xemaclite-add-2.00.b-revision.patch | 34 -------------------
 configs/qemu_microblazebe_mmu_defconfig       |  1 -
 configs/qemu_microblazeel_mmu_defconfig       |  1 -
 4 files changed, 70 deletions(-)
 delete mode 100644 board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
 delete mode 100644 board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch

diff --git a/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch b/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
deleted file mode 100644
index eb3859f858..0000000000
--- a/board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e96b73478232aa42b773cd19371808af69fd4b95 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Apr 2020 09:49:11 +0200
-Subject: [PATCH] net: xilinx: xemaclite: add 2.00.b revision
-
-Patch added for the kernel 3.14
-- fix networking in Qemu using a small patch
-- disable DTS, because linux.bin does not include any DTB the
-  default Qemu included DTB is used and this is okay and works fine
-
-https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
-
-[Romain: convert to git format]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Waldemar Brodkorb <wbx@openadk.org>
----
- drivers/net/ethernet/xilinx/xilinx_emaclite.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-index 0de52e70abcc..d8c13140ca77 100644
---- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-@@ -1278,6 +1278,7 @@ static const struct of_device_id xemaclite_of_match[] = {
- 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
-+	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
- 	{ /* end of list */ },
--- 
-2.25.3
-
diff --git a/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch b/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
deleted file mode 100644
index eb3859f858..0000000000
--- a/board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e96b73478232aa42b773cd19371808af69fd4b95 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sat, 25 Apr 2020 09:49:11 +0200
-Subject: [PATCH] net: xilinx: xemaclite: add 2.00.b revision
-
-Patch added for the kernel 3.14
-- fix networking in Qemu using a small patch
-- disable DTS, because linux.bin does not include any DTB the
-  default Qemu included DTB is used and this is okay and works fine
-
-https://git.buildroot.net/buildroot/commit/board/qemu/microblazebe-mmu/xilinx-xemaclite.patch?id=fa2798548368d51998fad18d7f6d1ae0ed065b33
-
-[Romain: convert to git format]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-Cc: Waldemar Brodkorb <wbx@openadk.org>
----
- drivers/net/ethernet/xilinx/xilinx_emaclite.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-index 0de52e70abcc..d8c13140ca77 100644
---- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
-@@ -1278,6 +1278,7 @@ static const struct of_device_id xemaclite_of_match[] = {
- 	{ .compatible = "xlnx,opb-ethernetlite-1.01.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-1.00.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
-+	{ .compatible = "xlnx,xps-ethernetlite-2.00.b", },
- 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
- 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
- 	{ /* end of list */ },
--- 
-2.25.3
-
diff --git a/configs/qemu_microblazebe_mmu_defconfig b/configs/qemu_microblazebe_mmu_defconfig
index e02b8dae2f..a93ef3564d 100644
--- a/configs/qemu_microblazebe_mmu_defconfig
+++ b/configs/qemu_microblazebe_mmu_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazebe-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
-BR2_LINUX_KERNEL_PATCH="board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
diff --git a/configs/qemu_microblazeel_mmu_defconfig b/configs/qemu_microblazeel_mmu_defconfig
index 146bbb67de..0b00b58b4e 100644
--- a/configs/qemu_microblazeel_mmu_defconfig
+++ b/configs/qemu_microblazeel_mmu_defconfig
@@ -24,7 +24,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/microblazeel-mmu/linux.config"
 BR2_LINUX_KERNEL_LINUX_BIN=y
-BR2_LINUX_KERNEL_PATCH="board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch"
 
 # host-qemu for gitlab testing
 BR2_PACKAGE_HOST_QEMU=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
