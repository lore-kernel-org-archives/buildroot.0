Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E2CC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 21:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ED96401A1;
	Sat, 13 Aug 2022 21:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ED96401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGfCnhMhi6Sz; Sat, 13 Aug 2022 21:46:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 582234015E;
	Sat, 13 Aug 2022 21:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 582234015E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 642D31BF846
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22219410A5
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 21:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22219410A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mXLpAY6zgaVi for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 21:46:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BA1E410A4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BA1E410A4
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 21:46:11 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04FF01C0003;
 Sat, 13 Aug 2022 21:46:07 +0000 (UTC)
Date: Sat, 13 Aug 2022 23:46:06 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220813234606.7f118c81@windsurf>
In-Reply-To: <20220813214316.GA2830119@scaer>
References: <20220813105152.1403602-1-thomas.petazzoni@bootlin.com>
 <20220813214316.GA2830119@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660427168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSUEQAnVgJCE1axmKxMd9kce7KRxPa5pS7a86BpDvPo=;
 b=ca/qRXKgbuEX8R1qnf9lqAUvKLz9eglnIyDFfHjE5HV3Qo5raQnITkHZFT7YncfOiujTBu
 GkQFKR3PJaD/+Y+CUwGC4uHapN0nLVEBX2RDCYfXd+1zI6VrP8L/LmR75d2KdNGEs+qtLE
 D1L6S2HLpWG3687wZY1tpO4tZCZjy4hHK90/X3iAjC1ekH3NBcFWGnK96HANYQp4fbNo61
 wstfQcevgC6Yi148SgY+3sEBvklhy39EHn+AyquTmOUnbWin3sw44l3w8m0n7OV479mqOB
 Fc6r1rDrlQpj4tXD5UmYAPehsd4jg72mXc4EPMwsKSoDleIB4Jq/+U00aMF/Rw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ca/qRXKg
Subject: Re: [Buildroot] [PATCH] package/binutils: handle gprofng as an
 optional feature
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 13 Aug 2022 23:43:16 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> >  - Adds a new option BR2_BINUTILS_GPROFNG, which allows to
> >    enable/disable gprofng in host-binutils  
> 
> I was wondering if we should not just unconditionally build it. The
> overhead of building host-bison and its dependencies is probably very
> low when compared to the rest of the toolchain, especially with TLPB.
> 
> But OK, option it is...

Yes, I agree this question is relevant.

> > diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> > index a3fece27dc..e4cb19896d 100644
> > --- a/package/binutils/binutils.mk
> > +++ b/package/binutils/binutils.mk  
> [--SNIP--]
> > @@ -91,6 +92,13 @@ HOST_BINUTILS_CONF_OPTS = \
> >  	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
> >  	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
> >  
> > +ifeq ($(BR2_BINUTILS_GPROFNG),y)
> > +HOST_BINUTILS_DEPENDENCIES += host-bison
> > +HOST_INBUTILS_CONF_OPTS += --enable-gprofng
> > +else
> > +HOST_INBUTILS_CONF_OPTS += --disable-gprofng  
> 
>     $ make check-package
>     package/binutils/binutils.mk:97: possible typo: HOST_INBUTILS_CONF_OPTS -> *BINUTILS*
>     package/binutils/binutils.mk:99: possible typo: HOST_INBUTILS_CONF_OPTS -> *BINUTILS*
> 
> Untested code? ;-)

Meh, weird, I definitely tested it: I got a build failure before, and
not after. Strange. Anyway, thanks for fixing and applying!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
