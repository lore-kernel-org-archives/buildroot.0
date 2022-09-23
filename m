Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A767C04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA3DB41A16;
	Fri, 23 Sep 2022 21:51:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA3DB41A16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsOrFedVKOPg; Fri, 23 Sep 2022 21:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B40C1418B3;
	Fri, 23 Sep 2022 21:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B40C1418B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADB4D1BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86FB2418B3
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86FB2418B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wW7I1gUFTDS2 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:51:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E28BB4188F
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E28BB4188F
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:51:51 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1CBCFFF803;
 Fri, 23 Sep 2022 21:51:49 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:51:49 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Message-ID: <20220923235149.5b312376@windsurf>
In-Reply-To: <1663937486-98556-1-git-send-email-gwenj@trabucayre.com>
References: <1663937486-98556-1-git-send-email-gwenj@trabucayre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663969910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SP2Zl7GXC+ktES2Ae+ajH+lcguP55I492ld5QOU7Wiw=;
 b=d/7JTnN641Mxe5mDVlarZNuZjhyJI4DBprOntNrRyjrYzxVfw9lm38teBfnbYU9fPQjqhx
 ZsbwTBYvECCarFYbUd5VSKzKNDKNGOK83pp/Lz1JMOoDwINXnjfDGflk7y/H1A6wLZ079Z
 VnlUNsYdOlSIK2UECU/uf1v2h/RsrcKlzZ72Da6L0XLDq2H5Vqyh4KtdDA8ze3RNO0tNEx
 4ZkGDy98l+2AL7AsiKDhs2N+ZWY580Kb1JcHCs4027cQK1pfN+DFZgoZpZUbUHNZQxxocZ
 cPu3h8NrmBYZonuUlBpPVDRwsQJKINWPK08xqWhE2OTFvmrK4TgJSi9DgUlhNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d/7JTnN6
Subject: Re: [Buildroot] [PATCH v3] package/gnuradio: bump version to
 3.10.4.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri, 23 Sep 2022 14:51:26 +0200
Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:

> Note:
> Since gnuradio 3.10 swig was replaced by pybind. Now python libraries
> and python wrappers are produces using pybind: this why pybind is a
> buildtime and runtime dependency. numpy also become a buildtime dependency
> since some cpp bindings uses numpy's functions directly: this library
> is now required in both situation.

I am sorry, but this is still not clear. In this text, nowhere you are
talking about "host" or "target" packages.

> -	select BR2_PACKAGE_PYTHON_NUMPY # runtime
> +	select BR2_PACKAGE_PYTHON_NUMPY

This change is incorrect: target numpy is still only a runtime
dependency. Your change to gnuradio.mk adds host-python-numpy as a
build-time dependency, but not python-numpy.

Remember:

 - Target packages are named "foo" and have a corresponding Config.in
   symbol called BR2_PACKAGE_FOO

 - Host packages are named "host-foo" and generally do not have a
   corresponding Config.in symbol.

Therefore:

 - A host build-time dependency is added by doing <pkg>_DEPENDENCIES =
   host-foo

 - Target build-time dependency is added by doing <pkg>_DEPENDENCIES =
   foo *AND* selecting BR2_PACKAGE_FOO

 - Target run-time dependency is added by selecting BR2_PACKAGE_FOO

My understanding regarding numpy is that it is a:

 - Target run-time dependency
 - Host build-time dependency

>  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> -GNURADIO_DEPENDENCIES += python3
> +GNURADIO_DEPENDENCIES += python3 python-pybind \

This python-pybind looks weird. Why would the *target* package be
needed at build-time? Are you sure it's not host-python-pybind that is
needed? I don't see how python-pybind can be used at build time, since
it's a target package.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
