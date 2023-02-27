Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3268BC7EE30
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 08:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9268481D46;
	Mon, 27 Feb 2023 08:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9268481D46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtxZ1LwBrOXt; Mon, 27 Feb 2023 08:29:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A5D81CAF;
	Mon, 27 Feb 2023 08:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A5D81CAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDF5B1BF36C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B560E40217
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 08:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B560E40217
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mtn4Tp-1uhMb for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 08:29:40 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C30C940150
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C30C940150
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 08:29:39 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id WYmFp4RlamyZEWYmFpyNHT; Mon, 27 Feb 2023 09:22:31 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 09:22:30 +0100
Message-Id: <20230227082230.429997-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGDsEPssC4rRW1RiNv65EegxblPe1KGNIl+s2uLpoxKHowgY2Bp+jSgLJJDBc4Eti0IsDspyRorBLdyThi9LW86ZEwezE7PcDvLiK+cnrZfs8Rlg16Cf
 8mnKGXf+oHf0nNv4ljimD9aUl1nCb806NP05AaEMjxVkav8u4cSAiZgbvyHz8Uz13DRvAyaicfZrBK1DM9YhlCow3ej4f7CL+xmN8N2K3t4Ry33CbbLbnhoh
 y6O8G6kjqcT393hxCD07b1nmzAPaS9CVpPiflls9IuTHrQPZ5LeChpfA3SbqnJ7rF/KOMoOvt0vjvFiss3+T5g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677486151; bh=ZqMkY4lqz+V6wMQbfPBn1M9aUuwFPR6Bs/7+I0IVPXM=;
 h=From:To:Subject:Date:MIME-Version;
 b=SyIhfE+Mj6k80+ZoTEqClBN9+DPh891xDGFVyGBvYbYWFDFURFP3B03j/HntinBHB
 XagVTufg+f9YsnxUR4ngaKNpF4SM4So0sGyKoLnkwjhow8nNgvFpj7jObw587PkIx8
 4CUENzZGzi7CRj3Li5MQI6Jl9eV9XmsPglkDktWGm98Ek0VKEINbRYYl6bRx2eUHkK
 IZv+EoxG0782MA9mII78FEc+NDHTM27jg6eYpUIMt6Rd4yz5D5poxluztrjx7PngF+
 t5cDkA6pgBCHK3ws24KgUd/fo4t9sAM/ioRgI0Ftgr88dOI7ua/DYv61rkbNXC/H5Q
 IrRtGVluWYb1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=SyIhfE+M
Subject: [Buildroot] [PATCH] package/rtl8189es: fix build failure on
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patches pending upstream[0] to fix conflict of get_ra().
get_ra() is present both in PowerPC64 Linux header and in rtl8189es driver
so in the patch we rename all the occurences to rtl_get_ra().

Fixes:
http://autobuild.buildroot.net/results/45efdb0806d0bb2f7d542be80ed02bf2dc080df4/

[0]: https://github.com/jwrdegoede/rtl8189ES_linux/pull/94

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-build-failure-on-PowerPC64.patch | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch

diff --git a/package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch b/package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch
new file mode 100644
index 0000000000..8c876f16ee
--- /dev/null
+++ b/package/rtl8189es/0001-Fix-build-failure-on-PowerPC64.patch
@@ -0,0 +1,113 @@
+From c7bf7590bc0d7252005fd0496898ad420a85e1ae Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 27 Feb 2023 09:12:39 +0100
+Subject: [PATCH] Fix build failure on PowerPC64
+
+get_ra() is defined in Linux kernel for PowerPC64 architecture and it
+conflicts with local get_ra() definition so let's rename local definition
+as rtl_get_ra().
+
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
+index 8a35816..d74e134 100644
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
+@@ -383,7 +383,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
+ 					, pkt_cch, pkt_bw
+@@ -401,7 +401,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(rtl_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(rtl_get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
+ 				);
+diff --git a/core/rtw_recv.c b/core/rtw_recv.c
+index dc65adf..a5a65f9 100644
+--- a/core/rtw_recv.c
++++ b/core/rtw_recv.c
+@@ -4678,7 +4678,7 @@ void rx_query_phy_status(
+ 	wlanhdr = get_recvframe_data(precvframe);
+ 
+ 	ta = get_ta(wlanhdr);
+-	ra = get_ra(wlanhdr);
++	ra = rtl_get_ra(wlanhdr);
+ 	is_ra_bmc = IS_MCAST(ra);
+ 
+ 	if (_rtw_memcmp(adapter_mac_addr(padapter), ta, ETH_ALEN) == _TRUE) {
+@@ -4818,7 +4818,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
+ {
+ 	s32 ret = _SUCCESS;
+ 	u8 *pbuf = precvframe->u.hdr.rx_data;
+-	u8 *pda = get_ra(pbuf);
++	u8 *pda = rtl_get_ra(pbuf);
+ 	u8 ra_is_bmc = IS_MCAST(pda);
+ 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
+ #ifdef CONFIG_CONCURRENT_MODE
+diff --git a/hal/hal_com.c b/hal/hal_com.c
+index c28ae39..27b0825 100644
+--- a/hal/hal_com.c
++++ b/hal/hal_com.c
+@@ -13406,7 +13406,7 @@ void rtw_store_phy_info(_adapter *padapter, union recv_frame *prframe)
+ 
+ 			/*RTW_INFO("=>%s WIFI_DATA_TYPE or WIFI_QOS_DATA_TYPE\n", __FUNCTION__);*/
+ 			if (psta) {
+-				if (IS_MCAST(get_ra(get_recvframe_data(prframe))))
++				if (IS_MCAST(rtl_get_ra(get_recvframe_data(prframe))))
+ 					psta_dframe_info = &psta->sta_dframe_info_bmc;
+ 				else
+ 					psta_dframe_info = &psta->sta_dframe_info;
+diff --git a/include/wifi.h b/include/wifi.h
+index def77a4..c2e7afb 100644
+--- a/include/wifi.h
++++ b/include/wifi.h
+@@ -456,7 +456,7 @@ __inline static int IS_MCAST(const u8 *da)
+ 		return _FALSE;
+ }
+ 
+-__inline static unsigned char *get_ra(unsigned char *pframe)
++__inline static unsigned char *rtl_get_ra(unsigned char *pframe)
+ {
+ 	unsigned char	*ra;
+ 	ra = GetAddr1Ptr(pframe);
+diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
+index 4e810e5..e744d69 100644
+--- a/os_dep/linux/ioctl_cfg80211.c
++++ b/os_dep/linux/ioctl_cfg80211.c
+@@ -6347,7 +6347,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
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
