Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90D4CA5FA5
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9E4E8086E;
	Mon, 28 Sep 2026 11:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mhOurXDIKwS1; Mon, 28 Sep 2026 11:37:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CDDAD80805
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790595437;
	b=Anrq/siZTuNrpwJV545KsQzzVk/hwlJ/U7kBDP6ejvreEN0X3/PRHhddQXQiSb1kXDty
	 tk05u1CVkE3koUm77TivwHVX9BzeIu8LJWTuVKd4NB5sPlAstLY9DOv7THB/1kUm2bwhu
	 G5ZcntgWNiawFSREGOmjdbnuosB2B8lsszhmXJTv5g0vTqRL1jFtqMTs/8o5DPeDitPgp
	 3+/IrLuoVAWlajHpoyd/iXiAbifJUxs6X/C/uXLqGFZ+4lSzfAUZKYC1dd4P1O19eo9hp
	 R5eZFgCdBDePHhKp7kJ2UnE9QxytgNg4HBYBZp6FPFdBRn9JG8EIGj1SIx4o9rEQWvQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790595437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tzrU4vkylze/7AA30WbrXRHjwUj5D3V+hlXuFY2BJGE=;
	b=s52Y3dgamoMzVpI+X5S+WVE5e+mV5rCNUM1eSg/rdBvSVR54Zlqn+Cv0KkXPPfSvqTyU
	 ngrrd2nhfH6zA4eKqleZK9Fjfc/1ox5ZOj9Yt6pB4p/ScHSB/xJMjVsKEt1nU27wOIdwB
	 pO6CrjtxyPf27JHjQ5NsAabxeaND1WzleL98oVtRMj33LN0iq9Yfp3utkrsw/32HuGeeI
	 1h57GfPhUXoT6mipGXvxJiKWQdzebm8BK7+Jh0lRS7i6muwHdPxzwQpNDreStsdzYr4Cx
	 aklx6xkS9+OpdtxpyVCSrpGSVQzmemhPcfdjsKrLn8r5Uwot3gjQT3Z0Ubo2CELEckw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790595437;
	bh=tzrU4vkylze/7AA30WbrXRHjwUj5D3V+hlXuFY2BJGE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SNH8ikboe/c9BQoys7xXqOqnhmozDZxkvIW/4jSAsgMZOMFc4LVyH8G4ORSBLvT4e
	 unu9flvKSIHKfp4Em1auEuLUBAoCDb+RhBI/KgqMG474t+zT3gmpuvoZgSftcWmJt7
	 ae2sNqHCtrTBha/6gxFy0A6tFqAcu5njaXdw0sy5ZABhrMVQwn2oL89/H132HMC1Cy
	 XRfCVDR/6NXqz12nW/MLO46iarRN9CPFiS8rbIr4mu5u4BfeoiZifu+l3+aLUoo56X
	 lkBtLcG0hoLj3ZQYVCK67fjo9tOfjW6++lbu144IzmMDIbxNiZqq6eQU3vnkg78RT4
	 kkmu7SbpeTZ6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDDAD80805;
	Mon, 28 Sep 2026 11:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74D9632F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B3D8400DB
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:37:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKEwWJwYlaha for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:37:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E544640063
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790595435;
 b=B6d2KNrZX4CpOfrECQ+DcwT+LIozqNA66MQJtCKPfxKjm2RhkWdVmW0TYmdWMqFoeyJb
 w8z/Is2KeA03Ojcm1UyQB+esnUyVhsPaBz+W9CUeUGwX+yTLIytjbUrJvp9cegv3q2tN5
 aO20s49cs59D7DABVzDtt7Uj5Z/mBTmyIbtt4rKKR/Q8awLYLJ3bgg+DcqzFYlGzoJX36
 EPCpDsdwQ9hag/XtnI0CyCDf+01p2GrM8Y1u8qMPbBZo8GHHDiyrhX+AeSl2R6uLz9thI
 X2LFcQ/HiFHQHN2ckw92Om+bxXI01/AecNj2jQuqSEk5Oq3GLS5yc/DRkVivocmGPPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790595435;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1dra0iEXokP2KCmw/XHFZk8euG/TxNN1QlYqIG3++78=;
 b=TvZUXTNomQ99yvseZ5TzzNt0Gwr2TyM/zvWHgx4DXgA/6SiWSwPklz2iNJFhyezquCq8
 qoSBwPFH0JmP/D5Ybq8D8voIca1aqwbCaZdnhFskuTal2JmGijnJVwGhSar/9GaI+BgW2
 YStq+yoWFLZUH8FBV2ZD5DnDXS+goFG0VVTmcKpGInvglSXgr7Pe94oywP7Pv8hvR5hoy
 PYkH3/61yeAbvJm9SvKPKypjGJPgYy4aVGiz6d9L5pylAgZLqocyBLPJNDhQaqi+WJIG/
 ljO6iiuPN1uHB+4cvMcqJDHt69U9fwYv79nb2+X9O8vMWPoLQ35Qi1tCe+qmLeBTp4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Uyv4SFn4; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E544640063
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:37:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C3B944E41025;
 Mon, 28 Sep 2026 11:37:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8813D601BD;
 Mon, 28 Sep 2026 11:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 431A2102F1E82; 
 Mon, 28 Sep 2026 13:37:03 +0200 (CEST)
Date: Mon, 28 Sep 2026 13:37:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Bis <marcin@bis.org.pl>, 
 Robert Rose <robertroyrose@gmail.com>, Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, 
 =?utf-8?Q?C=C3=A9dric_Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>, 
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>, 
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?utf-8?Q?No=C3=A9?= Rubinstein <noe.rubinstein@gmail.com>, 
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Zwing <nerv@dawncrow.de>, 
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>, 
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>, 
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>, 
 Sen Hastings <sen@hastings.org>, Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Message-ID: <arpROa1r-gyG-ub3@windsurf>
References: <20260927104301.1801638-1-bernd@kuhls.net>
 <20260927104301.1801638-46-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260927104301.1801638-46-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v6 45/82] package/gloox: Fix build with
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

On Sun, Sep 27, 2026 at 12:42:23PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've applied to master, but I agree with you that upstream seems to be
dead, I couldn't (easily) find a Git repo for this project. Since it
has no reverse dependency in Buildroot, I suggest we drop this
package.

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
