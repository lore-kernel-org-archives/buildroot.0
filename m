Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B38C47DB3
	for <buildroot@archiver.kernel.org>; Mon, 29 Jan 2024 23:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E91C760BA0;
	Mon, 29 Jan 2024 23:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E91C760BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IXSrybtoZgir; Mon, 29 Jan 2024 23:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFCB660C0F;
	Mon, 29 Jan 2024 23:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFCB660C0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 296621BF309
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 23:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01B8860BA0
 for <buildroot@lists.busybox.net>; Mon, 29 Jan 2024 23:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B8860BA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S2ZqCJXF1FxT for <buildroot@lists.busybox.net>;
 Mon, 29 Jan 2024 23:18:02 +0000 (UTC)
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E892D60B3B
 for <buildroot@buildroot.org>; Mon, 29 Jan 2024 23:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E892D60B3B
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Uat4r1x68RqncUat4rsACH; Tue, 30 Jan 2024 00:17:59 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 00:17:56 +0100
Message-Id: <20240129231756.443977-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfASEkYajnAcBAlZxWoZBXXKpCiphRdGtXzrnmo5ZtU2N9a3rEDsVrggtMJuqcP4PvvuXiLGw8A6aqst+g3ytzaaNswhhgVZwfbZpi1Uq5RYQJdGbl0Vp
 n8eQSUiDFyGs1Wkwxhc5siG6IKrLNX/aVLixiflIp5piWS3D4kyAH6ciJVT43VUtAFLb3s5ACVm6E5MqKFxByImCQcvHqFU7BaB+rZAQ5H7+7cL5jlkGo0Fm
 P/6Azr6l3oyQdG1EVx/aDBACUtKt4pW1XsnxRCr+xF4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1706570279; bh=c1aNVW+tLaH5H5Y1jv6f/ButNvi/ek7pa1L3yyuF8eg=;
 h=From:To:Subject:Date:MIME-Version;
 b=YKqaZDrlCuhk72L8yhrT6clvDIFLktfXdhUce40jdOLuV5CieXnCzt6Wa9RJznRZx
 0CkfOkkDePWVkiLXMggwv8IyCI59jNT3G4rklSW+wfp7sK7Wbe10Y3aZH/kBfyfE0D
 E7q6Usl5uAksHloyUcfYDmb8FlKPP/4cZdu8LrSt4CPpgmAti4NgCQoG9LhaZFyG9t
 bDO2IzsFEx+TWQYRqdAhe4AFpfw8Y50AcITYZkGMYGQbmEbAkkRPEKrhTU4FW3gdUZ
 no7EJPUtOQKLInFb6d8Ur1AfJl+5Oa6lVN4auyK5Ojxlo7kQGLhXk//+8vnewQ3SYO
 Xmph+li1M9EkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YKqaZDrl
Subject: [Buildroot] [PATCH] package/esp-hosted: bump version to 2024-01-26
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* support Linux 6.7
* support ESP32 and ESP32C6 Targets

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...g-Fix-build-with-Linux-kernel-versio.patch | 36 ++++++++++
 ...py-with-strscpy-as-suggested-in-Linu.patch | 71 +++++++++++++++++++
 package/esp-hosted/Config.in                  | 14 ++++
 package/esp-hosted/esp-hosted.hash            |  2 +-
 package/esp-hosted/esp-hosted.mk              |  8 ++-
 5 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 package/esp-hosted/0001-fix-esp-hosted-ng-Fix-build-with-Linux-kernel-versio.patch
 create mode 100644 package/esp-hosted/0002-Substitute-strlcpy-with-strscpy-as-suggested-in-Linu.patch

diff --git a/package/esp-hosted/0001-fix-esp-hosted-ng-Fix-build-with-Linux-kernel-versio.patch b/package/esp-hosted/0001-fix-esp-hosted-ng-Fix-build-with-Linux-kernel-versio.patch
new file mode 100644
index 0000000000..6c5b7bae38
--- /dev/null
+++ b/package/esp-hosted/0001-fix-esp-hosted-ng-Fix-build-with-Linux-kernel-versio.patch
@@ -0,0 +1,36 @@
+From 5391bf14468cda9aa180fb524c3d12d3af7525f3 Mon Sep 17 00:00:00 2001
+From: Nicolas Aguirre <aguirre.nicolas@gmail.com>
+Date: Thu, 25 Jan 2024 16:01:49 +0100
+Subject: [PATCH] fix(esp-hosted-ng): Fix build with Linux kernel version 6.7.0
+
+cfg80211_rx_assoc_resp structure has been removed and replaced by
+cfg80211_rx_assoc_resp_data after this changes :
+https://patchwork.kernel.org/project/linux-wireless/patch/20231012114229.2931808-3-kvalo@kernel.org/
+
+Upstream: https://github.com/espressif/esp-hosted/pull/324
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_ng/host/include/esp_kernel_port.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/esp_hosted_ng/host/include/esp_kernel_port.h b/esp_hosted_ng/host/include/esp_kernel_port.h
+index 03d11773e5..c4eb336969 100644
+--- a/esp_hosted_ng/host/include/esp_kernel_port.h
++++ b/esp_hosted_ng/host/include/esp_kernel_port.h
+@@ -178,7 +178,12 @@ void CFG80211_RX_ASSOC_RESP(struct net_device *dev,
+ 			    const u8 *req_ies, size_t req_ies_len)
+ {
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 0, 0))
++
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 7, 0))
++	struct cfg80211_rx_assoc_resp_data resp = {0};
++#else
+ 	struct cfg80211_rx_assoc_resp resp = {0};
++#endif
+ 
+ 	resp.links[0].bss = bss;
+ 	resp.buf = (u8 *)buf;
+-- 
+2.34.1
+
diff --git a/package/esp-hosted/0002-Substitute-strlcpy-with-strscpy-as-suggested-in-Linu.patch b/package/esp-hosted/0002-Substitute-strlcpy-with-strscpy-as-suggested-in-Linu.patch
new file mode 100644
index 0000000000..54c8539552
--- /dev/null
+++ b/package/esp-hosted/0002-Substitute-strlcpy-with-strscpy-as-suggested-in-Linu.patch
@@ -0,0 +1,71 @@
+From 2479fac6163537c77f30ac66440018a866e1312b Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 29 Jan 2024 23:56:03 +0100
+Subject: [PATCH] Substitute strlcpy() with strscpy() as suggested in Linux:
+ https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/scripts/checkpatch.pl#n7006
+
+Upstream: https://github.com/espressif/esp-hosted/pull/326
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ esp_hosted_fg/host/linux/host_driver/esp32/spi/esp_spi.c | 2 +-
+ esp_hosted_ng/host/esp_cfg80211.c                        | 2 +-
+ esp_hosted_ng/host/esp_cmd.c                             | 2 +-
+ esp_hosted_ng/host/spi/esp_spi.c                         | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/esp_hosted_fg/host/linux/host_driver/esp32/spi/esp_spi.c b/esp_hosted_fg/host/linux/host_driver/esp32/spi/esp_spi.c
+index f375d7d3f1..1dc2506bee 100644
+--- a/esp_hosted_fg/host/linux/host_driver/esp32/spi/esp_spi.c
++++ b/esp_hosted_fg/host/linux/host_driver/esp32/spi/esp_spi.c
+@@ -460,7 +460,7 @@ static int spi_dev_init(int spi_clk_mhz)
+ 	struct spi_board_info esp_board = {{0}};
+ 	struct spi_master *master = NULL;
+ 
+-	strlcpy(esp_board.modalias, "esp_spi", sizeof(esp_board.modalias));
++	strscpy(esp_board.modalias, "esp_spi", sizeof(esp_board.modalias));
+ 	esp_board.mode = SPI_MODE_2;
+ 	esp_board.max_speed_hz = spi_clk_mhz * NUMBER_1M;
+ 	esp_board.bus_num = 0;
+diff --git a/esp_hosted_ng/host/esp_cfg80211.c b/esp_hosted_ng/host/esp_cfg80211.c
+index 548fdcc476..feeb9921a1 100644
+--- a/esp_hosted_ng/host/esp_cfg80211.c
++++ b/esp_hosted_ng/host/esp_cfg80211.c
+@@ -671,7 +671,7 @@ static void esp_reg_notifier(struct wiphy *wiphy,
+ 
+ 	/* Don't send same regdom info to firmware */
+ 	if (strncmp(request->alpha2, priv->country_code, strlen(request->alpha2))) {
+-		strlcpy(priv->country_code, request->alpha2, MAX_COUNTRY_LEN);
++		strscpy(priv->country_code, request->alpha2, MAX_COUNTRY_LEN);
+ 		cmd_set_reg_domain(priv);
+ 	}
+ }
+diff --git a/esp_hosted_ng/host/esp_cmd.c b/esp_hosted_ng/host/esp_cmd.c
+index 244df46c0f..0c0ab968ef 100644
+--- a/esp_hosted_ng/host/esp_cmd.c
++++ b/esp_hosted_ng/host/esp_cmd.c
+@@ -1646,7 +1646,7 @@ int cmd_set_reg_domain(struct esp_wifi_device *priv)
+ 
+ 	cmd = (struct cmd_reg_domain *) (cmd_node->cmd_skb->data + sizeof(struct esp_payload_header));
+ 
+-	strlcpy(cmd->country_code, priv->country_code, MAX_COUNTRY_LEN);
++	strscpy(cmd->country_code, priv->country_code, MAX_COUNTRY_LEN);
+ 
+ 	queue_cmd_node(priv->adapter, cmd_node, ESP_CMD_DFLT_PRIO);
+ 	queue_work(priv->adapter->cmd_wq, &priv->adapter->cmd_work);
+diff --git a/esp_hosted_ng/host/spi/esp_spi.c b/esp_hosted_ng/host/spi/esp_spi.c
+index 8364a0c4d6..c741d71981 100644
+--- a/esp_hosted_ng/host/spi/esp_spi.c
++++ b/esp_hosted_ng/host/spi/esp_spi.c
+@@ -416,7 +416,7 @@ static int spi_dev_init(int spi_clk_mhz)
+ 	struct spi_board_info esp_board = {{0}};
+ 	struct spi_master *master = NULL;
+ 
+-	strlcpy(esp_board.modalias, "esp_spi", sizeof(esp_board.modalias));
++	strscpy(esp_board.modalias, "esp_spi", sizeof(esp_board.modalias));
+ 	esp_board.mode = SPI_MODE_2;
+ 	esp_board.max_speed_hz = spi_clk_mhz * NUMBER_1M;
+ 	esp_board.bus_num = 0;
+-- 
+2.34.1
+
diff --git a/package/esp-hosted/Config.in b/package/esp-hosted/Config.in
index 42e1afa8c5..5abab73b57 100644
--- a/package/esp-hosted/Config.in
+++ b/package/esp-hosted/Config.in
@@ -28,4 +28,18 @@ config BR2_PACKAGE_ESP_HOSTED_SPI
 
 endchoice
 
+choice
+	prompt "Target"
+	default BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
+	help
+	  Select which SoC Target driver is used for
+
+config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32
+	bool "ESP32"
+
+config BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32C6
+	bool "ESP32C6"
+
+endchoice
+
 endif
diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index b129bb42f9..73e19a2a47 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6e023c26355643f2aaf6d79d5910f64c49ea638063235d519075629643518a71  esp-hosted-ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404.tar.gz
+sha256  81852d1de5d6d8bb806818723c994dfae703e5fba4a734c5254902f3f71cf7b7  esp-hosted-0067a944ddc0e532bc13f83236c65df3a1ec00a0.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 578108c91d..6a4a4e1358 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = ce3c50a33fa4bc562a1b6cbcee292c1ae0b0a404
+ESP_HOSTED_VERSION = 0067a944ddc0e532bc13f83236c65df3a1ec00a0
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
@@ -28,5 +28,11 @@ else
 ESP_HOSTED_MODULE_MAKE_OPTS = target=sdio
 endif
 
+ifeq ($(BR2_PACKAGE_ESP_HOSTED_TARGET_ESP32),y)
+ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32=y
+else
+ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32C6=y
+endif
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
