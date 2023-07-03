Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E1AC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E07260E0A;
	Mon,  3 Jul 2023 18:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E07260E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oJfQW-Y-6bTb; Mon,  3 Jul 2023 18:56:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEE5660B0D;
	Mon,  3 Jul 2023 18:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEE5660B0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18CCC1BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E675681CA7
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E675681CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RhfL_iLoJ5v5 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:56:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0FA081A18
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0FA081A18
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:56:36 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 828EB1C0009;
 Mon,  3 Jul 2023 18:56:32 +0000 (UTC)
Date: Mon, 3 Jul 2023 20:56:31 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230703205631.4dd121b0@windsurf>
In-Reply-To: <20230703182930.B08CA863E5@busybox.osuosl.org>
References: <20230703182930.B08CA863E5@busybox.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688410593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/52/LbllS0/tfMBOFEClduZQK/I+n8kxQw32m39FhI=;
 b=LzVt5Cd9eViA1IusmfreJhWFxOgZjk9WExaUlSMTLajMZpqvnvAeCIiD6xK32g1Gjy4lrX
 2n/pPLfXPU9I6j4pV+vLPx7HoeZ1sZWNoaioAbDxADD9Ve6x3AsiZ4pcUf+W8qsT8GVd5h
 Geee9j6e83P3nQkVWYjIaRGVdVbehqoeUlZKw47TypbTEjdvgwULwTeqtmjgGOoxC8z4CC
 Nql9VPXne6vckzCmIb3ZCwfCDKXLheIshJwRg5/owIZJhUbssOTWbDOfIneq/71799018W
 s+k8/ug0n6C5SDBRqMW+VZCeurlUmu3VOKVGbUh81fiN6AVkyvuPM11yxzKkrQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LzVt5Cd9
Subject: Re: [Buildroot] [git commit] package/python-setuptools: add missing
 dependency on host-python-wheel
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
Cc: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 3 Jul 2023 20:20:31 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> commit: https://git.buildroot.net/buildroot/commit/?id=3b2913552ee4e304d4d86e577b237652a8f0a99f
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> While migrating to pep517 build backend the host-python-wheel
> dependency has been added to host-python-setuptools but
> not to python-setuptools. Note that host-python-wheel is not really
> needed during the build of (target) setuptools, but the setup.py script
> checks if the dependency is present in the host directory.
> 
> To make everything consistent, add host-python-wheel as a build
> dependency, and BR2_PACKAGE_PYTHON_WHEEL as a runtime dependency.

Hu, this was not in the patch from Romain I believe.

> +	select BR2_PACKAGE_PYTHON_WHEEL # runtime

This is not correct, there is no such symbol in Buildroot, and it
causes a check-symbol error:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4586144848

What was the motivation behind this additional select?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
