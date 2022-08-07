Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82750C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209BE414C4;
	Sun,  7 Aug 2022 12:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 209BE414C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-ja1-QeiONS; Sun,  7 Aug 2022 12:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06735408D2;
	Sun,  7 Aug 2022 12:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06735408D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02EC51BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C07F28131A
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:39:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C07F28131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKn97-sn9lzX for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:39:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DAC781300
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DAC781300
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:39:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 356BE1C0003;
 Sun,  7 Aug 2022 12:39:37 +0000 (UTC)
Date: Sun, 7 Aug 2022 14:39:36 +0200
To: Dominik Michael Rauh <dmrauh@posteo.de>
Message-ID: <20220807143936.3f3e0898@windsurf>
In-Reply-To: <20220807091341.10523-1-dmrauh@posteo.de>
References: <20220805163452.4e0d3dd4@windsurf>
 <20220807091341.10523-1-dmrauh@posteo.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659875978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=se2kJ0XTLqtE4ldetEnYIA7HELNDCbXSXgr8oaZn7yE=;
 b=PYVf6RXw/kaB4wJLGRHCqoB/Iy9YSZBKtPaq+LvnDs9yHs08F7y+v38cRmyTsu2zq5kiU8
 AYdEwYJZodmJB6RLC89YpSkpJ4/ipS/7i1eU1+k5zYwPvFSmOEaUY9us/fCaXT3MPsBZSK
 Ub5f1pfiYVCFmMcYl3I4g8uDDIbiHjF5woGyyKXrXjciF7Pbm6tYgb/w5ogcEsgTWFWdA6
 d3Tun16HgP1m2o5bRaPTpWGr6FzVWoBmaJC1T40BVm69WvS0WHJ9sM+xoUQPscGo0WNSUn
 iRqTk6ZS9u2U/f+FFpCrqnseJwcsNR0lPt1uefSSbInzaEBew3AazAKiYBlR2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PYVf6RXw
Subject: Re: [Buildroot] [PATCH v3] package/ccache: bump version to 4.6.1
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
Cc: anders.f.bjorklund@gmail.com, andrew.smirnov@gmail.com,
 s.martin49@gmail.com, buildroot@buildroot.org, fontaine.fabrice@gmail.com,
 thomas.de_schampheleire@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Aug 2022 09:13:41 +0000
Dominik Michael Rauh <dmrauh@posteo.de> wrote:

> > Just curious, what are these doing?  
> 
> These two options remove the corresponding CMake CACHE entries that are set at
> the beginning of "package/pkg-cmake.mk", when BR2_CCACHE=y (please also see
> https://cmake.org/cmake/help/latest/prop_tgt/LANG_COMPILER_LAUNCHER.html). Thus
> Buildroot is not trying to compile ccache using ccache :)

OK, makes sense!

> > It's really a pity that we need to disable ccache support to build
> > host-cmake, because host-cmake is notoriously slow to build... But
> > obviously since ccache is now using cmake as its build system, I don't
> > really see a much better solution.  
> 
> Yes, the more external dependencies ccache gains, the less beneficial it may
> become. One could think about making ccache a "multi-stage build", where at
> first, it is only compiled with all of its essential dependencies and then at a
> later stage, all other dependencies are "added". But that's probably more
> trouble than it's worth and certainly out of the question for CMake.

A possible alternative we could explore is to no longer build ccache
ourselves and rely on ccache being provided by the host distribution.
Of course, raises the question of which ccache version is available on
the host, and how to tweak its configuration to match the needs of
Buildroot.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
