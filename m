Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF9ECEB2CC
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 14:16:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B948840E2;
	Sat, 15 Nov 2025 14:16:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSMKSmcnnB3T; Sat, 15 Nov 2025 14:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B627984026
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B627984026;
	Sat, 15 Nov 2025 14:16:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BFA4158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DEED6084C
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-zupxgdeyMn for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 14:16:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBB5A60803
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB5A60803
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBB5A60803
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 14:16:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6FCCA2003DE;
 Sat, 15 Nov 2025 15:16:21 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Nov 2025 15:16:21 +0100
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 15:16:21 +0100
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <20250822-update_star64-v1-1-83fe87fbe8ea@bootlin.com>
References: <20250822-update_star64-v1-0-83fe87fbe8ea@bootlin.com>
 <20250822-update_star64-v1-1-83fe87fbe8ea@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a575c90b3a269afc22d73c7d60d1cce9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763216185;
 bh=OUYZGAFpYVBGbnu2Ibvyx1XZfKKg1eJxnJeYV+SBoL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Oeg7m3LBncT1H5kSu8BFqpZpJcKN3qqEquplIDE10XRCLIHqWuvLbIaaCL3E1yL9k
 SGRlZh4W8J1VVVXMIynLVOZ6jH8haTCudcZBCAI16qkBGFX9H5aEjoj3TpqEGE3b+Y
 wPJMy/8SeMOc4WLQB/TP80QD8kc7SBM4OHn4jV2p1YOAVSzcOpHzAIaFSdHp7ZoTGY
 G/96VsY4Ek2wgNSTItRFC8E+Dn766b+phQOdj8eYTXD34Kl2wFkaPMob1eKz64Jv9j
 SUWcfLC+7TzCZO/8xIX1rrtFBbtEGB6aSk7+ao8e8Azt8itr3UGa8XwxF9ba6Q2XPW
 S15lvg8aNuUuA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Oeg7m3LB
Subject: Re: [Buildroot] [PATCH 1/2] configs/pine64_star64: update defconfig
 to use mainline components
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 22/08/2025 10:11, Thomas Bonnefille via buildroot wrote:
> This is an update of the Pine64 Star64 to use mainline Linux and U-Boot
> on the model of what have been done for the VisionFive2.

I have just seen your patch series and realized I've recently sent
a similar patch here:
https://patchwork.ozlabs.org/project/buildroot/patch/20251104200833.4095436-1-ju.o@free.fr/

My initial motivation was to fix the build failure. Sorry for the
duplication.

I think the biggest difference between our patches is that I
use defconfigs from upstream Kernel and U-Boot. I also switched
the defconfig to use Bootlin external toolchains.

Could you review my patch to see if there is anything missing
from yours so we can merge those?

> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
