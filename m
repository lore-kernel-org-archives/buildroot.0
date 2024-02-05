Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ED0C48295
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 15:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A5CF41A84;
	Mon,  5 Feb 2024 15:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A5CF41A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7FVedJxM_D0; Mon,  5 Feb 2024 15:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C61384149F;
	Mon,  5 Feb 2024 15:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C61384149F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3271BF215
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6572860EF8
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 15:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6572860EF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otsaF5BUPsPZ for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 15:16:23 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFF1860EEE
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 15:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFF1860EEE
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X0hnr0Cq9l81fX0hnrUjCW; Mon, 05 Feb 2024 16:16:20 +0100
Message-ID: <0f0ddd79-6aee-4fa7-8b60-dce12339e94b@benettiengineering.com>
Date: Mon, 5 Feb 2024 16:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231123134052.239690-1-dario.binacchi@amarulasolutions.com>
 <20231123134052.239690-2-dario.binacchi@amarulasolutions.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231123134052.239690-2-dario.binacchi@amarulasolutions.com>
X-CMAE-Envelope: MS4xfK//f8GHZq+K8ILP2yzqocxm2YnbKjAVNkEnQY+nGnCNC3ZTMGNETjqpOIbKpTBw2MOY05LxRU7ytHkQf0K4ZPJKnrZeR1awyPukmyhgSyHV6wUcoDwq
 xwZvQJSCmyeeD0w9OAsvhtW6DOJKU7OUeMq+xxVMRE2edKgSVuOQfZDPHqpPDZAoDm7fXk51tgnHAGQ2YdyKoB3bqo9nNVSE9wxNv4zk2ySanb9LYGg+LTfm
 sdcv7pQZF1O08Dk0xWHkM1kktOaBUplxxlYtIncas0Liirwd4HPXHyQxJ1kQnloZSPlTXdv688MNbxQs+TR0ZUyqQryrdyWzFlqii/3xHr8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707146180; bh=eqHOcob64Dg7qTJbjH9u6ygcw4uPXAefng7z9vyeYtY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=U3veP/QHuFMCEFs+vRI2/n3kMh+xw3y8NehUdC5r4b+5oCWGou2wMcsR+rja3oYzk
 TeILJrGMImVgcVbLFxWju0rElcbMtPSIIXcMVS+uaAJ2W/D3WRjPaecT4frczS6INO
 rvHpLam6pdbPpOU/ZX0extY9FHJ4gOOimQUsozc81heUDBhch0HLlfOgfVGX4+L+ci
 QgBkBklpR6ZrAUg+GcM0kvcAyf+y8QQxw+EzK9CgNNNH2rdnZFRXyjY0yP+ljQJo5r
 +OZMogmzFDstFzUd7RSzcLo2h1jUCu9GFp9LNn5/XAzvKF5mMgzU5vK/D2fxhUI83c
 Zu2l3sOTucO7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=U3veP/QH
Subject: Re: [Buildroot] [PATCH 2/2] configs/ti_am62x_sk_defconfig: drop
 redundant defconfig choice
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Dario,

On 23/11/23 14:40, Dario Binacchi wrote:
> The defconfig choice is the default one, so it is redundant and can be
> removed without effect.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>   configs/ti_am62x_sk_defconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/configs/ti_am62x_sk_defconfig b/configs/ti_am62x_sk_defconfig
> index 6610e6fcf890..130d092e304f 100644
> --- a/configs/ti_am62x_sk_defconfig
> +++ b/configs/ti_am62x_sk_defconfig
> @@ -24,7 +24,6 @@ BR2_TARGET_OPTEE_OS=y
>   BR2_TARGET_OPTEE_OS_PLATFORM="k3"
>   BR2_TARGET_TI_K3_IMAGE_GEN=y
>   BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM62X=y
> -BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_GP=y

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

>   BR2_TARGET_TI_K3_R5_LOADER=y
>   BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am62x_evm_r5"
>   BR2_TARGET_UBOOT=y

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
