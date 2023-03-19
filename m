Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C32EC7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 12:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F0CE60FBC;
	Sun, 19 Mar 2023 12:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F0CE60FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9GnQ8MDuFcAW; Sun, 19 Mar 2023 12:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4855D60FB2;
	Sun, 19 Mar 2023 12:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4855D60FB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 845BF1BF5A2
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 12:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E77640525
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 12:24:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E77640525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1kNhKrxiinmO for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 12:24:08 +0000 (UTC)
X-Greylist: delayed 00:07:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9DC140176
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9DC140176
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 12:24:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dry8pQfQR9J5Hdry8pXwyL; Sun, 19 Mar 2023 13:17:01 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 13:16:58 +0100
Message-Id: <20230319121659.88039-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKYdhobOo5PtnH3oFzs7x3BGaHhiHaS1ewLaUP7b2G/gbariXLpjMLbZaazFaxS87EFBAlVjPlliXD7zME549hQXbc+VlfK/l9nAVBhbTgeH8ZVG5xPe
 /IdXfSGhHzhGQVYK2qWk3NLofoYXtsnvkSfBSRHk357vY8TAL1SoUUIsYus5D65W+Pqx5PCmqOaKBXTDZP/agjiGFzI+sDtVJFQkXtI57DsY7/VD/5SnOmWc
 bo9d/yH7zLPtd+AeWGgLhBYZojRHqLsR67npjeonfrcWIoTq8P2O27R3ZE+FhdNoBYWUsZLgUnX4Ese2A+FpGxzEcUlDC3w7MW+xGxA89Y+LFUlL8+Lbdq7r
 1YOT5z56BE0b6fkmRApzryv16y1TW/ewx+ubsjwcpXWH8W9b9hA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679228221; bh=Hc4Q7NHPbpBarZQwXu2ux3+3qq2G0pCaayuxqV3+XhU=;
 h=From:To:Subject:Date:MIME-Version;
 b=cO7LuGnKEOH/uCBjMkn6b+5uBH0mMkzzgWx+yqmIEY8XVscaJ9DuBc/5knqSqCtfp
 1IOCTyuFt4xrxfA2odziGcmZrKr5MP1ewIC5S3TXrBHsGWmAP5Cq0LqRh50df7i8Ty
 IcFxcDJNG04E9hKg356+gA3DXXLIuu/DsvGmOokzlZW33xpI7olJPhyOthvFPOLT/5
 tet4N167To7e/69W0XIdRGy6yEWI0O4LfPLG34qdKBNPX4zllJCq9svzLnYFQAl4pc
 Bh+3Jkju1Cj5/oV0KnpT5lgaf20PbiAxiz3Rf+Ki2F0Yq8Bmt35Hx6cqaEFZhYVmSR
 rjbAk1pHsrX6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=cO7LuGnK
Subject: [Buildroot] [PATCH] package/rtl8189es: bump to version 2023-03-14
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Indrek Kruusa <indrek.kruusa@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's drop local patch that has been upstreamed and note that this
version supports up to Linux 6.3

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
index 44d73e60f0..64f6158654 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  96347dbfedd95a217fb89b7b295fe417b711dbad3db896ef0c2fa733c6d150fd  rtl8189es-e58bd86c9d9408c648b1246a0dd76b16856ec172.tar.gz
+sha256  05d839c9b7820008bf7975c2f4a3dde6265dbae0c5dc48cefcee3a79492dc377  rtl8189es-ae7b31e55526ca0e01d2a3310118530bff4f1055.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index c2ee77f922..a40f656d3e 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = e58bd86c9d9408c648b1246a0dd76b16856ec172
+RTL8189ES_VERSION = ae7b31e55526ca0e01d2a3310118530bff4f1055
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
