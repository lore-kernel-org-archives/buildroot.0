Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF95BC021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 17:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4919040764;
	Sun, 23 Feb 2025 17:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyVpP2ieGFuG; Sun, 23 Feb 2025 17:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1082A40754
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1082A40754;
	Sun, 23 Feb 2025 17:33:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D8B943
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3FBA813F6
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADe4FVQf7x9r for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 17:33:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D216813F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D216813F3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D216813F3
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 17:33:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 988572003A4;
 Sun, 23 Feb 2025 18:33:35 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 18:33:35 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 18:33:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250223144626.10965-1-kuzminov.sergey81@gmail.com>
References: <20250223144626.10965-1-kuzminov.sergey81@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8a5565c1387c252aaaa7b1f1930821cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740332016;
 bh=uHUfYII2zOLd4PpDuqpGcIhLVtMzfuE/VC5Svbdnzvc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ehf+y0B6Mw1zUi5X++85pyn5J7oesv5z1HPJ4zVy0FFFonMyIuNmkOIA463e286O7
 1q+0MxzgQutfOy/pQMUAipFoe69s8+J4IisfZpnDegLBABKLYSsUwc3nWbIs7oV4sB
 ldTrkDxQsivutx6kS3OhcvN59g3LqZ0Xt8Zu1T2JPRNybsaqZBRhNDhcbTRIlXP+3n
 lfZlhlNRehxZW2pnSC5SmD+PeZf4dG6hTnWaxK7WeAM/9HuxnMbpE0wbuAfubSpLL9
 sFdqg8OzXV6LgrqMq70g+s1dDU/XDsOhIp/zMB8Sg5/u0mYr+9wTyT2bs/sxkxydwj
 DwvZpuQ8MqivQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ehf+y0B6
Subject: Re: [Buildroot] [PATCH v4 1/1]
 configs/friendlyarm_nanopi_r3s_defconfig: new defconfig
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

On 23/02/2025 15:46, Sergey Kuzminov wrote:
> This patch adds basic support for the new FriendlyARM NanoPi R3S board:
>  - 
> https://www.friendlyelec.com/index.php?route=product/product&product_id=303
>  - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R3S
> 
> Hardware Spec:
>  - CPU: Rockchip RK3566, Quad-core Cortex-A55
>  - RAM: 2GB LPDDR4X
>  - Ethernet: one Native Gigabit Ethernet, and one PCIe Gigabit Ethernet
>  - USB3.0 Host: Type-A x1
>  - Storage: MicroSD Slot x 1, and on-board 32GB eMMC
>  - Debug Serial Port: 3.3V TTL, 3-pin 2.54mm pitch connector, 1500000 
> bauds
>  - LED: LED x 3
>  - RTC: One low-power RTC, support backup battery input
>  - Buttons: 1x User button, 1x MASK button for eMMC flashing via USB-C
>  - Display: 1x MIPI-DSI 30-Pin FPC connector
> 
> BSP includes the following components:
>  - mainline ATF v2.12
>  - mainline U-Boot v2025.04-rc2
>  - mainline Linux kernel v6.13.4
> 
> Note: this defconfig is using U-Boot v2025.04-rc2 because the
> NanoPi R3S support was added in upstream commit [1] first included
> in v2025.04-rc1.
> 
> [1] 
> https://source.denx.de/u-boot/u-boot/-/commit/bf4a33e725ae02cae064a03ea90c45779780f323
> 
> Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
