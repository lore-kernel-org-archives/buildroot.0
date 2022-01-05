Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A26C433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C224B408D3;
	Wed,  5 Jan 2022 21:40:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ou9_V6E0jQG; Wed,  5 Jan 2022 21:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19D74047D;
	Wed,  5 Jan 2022 21:40:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D75921BF3A3
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D282F400D0
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUGUKPdESd0s for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:40:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 563CE400C9
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:40:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o3so855428wrh.10
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 13:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3d2DNAekrX+bHt6HaH0+NqzI0SbqO8ffvzjQNlTMQE=;
 b=LA3/2YCMRoN0aovEsTmLk4xyLZ1ZjrhXHcBRGR7ex863mhY57sZw5uvC0GSpO4tz4B
 /SJkqHme3AIXEq1txhp9qcZcTfUCfWi7xN9AU3/qMz+xt60I8pO4DhA+GnCg/uDVXUoN
 iqs/HI80Ja5uHFw/SdOSmS32ln7TUNEv5WYDmoQnvyetQL4solZTJuipVgnUU+KvQhmi
 Q5xivDtNCvlBslVtmJhc37x8suaN+rQKuEXjO/DQ4YLzVknKyclazOEoUAApvLuMPRbb
 hlWeKFpmhueNf2Wssh5G7rUc4qfjSAMWDWJNWFR4v+qyxCDdc9RWzBXmVVGEAasjCYjp
 zh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3d2DNAekrX+bHt6HaH0+NqzI0SbqO8ffvzjQNlTMQE=;
 b=wUBc++H5sE5hVTSy/oYJTAfDuGMlGDPwWmy0C5UGuIgs9YiaM/1mUQLK+D3KvE3zCx
 eN3TfU/ABQBeSzBLh9/T0XL1OPCeHxtUig2ZmhVCxViSpE79mKxZqTzYznNNTDOtOlse
 1ao2w40KgcIv1qxyRGWSmfU+SSxtOTlPGbwjZcxahriMleFSdsFq9gDwdVolIFqkUb/z
 MOdpr921fJ/ABnxUjRwYE+u5XNxryNGA07WKMPHA8b/31tcaDJ4mO6NDsQVdOsVDPHPW
 NeReBBbnOBaGtdPEAyy7yKKcWEmVITnseA/lZDOSV0zRgdZ+TqLFuL0+HYDdAzOIV5pg
 oJ1g==
X-Gm-Message-State: AOAM532tz7gdiOmEqFvVcyvNCISCZ2kWYqWEf3zpsO3CwRRMzH0bUAY+
 snX+H9XnoviPa268HhtwyLI0CFR6aBE=
X-Google-Smtp-Source: ABdhPJzunFrMAH3aDBOpa4X2MNOk4AxGMU5isvUdlO2Lo/AVoqE8QBMccOWvQhzS0Oo8PD4t/Tj0TA==
X-Received: by 2002:a05:6000:1e09:: with SMTP id
 bj9mr4399626wrb.67.1641418846157; 
 Wed, 05 Jan 2022 13:40:46 -0800 (PST)
Received: from home.localdomain ([178.124.208.44])
 by smtp.gmail.com with ESMTPSA id o11sm4015751wmq.15.2022.01.05.13.40.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:40:45 -0800 (PST)
From: Uladzimir Bely <wiselord1983@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 00:40:46 +0300
Message-Id: <20220105214046.14890-1-wiselord1983@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/linux-firmware: add option for Cypress
 FullMAC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since 2016, Cypress is in charge of supporting old Broadcom wireless
chips and producing new ones. Newer firmwares for now come with
a different license and have anoter location in a package.

Now, most of Broadcom FullMac firmwares in brcm/ directory should now
be just symlinks to the corresponding files in cypress/ directory.

Respectively, it also makes sence to autoselect corresponding CYPRESS
options if user selectes BRCM wireless stuff.

This patch was created as a result of investigation the issue with
broken wireless support for such popular boards as Raspberry Pi Zero W
and BananaPi M2 Zero.

Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>
---
 package/linux-firmware/Config.in           | 17 ++++++++++
 package/linux-firmware/linux-firmware.hash |  1 +
 package/linux-firmware/linux-firmware.mk   | 39 ++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 622b1ee685..c94ffe24de 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -140,11 +140,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X
 
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
 	bool "Broadcom BRCM bcm43xx"
+	select BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX
 	help
 	  Firmware files for the Broadcom bcm43xx SoftMAC and FullMAC.
 
 config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
 	bool "Broadcom BRCM bcm43xxx"
+	select BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XXX
 	help
 	  Firmware files for the Broadcom bcm43xxx, SoftMAC and FullMAC.
 
@@ -158,6 +160,21 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0
 	help
 	  Firmware file for the Broadcom 4366c0 FullMAC chip.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX
+	bool "Cypress CY cyw43xx"
+	help
+	  Firmware files for the Cypress cyw43xx FullMAC.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XXX
+	bool "Cypress CY cyw43xxx"
+	help
+	  Firmware files for the Cypress cyw43xxx FullMAC.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX
+	bool "Cypress CY cyw54xxx"
+	help
+	  Firmware files for the Cypress cyw54xxx FullMAC.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
 	bool "Intel iwlwifi 22260"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index d8edb37628..4c73374138 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -11,6 +11,7 @@ sha256  631065703055d11b099477c508508f20a80b202aad548a7726564bfa59a96c91  ath10k
 sha256  8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
 sha256  a5777f9e80aca0603b0648454de996168b1c530322550ccda94d6d78bcf6c061  LICENCE.chelsio_firmware
+sha256  ae0db6cc4db33941148df0f67de53e76a77b1b5a46b3165edb7040aa2750015f  LICENCE.cypress
 sha256  60fbc9cccb455e1a3306c97db942d6f24fa93664be61d54c497637e6d0e2ae83  LICENCE.fw_sst_0f28
 sha256  5181b0b51efc79d5acb2c9bb92042878fdbad97a92114d4ab5e32e2b5b52fce4  LICENCE.ibt_firmware
 sha256  0e0c11073ba3c832097da38e0905da36b8a3526f219407977b13b71c6675be7d  LICENCE.it913x
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 281ed0189d..ac45bc8282 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -675,6 +675,45 @@ LINUX_FIRMWARE_FILES += brcm/brcmfmac4366c-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
+# cyfmac43xx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XX),y)
+LINUX_FIRMWARE_FILES += \
+	cypress/cyfmac4339-sdio.bin \
+	cypress/cyfmac4354-sdio.bin \
+	cypress/cyfmac4354-sdio.clm_blob \
+	cypress/cyfmac4356-pcie.bin \
+	cypress/cyfmac4356-pcie.clm_blob \
+	cypress/cyfmac4356-sdio.bin \
+	cypress/cyfmac4356-sdio.clm_blob \
+	cypress/cyfmac4373-sdio.bin \
+	cypress/cyfmac4373-sdio.clm_blob
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
+endif
+
+# cyfmac43xxx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW43XXX),y)
+LINUX_FIRMWARE_FILES += \
+	cypress/cyfmac43012-sdio.bin \
+	cypress/cyfmac43012-sdio.clm_blob \
+	cypress/cyfmac43340-sdio.bin \
+	cypress/cyfmac43362-sdio.bin \
+	cypress/cyfmac43430-sdio.bin \
+	cypress/cyfmac43430-sdio.clm_blob \
+	cypress/cyfmac43455-sdio.bin \
+	cypress/cyfmac43455-sdio.clm_blob \
+	cypress/cyfmac43570-pcie.bin \
+	cypress/cyfmac43570-pcie.clm_blob
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
+endif
+
+# cyfmac54xxx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CYPRESS_CYW54XXX),y)
+LINUX_FIRMWARE_FILES += \
+	cypress/cyfmac54591-pcie.bin \
+	cypress/cyfmac54591-pcie.clm_blob
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.cypress
+endif
+
 # ql2xxx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX),y)
 LINUX_FIRMWARE_FILES += \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
