Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4CDC4332F
	for <buildroot@archiver.kernel.org>; Fri, 30 Dec 2022 05:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C89860AC0;
	Fri, 30 Dec 2022 05:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C89860AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myYhoHISIMty; Fri, 30 Dec 2022 05:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D9F606AA;
	Fri, 30 Dec 2022 05:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D9F606AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 215211BF2FB
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 05:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F10B340137
 for <buildroot@lists.busybox.net>; Fri, 30 Dec 2022 05:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F10B340137
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H2P3AYg-BqrC for <buildroot@lists.busybox.net>;
 Fri, 30 Dec 2022 05:19:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8C09400FC
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8C09400FC
 for <buildroot@buildroot.org>; Fri, 30 Dec 2022 05:19:51 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id B7o4ph98UYttnB7o4pjFTY; Fri, 30 Dec 2022 06:19:48 +0100
Message-ID: <de387784-9c6e-ce40-d98b-467e2de152a1@benettiengineering.com>
Date: Fri, 30 Dec 2022 06:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20221229235834.321957-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221229235834.321957-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfDdLzVQKQLGOYoZy4I4pGnnbNawL6j2kjhMdtPGG+mIT01DR06NuRD/LM5ZMX5+0cSCc7W5hXvk7msoLBcCq2pmfIqk9Upp6c2sbDjFCrj/KrWSLuop0
 JF8HM/2xp0Wxc4NfMyA7sWB9TO1iugX1oMe133k2X9rQ/qc5oO4OkBHjrjhaMsHaI8lro95U7Q5W+OEYBbsHZKWWPU3V9SjQiZAo9eabLUsoXPqkl7kO/jV5
 fCh7Y0xOUAD/dgMsUHpDNQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672377588; bh=eExmbLVjPiY6/HJyYtg1T8d0VUig71e8i7ag0ZoSdEs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ZeD0zK0sY1af4B7BXBOEce1KylmHDI4mwUa2kH9D+EwLjWg0pT02bgTfSao5YrJRU
 L+8GC9XRVtYC29SmMX7hKMR5ozn+O1/+H4wR4KZ6UQYdQLHzM5aaKVtq2a2z3Zlnt8
 SDYxH44T99ZQ1QjM08XfOZWE+D2el0Sqw3jOeTnR8CQHDCj7xssFSR9r1EnyhgI7rc
 TXV9rIlvDnXHr9xfXLLiwM82So9BIhdQ1wT5MYu0+IazxvfXA3WWKPlWfn3Zqpn2Xv
 AIZKFYnjbFidFqsKwh1jK8F6iL/E5xxK1xV7RfAm4y6F2Lcw/RxduRuuKnl2mE5LXg
 49yFpYAov9giw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ZeD0zK0s
Subject: Re: [Buildroot] [PATCH] package/xr819-xradio: fix build failure on
 Linux 6.1
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Please drop this patch since local patches have already been upstreamed.
I will wait some day next time before submitting local patches and see
if upstream merge them soon.

Patch with version bump comes soon.

Sorry for the noise
Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

On 30/12/22 00:58, Giulio Benetti wrote:
> Add 2 local patches pending upstream[0] to fix build failure with Linux 6.1
> 
> [0]: https://github.com/fifteenhex/xradio/pull/19
> 
> Fixes:
> Still not produced
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   ...missing-prandom_u32-with-Linux-6.1.0.patch | 34 +++++++++++++++++++
>   ...ailure-due-to-ieee80211_nullfunc_get.patch | 34 +++++++++++++++++++
>   2 files changed, 68 insertions(+)
>   create mode 100644 package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
>   create mode 100644 package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch
> 
> diff --git a/package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch b/package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
> new file mode 100644
> index 0000000000..ac07074034
> --- /dev/null
> +++ b/package/xr819-xradio/0001-wsm.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
> @@ -0,0 +1,34 @@
> +From d336006f0d9e9663a5ff61d38e98ddd33e175167 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Fri, 30 Dec 2022 00:44:30 +0100
> +Subject: [PATCH] wsm.c: fix missing prandom_u32() with Linux >= 6.1.0
> +
> +prandom_u32() previously was only calling get_random_u32() so it's been
> +dropped with Linux 6.1.0. So let's directly call get_random_u32() if Linux
> +version >= 6.1.0.
> +
> +[Upstream status: https://github.com/fifteenhex/xradio/pull/19]
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + wsm.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/wsm.c b/wsm.c
> +index 85eeef8..ea73770 100644
> +--- a/wsm.c
> ++++ b/wsm.c
> +@@ -2609,7 +2609,11 @@ static int xradio_get_prio_queue(struct xradio_vif *priv,
> + 		edca = &priv->edca.params[i];
> + 		score = ((edca->aifns + edca->cwMin) << 16) +
> + 				(edca->cwMax - edca->cwMin) *
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
> ++				(get_random_u32() & 0xFFFF);
> ++#else
> + 				(prandom_u32() & 0xFFFF);
> ++#endif
> + 		if (score < best && (winner < 0 || i != 3)) {
> + 			best = score;
> + 			winner = i;
> +--
> +2.34.1
> +
> diff --git a/package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch b/package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch
> new file mode 100644
> index 0000000000..cb3cab113f
> --- /dev/null
> +++ b/package/xr819-xradio/0002-ap.c-fix-build-failure-due-to-ieee80211_nullfunc_get.patch
> @@ -0,0 +1,34 @@
> +From 5f0dd19dc8acad9816bb1b857551f3289e386d32 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Fri, 30 Dec 2022 00:52:30 +0100
> +Subject: [PATCH] ap.c: fix build failure due to ieee80211_nullfunc_get()
> + change in Linux 6.1
> +
> +Starting from Linux 6.1 it's been added 'int link_id' parameter to
> +ieee80211_nullfunc_get() to comply to MSO, but this module doesn't support
> +it. So let's handle this case by passing default 0 as link_id parameter.
> +
> +[Upstream status: https://github.com/fifteenhex/xradio/pull/19]
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + ap.c | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/ap.c b/ap.c
> +index 51b8a44..649d6bf 100644
> +--- a/ap.c
> ++++ b/ap.c
> +@@ -1145,7 +1145,9 @@ static int xradio_upload_null(struct xradio_vif *priv)
> + 		.rate = 0xFF,
> + 	};
> +
> +-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 17))
> ++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 1, 0))
> ++	frame.skb = ieee80211_nullfunc_get(priv->hw, priv->vif, 0, false);
> ++#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 17))
> + 	frame.skb = ieee80211_nullfunc_get(priv->hw, priv->vif, false);
> + #else
> + 	frame.skb = ieee80211_nullfunc_get(priv->hw, priv->vif);
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
