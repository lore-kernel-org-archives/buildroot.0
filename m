Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828F9C369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4278A818A2;
	Sat, 19 Apr 2025 14:35:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zO6izkk821tm; Sat, 19 Apr 2025 14:35:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D20818CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D20818CD;
	Sat, 19 Apr 2025 14:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0D3E22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3168940151
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hOBrCIAmOvAK for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC3C400EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CC3C400EA
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A2B4852E0; Sat, 19 Apr 2025 14:35:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:34:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f027e7c5b3b84ab920f0ded6f3e2f298b7ad4f55
X-Git-Newrev: 3012fbdec745640f7ef9f52f4ee9d94d07c82eb6
X-Patchwork-Hint: ignore
Message-Id: <20250419143510.4A2B4852E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wilc-driver: fix build failure
 with Linux 6.10
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3012fbdec745640f7ef9f52f4ee9d94d07c82eb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add local patches pending upstream to fix 3 different API changes
throughout Linux 6.7, 6.8, 6.10.

Fixes:
https://autobuild.buildroot.org/results/e001f70dab4c9cebdbde0443f4f8bb6b42ae5561/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0008-Fix-build-with-Linux-6.7.patch            | 46 ++++++++++++++++++
 .../0009-Fix-build-with-Linux-6.8.patch            | 34 +++++++++++++
 .../0010-Fix-build-with-Linux-6.10.patch           | 55 ++++++++++++++++++++++
 3 files changed, 135 insertions(+)

diff --git a/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch b/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
new file mode 100644
index 0000000000..9714a828eb
--- /dev/null
+++ b/package/wilc-driver/0008-Fix-build-with-Linux-6.7.patch
@@ -0,0 +1,46 @@
+From c2024eb93f6d7ec605226d5d8a29ea17fbc71b5d Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 17 Apr 2025 19:06:48 +0200
+Subject: [PATCH] Fix build with Linux 6.7
+
+During commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bb55441c57ccc5cc2eab44e1a97698b9d708871d
+struct cfg80211_ap_settings has been split into multiple structs including
+beacon. So is Linux version is 6.7+ let's use &info->beacon in place of
+beacon.
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 5c92062..25da3a1 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -1822,13 +1822,21 @@ static int start_ap(struct wiphy *wiphy, struct net_device *dev,
+ }
+ 
+ static int change_beacon(struct wiphy *wiphy, struct net_device *dev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,7,0))
++			 struct cfg80211_ap_update *info)
++#else
+ 			 struct cfg80211_beacon_data *beacon)
++#endif
+ {
+ 	struct wilc_vif *vif = netdev_priv(dev);
+ 
+ 	PRINT_INFO(vif->ndev, HOSTAPD_DBG, "Setting beacon\n");
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,7,0))
++	return wilc_add_beacon(vif, 0, 0, &info->beacon);
++#else
+ 	return wilc_add_beacon(vif, 0, 0, beacon);
++#endif
+ }
+ 
+ static int stop_ap(struct wiphy *wiphy, struct net_device *dev
+-- 
+2.39.5
+
diff --git a/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch b/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
new file mode 100644
index 0000000000..2bafd53a9a
--- /dev/null
+++ b/package/wilc-driver/0009-Fix-build-with-Linux-6.8.patch
@@ -0,0 +1,34 @@
+From 90e679f1b7caad02e68fa8672be6569eb1b2b76f Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 17 Apr 2025 18:56:55 +0200
+Subject: [PATCH] Fix build with Linux 6.8
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d26270061ae66b915138af7cd73ca6f8b85e6b44
+strlcpy() has been superseded in favor of strscpy() so let's #define
+strlcpy as strscpy if Linux version 6.8+
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ mon.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/mon.c b/mon.c
+index 2c9c2d9..20b7e20 100644
+--- a/mon.c
++++ b/mon.c
+@@ -6,6 +6,10 @@
+ 
+ #include "cfg80211.h"
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 8, 0))
++#define strlcpy strscpy
++#endif
++
+ struct wilc_wfi_radiotap_hdr {
+ 	struct ieee80211_radiotap_header hdr;
+ 	u8 rate;
+-- 
+2.39.5
+
diff --git a/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch b/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
new file mode 100644
index 0000000000..08444b06e2
--- /dev/null
+++ b/package/wilc-driver/0010-Fix-build-with-Linux-6.10.patch
@@ -0,0 +1,55 @@
+From 684eb3e40c88ee7a2cd4417a12b9b27a35e86655 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 17 Apr 2025 18:41:07 +0200
+Subject: [PATCH] Fix build with Linux 6.10
+
+During commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9b163e0d330debbf7dcc14b2c3e2dc19a3b50a1d
+is_dma_mapped member has been dropped since it was not used anymore. The
+DMA mapping is done directly in single spi drivers in case it's supported
+so having is_dma_mapped set to 1 lead to code breakage. So we can consider
+it always as 0 and basically guard it if Linux version is 6.10+
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/8
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ spi.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/spi.c b/spi.c
+index f7b43e2..be616f4 100644
+--- a/spi.c
++++ b/spi.c
+@@ -338,7 +338,9 @@ static int wilc_spi_tx(struct wilc *wilc, u8 *b, u32 len)
+ 		memset(&msg, 0, sizeof(msg));
+ 		spi_message_init(&msg);
+ 		msg.spi = spi;
++#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
+ 		msg.is_dma_mapped = USE_SPI_DMA;
++#endif
+ 		spi_message_add_tail(&tr, &msg);
+ 
+ 		ret = spi_sync(spi, &msg);
+@@ -385,7 +387,9 @@ static int wilc_spi_rx(struct wilc *wilc, u8 *rb, u32 rlen)
+ 		memset(&msg, 0, sizeof(msg));
+ 		spi_message_init(&msg);
+ 		msg.spi = spi;
++#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
+ 		msg.is_dma_mapped = USE_SPI_DMA;
++#endif
+ 		spi_message_add_tail(&tr, &msg);
+ 
+ 		ret = spi_sync(spi, &msg);
+@@ -427,7 +431,9 @@ static int wilc_spi_tx_rx(struct wilc *wilc, u8 *wb, u8 *rb, u32 rlen)
+ 		memset(&msg, 0, sizeof(msg));
+ 		spi_message_init(&msg);
+ 		msg.spi = spi;
++#if KERNEL_VERSION(6, 10, 0) > LINUX_VERSION_CODE
+ 		msg.is_dma_mapped = USE_SPI_DMA;
++#endif
+ 
+ 		spi_message_add_tail(&tr, &msg);
+ 		ret = spi_sync(spi, &msg);
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
