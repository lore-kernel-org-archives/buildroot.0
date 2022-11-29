Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AD2C4167B
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 14:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAB5D409B4;
	Tue, 29 Nov 2022 14:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAB5D409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4rohTosvVALv; Tue, 29 Nov 2022 14:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31BC416BE;
	Tue, 29 Nov 2022 14:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31BC416BE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48DD81BF429
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 14:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BA9160F93
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 14:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BA9160F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xClt4Fbcod6u for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 14:16:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB9956059B
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB9956059B
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 14:16:45 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 01PgpwNEUIM4A01Pgpo5Tm; Tue, 29 Nov 2022 15:16:44 +0100
Message-ID: <69fc2da5-d80b-1200-df9a-d3c2abff888d@benettiengineering.com>
Date: Tue, 29 Nov 2022 15:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221127132855.510943-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221127132855.510943-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfJ2w9YeJKHj3VOH1tTug4xZYjk78x1Koghq+RQZtoypVnK8ZhFbjVI2LbQ0qbwzdIiZa00VDKmO7KZd0lXVbIr/fnG6bVDfyMUnCkmH5E2BOnUar7NXE
 OJgesE3aU0VmUkF+MEP9V6VRe8RMUxXhWn8SlHw9Hy0nPm659/EVtZZtwZAxN2OQ5ElzL5weqFHq+4QfDZJ/IE8jXMR8dY8AeK8reCLYwgi3Q1RQHZIrjhwt
 xbmKZBOZkst57k1Qratn+4SmMmlNiNqmhOk7kmokueA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669731404; bh=YIL7o8drjIQSxnaga5/SW77WCb3KCFNPldXxYaDGRYY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=F/q8/vt+vLPbe70ETJPcHarG3bWIiHs3qnpX5WDstC4iIpvOkMqtq58JWY9+g2PwF
 U3i2wMJofqfugK/lrU3pHuPGVm+f3+oLKwy1RmprhGLrJuSGnevbs3kqcVuxCp7hCr
 7ByQFJrOUoMT9jaANXItZj6/IrZS+C2GqV0o7Emrc8SgRLR7PBWkaVQgu5F7F1JoQt
 2t+nvr9+K7pfKaSGZpIsHNTy+tfeK44S0J2cI/r6bdIyUzctjMcXCvyKc9iJHXA8Ar
 8dLMpfDFBVbaGvidazAzV72jh7P4xTar3H5Hcn+N8NiJIKEbQzNwW155LoWlYY8Wi4
 xEzc7YXqmWJtw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=F/q8/vt+
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure on
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

this patch is superseded by this new patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20221129140533.438862-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

On 27/11/22 14:28, Giulio Benetti wrote:
> Add local patch(pending upstream[0]) to fix build failure with PowerPC due
> to a package re-defition of get_ra() that is only defined in Linux PowerPC
> implementation.
> 
> [0]: https://github.com/lwfinger/rtl8188eu/pull/432
> 
> Fixes:
> http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...uild-failure-on-PowerPc-architecture.patch | 106 ++++++++++++++++++
>   1 file changed, 106 insertions(+)
>   create mode 100644 package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
> 
> diff --git a/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
> new file mode 100644
> index 0000000000..b16a312c7e
> --- /dev/null
> +++ b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
> @@ -0,0 +1,106 @@
> +From 2a91a721d634a2eca131628b5c9c028af20037af Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Sun, 27 Nov 2022 14:20:43 +0100
> +Subject: [PATCH] Fix build failure on PowerPc architecture
> +
> +In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
> +that has a completely different purpose. So let's rename local get_ra()
> +to wifi_get_ra() to make it different from Linux's get_ra().
> +
> +[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm
> +
> +Upstream: https://github.com/lwfinger/rtl8188eu/pull/432
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + ioctl_cfg80211.c | 2 +-
> + rtw_odm.c        | 6 +++---
> + rtw_recv.c       | 6 +++---
> + wifi.h           | 2 +-
> + 4 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/ioctl_cfg80211.c b/ioctl_cfg80211.c
> +index 0ea5460..af43097 100644
> +--- a/ioctl_cfg80211.c
> ++++ b/ioctl_cfg80211.c
> +@@ -4607,7 +4607,7 @@ void rtw_cfg80211_rx_p2p_action_public(_adapter *adapter, union recv_frame *rfra
> +
> + indicate:
> + 	#if defined(RTW_DEDICATED_P2P_DEVICE)
> +-	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), get_ra(frame), &wdev))
> ++	if (rtw_cfg80211_redirect_pd_wdev(dvobj_to_wiphy(dvobj), wifi_get_ra(frame), &wdev))
> + 		if (0)
> + 			RTW_INFO("redirect to pd_wdev:%p\n", wdev);
> + 	#endif
> +diff --git a/rtw_odm.c b/rtw_odm.c
> +index 922a7b9..ad17080 100644
> +--- a/rtw_odm.c
> ++++ b/rtw_odm.c
> +@@ -283,7 +283,7 @@ void rtw_odm_parse_rx_phy_status_chinfo(union recv_frame *rframe, u8 *phys)
> + 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u)\n"
> + 					, *phys & 0xf
> + 					, MAC_ARG(get_ta(wlanhdr))
> +-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> ++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> + 					, HDATA_RATE(attrib->data_rate)
> + 					, phys_t0->band, phys_t0->channel, phys_t0->rxsc
> + 				);
> +@@ -399,7 +399,7 @@ type1_end:
> + 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, rf_mode:%u, l_rxsc:%u, ht_rxsc:%u) => %u,%u\n"
> + 					, *phys & 0xf
> + 					, MAC_ARG(get_ta(wlanhdr))
> +-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> ++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> + 					, HDATA_RATE(attrib->data_rate)
> + 					, phys_t1->band, phys_t1->channel, phys_t1->rf_mode, phys_t1->l_rxsc, phys_t1->ht_rxsc
> + 					, pkt_cch, pkt_bw
> +@@ -417,7 +417,7 @@ type1_end:
> + 				RTW_PRINT("phys_t%u ta="MAC_FMT" %s, %s(band:%u, ch:%u, l_rxsc:%u, ht_rxsc:%u)\n"
> + 					, *phys & 0xf
> + 					, MAC_ARG(get_ta(wlanhdr))
> +-					, is_broadcast_mac_addr(get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> ++					, is_broadcast_mac_addr(wifi_get_ra(wlanhdr)) ? "BC" : is_multicast_mac_addr(get_ra(wlanhdr)) ? "MC" : "UC"
> + 					, HDATA_RATE(attrib->data_rate)
> + 					, phys_t2->band, phys_t2->channel, phys_t2->l_rxsc, phys_t2->ht_rxsc
> + 				);
> +diff --git a/rtw_recv.c b/rtw_recv.c
> +index 9439415..24eb9e9 100755
> +--- a/rtw_recv.c
> ++++ b/rtw_recv.c
> +@@ -4040,10 +4040,10 @@ void rx_query_phy_status(
> + 		&& !memcmp(get_hdr_bssid(wlanhdr), get_bssid(&padapter->mlmepriv), ETH_ALEN);
> +
> + 	pkt_info.is_to_self = (!pattrib->icv_err) && (!pattrib->crc_err)
> +-		&& !memcmp(get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> ++		&& !memcmp(wifi_get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> +
> + 	pkt_info.is_packet_to_self = pkt_info.is_packet_match_bssid
> +-		&& !memcmp(get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> ++		&& !memcmp(wifi_get_ra(wlanhdr), adapter_mac_addr(padapter), ETH_ALEN);
> +
> + 	pkt_info.is_packet_beacon = pkt_info.is_packet_match_bssid
> + 				 && (get_frame_sub_type(wlanhdr) == WIFI_BEACON);
> +@@ -4129,7 +4129,7 @@ s32 pre_recv_entry(union recv_frame *precvframe, u8 *pphy_status)
> + 	_adapter *iface = NULL;
> + 	_adapter *primary_padapter = precvframe->u.hdr.adapter;
> +
> +-	pda = get_ra(pbuf);
> ++	pda = wifi_get_ra(pbuf);
> +
> + 	if (IS_MCAST(pda) == false) { /*unicast packets*/
> + 		iface = rtw_get_iface_by_macddr(primary_padapter , pda);
> +diff --git a/wifi.h b/wifi.h
> +index a6fc5b4..4b7377b 100644
> +--- a/wifi.h
> ++++ b/wifi.h
> +@@ -404,7 +404,7 @@ __inline static int IS_MCAST(unsigned char *da)
> + 		return false;
> + }
> +
> +-__inline static unsigned char *get_ra(unsigned char *pframe)
> ++__inline static unsigned char *wifi_get_ra(unsigned char *pframe)
> + {
> + 	unsigned char	*ra;
> + 	ra = GetAddr1Ptr(pframe);
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
