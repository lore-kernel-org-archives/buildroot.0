Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613B3CCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 22:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFAC80E7E;
	Sun, 12 Oct 2025 22:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coxIJW2YIpkx; Sun, 12 Oct 2025 22:30:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 118B780E7F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 118B780E7F;
	Sun, 12 Oct 2025 22:30:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8406BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 22:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8501A40AA6
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 22:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EL6OmOmAX-0H for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 22:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9A1BC40A64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A1BC40A64
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9A1BC40A64
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 22:30:51 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 84aWvM6EgDCZr84aWvqi09; Mon, 13 Oct 2025 00:30:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 13 Oct 2025 00:30:47 +0200
Message-ID: <20251012223047.3323531-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHg2+PRUA+ltoPlAdqL7liJSclfpBEX+TiI+InnlcewQhf+dVV6BHSf2uWi8swhjJTTMlitTMrTtAHoJr6LBg2iOuwpwoMU7rlvM9LpRcBFcQ4PyG/hW
 pcEGBdZePdDdP7b9TEjxvyskaAUjO0JEewjDvo8Gi0XVUKN6hbJLYhKloAVLJcfbMw2H/CWcL6TNSAskt1+ErcavYxnpujzHuhQGWK7v/WVomG/uUn/qpx0H
 gETNp530KQuI7ePhPhWqHBy4VParBngfo1hVph4GGoKlpGGRcX6C9wZ73S+q9yI7Y2x4MjmAwqBUSgCCjI5uEw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1760308249; bh=dCeYB6a0va+M67R8qzD5dW7YAV4SrPErX/Qy75oMxy0=;
 h=From:To:Subject:Date:MIME-Version;
 b=MXdLdGOyrojOoa9w5V+ICE/pONADg4DVby3m3qwNRQ9ElXnTjy1jbG8OHmoqCX4Q7
 nUT7+pZF1suuKQhyuYClkYuBSDKnmQeM+8taMBkNhE8c1xqLZVRocR7p/YHLcOosjT
 zUF0WCqRp6nciiTZsfoXy2fiKoaOTg3YLYOSXEiLEGhyF9X3Oorm4kXrMD6zozVGN2
 Wbar0DQ1hfz4tKHWjY9RO93sgIauiBvDrQEnkUQZZyr3Lu2c8M7U8KKyi/U5mKzxtn
 vn7TIlGmuE7A8zXIbQ9a+dVJjrIsDAou6+6nveQ3/FCZ4VxhqKEoyLQEyNOFqCiIBC
 Sd7zJBJHA4TOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MXdLdGOy
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to version 2025-10-11
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

Drop upstreamed patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-for-kernel-6.17.patch      | 80 -------------------
 package/xr819-xradio/xr819-xradio.hash        |  2 +-
 package/xr819-xradio/xr819-xradio.mk          |  2 +-
 3 files changed, 2 insertions(+), 82 deletions(-)
 delete mode 100644 package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch

diff --git a/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch b/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
deleted file mode 100644
index e53352ec0e..0000000000
--- a/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From dbf3f744650e05a40fc3df6325fc657e5c23cece Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Fri, 10 Oct 2025 22:18:12 +0200
-Subject: [PATCH] Fix build for kernel 6.17
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
-set_rts_threshold() and config() gain argument radio_idx to get radio
-index. So let's add that argument according to Linux version >= 6.17.
-
-Upstream: https://github.com/fifteenhex/xradio/pull/28
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- sta.c | 12 ++++++++++--
- sta.h | 12 ++++++++++--
- 2 files changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/sta.c b/sta.c
-index 1203ce9..d769b81 100644
---- a/sta.c
-+++ b/sta.c
-@@ -381,7 +381,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
- 	return ret;
- }
- 
--int xradio_config(struct ieee80211_hw *dev, u32 changed)
-+int xradio_config(struct ieee80211_hw *dev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+		  int radio_idx,
-+#endif
-+		  u32 changed)
- {
- 	int ret = 0;
- 	struct xradio_common *hw_priv = dev->priv;
-@@ -796,7 +800,11 @@ void xradio_wep_key_work(struct work_struct *work)
- 	wsm_unlock_tx(hw_priv);
- }
- 
--int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
-+int xradio_set_rts_threshold(struct ieee80211_hw *hw,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+			     int radio_idx,
-+#endif
-+			     u32 value)
- {
- 	struct xradio_common *hw_priv = hw->priv;
- 	int ret = 0;
-diff --git a/sta.h b/sta.h
-index 39a023a..de8f837 100644
---- a/sta.h
-+++ b/sta.h
-@@ -42,7 +42,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
-                             struct ieee80211_vif *vif,
-                             enum nl80211_iftype new_type,
-                             bool p2p);
--int xradio_config(struct ieee80211_hw *dev, u32 changed);
-+int xradio_config(struct ieee80211_hw *dev,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+		  int radio_idx,
-+#endif
-+		  u32 changed);
- int xradio_change_interface(struct ieee80211_hw *dev,
-                             struct ieee80211_vif *vif,
-                             enum nl80211_iftype new_type,
-@@ -65,7 +69,11 @@ int xradio_get_stats(struct ieee80211_hw *dev,
- int xradio_get_tx_stats(struct ieee80211_hw *dev,
- 			struct ieee80211_tx_queue_stats *stats);
- */
--int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value);
-+int xradio_set_rts_threshold(struct ieee80211_hw *hw,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+			     int radio_idx,
-+#endif
-+			     u32 value);
- 
- void xradio_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u32 queues, bool drop);
- 
--- 
-2.47.3
-
diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index fe91d856ec..4032fa307a 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  c06dd87948b4a4c1bee070bbc3ce07b8711ec027e78ab9b83ea1c7350472105d  xr819-xradio-d766844ce8307e5902b3ab461f06bf8ad06891dd.tar.gz
+sha256  fce2819322e18d80abba84fa420a55ec6ccea61240fc1a3268880eb84584bea5  xr819-xradio-43992a7e7ed95ff815cf6d8ba81cef1085e50ab9.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 93fbdacb38..087536ebe7 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = d766844ce8307e5902b3ab461f06bf8ad06891dd
+XR819_XRADIO_VERSION = 43992a7e7ed95ff815cf6d8ba81cef1085e50ab9
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
