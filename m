Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960B7C47088
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 20:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA2A4195E;
	Thu,  1 Dec 2022 20:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CA2A4195E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CF0JDO99uJ4w; Thu,  1 Dec 2022 20:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A8441971;
	Thu,  1 Dec 2022 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0A8441971
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F18F21BF379
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D940C610F6
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D940C610F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWrACk8bWQvJ for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 20:01:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E796610ED
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E796610ED
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 20:01:26 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 0pkKpOmailDUz0pkKpk2Qs; Thu, 01 Dec 2022 21:01:25 +0100
Message-ID: <f96ea944-d86b-2f06-4889-343f9a331781@benettiengineering.com>
Date: Thu, 1 Dec 2022 21:01:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221201143858.1486116-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221201143858.1486116-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfItm1yF4RjZx64tiOn8ZbwnHGVmmyGilmNeVGxspXHghXex0rPoTIKa/X9QAR6VSeDV1auMhQ0u6ztPva6Un8njp+579h0q1cDvzol/wieYwNNA7d7dc
 I4pZXtyK3moMmdNtvFh5EGl7iH2t9EMJFoUNxHeCzSmxN+RgoPXnA0KCx2ChBwuh+Iw5kFaSZc8U3x7e1v+QPFFRuOrQZxcAVRzYG0C1YGFYKnJ3NxLJMsN/
 CQhp2cWU5z28wJVhrqiivj1ROd4EIs9kJW9f5xsMprQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669924885; bh=LEPwGe7wBTMPEBIsVwOiSfoatAqy44+G2Y7KrmrQhn4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=A/qyQsIggortLYDav7scapaAYwaksEpk3qyLGy7KaEw9A9n7GaHrlhy1sdyCjLfGc
 RgItgxPI+CK8pcsLj+q0EN41idk0qIQCIerYqUK/yC1729smmA/j9jJ79lJS/RBNX/
 /RnIQbS1SrqkolKQ5H99GKciqqrxytWENf1OCgf34ohkk+CojQ2YkbZHNilzV7s756
 +Gi6kxzbwe4kpHD80TPbOfC5elQJJhXr1uuttifg1QxW96kbyEnfUlWZepwE3MSnWq
 B48Ppgx0l3AxMfSLK2C8tOFp3kM/ZBMyHmn6z+ZcUZ2/mHtXEgMJ9ItU2KglhPC8kl
 LlxOIyJBN7ZJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=A/qyQsIg
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure on
 PowerPC
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pending patch has been upstreamed, so let's drop this patch and this [0]
other patch in favor of this new one [1] that bumps package to latest
version that basically fix the build failure on PowerPC and fix minor
bugs.

[0]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20221128194131.3102770-1-giulio.benetti@benettiengineering.com/
[1]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20221201200044.2138064-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

On 01/12/22 15:38, Giulio Benetti wrote:
> Add local patch(pending upstream[0]) to fix build failure with PowerPC due
> to a package re-defition of get_ra() that is only defined in Linux PowerPC
> implementation.
> 
> [0]: https://github.com/lwfinger/rtl8723ds/pull/32
> 
> Fixes:
> http://autobuild.buildroot.net/results/fa2/fa2482674d789e7674dc0d83c5f54393beed4d70/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...8723ds-get_ra-exists-only-on-PowerPC.patch | 105 ++++++++++++++++++
>   1 file changed, 105 insertions(+)
>   create mode 100644 package/rtl8723ds/0002-rtl8723ds-get_ra-exists-only-on-PowerPC.patch
> 
> diff --git a/package/rtl8723ds/0002-rtl8723ds-get_ra-exists-only-on-PowerPC.patch b/package/rtl8723ds/0002-rtl8723ds-get_ra-exists-only-on-PowerPC.patch
> new file mode 100644
> index 0000000000..ceb9483a32
> --- /dev/null
> +++ b/package/rtl8723ds/0002-rtl8723ds-get_ra-exists-only-on-PowerPC.patch
> @@ -0,0 +1,105 @@
> +From aaf31f36eb21b16bc628671a0c49b65ff2736a22 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 1 Dec 2022 15:24:08 +0100
> +Subject: [PATCH] rtl8723ds: get_ra() exists only on PowerPC
> +
> +In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
> +that has a completely different purpose. So let's rename local get_ra()
> +to wifi_get_ra() to make it different from Linux's get_ra().
> +
> +[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm/disassemble.h?h=v6.1-rc7#n49
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + core/rtw_odm.c                | 6 +++---
> + core/rtw_recv.c               | 6 +++---
> + include/wifi.h                | 2 +-
> + os_dep/linux/ioctl_cfg80211.c | 2 +-
> + 4 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/core/rtw_odm.c b/core/rtw_odm.c
> +index d9b7db1..962560a 100644
> +--- a/core/rtw_odm.c
> ++++ b/core/rtw_odm.c
> +@@ -430,7 +430,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
> + 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
> + 					, *phys & 0xf
> + 					, MAC_ARG(get_ta(wlanhdr))
> +-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> ++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(wifi_get_ra(wlanhdr)) ? "MC" : "UC"
> + 					, HDATA_RATE(attrib->data_rate)
> + 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
> + 				);
> +@@ -546,7 +546,7 @@ type1_end:
> + 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
> + 					, *phys & 0xf
> + 					, MAC_ARG(get_ta(wlanhdr))
> +-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> ++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(wifi_get_ra(wlanhdr)) ? "MC" : "UC"
> + 					, HDATA_RATE(attrib->data_rate)
> + 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
> + 					, pkt_cch, pkt_bw
> +@@ -564,7 +564,7 @@ type1_end:
> + 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
> + 					, *phys & 0xf
> + 					, MAC_ARG(get_ta(wlanhdr))
> +-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> ++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(wifi_get_ra(wlanhdr)) ? "MC" : "UC"
> + 					, HDATA_RATE(attrib->data_rate)
> + 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
> + 				);
> +diff --git a/core/rtw_recv.c b/core/rtw_recv.c
> +index 87a6b2a..6a3c26d 100644
> +--- a/core/rtw_recv.c
> ++++ b/core/rtw_recv.c
> +@@ -4444,10 +4444,10 @@ void rx_query_phy_status(
> + 		&& _rtw_memcmp(get_hdr_bssid(wlanhdr), get_bssid(&padapter->mlmepriv), ETH_ALEN);
> +
> + 	pkt_info.bToSelf = (!pattrib->icv_err) && (!pattrib->crc_err)
> +-		&& _rtw_memcmp(get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> ++		&& _rtw_memcmp(wifi_get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> +
> + 	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID
> +-		&& _rtw_memcmp(get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> ++		&& _rtw_memcmp(wifi_get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> +
> + 	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID
> + 				 && (GetFrameSubType(wlanhdr) == WIFI_BEACON);
> +@@ -4549,7 +4549,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
> + 	_adapter *iface = NULL;
> + 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
> +
> +-	pda = get_ra(pbuf);
> ++	pda = wifi_get_ra(pbuf);
> +
> + 	if (IS_MCAST(pda) == _FALSE) { /*unicast packets*/
> + 		iface = rtw_get_iface_by_macddr(primary_padapter , pda);
> +diff --git a/include/wifi.h b/include/wifi.h
> +index ce78bf6..ccdbd0f 100644
> +--- a/include/wifi.h
> ++++ b/include/wifi.h
> +@@ -455,7 +455,7 @@ __inline static int IS_MCAST(unsigned char *da)
> + 		return _FALSE;
> + }
> +
> +-__inline static unsigned char *get_ra(unsigned char *pframe)
> ++__inline static unsigned char *wifi_get_ra(unsigned char *pframe)
> + {
> + 	unsigned char	*ra;
> + 	ra = GetAddr1Ptr(pframe);
> +diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
> +index a197612..4fff23a 100644
> +--- a/os_dep/linux/ioctl_cfg80211.c
> ++++ b/os_dep/linux/ioctl_cfg80211.c
> +@@ -4735,7 +4735,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
> +
> + indicate:
> + 	#if defined(RTW_DEDICATED_P2P_DEVICE)
> +-	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), get_ra(frame), &wdev))
> ++	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), wifi_get_ra(frame), &wdev))
> + 		if (0)
> + 			RTW_INFO("redirect to pd_wdev:%p\n", wdev);
> + 	#endif
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
