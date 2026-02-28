Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A0EEEF317
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8425A60ADF;
	Thu,  5 Mar 2026 08:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcLUb_Xv7zqJ; Thu,  5 Mar 2026 08:02:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A130760B04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697738;
	bh=VnKIsWFOwlMMkJarTHv3qVYISTX//SVlBKFbpC4Rk/Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AIEQJo2nQQdrnUSjeCR04I6iWVT5B1x5R+XT4Tg6g+aUwvDJZI8vYOypVXq/CPA/G
	 A3YicWJMzxDYqOkOyAgOD+NUETi1VNioXENCrRxBQfryb4tAbEgzhjSVycpAFrgjKT
	 OgTKVWJUNba3GBS3CRthO73dOrXq0Xa/eyylIRaHxb1xN6/7wq0XIOnh7Cv/68ain5
	 ftjrWT7KllpVUDFy9ADYDKr2VhZthdHY5f4jnzK0gtlg6BOfF238EDSA57qLO2iR/V
	 Va7y4v3DpagFez0LcCu/52qTWGgDZ0Esfr/JG8U6dPRcwcDMIR8XQH+VskoxPS0h2Z
	 zmlXo7pcf/xxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A130760B04;
	Thu,  5 Mar 2026 08:02:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D4C325B
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 235796080A
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbbN69xi3HBl for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CEC560623
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CEC560623
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 292C985EEB; Thu,  5 Mar 2026 08:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 11:15:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cc6279d1144c0b61dc6051eb57ab8800931c96c
X-Git-Newrev: ef4f0eca1b179f5c623b67babe87a6cd1ff10b34
X-Patchwork-Hint: ignore
Message-Id: <20260305080208.292C985EEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option to
 select Airoha EN8811H
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
Content-Type: multipart/mixed; boundary="===============3981491981022079481=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3981491981022079481==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef4f0eca1b179f5c623b67babe87a6cd1ff10b34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============3981491981022079481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3981491981022079481==--
