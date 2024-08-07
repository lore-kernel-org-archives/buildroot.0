Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4E7C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 09:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5BE4812BA;
	Wed,  7 Aug 2024 09:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VnkycLUF-mz1; Wed,  7 Aug 2024 09:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E31B8812BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E31B8812BB;
	Wed,  7 Aug 2024 09:00:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7AFB1BF329
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B56F4405A0
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 09:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rg0yVKT1iAW for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 09:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A79640597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A79640597
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A79640597
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 09:00:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11F941C0003;
 Wed,  7 Aug 2024 09:00:24 +0000 (UTC)
Date: Wed, 7 Aug 2024 11:00:24 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240807110024.519f6ab1@windsurf>
In-Reply-To: <CAPi7W82C-dMF+d_gJY=WYOAKYPQE_5py6cf4aknoHwpQPXCcNA@mail.gmail.com>
References: <20240509204218.77779-1-fontaine.fabrice@gmail.com>
 <20240509231050.5365ecf0@windsurf>
 <20240722222156.4959aec7@windsurf>
 <CAPi7W82C-dMF+d_gJY=WYOAKYPQE_5py6cf4aknoHwpQPXCcNA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723021225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYEpVfSm4pwqhnakLCGHrooZ+OKQRd2h1C0pnWKpe3g=;
 b=NJH1Cbb+XNwB7PwFsEm86ycGauVKYJe48zzfIX5FO/v3U0UlhbZnNIMqcPjdTEseZagyue
 tlTn28gBucJMANwuMX07Fdsw90LUtgSsY9NmBU0OF0JGKjyoWuszep0Zy+Y9qMGHOywDLF
 XzhSQeSq848eHHugwRrQ0kNWq73Hq2snjUcAontjao16lCS+sYnoLVDdxXFlCJx3fA4lhS
 37isxOgf7LkqN8ZXbrGBE8NeHLB+2UsUBTBkMksDG84/JLyQkLXwbEIgku5CmQAlESev2C
 yE1uCESNnFP0PiIgf0Y9cEBfB3InqDAA/B3DYo/P3juNc1PmcAsWjQ+ORWitWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NJH1Cbb+
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: fix enginesdir
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
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Mon, 22 Jul 2024 22:47:04 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> It seems that you added this workaround back in 2019 [1].
> However, to my understanding pkg-config only prefixes sysroot to a
> subset of variables since at least 2018 [2] and enginesdir is not one
> of them.
> Finally, since its addition in openssl in 2016 [3], enginesdir has
> always been set to ${libdir}/engines-...
> So, I don't know what triggers the build failure that you fixed at that time.

So, I had a closer look, and you're right... but things are going to
get broken again soon.

Back when I introduced this code, enginesdir was expressed in terms of
${libdir}:

enginesdir=${libdir}/engines-3

and because ${libdir} is one of the variables that get sysroot-ed,
enginesdir also gets sysrooted, which is why my "hack" was needed.

Then, in OpenSSL commit 2ac569a67b9d0980efa2d8061a6a61e0645f37a7 (first
appeared in OpenSSL 3.3.0), they reworked the whole .pc stuff, and
changed enginesdir like this:

enginesdir={- $OpenSSL::safe::installdata::ENGINESDIR -}

which ends up as:

enginesdir=/usr/lib/engines-3

so enginesdir is no longer expressed as a relative path to ${libdir},
so it doesn't get sysroot'ed, which is the behaviour you observe right
now.

However, more recently (June 2024) commit
30dc37d798a0428fd477d3763086e7e97b3d596f was merged into OpenSSL, which
reworks the above logic to:

enginesdir=${libdir}/{- $OpenSSL::safe::installdata::ENGINESDIR_REL_LIBDIR -}

so, starting from the next release of OpenSSL, enginesdir will be back
to be defining relatively to ${libdir}, so it will be sysrooted again.

See my quick experiment below. First current situation:

$ grep ^enginesdir output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/libcrypto.pc
enginesdir=/usr/lib/engines-3
$ ./output/host/bin/pkg-config --variable=enginesdir libcrypto
/usr/lib/engines-3

with the next release of OpenSSL, it will look like this:

$ grep ^enginesdir output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/libcrypto.pc
enginesdir=${libdir}/engines-3

$ ./output/host/bin/pkg-config --variable=enginesdir libcrypto
./output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/lib/engines-3

So maybe we should merge your patch.. and revert when a new OpenSSL
release is made?

I was wondering whether the problem should be fixed in libcrypto.pc by
a tweak in libopenssl.mk, but how can we know when this enginesdir will
be used to know the location of the engines at compile time (in which
case it must be sysrooted) vs. when it will be used to know the
location of the engines at run time (in which case it should not be
sysrooted) ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
