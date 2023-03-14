Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9739BC6FD1D
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 13:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 235896108A;
	Tue, 14 Mar 2023 13:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 235896108A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gznB2k49ZBhg; Tue, 14 Mar 2023 13:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530F161094;
	Tue, 14 Mar 2023 13:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 530F161094
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE7221BF329
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:06:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C57DC418D9
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 13:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C57DC418D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AbqxWWYkr6fu for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 13:06:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47A93415DD
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47A93415DD
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 13:06:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.142.131])
 by Aruba Outgoing Smtp  with ESMTPSA
 id c4LxpI1AzcQY3c4LxplEkP; Tue, 14 Mar 2023 14:06:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 14 Mar 2023 14:06:08 +0100
Message-Id: <20230314130608.2876389-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL6aQv6fVKTt+VB+GbVf7p/KoCO5BEXwmE2ts1j3wRYbp3krX5L9W0RJE5vIN6tlzbWhaONTzfrL+pYD0ZP581s/snGCCyKiC8yUfE6SIPh9NsT8UF5h
 8XuHKG8KaEaoa1oxI5r6dwSsCiXlUbSf7XuQJSMZuI7sxUn0JwLwJhHpDRmgWapxGYLKTXRVhFMpAghw4WHGBtArErPRVtQ/4GXzyj5qdk8Lr1YTjJK3J3xR
 kUsPO6vkYb6xi7dLCWFisdmI6lMgbMOg0amCRZl4R+ydCc7Fu/IbsilWdxitx3A3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678799169; bh=0bPn7t7I01t72ZI2cLqNwwxET3fKTbSaueER0HsLoBk=;
 h=From:To:Subject:Date:MIME-Version;
 b=CZDeGhqE1+XUKyj29yHtZ0qkhH5Oknjp8jPrDcz/UYokesYjt1Y20ypGFRC6gwapN
 VOCEzWslinBkRcWnWxVqW2uhmNX/Y3WL2wes6YBwPy6j2Ofg86krwLE+hU2Guw4Pd2
 THoUQf7ouJpkgkO77IsRKppEwAGtVb5mOMGSgG9Nnk6cFvYUs2iXq6aiyAQf8Q8DTT
 Vwe/neqBpohokJfnsAwu/0znDmxKiySo5DahKTNdo5QWbDsn92ofLwrHkIKhMssdaJ
 9ryJhgYEXCiNlhVuN+OCoysWfGLIFyOSDqLyQ4105Bbe33b8KSljcAJxoJS9rk35PH
 91ZM/NeKt0avg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CZDeGhqE
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure on PowerPC64
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

Add local patch pending upstream[0] to fix build failure on PowerPC64 due
to conflicting get_ra().

Fixes:
http://autobuild.buildroot.net/results/8c5/8c51009fa32947b2c1cda8f9862507df8da126db//

[0]:
https://github.com/aircrack-ng/rtl8812au/pull/1054

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-failure-on-PowerPC64.patch | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch

diff --git a/package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch b/package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch
new file mode 100644
index 0000000000..488c21a4fc
--- /dev/null
+++ b/package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch
@@ -0,0 +1,114 @@
+From d78bda8e60ad6382c1e5832d83d8e40c923628fa Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 14 Mar 2023 13:21:11 +0100
+Subject: [PATCH] Fix build failure on PowerPC64
+
+get_ra() is defined in Linux kernel for PowerPC64 architecture and it
+conflicts with local get_ra() definition so let's rename local definition
+as rtl_get_ra().
+
+[Upstream status: https://github.com/aircrack-ng/rtl8812au/pull/1054]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ core/rtw_odm.c                | 6 +++---
+ core/rtw_recv.c               | 4 ++--
+ hal/hal_com.c                 | 2 +-
+ include/wifi.h                | 2 +-
+ os_dep/linux/ioctl_cfg80211.c | 2 +-
+ 5 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/core/rtw_odm.c b/core/rtw_odm.c
+index 7204181..a9a7604 100644
+--- a/core/rtw_odm.c
++++ b/core/rtw_odm.c
+@@ -273,7 +273,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
+ 				);
+@@ -389,7 +389,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
+ 					, pkt_cch, pkt_bw
+@@ -407,7 +407,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
+ 				);
+diff --git a/core/rtw_recv.c b/core/rtw_recv.c
+index ffd1ff9..05bede9 100644
+--- a/core/rtw_recv.c
++++ b/core/rtw_recv.c
+@@ -4851,7 +4851,7 @@ void rx_query_phy_status(
+ 	wlanhdr = get_recvframe_data(precvframe);
+ 
+ 	ta = get_ta(wlanhdr);
+-	ra = get_ra(wlanhdr);
++	ra = rtl_get_ra(wlanhdr);
+ 	is_ra_bmc = IS_MCAST(ra);
+ 
+ 	if (_rtw_memcmp(adapter_mac_addr(padapter), ta, ETH_ALEN) == _TRUE) {
+@@ -4991,7 +4991,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
+ {
+ 	s32 ret = _SUCCESS;
+ 	u8 *pbuf = precvframe->u.hdr.rx_data;
+-	u8 *pda = get_ra(pbuf);
++	u8 *pda = rtl_get_ra(pbuf);
+ 	u8 ra_is_bmc = IS_MCAST(pda);
+ 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
+ #ifdef CONFIG_CONCURRENT_MODE
+diff --git a/hal/hal_com.c b/hal/hal_com.c
+index dcf8edf..07b8a5e 100644
+--- a/hal/hal_com.c
++++ b/hal/hal_com.c
+@@ -12569,7 +12569,7 @@ void rtw_store_phy_info(_adapter *padapter, union recv_frame *prframe)
+ 
+ 			/*RTW_INFO("=>%s WIFI_DATA_TYPE or WIFI_QOS_DATA_TYPE\n", __FUNCTION__);*/
+ 			if (psta) {
+-				if (IS_MCAST(get_ra(get_recvframe_data(prframe))))
++				if (IS_MCAST(rtl_get_ra(get_recvframe_data(prframe))))
+ 					psta_dframe_info = &psta->sta_dframe_info_bmc;
+ 				else
+ 					psta_dframe_info = &psta->sta_dframe_info;
+diff --git a/include/wifi.h b/include/wifi.h
+index f071dd0..b349bb9 100644
+--- a/include/wifi.h
++++ b/include/wifi.h
+@@ -454,7 +454,7 @@ __inline static int IS_MCAST(const u8 *da)
+ 		return _FALSE;
+ }
+ 
+-__inline static unsigned char *get_ra(unsigned char *pframe)
++__inline static unsigned char *rtl_get_ra(unsigned char *pframe)
+ {
+ 	unsigned char	*ra;
+ 	ra = GetAddr1Ptr(pframe);
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 03f6240..a54125a 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -6468,7 +6468,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
+ 
+ indicate:
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
