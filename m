Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD29C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF3140BAD;
	Tue, 16 Jul 2024 12:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jy4v93aLmZgL; Tue, 16 Jul 2024 12:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14BFC40BCF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14BFC40BCF;
	Tue, 16 Jul 2024 12:40:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBA11BF38A
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C37B402DA
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MUOU4APLOJaU for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF8C1402B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF8C1402B1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF8C1402B1
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:40:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC94DFF804;
 Tue, 16 Jul 2024 12:40:30 +0000 (UTC)
Date: Tue, 16 Jul 2024 14:40:28 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240716144028.2bacd094@booty>
In-Reply-To: <74d09502-f6aa-40c2-9f06-de5b25331a73@mind.be>
References: <20240617-uboot-default-env-v1-1-9ac88f0e1789@bootlin.com>
 <bb557f20-2d9c-4b1b-9b33-4072d41fe129@mind.be>
 <20240715155144.227dab3e@booty>
 <74d09502-f6aa-40c2-9f06-de5b25331a73@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721133631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itCAf8j9cHyCAoEtVtpINegZJ9GTWYCSZSd15xRfWf0=;
 b=Nk3TAyDSjxVXtApH4iPgbDj93GhdlP3+BmEl8EyX9V7cKjp0JOVaPbCeXtcRuxkVinckry
 Dug7Dzjz5p1JF7uKaRFkW1TJvJJ4KLEXildCSJwzLQT0hHT0Nl+nSoCK3VlUTYblW5vbFF
 95nfKlcrlvb2tNM2jKNz1O1fR5Cc2iy7KZ4JYO/2XXdCXtEJr/7whu+TKClCvc7O7U75xC
 lWi01dzEWiAW5VilVFV/gTTJcwCgLSZ6IHxdUgOXE8iFKc2as2V7bh/Q6as34XmhixJUTn
 zIRfEMioXhsS6kZPrans7m5PsCk5wEEqnqq9Pm5Qg1mueGk0zIVkZSlIRqrBGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nk3TAyDS
Subject: Re: [Buildroot] [PATCH] uboot: allow taking the entire default
 environment from a text file
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: =?UTF-8?Q?K=C3=B6ry?= Maincent <kory.maincent@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

On Mon, 15 Jul 2024 16:49:38 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> On 15/07/2024 15:51, Luca Ceresoli wrote:
> > Hi Arnout,
> > 
> > On Fri, 12 Jul 2024 11:23:12 +0200
> > Arnout Vandecappelle <arnout@mind.be> wrote:  
> 
> [snip]
> >>    I think we mostly use `` rather than $(shell ...) - with the backticks, it's
> >> much easier to understand when it's going to be evaluated.  
> > 
> > I did some quick tests with the backticks and wasn't able to make it
> > work, but if you have a suggestion to make it work I'll be glad to try
> > that.  
> 
>   KCONFIG_SET_OPT adds double quotes around its argument, so backticks will 
> indeed not work!

Thanks for the explanation!

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
