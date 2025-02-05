Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E2CC02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC670600BB;
	Wed,  5 Feb 2025 15:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7Bs9IDTpfV4; Wed,  5 Feb 2025 15:17:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB295600C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB295600C6;
	Wed,  5 Feb 2025 15:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C89FE12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACBBD406C4
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INdWQa21ImUV for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:17:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BA45405D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BA45405D8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BA45405D8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:17:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E66454321D;
 Wed,  5 Feb 2025 15:17:53 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:17:52 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>, Spenser Gilliland
 <spenser@gillilanding.com>
Message-ID: <20250205161752.4608182c@windsurf>
In-Reply-To: <f70aa72c-8c8f-4cc1-b7e1-96ed51997596@gmx.de>
References: <20250124124710.2838253-1-fiona.klute@gmx.de>
 <20250205102036.77588f14@windsurf>
 <f70aa72c-8c8f-4cc1-b7e1-96ed51997596@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedviedtkeeuiedvtefhjeejjefggfejheehkedtgeffffdtvdehheejteffudduueenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepfhhiohhnrgdrkhhluhhtvgesghhmgidruggvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehsphgvnhhsvghrsehgihhllhhilhgrnhguihhnghdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738768674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LpkP/TbJSp3qOtoCF6+zSXARFakfphvPBms5+m3wEEY=;
 b=aRpj5zoWxIthgOSZCNnSd2K+jJDpzypToafVdT+iup9vf5arwZdkHYeBnwz9f8VJBtWyxs
 q6AbCzegIVcIOxCGS7scAQ9OHAp5rYnKQEm1SW623NSaVueBQhU5+kULINGGYSk2jxDuAd
 +NpBVAvg92OAYqEBij5/o9l51XTPUeazqnItQu2zbU8kOPWwxBBvlfaiqrUXu9MBgdD36n
 FIjln9YFdBe9sBkHeYhAPgr6UUt6dFyBUOhfMbUp3JNlE+VkNSGpUqobHZdXrFCfDBIefx
 D/f53XaDkdKl3vW3TN5QOSbQbXpZUgYnjXwibvPnsvi3XtF/jeEl1txZkVRd2g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aRpj5zoW
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d-demos: fix build failure
 on musl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Wed, 5 Feb 2025 13:59:14 +0100
Fiona Klute <fiona.klute@gmx.de> wrote:

> As far as I remember you need need to build full OpenGL GLX, not just
> EGL. This is the related part of my defconfig:
> 
> BR2_PACKAGE_CAGE=y
> BR2_PACKAGE_MESA3D_DEMOS=y
> BR2_PACKAGE_LIBGLVND=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_LLVM=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK=y
> BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM=y
> BR2_PACKAGE_MESA3D_VULKAN_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_OSMESA_GALLIUM=y
> BR2_PACKAGE_MESA3D_OPENGL_GLX=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XKEYBOARD_CONFIG=y
> BR2_PACKAGE_LIBDECOR=y
> BR2_PACKAGE_LIBFREEGLUT=y

ACK, I'll give it a try.

> Note that the X stuff is for libraries required for GLX, it's still a
> pure Wayland setup.

A pure wayland setup with X is not... really a pure Wayland setup :-)

> > Basically, when fixing an issue, we should never just fix it. We should
> > always explain since when the problem has started happening.  
> The "uint" use was introduced here:
> 
> https://gitlab.freedesktop.org/mesa/demos/-/commit/813ebef7671f0e54d1b55be9e15ae5586b2b9eb1
> https://gitlab.freedesktop.org/mesa/demos/-/commit/5aaa7faeb4de9497535738830e6ebb8f10071877
> 
> The first and so far only mesa3d-demos release that contains those
> commits is 9.0.0 from March 2023. Considering that was added to
> Buildroot in early July 2023 (commit
> 80304d9911f34f8a0173a4f37d52f93177478cc7) it's probably safe to assume
> it's in all still supported releases.

ACK, thanks for the additional research.

> That said, making "since when" a strict requirement for accepting a fix
> seems problematic to me, because it might discourage people from
> participating. In my situation (getting paid to make things work,
> including upstreaming) it's a perfectly reasonable request. But people
> who send a patch here and there from hobby coding might feel their
> contributions aren't valued, and someone who has a manager breathing
> down their neck and complaining about time wasted might decide it's not
> worth the trouble. In case of doubt having a fix on the development
> branch (and backporting if someone bumps into the problem on a release)
> seems preferable over not having it at all. ;-)

I understand your concern. The issue is that if this effort is not done
by the contributor, then it falls on the Buildroot maintainer who
manages the LTS branch, and (s)he will have to do that on each and
every commit. Clearly, it makes a lot more sense to ask each individual
contributor to do a little bit more effort on their patches rather than
having the LTS maintainer have to do this for 100s of commits that have
to be analyzed to see if they should be backported.

In addition, asking this on contributors also forces them to do a
slightly more in-depth research, which also avoids "bogus" bug fixes
that paper over the problem instead of fixing the real root causes.

Hopefully you will understand those different arguments :-)

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
