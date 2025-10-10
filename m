Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259B2CCD18C
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 20:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB86A605CB;
	Fri, 10 Oct 2025 20:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nla_1mNUWez; Fri, 10 Oct 2025 20:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC424606EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC424606EA;
	Fri, 10 Oct 2025 20:31:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E9314B
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 20:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 742B0606EA
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKmO_n7aOPE6 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 20:31:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7208605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7208605CB
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7208605CB
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 20:31:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 7Jm5v7x3mqmI77Jm6vBTD5; Fri, 10 Oct 2025 22:31:38 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 10 Oct 2025 22:31:37 +0200
Message-ID: <20251010203137.1817176-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010203137.1817176-1-giulio.benetti@benettiengineering.com>
References: <20251010203137.1817176-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGZgYORVC7YLm7rPDS80ISmXgW9sic72jrigOtyyxlOOf3IFKBy3Fd0U1HMpsdq2GJCj4aSvU2+fyQItbsYEuj/qsnwjOf77S0qSd20CBKvwziWoao8G
 Ro2lqJHaZjpDXEzUZbsWIjLy/Zu2RJtlyOBlVqOCnA1bjIUdqORAVvMYDi+h4ur0DYE0ClFwDukPrq3OmpFji/ITRZlD7otdP7WUr1f7YEwH4HoMsolL68bB
 Ifxu/dPEuH2wQIUM5iFORj23uxGZ3+alwle1s0Rn2PSI3dzF9Sjh2k7qPtErYJ3FFDjIyVmBzeZzwNA6zf5gvnNofdumVu1bZpvFyYQ+rEI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1760128298; bh=2xKpvs0cMFYw6WnOWN6zEUEON92M1fADFX0TPm52/us=;
 h=From:To:Subject:Date:MIME-Version;
 b=XbY9ON3yiH77ODYXLWvV3Frmi1mrhPHrnF94r+kaxlaNhGE6a6ZnH/aJtBLcNvGAQ
 lC23VQgMZCpjDNFu3YkI6tStsT7OuQYrwCIXY03umP4mJI98hhjmnNWr/3cIsYCSLb
 LcVlM5OtzpxyCigo7xRG6gaiKMYv5LWxXWBmn2ylu4S4g5o9+svOB2YMGvSbzIV7bP
 2suCxriCH8v4dQzKbJoaMfY0D8OaqRI5V3fk0mO6/5Sf1WiVQobCstExkPgodmjpt5
 p+N2kW9tSqFDjov/zhhqLCo2QqjEbkgDfS+i/PYPs5cVOkwy/9aMALll/+9Nd0v1JH
 k49pi6IzVxZ1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XbY9ON3y
Subject: [Buildroot] [PATCH] package/xr819-xradio: fix build failure with
 Linux 6.17
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

Add a local patch pending upstream to fix build failure with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-for-kernel-6.17.patch      | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch

diff --git a/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch b/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..e53352ec0e
--- /dev/null
+++ b/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,80 @@
+From dbf3f744650e05a40fc3df6325fc657e5c23cece Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 10 Oct 2025 22:18:12 +0200
+Subject: [PATCH] Fix build for kernel 6.17
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_rts_threshold() and config() gain argument radio_idx to get radio
+index. So let's add that argument according to Linux version >= 6.17.
+
+Upstream: https://github.com/fifteenhex/xradio/pull/28
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ sta.c | 12 ++++++++++--
+ sta.h | 12 ++++++++++--
+ 2 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/sta.c b/sta.c
+index 1203ce9..d769b81 100644
+--- a/sta.c
++++ b/sta.c
+@@ -381,7 +381,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
+ 	return ret;
+ }
+ 
+-int xradio_config(struct ieee80211_hw *dev, u32 changed)
++int xradio_config(struct ieee80211_hw *dev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++		  int radio_idx,
++#endif
++		  u32 changed)
+ {
+ 	int ret = 0;
+ 	struct xradio_common *hw_priv = dev->priv;
+@@ -796,7 +800,11 @@ void xradio_wep_key_work(struct work_struct *work)
+ 	wsm_unlock_tx(hw_priv);
+ }
+ 
+-int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value)
++int xradio_set_rts_threshold(struct ieee80211_hw *hw,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++			     int radio_idx,
++#endif
++			     u32 value)
+ {
+ 	struct xradio_common *hw_priv = hw->priv;
+ 	int ret = 0;
+diff --git a/sta.h b/sta.h
+index 39a023a..de8f837 100644
+--- a/sta.h
++++ b/sta.h
+@@ -42,7 +42,11 @@ int xradio_change_interface(struct ieee80211_hw *dev,
+                             struct ieee80211_vif *vif,
+                             enum nl80211_iftype new_type,
+                             bool p2p);
+-int xradio_config(struct ieee80211_hw *dev, u32 changed);
++int xradio_config(struct ieee80211_hw *dev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++		  int radio_idx,
++#endif
++		  u32 changed);
+ int xradio_change_interface(struct ieee80211_hw *dev,
+                             struct ieee80211_vif *vif,
+                             enum nl80211_iftype new_type,
+@@ -65,7 +69,11 @@ int xradio_get_stats(struct ieee80211_hw *dev,
+ int xradio_get_tx_stats(struct ieee80211_hw *dev,
+ 			struct ieee80211_tx_queue_stats *stats);
+ */
+-int xradio_set_rts_threshold(struct ieee80211_hw *hw, u32 value);
++int xradio_set_rts_threshold(struct ieee80211_hw *hw,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++			     int radio_idx,
++#endif
++			     u32 value);
+ 
+ void xradio_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u32 queues, bool drop);
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
