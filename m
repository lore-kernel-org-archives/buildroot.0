Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A47C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 13:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6E540A72;
	Sun, 20 Sep 2026 13:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PsxZhhWLkjWu; Sun, 20 Sep 2026 13:04:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2896840CC2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789909472;
	b=PKMb53XAuireufULPSVrNk1BSgxJt1CvUJ4RI6KXRBUcEe9fTOgf48eHZXwPyGcvN6Tt
	 u+G1KxqGE9EjeJLLXP3lKo6VLlfP+oJ7MdImG+/NUPwej3SySr9Bf7EehoWOHpqZK1JYB
	 nWB9s9NWG2DI1o1suD1kVVlwVAkC96zYsl8p/D84+xMoi/lnsTbWCFx+M7L2WKS+9m93t
	 PVnXg5oIto10H+joR2qyVIR95WyBg5edn+OgUINjR2chTIeLMIX67J3Ov0lZsN5sjCN77
	 7/PDD5DB5o4/QqjmhKN4fn/Q505k1hUnVwA2eex0w7+n+yozgjsMEVS+RKuzx6nbgsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789909472;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YcPGsksYixA1UeAcYm/UPY+H5CEXnaDxk+PBvaBI2ww=;
	b=X/ysSRA6ZleKo+0eIws5Z9KqURfRtklaw+BKzr+8aADJKmX17ARVc7vw1WBvzBqi+eGy
	 JDGnPUEfb291e3OptOeenH6lfL/ALtCTpyhummn9kp+MXZud/fFX/3TbbtjsO0F40B6jW
	 QVcibs+XxRcG2RleYT/C3yvRxbaVvz4a6gd9F46DUNg4artFVaM1fqk7i0sqYs9Agr6t1
	 lgA5V8Nh/Z2M9/eHqgy8oqy8eDkJMsm1gLLIcFYIODg7KGIRPa1YJF2qw9rLLjUriYByW
	 +ejn7g9OoiVw8lajOhUEVv+iFIBnrGa57/UHJsxT4DETYJqUtk1SgmCVRKFVYFQQMcQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789909472;
	bh=YcPGsksYixA1UeAcYm/UPY+H5CEXnaDxk+PBvaBI2ww=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IHMUmQgzmWQ841E8l1TfzsVY3FUG0yuj/46z9eDU3NCN2kLgl3uKsMoH17S1kqW82
	 ATfEPETcjHyM/mUjmigfMGKsktzs3RJq4CRLBx46x5EBUF2APx7QL8fGJWG2h6RRLL
	 k4zU14CxnNegRx8gFV/vUxgWZOStMiiHNeL9DlX+N4DEBCVrMKnzn1yIiksYJPioKc
	 mO0UvHYgA4yLY2oZOlcjtOa8pNwFzb5qrLkX6X/nHFGyWBVYqY4tOGAk5WARhSiPeh
	 EN3u/YQU74TWzIiId5Ez1Sxh2nD/do5rTOXU3x67B31/1a3amt0tTf5Gxxw/cMu5Ny
	 MNJO+75nOtaZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2896840CC2;
	Sun, 20 Sep 2026 13:04:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58A713AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EECF80AED
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nuOrUS1OWiGQ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 13:04:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3C4BD80E21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789909469;
 b=TegBmtRC4iOAQoSKXE7MvX41mbAK0p4PP7vKsSskDNR3sFYNFM3IjYNvFxWhaaKxcOjS
 jFZOLV2Nv3ZnyqYCgYHNgyEm5zEDMdHmquRP9bCDq10SLokAGhnEreYhEXpA+5nIYnPas
 /+xiu5FpKbk1TTo0L8mv4FhY2XsHKkelk0w6Czhv/vSh8iM9zicGYVANRWT4/96TlKh6e
 dVw+NmPw5KVLbuAhHBqcCkBEz4vtOYif5DHYObtkqPNUk6cYpvs8KRRsatYSFD5JZI0Bn
 AY8BTb3SL5pOWcgoD9M6RYzICcZj+PI6fleszaslnyUeBKiTu2ofqhJUsVUmgc1mgkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789909469;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=msJbI9kFE+7jr5zy5BZmBifb/SAGz/olYyXPfl7ug1k=;
 b=fUFOKyotgPVdHdhGugW/b2l3ZquMYUuMqfifjLoqAiOX/3AbkhAGUALvLfdBEoKK/8L8
 seoA9tRUaAk/IKez9ws6hLFbC22S+/HaPQcc+z9qWTRFnKZiJLVL7tqADSQ/SJYjWdMRk
 +7vaXCXn9GJ16NEN26zezvreygxLm2LIsmmK6yDPqG7f40wwr4wVKFEdlyLnBJ9Af/TSP
 qA7kqtGQz9qC1CUBCrTrRySWqDXFudMQHLTHvJkH5koMCQUwDuf/BOtCrJi3K4u2wAXGL
 B2AaVA6UbFrndHmbuhm3veZTsuregfCd9kERplm+rn0BTmo/uPBawnco/6TtIHa9GPg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=x3qsJYqQ; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C4BD80E21
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:04:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id CF3CF1A09A4;
 Sun, 20 Sep 2026 13:04:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 989A6604C9;
 Sun, 20 Sep 2026 13:04:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6BEF410328417; 
 Sun, 20 Sep 2026 15:04:17 +0200 (CEST)
Date: Sun, 20 Sep 2026 15:04:16 +0200
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
Message-ID: <aq_Zy-7ox26PJbkq@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-14-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-14-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 13/77] package/libpjsip: Add support for
 OpenSSL 4.0.0
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

On Sat, Sep 19, 2026 at 05:57:38PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
