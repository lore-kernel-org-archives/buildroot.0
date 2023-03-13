Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFF7C6FD19
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 18:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43585410C3;
	Mon, 13 Mar 2023 18:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43585410C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id erKfq70CGr1Z; Mon, 13 Mar 2023 18:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1FE441527;
	Mon, 13 Mar 2023 18:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1FE441527
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 469461BF384
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D52F408E0
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:03:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D52F408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JkZDufEh0hVh for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 18:03:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 529B5405B7
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 529B5405B7
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 18:03:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.142.131])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmWIpReNimSJabmWIpeh70; Mon, 13 Mar 2023 19:03:38 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 19:03:32 +0100
Message-Id: <20230313180332.1003747-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKL3pxvxVq49U+yzN907LnkyP4eAM60LgBbxDcMFZeyk35WfeZVJApw7xR5yQtIiDfrPVMeoPq33+FgGzhvWBiZKQ/ZeQGTLQ0GUoLD6osTSjCTC6M4l
 WvUKKPcb3mm+yW+FU+he5KQAOFkyu7lpEIRPAsNXznzfjcIcfFLqj4N7Qt8Zyhzx0fUhEiP430Qg0N48WV6oA3xSbhJ5gTotMDDqBwwqPpETj+SYNuINQtj2
 8HcKwgxmz/Vwza3VBDAPIii7wEy8frr2itMlCd+8PEV4E9sb2Oovid/toSXssMiV2Od0quj5SJPcV1XxwHYvSA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678730618; bh=kjPDoSGhAbDoJnB5Y48GP2YoQsNTMxRSq1BJSXAp1Ng=;
 h=From:To:Subject:Date:MIME-Version;
 b=EW3r+4f2UiXafYDjrDd5rQOdyaFQtCbl4XQgIapC3pKVggvBFGb8CB+gLuJIwSMCu
 UUpLlldJtTphvCZyXtOx37vo17zHTMBoSxAVyULfyiXrJL0HOgySAG2euBhqzocNv6
 N7Me0o2qJAXFj1JAUgbyalvv1EFtM7HKsKX3TWDXNo3DWXDgQ+Zk/Uunp0oJNCs2DU
 SrF6SZjvoAoLALPmZ6xuc6woSwdzvR464Dkq+u9rD9C/EoCFCYZ5UtiE9hIqMWjjad
 Y9GfsmGTtuCQuh9dX4tSgvYnBFL4d9RrQTexSknnMDKByYQoeHb4z+b2ih/bwYZ912
 NqE1QnYDhdHUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EW3r+4f2
Subject: [Buildroot] [PATCH] package/rtl8189es: bump to version 2023-03-13
 on master branch
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's drop local patch that has been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-failure-on-PowerPC64.patch | 113 ------------------
 package/rtl8189es/rtl8189es.hash              |   2 +-
 package/rtl8189es/rtl8189es.mk                |   2 +-
 3 files changed, 2 insertions(+), 115 deletions(-)
 delete mode 100644 package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch

diff --git a/package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch b/package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch
deleted file mode 100644
index 8c876f16ee..0000000000
--- a/package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From c7bf7590bc0d7252005fd0496898ad420a85e1ae Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 27 Feb 2023 09:12:39 +0100
-Subject: [PATCH] Fix build failure on PowerPC64
-
-get_ra() is defined in Linux kernel for PowerPC64 architecture and it
-conflicts with local get_ra() definition so let's rename local definition
-as rtl_get_ra().
-
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
-index 8a35816..d74e134 100644
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
-@@ -383,7 +383,7 @@ type1_end:
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
- 					, pkt_cch, pkt_bw
-@@ -401,7 +401,7 @@ type1_end:
- 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
- 					, *phys & 0xf
- 					, MAC_ARG(get_ta(wlanhdr))
--					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
-+					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
- 					, HDATA_RATE(attrib->data_rate)
- 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
- 				);
-diff --git a/core/rtw_recv.c b/core/rtw_recv.c
-index dc65adf..a5a65f9 100644
---- a/core/rtw_recv.c
-+++ b/core/rtw_recv.c
-@@ -4678,7 +4678,7 @@ void rx_query_phy_status(
- 	wlanhdr = get_recvframe_data(precvframe);
- 
- 	ta = get_ta(wlanhdr);
--	ra = get_ra(wlanhdr);
-+	ra = rtl_get_ra(wlanhdr);
- 	is_ra_bmc = IS_MCAST(ra);
- 
- 	if (_rtw_memcmp(adapter_mac_addr(padapter), ta, ETH_ALEN) == _TRUE) {
-@@ -4818,7 +4818,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
- {
- 	s32 ret = _SUCCESS;
- 	u8 *pbuf = precvframe->u.hdr.rx_data;
--	u8 *pda = get_ra(pbuf);
-+	u8 *pda = rtl_get_ra(pbuf);
- 	u8 ra_is_bmc = IS_MCAST(pda);
- 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
- #ifdef CONFIG_CONCURRENT_MODE
-diff --git a/hal/hal_com.c b/hal/hal_com.c
-index c28ae39..27b0825 100644
---- a/hal/hal_com.c
-+++ b/hal/hal_com.c
-@@ -13406,7 +13406,7 @@ void rtw_store_phy_info(_adapter *padapter, union recv_frame *prframe)
- 
- 			/*RTW_INFO("=>%s WIFI_DATA_TYPE or WIFI_QOS_DATA_TYPE\n", __FUNCTION__);*/
- 			if (psta) {
--				if (IS_MCAST(get_ra(get_recvframe_data(prframe))))
-+				if (IS_MCAST(rtl_get_ra(get_recvframe_data(prframe))))
- 					psta_dframe_info = &psta->sta_dframe_info_bmc;
- 				else
- 					psta_dframe_info = &psta->sta_dframe_info;
-diff --git a/include/wifi.h b/include/wifi.h
-index def77a4..c2e7afb 100644
---- a/include/wifi.h
-+++ b/include/wifi.h
-@@ -456,7 +456,7 @@ __inline static int IS_MCAST(const u8 *da)
- 		return _FALSE;
- }
- 
--__inline static unsigned char *get_ra(unsigned char *pframe)
-+__inline static unsigned char *rtl_get_ra(unsigned char *pframe)
- {
- 	unsigned char	*ra;
- 	ra = GetAddr1Ptr(pframe);
-diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
-index 4e810e5..e744d69 100644
---- a/os_dep/linux/ioctl_cfg80211.c
-+++ b/os_dep/linux/ioctl_cfg80211.c
-@@ -6347,7 +6347,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
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
diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 44d73e60f0..5a2b6e65ab 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96347dbfedd95a217fb89b7b295fe417b711dbad3db896ef0c2fa733c6d150fd  rtl8189es-e58bd86c9d9408c648b1246a0dd76b16856ec172.tar.gz
+sha256  5bc1cf713c4bd9644139acf449d0a86187fd1d2b6e1e8c491a6bd604049cf4e1  rtl8189es-50107c4b9d9a6a478943db4ac3331740d347410b.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index c2ee77f922..afa9d95692 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = e58bd86c9d9408c648b1246a0dd76b16856ec172
+RTL8189ES_VERSION = 50107c4b9d9a6a478943db4ac3331740d347410b
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
