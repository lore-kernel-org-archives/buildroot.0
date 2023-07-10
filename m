Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E019DEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 17:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E031818C9;
	Mon, 10 Jul 2023 17:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E031818C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7Mf6kPO0JSH; Mon, 10 Jul 2023 17:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CF581491;
	Mon, 10 Jul 2023 17:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89CF581491
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CD551BF3D4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 435D280AA6
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 17:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 435D280AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PscqGpmPdyQm for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 17:29:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 170A081491
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 17:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 170A081491
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0344C86BAF; Mon, 10 Jul 2023 17:29:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 19:29:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9206caf13ec38841d93c7b8434fcc3668dffbc36
X-Git-Newrev: f12f54998a70cf30323b9eda9ea9cc95453d11d6
X-Patchwork-Hint: ignore
Message-Id: <20230710172942.0344C86BAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8192eu: bump to version
 2023-06-23 on branch 5.11.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f12f54998a70cf30323b9eda9ea9cc95453d11d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop local patch that has been upstreamed.
It now supports building with Linux version > 6.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-Fix-conflicting-get_ra-on-PowerPC.patch   | 124 ---------------------
 package/rtl8192eu/rtl8192eu.hash                   |   2 +-
 package/rtl8192eu/rtl8192eu.mk                     |   2 +-
 3 files changed, 2 insertions(+), 126 deletions(-)

diff --git a/package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch b/package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch
deleted file mode 100644
index dbc4ddd2e8..0000000000
--- a/package/rtl8192eu/0002-Fix-conflicting-get_ra-on-PowerPC.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From 4a7e9c3c02a759d818a68c5d23ad7623d8b82ee6 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sat, 11 Mar 2023 19:26:32 +0100
-Subject: [PATCH] Fix conflicting get_ra() on PowerPC
-
-In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
-that has a completely different purpose. So let's rename local get_ra()
-to rtl_get_ra() to make it different from Linux's get_ra().
-
-[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm/disassemble.h?h=v6.1-rc7#n49
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- core/rtw_odm.c                | 6 +++---
- core/rtw_recv.c               | 6 +++---
- hal/hal_com.c                 | 2 +-
- include/wifi.h                | 2 +-
- os_dep/linux/ioctl_cfg80211.c | 2 +-
- 5 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/core/rtw_odm.c b/core/rtw_odm.c
-index 750598c..18e0222 100644
---- a/core/rtw_odm.c
-+++ b/core/rtw_odm.c
-@@ -258,7 +258,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
- 				);
-@@ -368,7 +368,7 @@ type1_end:
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
- 					, pkt_cch, pkt_bw
-@@ -386,7 +386,7 @@ type1_end:
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
- 				);
-diff --git a/core/rtw_recv.c b/core/rtw_recv.c
-index 63ecbc6..d52a7bb 100755
---- a/core/rtw_recv.c
-+++ b/core/rtw_recv.c
-@@ -4245,7 +4245,7 @@ int recv_func(_adapter *padapter, union recv_frame *rframe)
- 
- 	if (check_fwstate(mlmepriv, WIFI_MONITOR_STATE) 
- #ifdef RTW_SIMPLE_CONFIG
--		|| (check_fwstate(mlmepriv, WIFI_AP_STATE) && padapter->rtw_simple_config == _TRUE && IS_MCAST(get_ra(ptr)))
-+		|| (check_fwstate(mlmepriv, WIFI_AP_STATE) && padapter->rtw_simple_config == _TRUE && IS_MCAST(rtl_get_ra(ptr)))
- #endif
- 		) {
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 24))
-@@ -4598,7 +4598,7 @@ void rx_query_phy_status(
- 	wlanhdr = get_recvframe_data(precvframe);
- 
- 	ta = get_ta(wlanhdr);
--	ra = get_ra(wlanhdr);
-+	ra = rtl_get_ra(wlanhdr);
- 	is_ra_bmc = IS_MCAST(ra);
- 
- 	if (_rtw_memcmp(adapter_mac_addr(padapter), ta, ETH_ALEN) == _TRUE) {
-@@ -4746,7 +4746,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
- {
- 	s32 ret = _SUCCESS;
- 	u8 *pbuf = precvframe->u.hdr.rx_data;
--	u8 *ra = get_ra(pbuf);
-+	u8 *ra = rtl_get_ra(pbuf);
- 	u8 ra_is_bmc = IS_MCAST(ra);
- 	bool phy_queried = 0;
- 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
-diff --git a/hal/hal_com.c b/hal/hal_com.c
-index 96c7ade..fe5b156 100755
---- a/hal/hal_com.c
-+++ b/hal/hal_com.c
-@@ -13590,7 +13590,7 @@ void rtw_store_phy_info(_adapter *padapter, union recv_frame *prframe)
- 
- 			/*RTW_INFO("=>%s WIFI_DATA_TYPE or WIFI_QOS_DATA_TYPE\n", __FUNCTION__);*/
- 			if (psta) {
--				if (IS_MCAST(get_ra(get_recvframe_data(prframe))))
-+				if (IS_MCAST(rtl_get_ra(get_recvframe_data(prframe))))
- 					psta_dframe_info = &psta->sta_dframe_info_bmc;
- 				else
- 					psta_dframe_info = &psta->sta_dframe_info;
-diff --git a/include/wifi.h b/include/wifi.h
-index 322cfba..dd289f2 100644
---- a/include/wifi.h
-+++ b/include/wifi.h
-@@ -459,7 +459,7 @@ __inline static int IS_MCAST(const u8 *da)
- 		return _FALSE;
- }
- 
--__inline static unsigned char *get_ra(unsigned char *pframe)
-+__inline static unsigned char *rtl_get_ra(unsigned char *pframe)
- {
- 	unsigned char	*ra;
- 	ra = GetAddr1Ptr(pframe);
-diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
-index 942971f..f36c77a 100755
---- a/os_dep/linux/ioctl_cfg80211.c
-+++ b/os_dep/linux/ioctl_cfg80211.c
-@@ -7076,7 +7076,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
- indicate:
- #endif
- 	#if defined(RTW_DEDICATED_P2P_DEVICE)
--	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), get_ra(frame), &wdev))
-+	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), rtl_get_ra(frame), &wdev))
- 		if (0)
- 			RTW_INFO("redirect to pd_wdev:%p\n", wdev);
- 	#endif
--- 
-2.34.1
-
diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 2d6498f19d..8528689670 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  72d1d97c6d2038885e5666f3271609b4dcbe45633c19a5606dc59745ff8ab543  rtl8192eu-865656c3a1d1aee8c4ba459ce7608756d17c712f.tar.gz
+sha256  665a8f857b3881554edd6d5e5e6c8f058b8ecfecf921817993e861d48e214d36  rtl8192eu-ac8517206e14f70babbeed68e136ee23c85cba3d.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index da6fe42e99..9ae29d9940 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 865656c3a1d1aee8c4ba459ce7608756d17c712f
+RTL8192EU_VERSION = ac8517206e14f70babbeed68e136ee23c85cba3d
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
