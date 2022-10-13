Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C90C433FE
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 14:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 254F9402B5;
	Thu, 13 Oct 2022 14:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 254F9402B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J8XE3cp3rcOw; Thu, 13 Oct 2022 14:39:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE0374025F;
	Thu, 13 Oct 2022 14:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE0374025F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 152B81BF387
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 14:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4760832DC
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 14:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4760832DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jvFKxmnM450M for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 14:39:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7849482B24
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7849482B24
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 14:39:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 198134000C;
 Thu, 13 Oct 2022 14:39:10 +0000 (UTC)
Date: Thu, 13 Oct 2022 16:39:10 +0200
To: Robert Hancock <robert.hancock@calian.com>
Message-ID: <20221013163910.3c6d9c8f@windsurf>
In-Reply-To: <5eebf7dee2a585f50a4e986c214677a157bfd22c.camel@calian.com>
References: <20221012215008.2918444-1-thomas.petazzoni@bootlin.com>
 <5eebf7dee2a585f50a4e986c214677a157bfd22c.camel@calian.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665671951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6I6OxNdn0C/WbxiJwqZX8v3iTNiSPE1VUOmg7LbM7U=;
 b=a3wk/9S6rF5gJHMIOY2Nm+XX1AjrNJYXyQduqQVRcDPHF9YQ9cOzeELeu9axpQIP/fnR5J
 QYUEUtBSzwS/lmsyTajBYUjNMKBY5ub6GpS9iWQG8jGoysnQ1h/+JJleO5TjbHEDpnRyK3
 f7zVSOZyK6RMt+sHgRerVqasCch2hpGnx+4bTaAVrgm7SPr4SA3dAtlInAkinIy/HBH+eQ
 s98fFMyxsxkkQOF1/qM5DELZTwcGkHGCdf3WyHg8Az03XJ0otVJsg+o9W69y1mnRFoHZ2u
 OTVI3HFpvhdQ/47GQmYzNLYiXOlJu2em0mGiSiaCKuD2riYVwSwcBwtNL2T1LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=a3wk/9S6
Subject: Re: [Buildroot] [PATCH] Config.in: introduce BR2_TIME_BITS_64
 option for Y2038 compatibility
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
Cc: "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 12 Oct 2022 23:49:37 +0000
Robert Hancock <robert.hancock@calian.com> wrote:

> There's some chance of software being broken by enabling this, with
> either a compile or runtime failure. For example, applications that
> assume sizeof(time_t) == sizeof(long) would work on 32-bit platforms
> with a 32-bit time and 64-bit platforms with a 64-bit time, but fail
> with a 64-bit time on 32-bit. I believe I've seen this when trying to
> build software with that option, so turning this on unconditionally
> might be unwise, unless  some build tests of the supported packages
> have been done..

There will definitely be build testing: our autobuilders are testing
24/7 random configurations of Buildroot. So as soon as we introduce
this option, there would be builds with BR2_TIME_BITS_64=y enabled,
which would raise build issues if there's any.

Of course, the more tricky part are runtime issues, which are
essentially impossible to detect until someone runs into the problem.

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
