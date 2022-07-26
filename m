Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D541BC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 746A4418F6;
	Tue, 26 Jul 2022 17:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 746A4418F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GmsQRgioIBNI; Tue, 26 Jul 2022 17:34:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDA141969;
	Tue, 26 Jul 2022 17:34:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EDA141969
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59BAC1BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25BE38404E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25BE38404E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3JTrMm91yfl for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:34:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9AA883337
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9AA883337
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:34:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BF8C41BF203;
 Tue, 26 Jul 2022 17:34:03 +0000 (UTC)
Date: Tue, 26 Jul 2022 19:34:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220726193402.4df88a69@windsurf>
In-Reply-To: <CADvTj4oay+SKPqUojKnuoG-XKk7D+GaiAgcT4Pj-mCic8SKXhw@mail.gmail.com>
References: <20220726044425.72570-1-james.hilliard1@gmail.com>
 <20220726044425.72570-2-james.hilliard1@gmail.com>
 <20220726082503.48ce118f@windsurf>
 <CADvTj4ob3JZmsB=jdW3kM4mTQ30jsDXWTOEG5FUG1b=vwfRB8g@mail.gmail.com>
 <20220726090755.2ec1a4a8@windsurf>
 <CADvTj4oay+SKPqUojKnuoG-XKk7D+GaiAgcT4Pj-mCic8SKXhw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658856845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6cSD27bABFFbmtcIDtoWkM2SZQGVLaE7LhQWzZ5mOo=;
 b=kkUZPQZVrnWtMaCsh+QlTIRy2YcJaO2lMmAbZiPFdD7Qh/P+67pNwp4/rcL365ULLnMHUw
 TdcIDUir0HQ9ubdPOrOyyG7ikxEQ1G64u2jS2FDXMDaduVm60RDFTNrMiGmy6vg+wzt4FK
 TFCg2gqsiURJKaIH0hBcfVO0Fhz8l42RF+APXOqj0M7hU8OUYXmaRcvSF7kNWaX2CevJK1
 hMyzCaZi0wEWBznRLtm2XS2au7i4KLR6dz8OmHu7nv7h04Aamg8ZEynK2XL+xHgqo/+bo1
 kLEL3nPXkOEtO8pGJ171ZsD6Lq6Bo0HeBRX1XJAOoAKf2s1Ganbwpdo1CunLSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kkUZPQZV
Subject: Re: [Buildroot] [PATCH v4 2/2] package/pkg-meson: use meson to
 build/install packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot <buildroot@buildroot.org>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 26 Jul 2022 11:26:50 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > prefix is the path where the software will be located when executed.  
> 
> We install to the package's per-package directory $(HOST_DIR) but
> we don't actually execute it from there AFAIU.
> 
> Since the execution location changes for each per-package build I thought
> we wanted the prefix to be independent of the absolute installation path.
> 
> >
> > DESTDIR is here to divert the installation.
> >
> > For host packages, we use prefix=$(HOST_DIR) and no DESTDIR because the
> > software will be located in $(HOST_DIR) when executed.  
> 
> But the $(HOST_DIR) it's installed to is not the same $(HOST_DIR) it's executed
> from when BR2_PER_PACKAGE_DIRECTORIES is enabled, at least when
> it's executed from a reverse dependency.

That is indeed true, but this usage of prefix/DESTDIR is also what we
do in CMake, autotools, and everywhere else, and it did work fine until
now with Meson. I wouldn't want Meson to stand out from
CMake/autotools, unless we have a solid reason to do so. It's not clear
why switching to calling meson to do the build/install requires this
change.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
