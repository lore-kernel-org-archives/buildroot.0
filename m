Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A40CAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 20:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F11B81176;
	Tue, 30 Sep 2025 20:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gt9ZUGz955GC; Tue, 30 Sep 2025 20:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9824A81298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9824A81298;
	Tue, 30 Sep 2025 20:25:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94564111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 840886109E
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_vTmaNssUVn for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 20:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B8BA61097
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B8BA61097
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 20:24:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C57A8665D; Tue, 30 Sep 2025 20:24:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 22:21:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 752fc349a05910a08b08467e2f28fd80f1c239a1
X-Git-Newrev: 5e28e8d34d2ab2b6ba2c37ebcdce4428af8d9015
X-Patchwork-Hint: ignore
Message-Id: <20250930202459.7C57A8665D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 ath12k firmwares
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e28e8d34d2ab2b6ba2c37ebcdce4428af8d9015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add options to install the WCN7850 or QCN9274 firmware.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
[Julien:
 - reindent _FIRMWARE_FILES with one tab
 - move ath12k license hashes near ath10k
 - inverse QCN9274/WCN7850 order in Config.in
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/linux-firmware/Config.in           | 12 ++++++++++++
 package/linux-firmware/linux-firmware.hash |  2 ++
 package/linux-firmware/linux-firmware.mk   | 19 +++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 1f33fbc0bd..9e01831ed1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -490,6 +490,18 @@ config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_6174
 	help
 	  Firmware files for the Qualcomm Atheros QCA6174 chip
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_QCN9274
+	bool "Qualcomm QCN9274"
+	help
+	  Firmware files for the Qualcomm 802.11be QCN9274 chip
+	  supported by the ath12k kernel driver.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WCN7850
+	bool "Qualcomm WCN7850"
+	help
+	  Firmware files for the Qualcomm 802.11be WCN7850 chip
+	  supported by the ath12k kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
 	bool "Ralink rt2501/rt61"
 	help
diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index e980010cd8..66e7a47275 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -10,6 +10,8 @@ sha256  802b7014b26c606cf6248ae8b0ab1ce6d2d1b0db236d38dd269e676cd70710f2  LICENC
 sha256  3b5eb392b2d9d8c46d6aae26d06c187e5ea3029b12d13bc2b8deb8b3ce6bfa53  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-4.txt
 sha256  631065703055d11b099477c508508f20a80b202aad548a7726564bfa59a96c91  ath10k/QCA6174/hw2.1/notice_ath10k_firmware-5.txt
 sha256  8ce5c6ea0542bf4aac31fc3ae16a39792ad22d0eae4543063fac56fb3380f021  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
+sha256  097ceeb6f03dad7e74a2de0f217b1dad149989e550681e8726908ef477c9d58f  ath12k/QCN9274/hw2.0/Notice.txt
+sha256  515bf4c9d620a87458e4447fe01a0e9bc384d1c3e0037cc4c3d2037b1ff25525  ath12k/WCN7850/hw2.0/Notice.txt
 sha256  bf1cb89140fe7e138fec229b26fa45d2fb46f416ab559916c6e56c0224df2e8e  LICENCE.bnx2
 sha256  691f2b5e3e94e06aa89450c99ff08c83336c77fe4ad64a609b1cddea4bf98727  LICENCE.bnx2x
 sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 723b525fed..67d56e4f58 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -459,6 +459,25 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += \
 	ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WCN7850),y)
+LINUX_FIRMWARE_FILES += \
+	ath12k/WCN7850/hw2.0/board-2.bin \
+	ath12k/WCN7850/hw2.0/amss.bin \
+	ath12k/WCN7850/hw2.0/m3.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENSE.QualcommAtheros_ath10k \
+	ath12k/WCN7850/hw2.0/Notice.txt
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_QCN9274),y)
+LINUX_FIRMWARE_FILES += \
+	ath12k/QCN9274/hw2.0/board-2.bin \
+	ath12k/QCN9274/hw2.0/firmware-2.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += \
+	LICENSE.QualcommAtheros_ath10k \
+	ath12k/QCN9274/hw2.0/Notice.txt
+endif
+
 # CC2560(A)
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560),y)
 LINUX_FIRMWARE_FILES += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
