Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9560BC4167B
	for <buildroot@archiver.kernel.org>; Mon, 27 Nov 2023 18:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3252981376;
	Mon, 27 Nov 2023 18:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3252981376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlKObMV6_sbw; Mon, 27 Nov 2023 18:51:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C581B81211;
	Mon, 27 Nov 2023 18:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C581B81211
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 504BD1BF348
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A1F60F2E
 for <buildroot@lists.busybox.net>; Mon, 27 Nov 2023 18:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A1F60F2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24dy6xAKDksj for <buildroot@lists.busybox.net>;
 Mon, 27 Nov 2023 18:51:44 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B07B60F2B
 for <buildroot@buildroot.org>; Mon, 27 Nov 2023 18:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B07B60F2B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:7618:50d5:c153:9a40])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3EC3DB0053D;
 Mon, 27 Nov 2023 19:51:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Nov 2023 19:51:38 +0100
Date: Mon, 27 Nov 2023 19:51:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20231127185138.GD3177259@scaer>
References: <20230808180959.28091-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230808180959.28091-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1701111102;
 bh=taCPWxONHXotck28GwdanEDBlh8dVEG6PEg5Wryw79I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZxRz8raEG31GSsWK8xMX8TEZcLXANwDnp8QZL2EQYf+NPWLnJ3gjgRgFSAdPYNK8m
 RY/XJzYGSDK6jmiUlusW8rPf9G2tb0uvcmTMtWjmM3TjoDJYB+acctghUQB/wbTY2B
 Sq8MsDeKIGwQDuvaRtq7w2mX8cQJPivZ8m052gDTW8nwcUFj3lrDsZdQZURmuNlH+2
 HIBTkJM/JZq3gFmWJpXApxwLQaeuTn6B33On4w5T3knUpsuyfc2dTpZzNouk8SlO0y
 FaTftmctLkyqtT8PKnB+xqDCCI8DS+4mKB/Lb40fFGHuPgvlwYxDEoeauqpM+WXXz/
 55fSO2jqJQJGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZxRz8raE
Subject: Re: [Buildroot] [PATCH v1] board/raspberrypi/config_4_64bit.txt:
 remove testing dtoverlay entries (vc4-kms-v3d-pi4, imx219)
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-08-08 20:09 +0200, Peter Seiderer spake thusly:
> Remove private/testing dtoverlay entries (vc4-kms-v3d-pi4, imx219 and
> commented out ov5647) wrongly introduced by commit 689b9ac439
> ("package/rpi-firmware: rework boot/config file handling") [1].
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=689b9ac439ab7b507c8982b6102bddf59d03efbf
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/raspberrypi/config_4_64bit.txt | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/board/raspberrypi/config_4_64bit.txt b/board/raspberrypi/config_4_64bit.txt
> index 41c7e97e99..4a77fb3f1b 100644
> --- a/board/raspberrypi/config_4_64bit.txt
> +++ b/board/raspberrypi/config_4_64bit.txt
> @@ -28,9 +28,5 @@ dtoverlay=miniuart-bt
>  # enable autoprobing of Bluetooth driver without need of hciattach/btattach
>  dtoverlay=krnbt=on
>  
> -dtoverlay=vc4-kms-v3d-pi4
> -dtoverlay=imx219
> -#dtoverlay=ov5647
> -
>  # enable 64bits support
>  arm_64bit=1
> -- 
> 2.41.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
