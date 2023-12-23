Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D426C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 14:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC9B60A5B;
	Sat, 23 Dec 2023 14:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAC9B60A5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nK7e89AkupLK; Sat, 23 Dec 2023 14:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0208060A71;
	Sat, 23 Dec 2023 14:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0208060A71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C5EA61BF616
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA29C40280
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 14:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA29C40280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KlciHvGXM3OI for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 14:45:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DB2440131
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 14:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DB2440131
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D1DD20004;
 Sat, 23 Dec 2023 14:45:31 +0000 (UTC)
Date: Sat, 23 Dec 2023 15:45:30 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231223154530.11bdd126@windsurf>
In-Reply-To: <ZYXBME0BTWxAc9an@landeda>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
 <ZYXBME0BTWxAc9an@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703342731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+4sBQ4oc3IINQ+d4ec+8mMUIhZExOcMjFzvQ3+A2Ec=;
 b=ND3Ug7y4rq+qFewOQk6gFrxD4P7fYx3sciI9BVD4c1SVdcHlsKZKvg/qqnygZg+kvjD/0E
 mH5ZIJKnELo+rIkAcekQbkOR3W+CiQD+Ga3Vq0GGX711X0o6PVQfYYOMG8Wme73FT8DFWD
 nI7aMRkre+4VHN7xtEVut3KpPIlkyKyYIwIiairGKD3IW4lNl9V65tiyrRwr5q9u8NeqF/
 eyk4Ihja/dN5BJdeFIf3e1L6KSDerAiWhbdFU779QYaOJoUe4AjZV9SYHzKOT5DjwlXxF6
 rrnjCwmu2th2SpXpICWSeUKFgphxQIegKxV+wdQwUqFmrxQPZyPUTvF4rTAJww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ND3Ug7y4
Subject: Re: [Buildroot] [PATCH v4 01/10] package/wlroots: add hwdata and
 hwdata_pnp_ids as a dependency
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 22 Dec 2023 18:02:40 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thanks for the reproducer. :-) However, Thomas was also wondering why
> this was never caught in our autobuilders. Do you have an idea why it
> was never caught? Since the autobuilders did not help, we have no idea
> when this started to occur, so we have no idea whether we need to
> backport the fix. Having an explanation why the autobuilder did not
> catch the issue will help decide whether this needs to be backported.
> 
> Second, hwdata does not provide a library or headers, just data files
> that describe the VID/PID mappings to human-readable names; those are
> supposed to be used at runtime to do the conversion (e.g. lspci or lsusb
> do that).
> 
> And as you report a build failure, it means those are used at build
> time, which is weird.
> 
> So, what does wlroots do?
> 
> In fact, the build scans the pnp.ids and generates a C file with a big
> switch-case mapping all the PNP ids to their vendor string, and thus
> hwdata is not needed on the target, but is needed at build time.
> 
> So, it means we end up with the hwdata on the target for nothing. The
> default config will install about 2.1MiB, which is arguably not too much
> if one builds a system with wlroots (the stack is already big). Still,
> this is noticeable.
> 
> Of course, this is not your fault! :-) But it would have been good to
> provide this info in the commit log, even as a terse sentence, to avoid
> the maintainers trying to understand this (i.e. try to understand the
> reason why the data files are needed at build time rather than are
> runtime).
> 
> Third and finally, hwdata is not mandatory in wlroots; it is only
> required for the DRM backend, so it should not be unconditional. Except
> that in Buildroot, we do enable the DRM backend unconditionally, so
> hwdata indeed becomes an unconditional dependency.
> 
> So yes, it does indeed take some time to come up with the underlying
> reasons for why a change is needed, and to digest them into a commit
> log. But if submitters don't do that work on their end, it means the
> maintainers have do it, and that means even more time is spent reviewing
> and replying to each patch, which makes the patch queue grow, and
> ultimately makes everyone grumpy, submitters first.

Thanks for the additional research. So let me fill in the blanks, which
I could find with some further research. Looking at
http://autobuild.buildroot.net/index.php?symbols[BR2_PACKAGE_WLROOTS]=y&step=250,
we had no fully successful build of a configuration that includes
wlroots since 2022-05-05, at which time we built Buildroot 27c672e5,
which had wlroots 0.15.1. We now have wlroots 0.16.2 in Buildroot.

Turns out that upstream commit
"eec95e3d5e1a4f2e13b1f6b34cc287475ca57daf backend/drm: use pnp.ids to
fetch EDID data" is the one that introduced this usage of the pnp.ids
file, and this commit went in wlroots 0.16.0.

So both 2023.02.x and 2023.08.x are unaffected because they have
wlroots 0.15.1. We bumped from 0.15.1 to 0.16.2 in
d6279bc82c02b43c9a2f28c36639e092b9e9e08b, which is not in any tagged
release.

Adam: this whole research that Yann and I did is what we expect you to
do. This is what is needed if you want your patches to be merged
faster. We have been repeating this over and over and over again to
you, but rather than improving, you have chosen to complain on us not
merging your patches fast enough.

If you want your patches to be merge faster, you need to increase the
trust we have in your contributions. To increase the trust we have in
your contributions, you should not submit patches that obviously don't
build even in a basic configuration (your recent dmenu-wayland), and
don't submit patches that are clearly insufficiently documented (this
wlroots patch).

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
