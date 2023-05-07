Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2376C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9216A4053C;
	Sun,  7 May 2023 12:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9216A4053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7bmRYxtFHMK; Sun,  7 May 2023 12:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79E42404FE;
	Sun,  7 May 2023 12:45:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79E42404FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7E611BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCAFC410E7
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:45:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCAFC410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdmqWphLB-iN for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:45:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64264410E6
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64264410E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5201285F52; Sun,  7 May 2023 12:45:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 14:44:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f89b988d33c9bd65ab33023fafab80b69d767656
X-Git-Newrev: 8d6ddb7a290545dff5b9f07d042bd7512d258882
X-Patchwork-Hint: ignore
Message-Id: <20230507124548.5201285F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8812-aircrack-ng: bump to
 2023-05-01 version to fix build failure with Linux 6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d6ddb7a290545dff5b9f07d042bd7512d258882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@aperture.us>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Fix-build-failure-on-PowerPC64.patch      | 114 ---------------------
 .../rtl8812au-aircrack-ng.hash                     |   2 +-
 .../rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk |   2 +-
 3 files changed, 2 insertions(+), 116 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch b/package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch
deleted file mode 100644
index 488c21a4fc..0000000000
--- a/package/rtl8812au-aircrack-ng/0001-Fix-build-failure-on-PowerPC64.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From d78bda8e60ad6382c1e5832d83d8e40c923628fa Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 14 Mar 2023 13:21:11 +0100
-Subject: [PATCH] Fix build failure on PowerPC64
-
-get_ra() is defined in Linux kernel for PowerPC64 architecture and it
-conflicts with local get_ra() definition so let's rename local definition
-as rtl_get_ra().
-
-[Upstream status: https://github.com/aircrack-ng/rtl8812au/pull/1054]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- core/rtw_odm.c                | 6 +++---
- core/rtw_recv.c               | 4 ++--
- hal/hal_com.c                 | 2 +-
- include/wifi.h                | 2 +-
- os_dep/linux/ioctl_cfg80211.c | 2 +-
- 5 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/core/rtw_odm.c b/core/rtw_odm.c
-index 7204181..a9a7604 100644
---- a/core/rtw_odm.c
-+++ b/core/rtw_odm.c
-@@ -273,7 +273,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
- 				);
-@@ -389,7 +389,7 @@ type1_end:
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
- 					, pkt_cch, pkt_bw
-@@ -407,7 +407,7 @@ type1_end:
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
- 				);
-diff --git a/core/rtw_recv.c b/core/rtw_recv.c
-index ffd1ff9..05bede9 100644
---- a/core/rtw_recv.c
-+++ b/core/rtw_recv.c
-@@ -4851,7 +4851,7 @@ void rx_query_phy_status(
- 	wlanhdr = get_recvframe_data(precvframe);
- 
- 	ta = get_ta(wlanhdr);
--	ra = get_ra(wlanhdr);
-+	ra = rtl_get_ra(wlanhdr);
- 	is_ra_bmc = IS_MCAST(ra);
- 
- 	if (_rtw_memcmp(adapter_mac_addr(padapter), ta, ETH_ALEN) == _TRUE) {
-@@ -4991,7 +4991,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
- {
- 	s32 ret = _SUCCESS;
- 	u8 *pbuf = precvframe->u.hdr.rx_data;
--	u8 *pda = get_ra(pbuf);
-+	u8 *pda = rtl_get_ra(pbuf);
- 	u8 ra_is_bmc = IS_MCAST(pda);
- 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
- #ifdef CONFIG_CONCURRENT_MODE
-diff --git a/hal/hal_com.c b/hal/hal_com.c
-index dcf8edf..07b8a5e 100644
---- a/hal/hal_com.c
-+++ b/hal/hal_com.c
-@@ -12569,7 +12569,7 @@ void rtw_store_phy_info(_adapter *padapter, union recv_frame *prframe)
- 
- 			/*RTW_INFO("=>%s WIFI_DATA_TYPE or WIFI_QOS_DATA_TYPE\n", __FUNCTION__);*/
- 			if (psta) {
--				if (IS_MCAST(get_ra(get_recvframe_data(prframe))))
-+				if (IS_MCAST(rtl_get_ra(get_recvframe_data(prframe))))
- 					psta_dframe_info = &psta->sta_dframe_info_bmc;
- 				else
- 					psta_dframe_info = &psta->sta_dframe_info;
-diff --git a/include/wifi.h b/include/wifi.h
-index f071dd0..b349bb9 100644
---- a/include/wifi.h
-+++ b/include/wifi.h
-@@ -454,7 +454,7 @@ __inline static int IS_MCAST(const u8 *da)
- 		return _FALSE;
- }
- 
--__inline static unsigned char *get_ra(unsigned char *pframe)
-+__inline static unsigned char *rtl_get_ra(unsigned char *pframe)
- {
- 	unsigned char	*ra;
- 	ra = GetAddr1Ptr(pframe);
-diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
-index 03f6240..a54125a 100644
---- a/os_dep/linux/ioctl_cfg80211.c
-+++ b/os_dep/linux/ioctl_cfg80211.c
-@@ -6468,7 +6468,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
- 
- indicate:
- 	#if defined(RTW_DEDICATED_P2P_DEVICE)
--	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), get_ra(frame), &wdev))
-+	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), rtl_get_ra(frame), &wdev))
- 		if (0)
- 			RTW_INFO("redirect to pd_wdev:%p\n", wdev);
- 	#endif
--- 
-2.34.1
-
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index cdf5f3b4e2..ed75b09816 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  69891a35724a6c30fcb29d9eba783879e0bee3f5f7847341fce06101a7542f5f  rtl8812au-aircrack-ng-d98018d038a5db96066e79f26ed4a72f2fe1774e.tar.gz
+sha256  3545efb56ecba757e1e27a5479653835e3f5be4f5b49eb9e1e4ff87cbeb6e783  rtl8812au-aircrack-ng-35308f4dd73e77fa572c48867cce737449dd8548.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index ab3ebe2077..a666757449 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = d98018d038a5db96066e79f26ed4a72f2fe1774e
+RTL8812AU_AIRCRACK_NG_VERSION = 35308f4dd73e77fa572c48867cce737449dd8548
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
