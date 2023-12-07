Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3239C4167B
	for <buildroot@archiver.kernel.org>; Thu,  7 Dec 2023 16:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFAF83CE6;
	Thu,  7 Dec 2023 16:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AFAF83CE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3TdKKvqs8LWG; Thu,  7 Dec 2023 16:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E578128D;
	Thu,  7 Dec 2023 16:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E578128D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A60E01BF5B3
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 16:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48FB08128D
 for <buildroot@lists.busybox.net>; Thu,  7 Dec 2023 16:39:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48FB08128D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 45qKpx-6Y4LJ for <buildroot@lists.busybox.net>;
 Thu,  7 Dec 2023 16:39:34 +0000 (UTC)
X-Greylist: delayed 86288 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 07 Dec 2023 16:39:33 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1ACD80B74
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1ACD80B74
 for <buildroot@buildroot.org>; Thu,  7 Dec 2023 16:39:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5EB1C0006;
 Thu,  7 Dec 2023 16:39:30 +0000 (UTC)
Date: Thu, 7 Dec 2023 17:39:29 +0100
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <ZXH1QcJkmcJdz3nB@louis-chauvet-laptop>
References: <20231206164437.22191-1-louis.chauvet@bootlin.com>
 <87h6kvckwc.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h6kvckwc.fsf@tarshish>
X-GND-Sasl: louis.chauvet@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1701967171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PKi2VcqEFvyEEXKoqV9gyGnti33Rw3RbckTQUdMDi+M=;
 b=GuuAeCGb4nu0nzBIlNklw711DjXmMC3YL23Ae6rns+ITpg+C1ek9EV0NGqwkJTy/jWKbnU
 yTDBXWbknBLcAB6ydCC7NxqBOELW7XQu1NYWD9pyzAP52wBeGFL/zWNcvERLbeR1MnOD5Z
 8pdu+6Tw4ZmKuqAXO0yyADTcTwsqqIsoNJxbWmDE98F5Wmp6ugGrYgHCBjoZrkViuvqTwz
 k1SCaNDMofUcDt7sc4x7/IGaiZJ/1NtGj0QAvWi35PYAnRmW1KqX7/JEF8ndfvMJjyNPm7
 02HAh7mRuVEtk7XAdOy2+VF9JBXtutbytvwmBFsjOGsY45i+EbFcrLYSssqhPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GuuAeCGb
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: fix the RPATH of
 fiptool
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
From: Louis Chauvet via buildroot <buildroot@buildroot.org>
Reply-To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: kory.maincent@bootlin.com, thomas.petazzoni@bootlin.com, geomatsi@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Baruch,

Le 06/12/23 - 19:05, Baruch Siach via buildroot a =E9crit :
> Hi Louis,
> =

> On Wed, Dec 06 2023, Louis Chauvet via buildroot wrote:
> > The arm-trusted-firmware package builds a host tool called "fiptool",
> > which is used during the build process of arm-trusted-firmware
> > itself. This tool links against the OpenSSL host library, and
> > therefore needs to be built with the correct RPATH pointing to
> > $HOST_DIR/lib.
> >
> > This is why commit a957d9a90ade4194dffe3eb2fc0136bc5d077c28
> > ("boot/arm-trusted-firmware: build fiptool separately with dependency
> > o n host-openssl") added the ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL
> > variable, which builds the fiptool tool first, with the right
> > variables set, before invoking the full build of TF-A. This ensured
> > that fiptool was built with the correct RPATH.
> >
> > However, more recent versions of TF-A have modified their Makefile
> > machinery, and fiptool is being rebuilt even if it was built
> > before. Unfortunately, this rebuild is no longer done with the right
> > flags, so we end up with a fiptool binary that no longer has the right
> > RPATH, and fiptool fails to find the OpenSSL libraries from
> > $HOST_DIR/lib.
> >
> > In order to fix this, we take a different approach: we do not build
> > fiptool separately first, but we inject the necessary flags through
> > the HOSTCC variable. Indeed, there's no HOST_LDFLAGS or HOST_LDLIBS
> > variable or similar that would allow us to pass the -Wl,-rpath flag
> > that is needed. Shoe-horning this flag into HOSTCC gets the job done,
> > and actually simplifies our arm-trusted-firmware.mk.
> =

> The code this patch removes tries to keep compatibility with TF-A
> versions earlier than 1.3. This patch relies on HOSTCC that was only
> introduced in TF-A version 1.4 with upstream commit 72610c4102990
> ("build: Introduce HOSTCC flag"). I guess losing compatibility with
> older TF-A is fine, since all Buildroot in-tree configs appear to use
> newer versions. But I think this should at least be mentioned in the
> commit log.
> =


Thanks for your feedback. Do you think this is sufficient ?

This patch break the compatibility with version prior to 1.4 (upstream
commit 72610c4102990 ("build: Introduce HOSTCC flag")). v1.4 is very old =

(July 2017), not used anymore in-tree and probably not used anymore =

outside the tree.

-- =

Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
