Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D29EE49B0
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 21:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D55761354;
	Thu, 31 Aug 2023 21:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D55761354
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZJtrPecLdUx; Thu, 31 Aug 2023 21:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A316161347;
	Thu, 31 Aug 2023 21:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A316161347
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B92FA1BF396
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 21:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77C8482890
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 21:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77C8482890
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPywvllDDthf for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 21:54:46 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 189D482338
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 21:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 189D482338
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4446940007;
 Thu, 31 Aug 2023 21:54:42 +0000 (UTC)
Date: Thu, 31 Aug 2023 23:54:41 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20230831235441.1a93e5ed@windsurf>
In-Reply-To: <CAMdwsN_TugJKe9iAYaQRsE77RWTkdRATNWPHLY1=5DN4j0AFgA@mail.gmail.com>
References: <20230808172231.1114696-1-jesse.vangavere@scioteq.com>
 <20230826214912.7821c07c@windsurf>
 <CAMdwsN_TugJKe9iAYaQRsE77RWTkdRATNWPHLY1=5DN4j0AFgA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693518883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qctz2kT+Dd4VHjQZsNzNgA9x0e8LTPcpjKATghfTHM8=;
 b=X/QmBKQcUrNXzgEbSlj+1HDBePgOSP2Qn97krFmoAlBQ91zAKvfXIFAt3tqcldIQHjQGfv
 ZEzyiYh0OKEL0ftA95MmmCr/CoeIR8nsdgqGClnmMKRgwwiQSGqqI6LkAE1seUkS7n/G3S
 QyfByPqLYJfHm2yeNtiOhw0qc4NCLsfDeJQvQRZy9HEJBJJtdhNggot7VIlSRg5b9jq6S6
 0VZKogd/6pm3xO5xOwycCBkr+0u3q2/824WDgGK1VhFqnBXFdhJNNnKtDuEXbfc8uAhssX
 xZOhLBjaN80CpzRlZO7vNipRTvTRaXmrzimKvoeKE2BaLsRVuB18hpwtETslsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=X/QmBKQc
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6shadertools: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Jesse Van Gavere <jesse.vangavere@scioteq.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Sat, 26 Aug 2023 22:04:19 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> > For the target package, it would be easy to fix. But for the host
> > qt6base package, the story is a bit different. Does qt6shadertools
> > really need GUI support in host-qt6base? If so, how did you test that
> > as nothing in Buildroot right now allows to enable GUI support in
> > host-qt6base?
> >  
> Yeah another oversight, I probably built it with GUI temporarily in and
> forgot about it, the host package is necessary though as this will install
> qsb which is a requirement for the follow-up qt declarative package I want
> to add (at least for QtQuick support)

If qsb is only needed for the follow-up qt declarative package, then it
should only be built as a dependency of this, and not as a dependency
of the target qt6shadertools.

> and I'm not aware of a mechanism that
> allows for conditional host package builds, if it's available though I'll
> take a look, otherwise I'll always do the host build jit for that case, but
> I'll at least check for adding the host GUI support, a slight casualty of
> Qt their new host/target split

See package/python3/Config.in.host. Packages that need bzip2 support or
SSL support in host-python3 can select BR2_PACKAGE_HOST_PYTHON3_BZIP2
or BR2_PACKAGE_HOST_PYTHON3_SSL.

So you will need a package/qt6/qt6base/Config.in.host with a
BR2_PACKAGE_HOST_QT6BASE_GUI, and tweak qt6base.mk to build
host-qt6base with GUI support if BR2_PACKAGE_HOST_QT6BASE_GUI=y. Of
course one question will be: which display backend you will enable...

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
