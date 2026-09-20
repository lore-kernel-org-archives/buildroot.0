Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EA6C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 652644081F;
	Sun, 20 Sep 2026 12:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBAmxWb4ZSgb; Sun, 20 Sep 2026 12:34:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7C5A440B56
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907649;
	b=tE4EWdfDYY0eP8++4i0FsHp/g2J8x0vsWVWq4DYq1vWXr0a0w8N4cj29n49IlsTuZnEw
	 K95ynkETXcFoMW0Jb8Crur2mtIkngN8jcloz07O27e2vSREHQwTP2AVAsFB01KZZNjNvM
	 Pdc4lCnxwj3+dj2ANI57zFWGGVeQI+/v+ddGAFw3BL9o5JRUmbBM25Qx24hN66l8dTUI8
	 vGLkX/1kq/M1XnGPOPv+NOAzUNmYoDym2NZ46PN32OVEM+CZoSTkpx+QyI7Gb/9DuuD02
	 93FlpwVJO0hxROuWOgRN9mdeE537eNWyXxzcq1CANQnoYQSgxcB/TRMFcHRsWiGYwQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907649;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZE6abnYpba4WUldTNTw0vuUqIKwfeHQRtPmDFbfABEw=;
	b=Co0TNKOcp22G/cl23EyEl6HaeuUMYQ5rFcdujcPasMuGAIMwYwSJiNZ7YxpVNEBSBQpL
	 ZMlFIQ8sgx155xI0zNr21NrvUFoTBLGeAgXHoYXybrIUsgfrXd9ARhFMr8MpiqKvaQNAE
	 Z/7IMvsJVvjoH8nqhLQ6LmJ59nXWhmvcG5ZHnfZfKTWuMNQ7DtGotP2gXlfD6mY1KA9cK
	 Y/iI0jgDvPPqPdeYcr9ab6gtw5g+wAtaQHbCiEfy9tlE1VCwyk4pEv0LiJgcetuvXNJmG
	 HXrL0EObzb5N1JV7I1MTf34tDVIlPH9sN9aE9s73h+kTAsLHcBWCyGU9mS0bm20D0xQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907649;
	bh=ZE6abnYpba4WUldTNTw0vuUqIKwfeHQRtPmDFbfABEw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YA3+dYiiLzbWpXlAHlyU+fh534V98vDUdk7tNub1uDgzcXaAO1i1ynZl2Y8r1taGD
	 IPte5WLsJoY5PL1tWNHZVJOcDxMfflLJXE1iAroBFpZceGiukOxlKrET5PijH/hrQu
	 fDcwhhuckdh5qSnH7OU8WWcGqVbO2RfQq5ha9K638TnNq3CrTdhmR7YoqtN5l/OPIu
	 CmpjDVFD5RR7OnQily+ZAK23VUCyvMff+ub5iDfRgRNt8UOUNc4YE1wsnqRQoAoAL9
	 Z6acqmcV8GRozP7I6qfxQM6xEcsb6h6NysmQFmZ9ETnMAM5aIo4xivRA9O8CV2V3+O
	 RRqaG4oVM4m0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C5A440B56;
	Sun, 20 Sep 2026 12:34:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 191CF224
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ABDA80BD7
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCNlwhJe4vcc for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:34:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EBC4580B97
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907647;
 b=d6KSJbR2xWYSCaQMhADLboHiZ+ZqvtQBBEzxo2ccKCHcWSaSAQnwZjd6ZMcgV7l5nPji
 jk0R1VpHsOD+x+F6hD+DPrtEZs8vqjbHM8DcGJq7x5AFr1rNqFVxQr7OT4YCgBbF6hOyW
 v4NQcd0HToG4ldonrFic/emLshRzyMRcKLedQYx/XhaAIAgAIDBc3aX026IWMnWbSoSEs
 uKrnKH7i5m/266r641cpCc7Xc5zoUziJL6V0Y+AkFiyOKnupUSjTYBFmcslZyMzKmAlVb
 COnB4Wsv3UNhnu5CfTV862xfy7QqPUXFA7VPKwnsS8y+F3XtBraXRLNVG3pImuFJdIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907647;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=SF0VpEYk0Wi2T4vzO1PKXyGwSyQn3ZSbKUIz3YTNpZg=;
 b=ABLg7nBRuiBTaD72Dw4Ot5zeiC70CW/U06sGOoomydebUDnyxJtkNhJW4bSs/6eL8b2v
 xR3kaLYrA5vhfovfgnDWxOuMwFtDcWnRNQ7ZQHmCIBg0pM3Qp1dGLa8eTS7CXlp0jGp12
 kxAEwwWun3/a9Q44cNeH+uz3ZL70WkEQ5w5rnCMYtXhuPc1hRXwGUBC58er0NSOnnDjdE
 YuLAdxGV7qcoqFJb+JW4AO17D+zKTKaZLN7i1EcJeqTaZXQBCdpFwlmR6GljAnOvOrrlc
 wrvHtpVqtUHe/nEPifAm3RM+CeMeFm1TFV1gmFa+9TcZBQRZTewYFt7SDOWnyWAwVsA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=prSFWGlS; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBC4580B97
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:34:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D643DC63455;
 Sun, 20 Sep 2026 12:34:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0BA33604C9;
 Sun, 20 Sep 2026 12:34:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3AAB103282B4; 
 Sun, 20 Sep 2026 14:33:55 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:33:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Koen Martens <gmc@sonologic.nl>, 
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, 
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, 
 Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>, 
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <aq_Sf9PzDqIO3olv@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 02/77] package/heirloom-mailx: remove
 package
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

On Sat, Sep 19, 2026 at 05:57:27PM +0200, Bernd Kuhls wrote:
> Building the package with OpenSSL 4.0.2 is broken:

Thanks, patch applied.

Last month, I was looking at updating heirloom-mailx by replacing it
with snail which is what Debian has chosen to replace it. My WIP work
is at:

  https://gitlab.com/tpetazzoni/buildroot/-/commit/72d6498f9531234f51e0a03eaaf3d9e3799dfd2c

I don't remember in what state I stopped :)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
