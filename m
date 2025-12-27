Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA0EE92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 21:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C48980E63;
	Sat, 27 Dec 2025 21:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6tA1WcG7axq; Sat, 27 Dec 2025 21:33:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ACA680F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766871195;
	bh=kHiMAo2REzVXnHgzWygQPJ+V1t8y3BvXCstXUS8j3hY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lIu4CM7uzZXP5tm+YUMeKZ5seGEe01NvoLTlLcF5njG6bH3KB4PWgzoqLnuHD+jzi
	 edGuPnB75oj8LC83roFr6xDmwj1s/CkMEcO7Ganlu/eMZPlIfUg/tXHnbtGYxHpldu
	 bbpFu6yIBgAFnAiziozKkENSB/7xos9K7umg2s9XK1kTEiqL4Xmv4L5sn7SaJNSUvN
	 gsz2TvUft/+0oFDNKQQ1Jd9n0L/SB2jdRY8MsLHLxn/foEfyJ2KH7tpsTDvuajr2xV
	 N2ERNfLui265flAEVfrP9Ve4Wk4gZ/kFuidi9f32KfK+fCpvtomf2tc0Hg0vXi9xKz
	 u5/u17fe7oSog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ACA680F30;
	Sat, 27 Dec 2025 21:33:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98AA2119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 770D480F30
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6jaMYFHk7dT for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 21:33:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2FC480E63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2FC480E63
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 21:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9875F87826; Sat, 27 Dec 2025 21:33:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 27 Dec 2025 22:29:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 225f8a189987ebddf77abc3a34f782eaf93d06c2
X-Git-Newrev: d60dc5e6184dd2740fb33f6bc7aa8c6a76b35d7b
X-Patchwork-Hint: ignore
Message-Id: <20251227213312.9875F87826@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xr819-xradio: bump to version
 2025-10-11
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

commit: https://git.buildroot.net/buildroot/commit/?id=d60dc5e6184dd2740fb33f6bc7aa8c6a76b35d7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstreamed patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-Fix-build-for-kernel-6.17.patch           | 80 ----------------------
 package/xr819-xradio/xr819-xradio.hash             |  2 +-
 package/xr819-xradio/xr819-xradio.mk               |  2 +-
 3 files changed, 2 insertions(+), 82 deletions(-)

diff --git a/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch b/package/xr819-xradio/0001-Fix-build-for-kernel-6.17.patch
deleted file mode 100644
index 3329016472..0000000000
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
-Upstream: https://github.com/fifteenhex/xradio/commit/43992a7e7ed95ff815cf6d8ba81cef1085e50ab9
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
