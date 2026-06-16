Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2650ACD98E3
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C29AE42BF0;
	Tue, 16 Jun 2026 16:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2i0EucCbxGu; Tue, 16 Jun 2026 16:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2F742BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781626396;
	bh=NIDTdvQ9FYAVaEJ3GQVdfAZcJYnzxm4O/LyiolRESXU=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coyZyDoA2QpUpdyM5QiKwxHpZCBzqvb0cbAGMUNwI0BdVCSxyAPHB36n7ttQ2Nfto
	 xndje97XJ97yn4fV+GjHHYI6Wm3Q6LSR4PhNTo6yg6A61AryqwOpNlfjHO/DypZP0s
	 k2oynmcw0oGh51tgSaqZG2wrj6TGNVoL6vqSMdxCgVuxcGWxTemvG9wLEl+uCFfPiu
	 S9iCJ07NEzVw04LTE9eCcAgKknaiZABBN3ZpI/IrG7fzqOn6oCrrHK5uywE2rJV0GD
	 UURZfK8FdaytM7PrmhArUXA7M31uzcBKxTFzoWIeoMZMlNJhLgoO9gqC5kqzpmd9GH
	 0TVY3aavvKWTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2F742BBC;
	Tue, 16 Jun 2026 16:13:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF132B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04F8042BBC
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qp_9vvp6e1Oz for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:13:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.161;
 helo=smtpcmd14161.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 54D1B42B88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54D1B42B88
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54D1B42B88
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:13:11 +0000 (UTC)
Received: from [192.168.51.134] ([151.78.192.252]) by Aruba SMTP with ESMTPSA
 id ZWPVw19724OeoZWPVwtKwR; Tue, 16 Jun 2026 18:13:09 +0200
Message-ID: <102f577d-d099-46b0-81eb-de36a348b9f9@benettiengineering.com>
Date: Tue, 16 Jun 2026 18:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260616160614.2665216-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260616160614.2665216-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfA83vrWZ56f8+gzgAHcdVplbQX29liOMq52XKtgS5spcxs3BzYlU/x6BaCymwjeRfEZdmjIi1w2qzSnvrnyV0W8b+UMo5pzO1Vf9CpLl6qJ0gCJWFRfV
 g97ovxO5qr45WYLALkJQ6pIJr0io+B0p256AhPHT+tpTTo/UEC/dg3WP9v+7mnH0vLGC3BfGbUZjsRG5lp3e/rmnfir54oT5Sk7MHUFWGu/FDjmZ3jcyNsLA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1781626389; bh=0WsxuVkSxKVNQbd2EUNhxocBYLcOSbc3EnA4oAU12VQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kQBLkrTDRU+XWi6lNLoDDW4BL267KV74iXPBsOm2Rp/3BQv37SccTAWiWyyghWk6m
 A/nM2SNbLoNP7F1nXuZwZ2RbYtJF/46bNFZvSzRNDlyt3YAd0Cob5jjT2ausHG17xM
 lZcc0kQzte+duaWxOgjiVD7N70kXbJkTLkcf4cHUi1Xslw+CeomEkOuU2cDXFdKm39
 BTHq0P8nDkQKM2N+oziBv1nZ1ApmYk1i72TTE3dnxJX+zxY+jZaeWNd9jMWUqI6jS0
 hxHWEPndhlTei6kxZ2F+e3j9WkntmeKnDmbQNxm1Rch3ECBaJPh5RkeGEWe4RNcxmp
 DLz/KPoLYG4zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=kQBLkrTD
Subject: Re: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: fix build
 failure due to warnings treated as errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/06/2026 18:06, Giulio Benetti wrote:
> A the moment build fails because all warnings are treated as errors
> except only 3 specific ones, but the problem is that there are many
> warnings that arise with gcc version increasing, so let's simply pass
> -Werror to ignore every warning in place of the previous 3 specific
> ignored warnings.

Fixes:
https://autobuild.buildroot.org/results/05e9cef32f07f05192dab0a23139a81a8980c806/

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index 1308508e00..de45db3d67 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -13,9 +13,7 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
>   	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
>   	-DCONFIG_IOCTL_CFG80211 \
>   	-DRTW_USE_CFG80211_STA_EVENT \
> -	-Wno-error=address \
> -	-Wno-error=array-bounds \
> -	-Wno-error=cast-function-type
> +	-Wno-error
>   
>   RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
>   	CONFIG_PLATFORM_I386_PC=n \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
