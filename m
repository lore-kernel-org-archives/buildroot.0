Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4E6CFA45F
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493EF60590;
	Wed, 23 Oct 2024 19:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sXV0msGpj3G; Wed, 23 Oct 2024 19:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3482C6062A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3482C6062A;
	Wed, 23 Oct 2024 19:13:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D4B9E27ED
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E95404BC
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qq0GIq00tSqF for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7537940153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7537940153
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7537940153
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:13:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6A7D40003;
 Wed, 23 Oct 2024 19:13:03 +0000 (UTC)
Date: Wed, 23 Oct 2024 21:13:02 +0200
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: Niklas Cassel via buildroot <buildroot@buildroot.org>, Niklas Cassel
 <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>, Kilian Zinnecker
 <kilian.zinnecker@mail.de>
Message-ID: <20241023211302.7e9a32a1@windsurf>
In-Reply-To: <ZxlB1N_gyS4wEhXL@ryzen>
References: <20241016132443.3859149-1-niklas.cassel@wdc.com>
 <20241016132443.3859149-5-niklas.cassel@wdc.com>
 <20241022225040.09c4ca7c@windsurf> <ZxlB1N_gyS4wEhXL@ryzen>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729710784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFkhTm6eia+vluiXoXGTvKD0NWbkrt4QrP3lcDIjhKE=;
 b=VhT2KE0S2B97ENEXk8w1NvP+atj0q13XElDYMXIPglNK+11GTxDR1jJUKs7m2KxUr54W50
 Lho3VaxO7efqR4o997Gj1KdeLUm/tGmwqyadBUru+0QR8gEdOMfZo4Wdpm4wzt8ry6ucQH
 KrAmmFa1xWwVHjiaf3R2faPbHkFq/UF8xIISVWmC1McfuVDswOtnI/PRXavNrXsmwsexPS
 IrENxBLh1356e1a+vsqnliEu6B7xOIWCPYb77gRHvj73T/O4QXY7iHrNUmwjUrzJ52HpRL
 O0a/CuF2gxjxss6xztrbnvCu7RLnqobJCdGm26w7olA2nEtB9VjOEXxc9kDB5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VhT2KE0S
Subject: Re: [Buildroot] [PATCH v3 4/4] configs/rock5b: enable uboot-env on
 the SD card
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 23 Oct 2024 18:35:00 +0000
Niklas Cassel <Niklas.Cassel@wdc.com> wrote:

> I can't use CONFIG_SYS_MMC_ENV_PART.
> 
> If you read the Kconfig help text:
> """
> MMC hardware partition device number on the platform where the
> environment is stored.  Note that this is not related to any software
> defined partition table but instead if we are in the user area, which is
> partition 0 or the first boot partition, which is 1 or some other defined
> partition.
> """
> 
> So CONFIG_SYS_MMC_ENV_PART is about specifying a MMC specific hwpartition,
> which is different from a GPT partition (which is usually stored in a MMC
> "user area" hwpartition).

Ah, indeed!

> I sent a v4 of this patch that uses the uboot feature which automatically
> loads the u-boot environment from a GPT partition which has the
> "u-boot-env" GPT partition type GUID instead:
> https://lore.kernel.org/buildroot/20241023182509.2808544-1-niklas.cassel@wdc.com/

Looks nice, I'll apply this solution. We should use this more globally
in other defconfigs!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
