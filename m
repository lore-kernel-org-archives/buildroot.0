Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6DFC83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 22:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 404DE60E8A;
	Sat, 26 Aug 2023 22:17:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 404DE60E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpPhx_MhexLd; Sat, 26 Aug 2023 22:17:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54A1660E29;
	Sat, 26 Aug 2023 22:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A1660E29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 255A61BF5A3
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 22:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF3781F52
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 22:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEF3781F52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvzmEEuwqcS7 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 22:17:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABE8A81427
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 22:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABE8A81427
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6FB220003;
 Sat, 26 Aug 2023 22:17:06 +0000 (UTC)
Date: Sun, 27 Aug 2023 00:17:02 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230827001702.49bda8fc@windsurf>
In-Reply-To: <CADvTj4qxRLqUcBw6fi6h=HaSCb43VDz0z+ueZxkQqTh4+LUp+Q@mail.gmail.com>
References: <20230626080016.2182278-1-james.hilliard1@gmail.com>
 <20230710200350.5c72bcab@windsurf>
 <CADvTj4qQ1m9ehmGs6pPMmPUQumeKewq-n3c7rY20PHnT=2TETA@mail.gmail.com>
 <20230711093807.41f21337@windsurf>
 <CADvTj4qxRLqUcBw6fi6h=HaSCb43VDz0z+ueZxkQqTh4+LUp+Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693088227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNLk1nWCzKKswFTm37vXvdIWT9oyelBfuJDCSWCD/lw=;
 b=DSucFi0YKCMO7UZv37i98ZERz1X6ZNRkCAb8aGQvJV1wtI0DGDzk1SNmWpHylqlVmW33gk
 hQVJ1x+CrnoBJrd9ApvkSDyXcbHMykJ48FW1bil0jOHRDNA+ewODmqawL+qRtX2v2sBF7W
 w4mE/hMRhaQAaLpO3CS5ChxqwK7lhq4Y9730NPHtO5nk/A/XRvBXCOt3YX92a6M5hfGr4Q
 T5HIgCyzAV0URlx8d1z74S3yZII4lznsfGgk4nS+xCbf2S8VWERIt0DqqKJv7tBPE7S3Rg
 oqkWACQrUgeBnowzVTCOhHdL489dr8L10+ESl/epP8eqrM4Bl28H/qOo2xWR7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DSucFi0Y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-msgpack: add host cython
 dependency
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, 11 Jul 2023 03:35:49 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > What is an "optimized extension" ? Could you clarify in which case
> > python-msgpack wouldn't build/work, ourside of the PEP517 migration?  
> 
> Well it's using some fallback logic in setup.py:
> https://github.com/msgpack/msgpack-python/blob/v1.0.5/setup.py#L20-L25
> 
> Although looking at it again it appears the sdist does have pre-cythonized
> sources as a fallback which looks to be the reason that not fixing this
> previously worked(I presume due to legacy style setuptools not having a
> reliable way for specifying build dependencies).

So upon further investigation, in fact the host-python-cython
dependency is not needed when we stick to legacy style setuptools. So
in other words, this patch we're discussing does not make sense outside
of the PEP517 setuptools migration, which further confirms my initial
request that this patch should be part of the patch series doing the
PEP517 setuptools conversion.

> > The context that is missing is that this patch (changing
> > python-msgpack) comes completely isolated from any other patch. If it
> > had been in the series that ends with the "package/pkg-python.mk:
> > migrate setuptools to pep517" patch, then it would have been clear:
> > it's a pre-requisite to be able to do this move to PEP517.  
> 
> I mean, it's just a missing dependency bug that was revealed by the
> pep517 migration, it can be reviewed/merged entirely separately from
> the actual pep517 migration patch(although it should be merged first).

See above: it's not a missing dependency bug, and outside of the pep517
migration, the proposed change is not useful/relevant. It just adds
another dependency (increasing the build time) with no
need/justification.

> I don't really have a good workflow for managing a large patch series so
> I tend to try and keep things more separated out unless I see a good
> reason for the changes to be kept together(ie if there is a need for them
> to be reviewed at the same time).
> 
> I personally find it a lot harder to review changes when they are mixed
> into a large series as that often reduces the signal to noise ratio.

The thing is that it's mainly the maintainers duty to review changes,
and so your preference in terms of what is easy/difficult to review
here does not really matter. As maintainers, we tell you that the way
you're submitting those patches make it difficult for us, because the
patches come isolated, with no explanation as to how they fit in the big
picture.

If you insist to send isolated patches, then you need each patch to
have a very extensive and detailed commit log that allows us to
understand how it fits in the big picture.

This whole discussion on the python-msgpack dependency on
host-python-cython is a good illustration of that.

> > Could you have a look at resending a complete series that include all
> > your changes related to PEP517 setuptools migration, with a proper
> > cover letter that describes the goal and the path taken to reach this
> > goal?  
> 
> I'm not really sure what I should add in a cover letter, all the changes
> in the series prior to the final pep517 migration patch are just package
> version updates. They would be the same whether or not we were
> planning on migrating setuptools to pep517.

That is correct, but not for this python-msgpack patch.

> In fact this pep517 migration patch depends upon many other version
> bump patches and similar changes I made that have already been merged
> as largely independent patches.

See my reply to your PEP517 setuptools infrastructure change, where I
suggest that maybe we need to find a solution that doesn't require a
flag day.

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
