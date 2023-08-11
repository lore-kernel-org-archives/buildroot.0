Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8482C001DB
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 14:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29BB28406B;
	Fri, 11 Aug 2023 14:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BB28406B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJa_7dHfi6JD; Fri, 11 Aug 2023 14:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B0ED84068;
	Fri, 11 Aug 2023 14:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B0ED84068
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02A871BF295
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 14:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABE8241D61
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 14:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABE8241D61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZD4NqgYcSvl for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 14:40:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0BAC41C54
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 14:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BAC41C54
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06FE7240006;
 Fri, 11 Aug 2023 14:40:46 +0000 (UTC)
Date: Fri, 11 Aug 2023 16:40:45 +0200
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230811164045.1c5416b4@windsurf>
In-Reply-To: <13322713.uLZWGnKmhe@kilian-aisec>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <20230809193855.60c6b89c@windsurf>
 <13322713.uLZWGnKmhe@kilian-aisec>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691764847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B70QMC0RZZvw+1sbtBiGTz/si2oOzY+UuQKTAISg6qE=;
 b=BeBHn3jgnMVt8ABMLBXZEenSXHZ8WskjFZRxQ0rwCmRCzm3Kn18iN9XpIDPXsMPfunvSET
 Nvg+R9KyTF7jrac4w6keIjEk0PtXPmMyeN7ZX12TwOrMIK0g9hewNnw53D6grqTBOITjLH
 wJSIcI/SUntw3xgochF7zayqQJmfG3hft0CiNQHSikmmoR7vJ0B32GP0Wg8Bf2DpUS4SP9
 yIGqE+aH974nWPog9Liv6sGmIZBxBEZX69FZSNzx79171j1m/zrbscKBjh7nu0fvQybK/+
 Jac0wUlpmWh6ZeGn8fmAw8xVavu6O3rOknluTGLFbZ+fxyPcBJY9vaHzwvyBiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BeBHn3jg
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Kilian,

On Thu, 10 Aug 2023 11:20:49 +0200
Kilian Zinnecker <kilian.zinnecker@mail.de> wrote:

> > Ah, ah, I was working on this as well!  
> 
> Nice, then let's do it together?

Sure, why not. You seem to be ahead of me already, so let me know when
you have something and I can give it a test. Or if you face some issue,
I can have a look and try to help.

> > Backport commit 1dde977518f13824b847e23275001191139bc384 from upstream
> > U-Boot on top of this vendor branch, it will solve your problem.  
> 
> Great, thanks, that did the trick!

I know, because I already encountered this exactly same problem while
trying to build U-Boot for the BeagleV-Ahead :-)

> I however run into a similar problem with opensbi afterwards. As I use the 
> beaglev_defconfig as basis, I also used the opensbi version defined there:
> 
> https://gitlab.com/buildroot.org/buildroot/-/blob/3a4ce27f/configs/
> beaglev_defconfig#L29

I'm not sure it makes sense to use the same OpenSBI version as the one
that was used for the original BeagleV. You probably want to check the
Yocto layers for the BeagleV-Ahead to see which OpenSBI
version/configuration they are building.

> However, the (2 years old) opensbi version (currently defined in the 
> beaglev_defconfig) does not define the neccessary flags for the zicsr and 
> zifencei extensions, needed by gcc12, as seen here in the newer opensbi 
> release-1.3.x version:
> 
> https://github.com/riscv-software-src/opensbi/blob/release-1.3.x/Makefile#L274
> 
> So my build broke until I changed to release-1.3.x. This makes me wonder about 
> the current beaglev_defconfig: It might be broken since bumbing gcc to v12, but 
> I actually don't know. I could try building an image for the beaglev later 
> today?

The beaglev_defconfig indeed fails to build in U-Boot:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4839059972

However, I think beaglev_defconfig should probably be removed, this
board is not produced.

> Now, regarding the bealgev-ahead, it seems to build opensbi on my machine. But 
> I don't know whether the official opensbi is actually needed, or the custom 
> version, i.e.:
> 
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-opensbi

See
https://git.beagleboard.org/beaglev-ahead/xuantie-yocto/-/tree/Linux_SDK_V1.1.2-light-beagle/meta-light/recipes-bsp/opensbi
for how they are building OpenSBI.

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
