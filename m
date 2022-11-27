Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD40C4332F
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC4D4401DD;
	Sun, 27 Nov 2022 13:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC4D4401DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hIMG1PHeYFmd; Sun, 27 Nov 2022 13:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D311540223;
	Sun, 27 Nov 2022 13:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D311540223
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C73A91BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B29181302
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B29181302
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_BQpIV3nbZD for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:28:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 396CB80C16
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396CB80C16
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:28:57 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id zHiKoO9lfS2o1zHiKo62pl; Sun, 27 Nov 2022 14:28:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 14:28:55 +0100
Message-Id: <20221127132855.510943-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAs4gLxBz3rYeS2Tkoj8w+jtRMzslkx11NueO2yX6MFF2OTb9Wqvxi9kfw4Z3osfmmZn0Tea0tpN1gs0Q1BEHRub8cLOgodsttZ4TRpIDReYU0WBmig6
 4JSfj220enIDT3pnkku07zS8yWZxBuj2voCWym+gsYcSuW8pFD63mEYGDoLWyCQf/z2vbUXlWKoj8YsbvTNB0LO0lYOUrGNjbbaTZ3Zn7iUUR6temz0CORBV
 mU8aWiBpixPRbfLCOYgKigqzHnIHX6NCSzpfDmLhzO0cO6ry6X/VzuTDEPDNgOY10XYOtZEIh/K9yM1+MR6UAw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669555736; bh=biK5toAA5wOYrFZvkgF2PKfTga/L63GxEbG+WcUgf80=;
 h=From:To:Subject:Date:MIME-Version;
 b=Uykpot4TZ0PI9HTmAbvwRVvdo1nNIRF2glzXb9W6LjuhpOWp2t3i2TpcySYHXBFhz
 8bmjeHTuU87kySAvMUKXC1k7FdaOX2mB9yh3+5x/xhFdzcib8Ex9MzK5jBnYx0kwBs
 iQ5tdk0udEG7aIC+oLaQtSftWXLaR4qcFrmjZf+wyLUYVy3xRqLX+kobSuaM/J6frc
 NWklCYEHxgtSbM/66stp6aZww3OO5jEDRyBOEYpmQj4a+38Vaxq7pBry5r+DKuPT+m
 5F6bKhXP0xKuqBn7bYpDO8fSjRxqZnC29d9ip4Ux4iltK/yvwP3zvS2E+BsGquot5j
 BPFBECcXGjdRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Uykpot4T
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure on PowerPC
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch(pending upstream[0]) to fix build failure with PowerPC due
to a package re-defition of get_ra() that is only defined in Linux PowerPC
implementation.

[0]: https://github.com/lwfinger/rtl8188eu/pull/432

Fixes:
http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...uild-failure-on-PowerPc-architecture.patch | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch

diff --git a/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
new file mode 100644
index 0000000000..b16a312c7e
--- /dev/null
+++ b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
@@ -0,0 +1,106 @@
+From 2a91a721d634a2eca131628b5c9c028af20037af Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 27 Nov 2022 14:20:43 +0100
+Subject: [PATCH] Fix build failure on PowerPc architecture
+
+In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
+that has a completely different purpose. So let's rename local get_ra()
+to wifi_get_ra() to make it different from Linux's get_ra().
+
+[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm
+
+Upstream: https://github.com/lwfinger/rtl8188eu/pull/432
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ ioctl_cfg80211.c | 2 +-
+ rtw_odm.c        | 6 +++---
+ rtw_recv.c       | 6 +++---
+ wifi.h           | 2 +-
+ 4 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
+index 0ea5460..af43097 100644
+--- a/ioctl_cfg80211.c
++++ b/ioctl_cfg80211.c
+@@ -4607,7 +4607,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
+ 
+ indicate:
+ 	#if defined(RTW_DEDICATED_P2P_DEVICE)
+-	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), get_ra(frame), &wdev))
++	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), wifi_get_ra(frame), &wdev))
+ 		if (0)
+ 			RTW_INFO("redirect to pd_wdev:%p\n", wdev);
+ 	#endif
+diff --git a/rtw_odm.c b/rtw_odm.c
+index 922a7b9..ad17080 100644
+--- a/rtw_odm.c
++++ b/rtw_odm.c
+@@ -283,7 +283,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
+ 				);
+@@ -399,7 +399,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
+ 					, pkt_cch, pkt_bw
+@@ -417,7 +417,7 @@ type1_end:
+ 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
+ 					, *phys & 0xf
+ 					, MAC_ARG(get_ta(wlanhdr))
+-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
+ 					, HDATA_RATE(attrib->data_rate)
+ 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
+ 				);
+diff --git a/rtw_recv.c b/rtw_recv.c
+index 9439415..24eb9e9 100755
+--- a/rtw_recv.c
++++ b/rtw_recv.c
+@@ -4040,10 +4040,10 @@ void rx_query_phy_status(
+ 		&& !memcmp(get_hdr_bssid(wlanhdr), get_bssid(&padapter->mlmepriv), ETH_ALEN);
+ 
+ 	pkt_info.is_to_self = (!pattrib->icv_err) && (!pattrib->crc_err)
+-		&& !memcmp(get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
++		&& !memcmp(wifi_get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
+ 
+ 	pkt_info.is_packet_to_self = pkt_info.is_packet_match_bssid
+-		&& !memcmp(get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
++		&& !memcmp(wifi_get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
+ 
+ 	pkt_info.is_packet_beacon = pkt_info.is_packet_match_bssid
+ 				 && (get_frame_sub_type(wlanhdr) == WIFI_BEACON);
+@@ -4129,7 +4129,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
+ 	_adapter *iface = NULL;
+ 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
+ 
+-	pda = get_ra(pbuf);
++	pda = wifi_get_ra(pbuf);
+ 
+ 	if (IS_MCAST(pda) == false) { /*unicast packets*/
+ 		iface = rtw_get_iface_by_macddr(primary_padapter , pda);
+diff --git a/wifi.h b/wifi.h
+index a6fc5b4..4b7377b 100644
+--- a/wifi.h
++++ b/wifi.h
+@@ -404,7 +404,7 @@ __inline static int IS_MCAST(unsigned char *da)
+ 		return false;
+ }
+ 
+-__inline static unsigned char *get_ra(unsigned char *pframe)
++__inline static unsigned char *wifi_get_ra(unsigned char *pframe)
+ {
+ 	unsigned char	*ra;
+ 	ra = GetAddr1Ptr(pframe);
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
