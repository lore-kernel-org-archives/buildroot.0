Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A68C001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 19:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C44806114A;
	Tue, 15 Aug 2023 19:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C44806114A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-doXLGJmccZ; Tue, 15 Aug 2023 19:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DC1260B8D;
	Tue, 15 Aug 2023 19:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DC1260B8D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A48AD1BF239
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 19:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D2F081FFB
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 19:38:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D2F081FFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4yxvoOaIy6Sq for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 19:38:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E38F9812D0
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 19:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E38F9812D0
Received: by mail.gandi.net (Postfix) with ESMTPSA id F240020004;
 Tue, 15 Aug 2023 19:38:17 +0000 (UTC)
Date: Tue, 15 Aug 2023 21:38:16 +0200
To: Jamie Gibbons via buildroot <buildroot@buildroot.org>
Message-ID: <20230815213816.38960e1e@windsurf>
In-Reply-To: <20230815100600.297932-2-jamie.gibbons@microchip.com>
References: <20230815100600.297932-1-jamie.gibbons@microchip.com>
 <20230815100600.297932-2-jamie.gibbons@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692128299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7ZS62zQu8SGHUOX6NXpP8fkSx8VrbzM7ylNaSJjubE=;
 b=k2L2caD0MQdaRLFRP7GVbe/WxjqchZ2FRtN9DAS0vdtek33KsnFDVaBC072iAZpX3H0ZeO
 XyGH3wfR8kN5zwlqVoX4qSzzu9EtTH1LJ2NpkQMcTJhWIxAV+Tzm+GxaIYyfSbSGoeMGvq
 YySmpFmzVo1Jx2XHc+/1zftHXhDttm5SwOgn7Kb+qyfUdacQi7cjub7F98jYyfWKMubOvM
 GY26xk15NPZ6DhXEnLmlz8REbyIQRLWajQY2BbimNAt6uHesHlN3SGPg6B/azU7BDd3Ves
 MFrOCO5LPla58mqpz/ZBhOqG6fxzUibHONMTebySNFPfSHbI17BxMbBXTO4/rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k2L2caD0
Subject: Re: [Buildroot] [PATCH 1/3] arch/Config.in.riscv: update
 instruction set ext
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 15 Aug 2023 11:05:58 +0100
Jamie Gibbons via buildroot <buildroot@buildroot.org> wrote:

> +if BR2_riscv_g
> +
> +comment "Instruction Set Extensions"
> +
> +config BR2_RISCV_ISA_CUSTOM_RVC
> +	bool "Compressed Instructions (C)"
> +	select BR2_RISCV_ISA_RVC
> +
> +config BR2_RISCV_ISA_CUSTOM_RVV
> +	bool "Vector Instructions (V)"
> +	select BR2_RISCV_ISA_RVV
> +	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
> +
> +endif

I believe this is still not correct: now those options are only
available for the BR2_riscv_g case, no longer for the custom RISC-V
core case.

Those two options should be available both as add-ons for the riscv_g
*and* for the riscv custom cases.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
