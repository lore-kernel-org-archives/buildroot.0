Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DE1EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4154481F6E;
	Sun, 25 Jun 2023 13:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4154481F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLT8j5canjlQ; Sun, 25 Jun 2023 13:56:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49CD181FA9;
	Sun, 25 Jun 2023 13:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49CD181FA9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95B131BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E25740932
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E25740932
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZncxaYf_m2cN for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:54:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14F254092D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14F254092D
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:54:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 03926B00576;
 Sun, 25 Jun 2023 15:54:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 15:54:35 +0200
Date: Sun, 25 Jun 2023 15:54:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <20230625135435.GC589277@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-7-dannenberg@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230622160212.2063472-7-dannenberg@ti.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687701278;
 bh=bMY78cAWw2p2ed0DYMSGH+wWMQC9vdwo01r9tqcm10o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Piwny+y6Et5qioTUzbyKUDAAbWy9gLbovfqcDa6DXUj898uvRGo8FKfB+J6xD34b6
 7/W0jpyL4HqULfqpKCr35pbfzSJY6lCCGchyLECeqApWsl+Bt6AkzIW/yzBPZo/YGT
 iIjCCBC6Lq1woKmYoqkETTMy6JjwNsBuLyefMFiU6LYIRoyul9h6VngFo7IvomyML+
 HyIv425otLgp23BTL1yL4mgxrftV5I3SPCfYi9segRQ6fN81kQ7MDP/3JnEPR7euCY
 w6eAKwp07eLma+T9mWGPXCLIVmGjAYa3xAx4psvMGw8tdFDV3QH+GfypXQ8v9o9+V7
 Ym4rijbuCn6BA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Piwny+y6
Subject: Re: [Buildroot] [PATCH v9 06/11] board/ti/am62x_sk|am64x_sk: switch
 to TI SDK v8.6 sources
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Andreas, All,

On 2023-06-22 11:02 -0500, Andreas Dannenberg via buildroot spake thusly:
> Switch the following projects to using the same Git source repos and
> commit IDs that are used to build the TI SDK v8.6 for AM62x and AM64x
> devices to establish a baseline for comparable functionality:
> 
> * TI Linux Kernel v5.10

So this means going from a 6.3 kernel back to a 5.10 (the current latest
if 6.3, which is what is used in the defconfigs from the two previous
patches). That's a bit unfortunate.

Do you have plans to update to a more recent kernel in the (near)
future? Can't we keep using 6.3 anyway?

> * TI U-Boot v2021.01
> * ARM Trusted Firmware
> * OP-TEE
> 
> For the Linux Kernel this also includes switching the defconfig to a new
> one that is generated with the ti_config_fragments/defconfig_builder.sh
> tool that is part of the respective ti-linux-5.10.y repository.
> 
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  .../ti/am62x_sk/ti_sdk_arm64_debug_defconfig  | 1991 +++++++++++++++++
>  .../am62x_sk/ti_sdk_arm64_release_defconfig   | 1894 ++++++++++++++++
>  .../ti/am64x_sk/ti_sdk_arm64_debug_defconfig  | 1991 +++++++++++++++++
>  .../am64x_sk/ti_sdk_arm64_release_defconfig   | 1894 ++++++++++++++++

Those are really big defconfigs... Why can't we use the defconfig
anymore?

Also, for each board, you are providing two defconfigs, one release and
one debug, but only one is used. We don;t want to carry files that are
unused, because they are going to bitrot sooner than later.

Just add the two defconfigs that are needed, one for each board.

Also, I think it would be preferrable that the files be named
linux.config (.config even though it is a defconfig, yes), like we do
for the other boards (there are slight deviations, like adding the
lernel version, or a 'nommu', but only one is named after the board).

Regards,
Yann E. MORIN.

[--SNIP--]
> diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
> index 083720f512..0b196f4cce 100644
> --- a/configs/am62x_sk_defconfig
> +++ b/configs/am62x_sk_defconfig
> @@ -1,8 +1,12 @@
>  BR2_aarch64=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y

This is out-of-order.

Either you have manually-edited defconfigs, and then you should provide
comments in there, like (see existing defconfigs for exampleS):

    # Linux headers same as kernel, a 5.10 series
    BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y

or you have a defconfig that is fully auto-gemnerated with
save-defconfig.

I prefer the latter, but other maintainers may prefer the former..

Regards,
Yann E. MORIN.

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
