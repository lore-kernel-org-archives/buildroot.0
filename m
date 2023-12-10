Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF94C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 17:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BB1D6109D;
	Sun, 10 Dec 2023 17:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BB1D6109D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJdT7LSX0E2j; Sun, 10 Dec 2023 17:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8040B60B6C;
	Sun, 10 Dec 2023 17:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8040B60B6C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61CBA1BF584
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 17:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 366C660B6C
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 17:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 366C660B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJSoHXRQRzQC for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 17:02:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F03BB60ADC
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 17:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F03BB60ADC
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9D511BF205;
 Sun, 10 Dec 2023 17:02:48 +0000 (UTC)
Date: Sun, 10 Dec 2023 18:02:47 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231210180247.24316308@windsurf>
In-Reply-To: <ZXXBnuTeg_LcSWgZ@landeda>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf> <ZXXBnuTeg_LcSWgZ@landeda>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702227769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1W1LKcZVUrlZsQKXK9iQsTKaSZpWiCb6oRLPQWNqHcA=;
 b=KDC+F1xjiIofTO3/khiUsy8oPXflmgpQx6Q4NTnMSLdL52weyQBGZNpPK9MbpbTAUp11U/
 DI3AD6RwE03UDetnFcsZoBFfi1hp8bmMGiWjUs5Rl07b4SAN1b2UvsMYoUlKzC2GhvAbSo
 Hzea+L+4swBFwnOuVeURHgrijQ0AKGYWlu6PmSnhQkPirn0sTQ+tLzUq0HF2KYvioQ3PwA
 ot6kdskie3C/k99P1aseTm96Z2mlwcSqg2HdPSWAWcdAsB0DjHOnTUTyjqeRaEg57gk8i1
 aJZVosDHlUbwiPrEK6j02RhVWmO1elKMARRQYM3YD/K3Wl3wtM1DUlmSzwqEXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KDC+F1xj
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 10 Dec 2023 14:48:14 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> M: strictly mandatory
> T: optional, but helps use pre-built toolchains
> S: optional, speeds up the build
> C: needed to run check-package et al.
> R: needed to run the runtime test-suite
> 
> Bazaar, mercurial and subversion are optional, and only required when a
> package is bzr-, hg-, or svn-hosted, but if we want this image to be
> usable generally, it should have all three.
> 
> Since mercurial is a python package, we can't drop python3, and the
> remaining modules are relatively small in comparison to the rest.
> 
> Getting a more minimal image would be just about dropping qemu. That
> would make for an image that we could not use in the CI, and that would
> not be usable to test the changes done to Buildroot. I don't think that
> would mkae for a good image.

It's mainly Python3 that is important to drop. Python3 is not part of
our mandatory requirements, and it's a very frequent sources, as people
don't have an easily accessible container to test Buildroot builds
without Python3, so they forget BR2_TARGET_UBOOT_NEEDS_PYTHON3 or
similar options.

We have exactly two packages that use Mercurial.

pygame has the comment "stable 1.9.1 release requires V4L which has
been wiped out of recent Linux kernels, so use latest mercurial
revision until next stable release is out.", but there's a recent
pygame 2.5.2 release from September 2023. And pygame is now on Github:
https://github.com/pygame/pygame.

The other one is dvb-apps, which hasn't seen a single commit since
March 2014: https://linuxtv.org/hg/dvb-apps. We could consider it
obsolete/unmaintained maybe? :-)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
