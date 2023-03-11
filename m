Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D790C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 19:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFE45405BC;
	Sat, 11 Mar 2023 19:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFE45405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxY-XKlIey4n; Sat, 11 Mar 2023 19:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B73BA404A8;
	Sat, 11 Mar 2023 19:02:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B73BA404A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 738AA1BF42C
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 19:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 469E060C2E
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 19:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 469E060C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddveDeWb5bJb for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 19:02:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D5B16076C
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D5B16076C
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 19:02:22 +0000 (UTC)
Received: from localhost.localdomain ([84.33.142.131])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b4U0pAX0pcONCb4U0puu4X; Sat, 11 Mar 2023 20:02:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 20:02:19 +0100
Message-Id: <20230311190219.841839-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBck/065nlqRYZtbbgT40RpwqFFRBY3FLEB3JhNfveQ6C2AvtiwHZ+GL1yb5vv0NgLBuMkLrJ55cXaUlMRL5y1v3JSstvNlzr4p5PJ1veUTys9ePlJgt
 7thdVLlRNJ7ewtDqYc5M9Myqpl4SBjHBO2ZedrJWySIgTdLqFyFYmLH7hWzKEKG/+izckCCICv8iQ0tDph7lpm8U0ODBr//vIlhRrxbRVQysYH2YH96PzxvX
 aq13amvhqHgjQqz7AiNKcUcYyTL8rnR+jeajtlvDluEVnasCfC/HF3C2wOaSg9aR/SwxY9l89XRJWuvPaDWf3w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678561340; bh=Ab3bcOqV88KHa7A8TEP2F2OJsa1JF5A6gfZHqWhW5+0=;
 h=From:To:Subject:Date:MIME-Version;
 b=RkYM1RcQCEJ9BuYcRYeLrDzw4mizY31jZXqqQlqC+nm69Az3uKvZFNVOwQ90YrZei
 nDkaFEV1zsfAIBYUrEnx9YZKqfmmzd5mQzk39AeK119uogzp2bE/iNrMQZLzQKfeHH
 bAejdYTTlvydtLiwrRvtd4QZIEQa28a5iuKkeuuZO5jRFL7mjfCGppXmO/hgKjjMmq
 lUSKsdl8sr7s5/liK5TJ0gK8O6mqJNBOZjZSKuhvuoBUbje+BWK07noNLlVhsHiXvr
 s4S8k1hUku3BRiTom5HxvcWoCG+NNn91FJxRjVmcKCmvGnjYxVe1wq+HzcxBA3/HTL
 MeJEPj3UAJ5Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=RkYM1RcQ
Subject: [Buildroot] [PATCH] package/rtl8192eu: fix build failure on PowerPC
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream[0] to fix build failure for conflicting
get_ra() on PowerPC architecture.

Fixes:
http://autobuild.buildroot.net/results/b248203c7affe183dd297075a540389a82cdae8f

[0]: package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...02-Fix-conflicting-get_ra-on-PowerPC.patch | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch

diff --git a/package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch b/package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch
new file mode 100644
index 0000000000..dbc4ddd2e8
--- /dev/null
+++ b/package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch
@@ -0,0 +1,124 @@
+From 4a7e9c3c02a759d818a68c5d23ad7623d8b82ee6 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 11 Mar 2023 19:26:32 +0100
+Subject: [PATCH] Fix conflicting get_ra() on PowerPC
+
+In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
+that has a completely different purpose. So let's rename local get_ra()
+to rtl_get_ra() to make it different from Linux's get_ra().
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm/disassemble.h?h=v6.1-rc7#n49
+
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
+index 750598c..18e0222 100644
+--- a/core/rtw_odm.c
++++ b/core/rtw_odm.c
+@@ -258,7 +258,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
+ 				);
+@@ -368,7 +368,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
+ 					, pkt_cch, pkt_bw
+@@ -386,7 +386,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
+ 				);
+diff --git a/core/rtw_recv.c b/core/rtw_recv.c
+index 63ecbc6..d52a7bb 100755
+--- a/core/rtw_recv.c
++++ b/core/rtw_recv.c
+@@ -4245,7 +4245,7 @@ int recv_func(_adapter *padapter, union recv_frame *rframe)
+ 
+ 	if (check_fwstate(mlmepriv, WIFI_MONITOR_STATE) 
+ #ifdef RTW_SIMPLE_CONFIG
+-		|| (check_fwstate(mlmepriv, WIFI_AP_STATE) && padapter->rtw_simple_config == _TRUE && IS_MCAST(get_ra(ptr)))
++		|| (check_fwstate(mlmepriv, WIFI_AP_STATE) && padapter->rtw_simple_config == _TRUE && IS_MCAST(rtl_get_ra(ptr)))
+ #endif
+ 		) {
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 24))
+@@ -4598,7 +4598,7 @@ void rx_query_phy_status(
+ 	wlanhdr = get_recvframe_data(precvframe);
+ 
+ 	ta = get_ta(wlanhdr);
+-	ra = get_ra(wlanhdr);
++	ra = rtl_get_ra(wlanhdr);
+ 	is_ra_bmc = IS_MCAST(ra);
+ 
+ 	if (_rtw_memcmp(adapter_mac_addr(padapter), ta, ETH_ALEN) == _TRUE) {
+@@ -4746,7 +4746,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
+ {
+ 	s32 ret = _SUCCESS;
+ 	u8 *pbuf = precvframe->u.hdr.rx_data;
+-	u8 *ra = get_ra(pbuf);
++	u8 *ra = rtl_get_ra(pbuf);
+ 	u8 ra_is_bmc = IS_MCAST(ra);
+ 	bool phy_queried = 0;
+ 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
+diff --git a/hal/hal_com.c b/hal/hal_com.c
+index 96c7ade..fe5b156 100755
+--- a/hal/hal_com.c
++++ b/hal/hal_com.c
+@@ -13590,7 +13590,7 @@ void rtw_store_phy_info(_adapter *padapter, union recv_frame *prframe)
+ 
+ 			/*RTW_INFO("=>%s WIFI_DATA_TYPE or WIFI_QOS_DATA_TYPE\n", __FUNCTION__);*/
+ 			if (psta) {
+-				if (IS_MCAST(get_ra(get_recvframe_data(prframe))))
++				if (IS_MCAST(rtl_get_ra(get_recvframe_data(prframe))))
+ 					psta_dframe_info = &psta->sta_dframe_info_bmc;
+ 				else
+ 					psta_dframe_info = &psta->sta_dframe_info;
+diff --git a/include/wifi.h b/include/wifi.h
+index 322cfba..dd289f2 100644
+--- a/include/wifi.h
++++ b/include/wifi.h
+@@ -459,7 +459,7 @@ __inline static int IS_MCAST(const u8 *da)
+ 		return _FALSE;
+ }
+ 
+-__inline static unsigned char *get_ra(unsigned char *pframe)
++__inline static unsigned char *rtl_get_ra(unsigned char *pframe)
+ {
+ 	unsigned char	*ra;
+ 	ra = GetAddr1Ptr(pframe);
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 942971f..f36c77a 100755
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -7076,7 +7076,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
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
