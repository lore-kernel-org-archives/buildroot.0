Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A70C6FA8E
	for <buildroot@archiver.kernel.org>; Thu,  2 Mar 2023 15:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77D6E41029;
	Thu,  2 Mar 2023 15:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77D6E41029
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8HjUbEQUEIKZ; Thu,  2 Mar 2023 15:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6EBC41006;
	Thu,  2 Mar 2023 15:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6EBC41006
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 163591BF59D
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 15:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1AEF41006
 for <buildroot@lists.busybox.net>; Thu,  2 Mar 2023 15:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1AEF41006
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LYC44p9C0gzh for <buildroot@lists.busybox.net>;
 Thu,  2 Mar 2023 15:26:10 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA6E9408F5
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA6E9408F5
 for <buildroot@buildroot.org>; Thu,  2 Mar 2023 15:26:09 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Xkhwp2ktAD70BXkhxp1SCa; Thu, 02 Mar 2023 16:19:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  2 Mar 2023 16:18:59 +0100
Message-Id: <20230302151859.400567-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNxaMUaP7ClAekI9kfAfw+3vv5t09hqe+V9B9/ULncHPGttUxnqJPvN/nFZ27fr3do3uxQk89u21KkYpEez8knoCS7xsSUlH11smSPOBEQJiFqrUjZxs
 mFtVHc1PkE43zkcVvG7Ri1+f8k4O9mRFxvRcpd+EmZc5hWlCLfYiYPvEmkjln8xdhqSRYUuaNBMOmzffQsZl0fPRbFWZV5O7wSLz0rNTNdSwt6PrDfSU+qi7
 NJ9/TTpWexrjK5V7bc+kewHEyTT8z46m/mZ0l22AQlx4EOaahEFawkJfyDbRkLtDVbIXt0HHQw9i7lXp4ff02g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677770341; bh=1wCZS7dsH4/s1ujTHMvqFpLYJw4jK6YyqIv+pWVhPQM=;
 h=From:To:Subject:Date:MIME-Version;
 b=m5ZaAnXTh3vl2/d41vktan8H9KZFTeQjJb1xV4BKDd27IX80jQzvQnHPCrQGQrTgf
 kDpT5F/kWlw07syxfWVHi24Hnjpq5/PRBQ05Bfxpa9Il/nxq5KcP7S4asH4RDH0G1R
 ZCfOhvpjzjDQ/JvfJXQ4FOiwIox06WUlaj3tjKgTzBqFAH52YxPjKRP78rCZHFKTnC
 Ald+vkm5b2D7R8mmo+4SuIF1L8xUuExiAybDHbS3r8pu/qfctETwFO+eZu15ZSz9CS
 PJjSdIMYPr2dpWO6V4zN1WXeyDrR7ynBU+kNsWnTFRiWs0PIa9G3U6X0Y182lLKTAo
 XPfnkdHnIt1BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=m5ZaAnXT
Subject: [Buildroot] [PATCH] package/rtl8821cu: fix build failure on
 PowerPC64
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

Let's add local patch pending upstream to fix get_ra() conflict on
PowerPC64 architecture.

[0]: https://github.com/morrownr/8821cu-20210118/pull/93

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-on-PowerPC64.patch         | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 package/rtl8821cu/0001-Fix-build-on-PowerPC64.patch

diff --git a/package/rtl8821cu/0001-Fix-build-on-PowerPC64.patch b/package/rtl8821cu/0001-Fix-build-on-PowerPC64.patch
new file mode 100644
index 0000000000..8beedcaa38
--- /dev/null
+++ b/package/rtl8821cu/0001-Fix-build-on-PowerPC64.patch
@@ -0,0 +1,123 @@
+From 267ca7b6f850befc8b5d92544b81e12c60dda0f6 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 2 Mar 2023 16:14:52 +0100
+Subject: [PATCH] Fix build on PowerPC64
+
+On PowerPC64 architecture get_ra() is also present in Linux but with a
+different name causing build to fail. To fix this let's rename local
+get_ra() to rtl_get_ra().
+
+[Upstream status: https://github.com/morrownr/8821cu-20210118/pull/93]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ core/rtw_odm.c                | 6 +++---
+ core/rtw_recv.c               | 6 +++---
+ hal/hal_com.c                 | 2 +-
+ include/wifi.h                | 2 +-
+ os_dep/linux/ioctl_cfg80211.c | 2 +-
+ 5 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/core/rtw_odm.c b/core/rtw_odm.c
+index 9651d4f..6174944 100644
+--- a/core/rtw_odm.c
++++ b/core/rtw_odm.c
+@@ -272,7 +272,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
+ 				);
+@@ -382,7 +382,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
+ 					, pkt_cch, pkt_bw
+@@ -400,7 +400,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
+ 				);
+diff --git a/core/rtw_recv.c b/core/rtw_recv.c
+index c19a492..7a2aa4b 100755
+--- a/core/rtw_recv.c
++++ b/core/rtw_recv.c
+@@ -4066,7 +4066,7 @@ int recv_func(_adapter *padapter, union recv_frame *rframe)
+ 
+ 	if (check_fwstate(mlmepriv, WIFI_MONITOR_STATE) 
+ #ifdef RTW_SIMPLE_CONFIG
+-		|| (check_fwstate(mlmepriv, WIFI_AP_STATE) && padapter->rtw_simple_config == _TRUE && IS_MCAST(get_ra(ptr)))
++		|| (check_fwstate(mlmepriv, WIFI_AP_STATE) && padapter->rtw_simple_config == _TRUE && IS_MCAST(rtl_get_ra(ptr)))
+ #endif
+ 		) {
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 24))
+@@ -4419,7 +4419,7 @@ void rx_query_phy_status(
+ 	wlanhdr = get_recvframe_data(precvframe);
+ 
+ 	ta = get_ta(wlanhdr);
+-	ra = get_ra(wlanhdr);
++	ra = rtl_get_ra(wlanhdr);
+ 	is_ra_bmc = IS_MCAST(ra);
+ 
+ 	if (_rtw_memcmp(adapter_mac_addr(padapter), ta, ETH_ALEN) == _TRUE) {
+@@ -4567,7 +4567,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
+ {
+ 	s32 ret = _SUCCESS;
+ 	u8 *pbuf = precvframe->u.hdr.rx_data;
+-	u8 *ra = get_ra(pbuf);
++	u8 *ra = rtl_get_ra(pbuf);
+ 	u8 ra_is_bmc = IS_MCAST(ra);
+ 	bool phy_queried = 0;
+ 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
+diff --git a/hal/hal_com.c b/hal/hal_com.c
+index a0f1595..42ef910 100644
+--- a/hal/hal_com.c
++++ b/hal/hal_com.c
+@@ -14286,7 +14286,7 @@ void rtw_store_phy_info(_adapter *padapter, union recv_frame *prframe)
+ 
+ 			/*RTW_INFO("=>%s WIFI_DATA_TYPE or WIFI_QOS_DATA_TYPE\n", __FUNCTION__);*/
+ 			if (psta) {
+-				if (IS_MCAST(get_ra(get_recvframe_data(prframe))))
++				if (IS_MCAST(rtl_get_ra(get_recvframe_data(prframe))))
+ 					psta_dframe_info = &psta->sta_dframe_info_bmc;
+ 				else
+ 					psta_dframe_info = &psta->sta_dframe_info;
+diff --git a/include/wifi.h b/include/wifi.h
+index d07b349..ce5990b 100755
+--- a/include/wifi.h
++++ b/include/wifi.h
+@@ -463,7 +463,7 @@ __inline static int IS_MCAST(const u8 *da)
+ 		return _FALSE;
+ }
+ 
+-__inline static unsigned char *get_ra(unsigned char *pframe)
++__inline static unsigned char *rtl_get_ra(unsigned char *pframe)
+ {
+ 	unsigned char	*ra;
+ 	ra = GetAddr1Ptr(pframe);
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 7e7849c..47a0903 100755
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -7074,7 +7074,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
+ indicate:
+ #endif
+ 	#if defined(RTW_DEDICATED_P2P_DEVICE)
+-	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), get_ra(frame), &wdev))
++	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), rtl_get_ra(frame), &wdev))
+ 		if (0)
+ 			RTW_INFO("redirect to pd_wdev:%p\n", wdev);
+ 	#endif
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
