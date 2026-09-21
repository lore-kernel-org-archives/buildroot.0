Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFF6C982ED
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 16:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEB8940B5A;
	Mon, 21 Sep 2026 16:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqX2wkhyPsFt; Mon, 21 Sep 2026 16:38:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0D5EB40AB4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790008727;
	b=g/A2kK8xKI7WhHabuV6UpLyhUExMfSxC9mYHQCWXBG7Xk63eBc4LIX5CrxkvrTIRpp3d
	 2clog7MFWyxBjkj3yNBAvoYVkoUirnKhTudmH3sBKwsoBWUl+N0+8DNzAi+vjaZy1/qXG
	 vT2TWwne9e3PbzY9kwcgLKd5iY6rSMH8ctYvEtOwdqlKyXb8nTPvlC2ezuRsrnmBFb077
	 6t+QQDmYdc59PxY5NS/Dm/ez17E+ieokejDWfosIknyaM+aXmbioiACzb9YdZFsVSmDs4
	 KJs4aXPmrQzl5ChZAl1/228XWefe6k4xwGyxLyyf480dyi3lyOrRWbLjrfvUdqtziTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790008727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=73hv177nmrFBmhcE+34Gwjkyhnfy8WHZJlCCcvfFNOc=;
	b=LpJZVnA5Uov8ZtdU4OCYlPuax1N4ubiGMuHiPPQ4uHv4ItXJSxA+vGCT4H69M6bM4SR4
	 2UjuOYT6ACm1IGnAdHWJlG4TfsSnkiPjwG+tKPbRFJOzEPU/Q+6hf838Np66x/V8PkK1J
	 2dJ0M39c1Hl0C2CK8EnE3tjyMgqxlSNWc6OBqor9Xk41z0SiyzIU/ualOZFZIfiO5yDeC
	 36pLnmt9Fj4uOh3otKK0PtOtAf+JVTpYnVu/MesuE88ljNEdqdncawgxuw67QD+oyBKIy
	 g66hwCzxoX5jwXh8bqnLoDNnJn8mo7UXOLABPZuHb4MPNt4C4j6ynlvv330Magc4BAg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790008727;
	bh=73hv177nmrFBmhcE+34Gwjkyhnfy8WHZJlCCcvfFNOc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RWQVzV/1HkFgyEo4orbqszGyCQk9utlWkysW+zpFhDEriHYd6v9VvQYxSQZ507I+R
	 IMgL3BYin6zWpS+qjs3yPNYImmbcANVJGmkhXLvc5LjrdPkEZPYYtJhmXG+Y0Gaerj
	 R97km5ccnMt/CXHcEZk8fU9Jo1ZcR3g9vqYH03wVDfH29p/EO0rX+sC8ocNGPNi7G1
	 4hD37BnVgZC6yF2TcqfelRTFE+sr2WObxPj4jxVVwwGGN0UKZL0ngxO1fK76vx2i+N
	 OMUcDH7MKbZC2Bz900j/YWwHvIFIhSHyc1mpBV4pbZZVwceSL8eFHQbuKP0qsdH6or
	 4pEnqTw61CPaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D5EB40AB4;
	Mon, 21 Sep 2026 16:38:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7CB0522
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 16:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8B15401CA
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 16:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PmPex-5yYf8l for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 16:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 19F09401B9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790008724;
 b=QnT4e8WAuHZomwwl5wn6EpLRuwQf4Ud4vYckACTFnfiY54q57O6Vm7UqvuehutS9e8JX
 BWErIO1VZ3oVcGMDWINbUHKKlP/+GVC5WlStUUsudN19YQwas+RfX11S+kle3r2mUodTx
 e3GOO7yFFF7+tntEK1Z+0ZOyr7/xEJ5czIKel2nDcjem+8uEMQVZvRq/mM/XBmk5I+nxk
 8HD+w1tQdB1JnpT3qT1Wt2OYWNK/hvwyidz7RWkuPYbpgjQFznFFMV5EsGiimPGJr50TM
 ocflnWKHjtxAoKBrjAq+xmnu1f1gsiwLvZRWJRYNFxUqN2uPcgLDCYk4X1mf41xl1ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790008724;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=mCBj+Ih9SPeyRUAGE/TXnxOMqBhJg1RWODrbP9jcnbs=;
 b=GOT0OigkHsvMYij61zlixe6anHE26OGfCaKjjGuTxuA3OpTcrHlhOIYRsPP2n3HiMGNl
 GWyuZedCeYaSiF8J48kPddMJKgbDfPQAcQS7+Bj4kRydTJhgFwiJtZrK+oRq113LuO6SZ
 riwgIa8uACeBzD09QH4Hq7iV0yB+fvkN8lkIrrYR70pL1G9IlImTeiPfgqKCr6ryvZ+2+
 YXz9FxZX5FEd9BN8c7hTskPdkKi6keODHhX57YIFFwBRGXzC95seOtezKJNSEzaLp1zKx
 Co5IPMwTaRRqaDixW5TD5ywyDSk1ce36JKCY55lex6Scc5l9dYE/idBCeHnZj+/0W1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2lFh1lzU; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19F09401B9
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 16:38:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 303CD1A0E97;
 Mon, 21 Sep 2026 16:38:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DAC025FFB2;
 Mon, 21 Sep 2026 16:38:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 192E010328E70; 
 Mon, 21 Sep 2026 18:38:21 +0200 (CEST)
Date: Mon, 21 Sep 2026 18:38:19 +0200
To: Adam Duskett <aduskett@gmail.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot <buildroot@buildroot.org>, 
 Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>, 
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>, 
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, 
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>, 
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David GOUARIN <dgouarin@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>, 
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, 
 Christian Hitz <christian@klarinett.li>, Gregory Dymarek <gregd72002@gmail.com>,
 Stefan Ott <stefan@ott.net>, Baxiche Su <baxiche@gmail.com>, 
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>, 
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arFb6txpfwW2SwzJ@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-2-bernd@kuhls.net> <aq-xqh_4_J_v2lQ6@windsurf>
 <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFSsvmpcYXFia=4TuZGKAEpyciugC5nUn4vM6nYTnAQHG_+G-w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 01/77] Remove mender packages
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

Hello Adam,

On Sun, Sep 20, 2026 at 12:33:08PM +0200, Adam Duskett wrote:

> I feel like this is an understatement. It's better to say completely ignored,
> including my emails to the original RFC for this patch series. Is it worth even
> keeping these packages in Buildroot when an external tree that is actively
> maintained is available if the maintainers of Buildroot refuse to even look at
> patches to keep mender up to date?

Thanks for your feedback. Based on how you phrase your feedback, it
seems like you're somehow taking it personally, as if it was
specifically your contributions that were being ignored.

In case this wasn't already obvious: there is nothing wrong
specifically about your contributions. We currently have a backlog of
700-750 patches, some of them much much older than yours.

While I understand the frustration that it may cause, simply being
"grumpy" is not going to help in any way. What would help is having
more contributors involved in the review of patches from others. Some
Linux kernel subsystems now have a policy that if you want to get your
patches merged, you need to help the community by reviewing patches
from other developers.

Regarding the idea of external trees vs. upstream: it is very much the
same discussion/argument as with out-of-tree kernel drivers
vs. upstream drivers. Yes, anyone can throw out-of-tree kernel drivers
on any random Github repo, and yes getting the same drivers accepted
upstream is going to take more effort and more time. But still, people
(including you I'm pretty sure?) prefer to use upstream Linux kernel
drivers, because of the community review that provides higher quality
and consistency, and the long-term maintainability.

Can I ask that rather than just looking at your own patches for your
own specific topic, you take a look at the bigger picture, hopefully
turning your "grumpiness" into more productive help/participation to
the Buildroot community? This is going to be a LOT more useful.

And I restate: Mender is an important piece of software of the
embedded Linux ecosystem, and it makes complete sense to have good
support for it in upstream Buildroot.

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
