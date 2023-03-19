Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5430AC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3DEC81B70;
	Sun, 19 Mar 2023 17:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3DEC81B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wAmAajU_0K-q; Sun, 19 Mar 2023 17:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FBC381B23;
	Sun, 19 Mar 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FBC381B23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3369E1BF401
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 17:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B164403E5
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 17:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B164403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UABxaR6uUkkU for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 17:08:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D925C402F5
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 17:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D925C402F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5419874FB; Sun, 19 Mar 2023 17:08:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 18:07:36 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 18aa1e8959e3ca63e896e2d5ffad39545ce1b4ea
X-Git-Newrev: f9a4096917c1bb592036dda3eb383419af0aa96b
X-Patchwork-Hint: ignore
Message-Id: <20230319170803.C5419874FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/rtl8812au-aircrack-ng: fix build failure on PowerPC64
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f9a4096917c1bb592036dda3eb383419af0aa96b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Add local patch pending upstream[0] to fix build failure on PowerPC64 due
to conflicting get_ra().

Fixes:
http://autobuild.buildroot.net/results/8c5/8c51009fa32947b2c1cda8f9862507df8da126db//

[0]:
https://github.com/aircrack-ng/rtl8812au/pull/1054

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d3051892eba100441f6900b6b435ae935f103fff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-build-failure-on-PowerPC64.patch      | 114 +++++++++++++++++++++
 1 file changed, 114 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
