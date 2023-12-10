Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7E8C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 12:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2F06104F;
	Sun, 10 Dec 2023 12:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2F06104F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6azha7lySQHC; Sun, 10 Dec 2023 12:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 310A46105F;
	Sun, 10 Dec 2023 12:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 310A46105F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A8F21BF86B
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 12:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4CE940182
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 12:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4CE940182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqOz_22AyYqS for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 12:17:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 875D6400D6
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 12:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875D6400D6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 537531BF203;
 Sun, 10 Dec 2023 12:17:04 +0000 (UTC)
Date: Sun, 10 Dec 2023 13:17:02 +0100
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20231210131702.76975e38@windsurf>
In-Reply-To: <a6f09f61-573b-465a-b5a9-6d175c313f2b@mind.be>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf>
 <23317020.6Emhk5qWAg@kilian-aisec>
 <a6f09f61-573b-465a-b5a9-6d175c313f2b@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702210624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ne9ZT7F32PdNcHe4wi3G6TWzUK2n5pXFzhFUx4bbK8o=;
 b=adlOmafdOv2NBVtYpnosCWjVOA4OsUcD9AR6gUwp6crccBT/HyCgiOaE1ZUrCvQRrmVZAu
 +Ejd5r+xS7SlpcTQVjhqqyx2iypLusDIKaMbi8fNu6Bvv00FQ4hc00gqHWIDDm1/m4iM4V
 34gLsGPpfW8TL8itqxez7UiX+DtxJpMfohtShtu6kqx4tdor/h/PWQBzqaG31Qsf/ezFVX
 dzz9c1U3r3yPmmaEmJR7tI21g0V0lDKa1n8zXWC5NqLszGMbYtbpOSc0s72yUHpsAimSC0
 bp5D6Yrw0EOSt7B+o8gR6a1DGJf8+EGk+d7SYrn1W7v3p70/fbz32oH9QNDCdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=adlOmafd
Subject: Re: [Buildroot] Buildroot docker image
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
Cc: buildroot@buildroot.org, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 9 Dec 2023 22:29:32 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>   So, if we do go for Alpine as the official docker image, we can expect quite a 
> lot of breakage... Therefore, before going there, I think we should go for a 
> "normal" distro after all for the time being. Of all the traditional distros, 
> ubuntu:22.04 has by far the smallest image at 80MB (this actually came as quite 
> the surprise to me... I have no idea why Fedora would be twice as large! But it 
> does already include Python, so after installing all necessary packages it may 
> even out again...).

An advantage of Fedora is that their Perl packaging is much more
fine-grained than in Debian/Ubuntu, which allows us to better detect
when we have missing Perl modules.

> > +RUN apk add --no-cache bc  
> 
>   Actually, we check for bc, but I don't think it's needed for anything... The 
> alpine container is a good way to test for this kind of stuff (all normal build 
> machines will have bc installed for other reasons).

I think bc is needed to build the Linux kernel, and we don't build
host-bc as a dependency of the linux package.


> > +USER root
> > +WORKDIR /home/br-user
> > +ADD https://github.com/buildroot/buildroot/archive/refs/heads/master.tar.gz /  
> 
>   Don't use the github mirror, use the actual upstream:
> http://gitlab.com/buildroot.org/buildroot
> 
>   However, I don't think we should pull the repository here. Instead, we should 
> use the already-checked-out buildroot from which this Dockerfile is built. Or we 
> shouldn't have any buildroot source in the container and just mount the volume, 
> like is done in docker-run.
> 
> > home/br-user/buildroot.tar.gz
> > +RUN chown -R br-user /home/br-user
> > +RUN chgrp -R br-user /home/br-user  
> 
>   You can do chown -R br-user.br-user to do both at the same time.

[...]

What is the goal of this new Dockerfile, compared to the one we already
have at support/docker/Dockerfile ?

support/docker/Dockerfile already has a good setup in terms of how the
br-user should be created, what the Dockerfile should use, etc. Why
should we do things differently?

I had one two things to suggest improving compared to our existing
Dockerfile:

- We should have a more minimal Dockerfile that installs really the
  strict minimal requirements that Buildroot needs to do a build, and
  then a second Dockerfile than inherits from the first, and adding
  what's needed so that it can be used as our CI Docker

- We should similarly have combos of Docker file (one minimal, one CI)
  that use different distributions;

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
