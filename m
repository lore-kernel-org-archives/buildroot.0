Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25263EE4996
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 15:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7BC60AB7;
	Tue, 22 Aug 2023 15:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A7BC60AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cveO1RzXy83Y; Tue, 22 Aug 2023 15:15:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F6F607B5;
	Tue, 22 Aug 2023 15:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F6F607B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E8CF1BF31C
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 15:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC1C740BC8
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 15:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC1C740BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSVLZy5cWD8e for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 15:15:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4818040BC6
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 15:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4818040BC6
Received: by mail.gandi.net (Postfix) with ESMTPSA id D757020005;
 Tue, 22 Aug 2023 15:15:34 +0000 (UTC)
Date: Tue, 22 Aug 2023 17:15:33 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230822171533.77fae599@windsurf>
In-Reply-To: <20230625101507.GK24952@scaer>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-11-dannenberg@ti.com>
 <CAAE6iEVbgKo4FS7ofh_GbOi=tUDafp0sHkcthHskqaduiPb8zQ@mail.gmail.com>
 <20230623145945.kvxhcdbf2kycdyk5@dasso>
 <CAAE6iEX1eomAE5_qr55=JKgRZWM-iZ+dmO+Ti_vQ94VuxZBe6Q@mail.gmail.com>
 <20230625101507.GK24952@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692717335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g8moo26OoKVKionkcSgUsVY1/oIP/SkdcOEnpZMAYcg=;
 b=I0eAhJVNu+H9rc4xXUFUZAF65KIEUDROIwG3kMjcIMWxAYsYx40Zs0fW8ANa93nRZdPx71
 HhqkU4qzV9nW23S9sjbPAQnTDvsvw31BIyyzDGZzPMJEFlPWKoHuAhOEuO6tFsYBiRJpko
 NqcB7auVbar4rC9Om/XyZ4Hby1fL20dlRs9R4uVwRGgd+v0xO52It+xEGR8mW00LsEHzag
 7+f7H8B4PtLoWVdbGxDm03q3w8at9cL0ULFbuen8fPOs8LefTowQqWcIuPxLufEqYN+6v8
 wwHPo1OxseHDvtoDZIoZDWbEC8/yhII+NumM5pikNei9Lb3+iX+jAHYnuCCFjw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I0eAhJVN
Subject: Re: [Buildroot] [PATCH v9 10/11] package/ti-rogue-um: new package
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
Cc: buildroot@buildroot.org, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 25 Jun 2023 12:15:07 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

>     # Usually frowned upon, but much much smaller than a patch to remove
>     # them; anyway, upstream is going to get rid of them in a future
>     # release.
>     define TI_IMG_ROGUE_UMLIBS_CLEANUP
>         $(Q)rm -rf $(@D)/targetfs/*/wayland/release/etc/init.d/
>     endef
>     TI_IMG_ROGUE_UMLIBS_POST_EXTRACT_HOOKS += TI_IMG_ROGUE_UMLIBS_CLEANUP

Why don't we simply not install it?

> Of course, this raises the issue that BR2_TARGET_TI_K3_IMAGE_GEN_SOC_*
> are no longer specific to ti-k3-image-gen, but are shared with a few
> packages.
> 
> In which case it may make sense to have those moved to a common
> Config.in, like is done for the freescale-imx stuff.
> 
> I.e. add a new BR2_PACKAGE_TI_AM6XX option, and the SoC selection can be
> moved there, with all common options, and packages (ti-k3-image-gen,
> ti-core-secdev-k3, etc...) can all depend on that option; packages in
> package/ can be made to appear in a "TI AM6xx" sub-menu, and packages in
> boot/ can just depend on it too.

I did indeed add a choice of SoC within the ti-k3-image-gen package,
and I rely on it in the u-boot package to know which DM firwmare to
use. While doing this, I was wondering if it wouldn't make sense to
promote this SoC selection at a higher-level. Indeed, we have more and
more packages that are platform-specific (OpenGL implementation, weird
firmware stuff), and many of those need to have details on the specific
SoC being used.

So would it make sense, at least for some platforms to have some sort
of top-level option where we could say "I have a Freescale i.MX6ULL" or
"I have a Broadcom BCM2835" so that packages can then do what they
think they should do? Of course, the idea is not to list the zillions
of ARM SoCs that exist, but only the ones for which we have specific
packages. We would have a default "Generic" platform if none of the SoC
known by Buildroot fits what the user has.

I can probably cook some initial prototype, just to give a more
specific idea of what I'm talking about.

Thoughts?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
