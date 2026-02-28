Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E80FEE4E5
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 10:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8779418CB;
	Sat, 28 Feb 2026 10:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgSAjDSRSxYf; Sat, 28 Feb 2026 10:19:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFD9B418D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772273968;
	bh=935bUUA6U8j7f0+qbUqyXS/8Hnn1EC0bF5B7Pq4tVfM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GF6hRDF9Yav+tQ6Mcrj40JEXtzY46CtbnK4PFE94NuISCKjhL3lUevxORzw6FDR1W
	 1ORWUlXRdX23+zhdV9RrDHQ84PPfXXhh1LuqWnJIDB/KfNQHCODUJHyoNCd7dn9ldS
	 F9H8/EOdGJedYykQxG/2+1/koaliGbMwbbI5Wcpyne2N0Ps/BtU4U1kfIj8wJp6Jnt
	 HjPhm8WMWjjE03NPUHNliRpzC2ZNydeRMKqQNQTiq044RQtlQ/C896q2RZatK99u5h
	 qiv24C4jr8HeqCol2/M+5hS/FOgOK43BTkrugybgG/m1UhHPfsOzYS6u05nVKNGSNW
	 Ux6y//iiP2Ktg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFD9B418D4;
	Sat, 28 Feb 2026 10:19:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5728618D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48C3F40177
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYdhf3QGfFOW for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 10:19:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 778F240018
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 778F240018
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 10:19:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60E86856EE; Sat, 28 Feb 2026 10:19:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 11:15:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1cc6279d1144c0b61dc6051eb57ab8800931c96c
X-Git-Newrev: ef4f0eca1b179f5c623b67babe87a6cd1ff10b34
X-Patchwork-Hint: ignore
Message-Id: <20260228101926.60E86856EE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: add
 option to select Airoha EN8811H
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2870617420147516418=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2870617420147516418==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef4f0eca1b179f5c623b67babe87a6cd1ff10b34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Which is a 2.5G Ethernet PHY.

Signed-off-by: Mattias Walström <lazzer@gmail.com>
[Julien: add LICENSE.airoha entry in linux-firmware.hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in           | 5 +++++
 package/linux-firmware/linux-firmware.hash | 1 +
 package/linux-firmware/linux-firmware.mk   | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4a6eaa9428..5ad4957756 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -589,6 +589,11 @@ endmenu
 
 menu "Ethernet firmware"
 
+config BR2_PACKAGE_LINUX_FIRMWARE_AIROHA_EN8811H
+	bool "Airoha EN8811H 2.5G Ethernet PHY"
+	help
+	  Firmware files for the Airoha EN8811H 2.5G Ethernet PHY.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3
 	bool "Broadcom NetXtreme/Tigon3"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index f1fdca52a9..bbd8d3295a 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -3,6 +3,7 @@ sha256  b6c9a9c112b88417d985b87d6521b677fa2fa0d5d7ee5219c76dc8ca66945ad3  linux-
 
 # Hash for license files
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
+sha256  ad548ca0ffb91ec655de0f28e13089ef1cd4e0deabb2f15a9289194990e62252  LICENSE.airoha
 sha256  27907ae1d74b94fd6f1159971158ed3199e472f129ea1ff748ea13aded2a59d5  LICENSE.amd-ucode
 sha256  572872598565dc3513470de971a32bf9db301f47afeef3636345eadae33b2eee  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6e58814279..0a35d72bc4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -675,6 +675,11 @@ LINUX_FIRMWARE_FILES += intel/iwlwifi/iwlwifi-QuZ-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AIROHA_EN8811H),y)
+LINUX_FIRMWARE_FILES += airoha/EthMD32.dm.bin airoha/EthMD32.DSP.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.airoha
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BROADCOM_TIGON3),y)
 LINUX_FIRMWARE_FILES += tigon/*
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.tigon

--===============2870617420147516418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2870617420147516418==--
