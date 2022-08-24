Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDA5C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BE2440B4A;
	Wed, 24 Aug 2022 11:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BE2440B4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oD7fb7Z3eqrh; Wed, 24 Aug 2022 11:31:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E24740283;
	Wed, 24 Aug 2022 11:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E24740283
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 31B201C116E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A4234004F
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A4234004F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKdxNyFsFpJT for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5577C40002
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5577C40002
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:31:55 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 22DC5240003;
 Wed, 24 Aug 2022 11:31:51 +0000 (UTC)
Date: Wed, 24 Aug 2022 13:31:50 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220824133150.1fa3be11@windsurf>
In-Reply-To: <CAMdwsN8qeVFHWdSGSHam22UqmEwT4mK2qguHZqsBdcQfcO=5yw@mail.gmail.com>
References: <20220824094900.3639681-1-jesseevg@gmail.com>
 <20220824123852.489214fa@windsurf>
 <CAMdwsN8qeVFHWdSGSHam22UqmEwT4mK2qguHZqsBdcQfcO=5yw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661340712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOkcyzNETSectwphkVzsm6pfAYJ7OYOSH87YXjRRdqw=;
 b=SOb7DklHfz6YRJucY4i2Zho1KtWLi7Mu96bz+vkoJazfwPW6VlaPWENu7UwdTe2ySdYFW7
 crKk6zq4TlVpPMPeE2h5oLjPsMDPxi4N6PTZ0H0B5wd8Ikv9O+/Hps+iras85r7mPbKqGS
 2hJN9T2DVzM2nwlE5zipz4YZIykkR1RER3BXGihX4kdoGj7wwBOBROEFVAclsJSlbA8PGl
 Jj3EdBgIH57S/uHKvsBpERqebVlGGlfi/ajfIzxZ0nHkDie93D9ta3MXCxIz80AhvkcAOC
 PvqaNMEsM3lczonLvSwFuK+1DnQYPDpngzYj86rylNdgwuSP5lS2uwORAyqw0g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=SOb7DklH
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6serialport: add package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Wed, 24 Aug 2022 13:27:21 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Yes very interested, I actually started work on this before Samuel had

FYI, Samuel was heavily involved in qt5 support, but he is no longer
active in the Buildroot community. The qt6base package was initially
started by Peter Seiderer, and then picked up by me recently.

> committed a first base package so I've been reworking a little what I got
> to conform more to what's already there, I've been getting all our internal
> code up to date to work with Qt6 so I've got a more fleshed out qt6base
> package from my struggles getting that working along with the
> qt6declarative package, I'll submit those qt6base changes later once I got
> the chance to rework a little taking your comments into account so you can
> have a look (because it does have some quirk in GUI/fontconfig I had to
> temporarily solve with patches and forced dependencies) and once that's
> done I'll submit the declarative package, my hope is that I can also then
> add some of the more straightforward modules from qt6 we also had in qt5.

Sounds good! Looking forward to your patches. I indeed suspect that
some aspects of the GUI support will be tricky.

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
