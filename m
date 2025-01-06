Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB98CE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 21:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEDF080ABF;
	Mon,  6 Jan 2025 21:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_j1meHVoHIN; Mon,  6 Jan 2025 21:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D5080A84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7D5080A84;
	Mon,  6 Jan 2025 21:13:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A2799DB4
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 841286058B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WV7g-jDasa31 for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 21:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6698C605C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6698C605C1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6698C605C1
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 21:13:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 130FA40003;
 Mon,  6 Jan 2025 21:13:03 +0000 (UTC)
Date: Mon, 6 Jan 2025 22:13:03 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Bryce Johnson <bryce@redpinelabs.com>, Suniel
 Mahesh <sunil@amarulasolutions.com>
Message-ID: <20250106221303.40b04c08@windsurf>
In-Reply-To: <20250106201720.3134534-1-yann.morin.1998@free.fr>
References: <20250106201720.3134534-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736197984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=puR8gUN1z9bJ+Krmh9A9jJ5Mxemfb8pcqIedpWyXu80=;
 b=JLvIZw0U3Zk/qTw3mwTeRGmFVtoN4Fq2Sw/lVi4YseJif2tkhEnR1AkqTwVEni+E1Uh4X9
 S5KNA/QCXjZI63l/InpSY4iwX4F3LZQU3kk7Bexzvc3bn64/r6tasmk3CZcsRvUTN7mg+U
 lR92sdZi5TE3djeNjfvGdVgo6tU+2L2qBsD8Ho3AgaXTfpajhx6GOpV7FJ5ySPQvQPfeBg
 Q0ODfntC0jHBk0ZnyF6H5Y8NrFODjW2g9cRllLjzaS3OcYinCciW2VYzpyxQS/RXeh9yIJ
 FHGUxEFWaJ8KMk6m34gh/phloA/VcVdyuPoMvz5WlsKIpoNrZSNOwAPBaou4tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JLvIZw0U
Subject: Re: [Buildroot] [PATCH] package/arm-gnu-toolchain: drop prompt for
 _SUPPORTS option
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

On Mon,  6 Jan 2025 21:17:20 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> The _SUPPORTS option should be blind: it represents a restriction that
> we certainly do not want to allow the user to lift by manually enabling
> that option...
> 
> Fixes: 65f268e21cbe (package/arm-gnu-toolchain: add
>        BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS)
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Bryce Johnson <bryce@redpinelabs.com>
> Cc: Suniel Mahesh <sunil@amarulasolutions.com>

Well spotted!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
