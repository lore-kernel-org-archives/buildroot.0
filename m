Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3613C001DC
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 22:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3401660F03;
	Sat, 22 Jul 2023 22:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3401660F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IoKb09ZSyLB6; Sat, 22 Jul 2023 22:28:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585AD60EE8;
	Sat, 22 Jul 2023 22:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 585AD60EE8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1131BF5AE
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 22:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38195832A9
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 22:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38195832A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LP9US_AhhP3r for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 22:28:08 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1B8483218
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 22:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B8483218
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF2DDFF803;
 Sat, 22 Jul 2023 22:28:04 +0000 (UTC)
Date: Sun, 23 Jul 2023 00:28:03 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230723002803.12e6545a@windsurf>
In-Reply-To: <CA+h8R2rgtSsq9V=TmSa2JB53=EEvhPzFwpEEw0edk+v-RyOFCA@mail.gmail.com>
References: <20230711220849.1702358-1-christian@aperture.us>
 <20230711220849.1702358-4-christian@aperture.us>
 <20230722231336.760d74ea@windsurf>
 <CA+h8R2rgtSsq9V=TmSa2JB53=EEvhPzFwpEEw0edk+v-RyOFCA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690064885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVqSLIXvG22t7dQmxtPo76nxtyz/spvwCm2qVpUDrg0=;
 b=I1hh3xGOQAgCDHmo6XUdWhNEEHE3u102mg/Bqp2GZxeGMNbUtP8cywnCeRuPn4FpCHjKtw
 kNieWl/eDBfXPpKn2u2lCrRbD5BcldKCsD1wOK+DabMlw5jMPJu4uV5erX3MR598xQ5P2M
 re7xTn9GfRBWMdVLQ1n60EysY79rTkihfcX/VVbE5KrndjHlAJ/MNZtWW4EzH9fheJlBMy
 cbXw6dHSA8tSufA9jjDfd0V4P1XDAmrN/f27j0v64kciJj3bbZ/69UKnDlZ0wjJfMUs0Hc
 m2vSbaMLclfOIMr+puVCHCk5fXrbhqdq9kAiQ3Rcaaw1BGRH/ElMvTZ1iMP61g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I1hh3xGO
Subject: Re: [Buildroot] [PATCH v7 4/4] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Christian,

On Sat, 22 Jul 2023 15:01:05 -0700
Christian Stewart <christian@aperture.us> wrote:

> The main difference is the Go compiler takes only a minute or so of build
> time. Bootstrapping it is fast and produces reproducible results across any
> of the architectures Buildroot supports, including those for which there
> currently are not any binary Go releases.
> 
> Therefore I submit that it is always worth the extra build time to
> bootstrap the Go compiler from source as part of the build as opposed to
> using a precompiled binary. Also it is less maintenance overhead (updating
> hashes for all the platforms) and as the one maintaining this process I
> appreciate that.
> 
> Today we download an external toolchain but still depend on a gcc package
> to be installed on the host as well. Depending on the host Go to be
> installed or otherwise provided for the bootstrap process is a decent
> approach for architectures that we can't bootstrap with the C compiler
> alone.
> 
> I can see a way we could add an option to do the binary downloads but would
> prefer to keep the logic to depend on the host compiler as a fallback to
> use for bootstrapping as well.
> 
> This is fine for legal-info as the bootstrap process builds the compiler
> with itself several times to ensure that only the version built from source
> is used.

Thanks for your feedback. What I meant by "legal-info" probably was
misunderstood. I very commonly run "make <foo>-legal-info" after
merging a version bump of a package. For 99% of our packages, this is a
trivial operation: it downloads the new tarball, extracts it, and
checks the hashes. For golang-package, it is a non-trivial operation as
it requires building go-bootstrap-stage1, go-bootstrap-stage2 and go,
before the package can be downloaded and vendored using "go".

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
