Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7EEC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52DA98196A;
	Wed, 27 Jul 2022 08:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52DA98196A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqSuF1-xiBgM; Wed, 27 Jul 2022 08:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DAB88186E;
	Wed, 27 Jul 2022 08:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAB88186E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6801E1BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13CD56066D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13CD56066D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdD1kkspKUt4 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B3E26063B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3B3E26063B
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:24:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C03F1BF207;
 Wed, 27 Jul 2022 08:24:15 +0000 (UTC)
Date: Wed, 27 Jul 2022 10:24:14 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220727102414.7a266341@windsurf>
In-Reply-To: <20220727075826.GB1085273@scaer>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
 <20220726163951.2111731-2-thomas.petazzoni@bootlin.com>
 <20220727075826.GB1085273@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658910255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bi0rD6nRlN1ErGflChSpfA7xu7cXdqunxpPPfYlrnw8=;
 b=FEt+xaiN/G+lpukwGK+EjqZCCCbg4JiGZAXT30rziJv9r6P+mWw6wR+TShNHtdvhN0sTYd
 FNHQSgZ8L90SvDsdbqdw+0QKDXpm931IM3cfHMUhnIbMsXiadQWg2eC370mCfXhkNZMtnN
 3PfgiqU6+ppRM7UlBgATAF/xS/UkOQOH8yNjsmFF2rfb0isZ7EaQGilQ+w5ZgBqPzjLunX
 a460FDEEfPsrlNJ3C2o3fsKN1J0sVMwG3SG2/Frtat0h4BSPx881MnM3vIHN989mKUoSGJ
 FjMSC81HJt/hO1ObedvP7wr4Yu879VSehJ36egDcpFYsWyB7cHN7OATreBBKtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FEt+xaiN
Subject: Re: [Buildroot] [PATCH v2 2/4] package/Makefile.in: add detection
 for the lack of C library
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 09:58:26 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +# This happens if there is a bug in Buildroot that allows an
> > +# architecture configuration that isn't supported by any library.
> > +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),)
> > +$(error No C library enabled, this is not possible.)
> > +endif  
> 
> I've moved this as the last else clause in the fllowing conditional
> block (and added an explicit test for the else-glibc case of course).

Aaah, yes, that's even better indeed! Thanks for fixing this!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
