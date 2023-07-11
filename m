Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5404BC001DE
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 07:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE32B40482;
	Tue, 11 Jul 2023 07:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE32B40482
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJDOTabcX5e3; Tue, 11 Jul 2023 07:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DCF640297;
	Tue, 11 Jul 2023 07:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DCF640297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3D301BF2C4
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 07:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDAE781FEC
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 07:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDAE781FEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Q72w4kC7tzF for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 07:38:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79259819BC
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79259819BC
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 07:38:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F2381C0007;
 Tue, 11 Jul 2023 07:38:08 +0000 (UTC)
Date: Tue, 11 Jul 2023 09:38:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230711093807.41f21337@windsurf>
In-Reply-To: <CADvTj4qQ1m9ehmGs6pPMmPUQumeKewq-n3c7rY20PHnT=2TETA@mail.gmail.com>
References: <20230626080016.2182278-1-james.hilliard1@gmail.com>
 <20230710200350.5c72bcab@windsurf>
 <CADvTj4qQ1m9ehmGs6pPMmPUQumeKewq-n3c7rY20PHnT=2TETA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689061089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s0Lfjzl8xgGccKqM81l1b5hNE0xv1/KMX76pG/pPbDE=;
 b=FpchH26quGhkdcv7VOze0ccimRaUL7tTgf8Fh3uP2EC1tkBsKd4G/FXmtL994Y9fTgHyz9
 kqwP2e9BsmSt4e45Pc4eyEDCZg3m7M+u5VhzrgWNtUE17cm4uJl+vBCD+ueCqBpEh0j7XD
 uZnY6wZFbBOTMb/CdUEWW56HkDWTX4rEBa+Yx1BtZpU9l/hFMf2hk1FVNPiGviL1T78ngp
 1K+ynz7htdSAvwV2y7rB6vZzWGo7iQZE0kHUW0zTSaPHFkyH+g81KW7C2sU0hV+VZ/vu9s
 Jk1rJ05rbL09Vr/j3eCoLcNK8JOWcFhQOOS9U3HuriuSBTS4d0kQd3HIItPU7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FpchH26q
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

On Mon, 10 Jul 2023 14:17:55 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> > Could you clarify if this is a current issue in the python-msgpack
> > package that causes build failures, or if this is in preparation to
> > move from setuptools to pep517 to build python-msgpack?  
> 
> It's a hard error when moving setuptools to pep517 but should be applied
> regardless as it's needed for optimized extensions to build properly AFAIU
> even when using legacy setup.py builds.

So this patch is a prerequisite to applying
https://patchwork.ozlabs.org/project/buildroot/patch/20230626181531.2312002-5-james.hilliard1@gmail.com/ ?

Why isn't it part of the same series, then?

What is an "optimized extension" ? Could you clarify in which case
python-msgpack wouldn't build/work, ourside of the PEP517 migration?

> > If you want us to merge your patches faster, please help us: explain in
> > the commit log the "WHY" you are doing the change. Your commit log
> > fails to explain it, and therefore I don't have the context to
> > understand the motivation of the change.  
> 
> I did mention in the commit log that this fixes an error which occurs when
> using a pep517 frontend, which is what the patch doing the setuptools
> pep517 migration changes, I'm not sure what context is missing here.

The context that is missing is that this patch (changing
python-msgpack) comes completely isolated from any other patch. If it
had been in the series that ends with the "package/pkg-python.mk:
migrate setuptools to pep517" patch, then it would have been clear:
it's a pre-requisite to be able to do this move to PEP517.

> We already use a pep517 frontend for other packages(i.e. packages using flit
> infrastructure) so I was assuming familiarity with pep517 build
> frontends/backends
> here. The pep517 documentation has additional background on how this all works.
> 
> https://peps.python.org/pep-0517/
> 
> This should be merged before the pep517 migration, I had only discovered
> this issue after so I had sent it as a follow up instead of within the
> initial pep517 setuptools migration series.

No, what you should have done is resend an updated PEP517 setuptools
migration series. This is what makes things clear for the
maintainers/reviewers. It's totally fine to miss things in the first
iteration of the series, but if you discover missing things, you should
NOT send separate standalone patches. Instead you should send a new
iteration of the series that includes the additional changes.

Could you have a look at resending a complete series that include all
your changes related to PEP517 setuptools migration, with a proper
cover letter that describes the goal and the path taken to reach this
goal?

This would *tremendously* help the work of the maintainers/reviewers.

Thanks a lot for all your work on the Python integration, it is really
much appreciated!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
