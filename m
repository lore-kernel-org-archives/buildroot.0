Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41D9C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C4D40659;
	Sun, 20 Sep 2026 12:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-c3yoQRmot6; Sun, 20 Sep 2026 12:40:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B400740BAB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789908052;
	b=c2SOrs/sRa6oTm82Zp8rVf3jIfJUTdl3XkNno7LtIZUkq3qgSMzXOaRK+/JF05QyX5kl
	 hLzcanadYC6dWOMSa2z0h40IGT1yHgPTVHYLN0U9lBtFfOvz7j8RYnPjRuDMNGNWVSuKE
	 8LWSPVgaK9P7L5ctaH/1TsdYDO+RmD3N69SaZH6WXatTgyBoUqMi0/KNiBVp/lPFc/29O
	 qW4n/AY8bxUGx2nz6Ehb43injX2uGXrUcIzbMJd00wowoJrU+YDY/sZsfrMI7ECkgr60z
	 z5lvKcYf6xzqYkGTMgkzrn3lO3RExqIvYPAcZf4W89S2LBI3lpLkNZxEX39fRL5TMFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789908052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=1qJNH+78BQ4tR1KtgCSgIKUEABMnqD2YVnklUMuprgs=;
	b=oYZMK3ur1MMvX0vFqf5PtRFKZGgqcO3Yv+g9ANqWz8QoANbvlpoFxYq5YRHwiJaTcAmv
	 +Fr4MS4wz+07wFNu8/IcYnx1I4p126pcfR4vA6lUD9JRLsdaVCDohiXChFfSl8fdL3eRD
	 cvONE2d5A5oEBbnMGoWy1n6nI9n+jl+KvryxlJNCiYED0+NjlZUwBz+izFsnBkDXqp3kf
	 lCkAap4AqaBoFSkPGXhpWd5Y2cKkDK4D1OSHPiYCWWmGTLJzvoJZQU/Xo/hTTFvPIgH3k
	 I8S3eQH2985kLQGIeU48XSEl1w6qMfHdLVdu6Y4L98+LeCqND5xz7ZLElYieO9pin0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789908052;
	bh=1qJNH+78BQ4tR1KtgCSgIKUEABMnqD2YVnklUMuprgs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r4dUaJefPaVt8dM6TpdXQvx2Y/Mpa3+rur+5OvaaZYekwMbtwA2bJx0N0deaa8xSp
	 dAi6Jv6z13Z9+8zNIntRoO5csU+Z+jMgcv1X/9yPKu4ZssyjjOnmuWqcrajWHTQSUQ
	 9v4lC1QlsG6IaUHIatdp4Di0vNYNY/eidwdM0MMf5i8SQuJzcGkpgqm2/EIWquBTDP
	 CXTiFUvz29eEuHOxyfhRKoPxOjT5CnT3QZvkmgBtGaRz8fKSCCdhE7DLAAzhKnf0BD
	 UAOdIcuKPbxbT7ybfzcFycDEVDMExOYBJk/GGqBzAdC+TRixElfP+vKb6crsoM/ZNL
	 F01pijc2gsZ7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B400740BAB;
	Sun, 20 Sep 2026 12:40:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18EC9371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A80780F15
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wHuzQoYhVfB0 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:40:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ED6F980F09
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789908050;
 b=OVbrBVUosuyzZv3RYNU/rSi8xn/rkzazW+WP8nD+Y8B+dqf0lVF94+F6pgWssuHiuoqX
 5BJOfbx7C4Yg7/4lL2Ado+ppG6aT3Pco821G0kLgVLX5Hy3nAoPSyYDtR2qNTekjgJ2z5
 ryAecCulOniR8Lgtk+VGeUnoEYfCSfDMjWG4n0j2sR8JCz2ZNRFEfsxkmxRyy471a7SZc
 xb4lawe2HJld0mHnZJmKV5+zv+hhAIC366u8hC+NzzCva2tuhumH+ebgTbpiHagg+q7zG
 KeyO89W+LSpiG0zcj0EXp+nXRTS8jrCTOrQnmDUAZL/EnPPeGJKz0mYlgXzMvPq+uRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789908050;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Ipq1Mgp5Ec1thfDVXEJyZcrPLw/M9CdOblrhuJ/cweE=;
 b=HUZvaZeOAITNwwAKaQxbbd6yuH3TzuDKsBSOeUsl24j/qNmclD3ct8hxPOks6xhbF6B+
 n3ru/gYmFt0OWC5Ef8kyYByV3b0rnq+IzSjYhbqm+GzOIEOTSRQVFbQjx897WRCV4MwUG
 06sfHXIJeFSfGb0gVygkKAV+C1173Vn+vFFNmL0ZfswFfuiY1XbnHIxJQn8YC2vXe/TKY
 x4jZpAXMKXrvZE7aU2HIbQw6Xy2haHqZmNlvIzgp+6MvAt0EuvUFMCrRfk2RyxoGw44aU
 4JmNSpVGLlH2SgnHuNFcdIA027lmDss9XchB1Zlw7hY+AlLugYOtxwoYm9xmYc6iNqQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=aWvXZ+83; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED6F980F09
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:40:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E4EB5C5CD5C;
 Sun, 20 Sep 2026 12:41:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 150F8604C9;
 Sun, 20 Sep 2026 12:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 00CEE103282E0; 
 Sun, 20 Sep 2026 14:40:34 +0200 (CEST)
Date: Sun, 20 Sep 2026 14:40:33 +0200
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
Message-ID: <aq_UPXNhH2FW6e5-@windsurf>
References: <20260919155845.5776-1-bernd@kuhls.net>
 <20260919155845.5776-7-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919155845.5776-7-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 06/77] package/libcpprestsdk: remove
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

On Sat, Sep 19, 2026 at 05:57:31PM +0200, Bernd Kuhls wrote:
> Quote from Github site https://github.com/microsoft/cpprestsdk
> "This repository was archived by the owner on Jun 1, 2026. It is now
>  read-only."
> 
> Building the package with boost >= 1.89 and OpenSSL >= 4.x is broken.
> To not block these version bumps we remove this package.
> 
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
