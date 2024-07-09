Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018CCC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 11:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B68C8135C;
	Tue,  9 Jul 2024 11:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hND3c_u_S7QA; Tue,  9 Jul 2024 11:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FF781369
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FF781369;
	Tue,  9 Jul 2024 11:55:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F9171BF59A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 11:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49E7F4027C
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 11:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfPPiyWsMp2r for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 11:55:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8095F401FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8095F401FB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8095F401FB
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 11:55:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4FDF8240007;
 Tue,  9 Jul 2024 11:55:39 +0000 (UTC)
Date: Tue, 9 Jul 2024 13:55:38 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <20240709135538.4594978e@windsurf>
In-Reply-To: <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
References: <20240704121352.1915154-1-fiona.klute@gmx.de>
 <20240704121352.1915154-4-fiona.klute@gmx.de>
 <20240708235639.7a9cc07c@windsurf>
 <1e0c66a5-b6d3-4117-aafb-68b4d00a5565@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720526139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Apuapcustgxrx7Z2czieZsy/5+FEDfmC1Yl3bgGgfEQ=;
 b=DEoARQZ9UjS2z8RgPCngxBuvbh6Rzz4LIQPL+ZvRbOAG9c/FR87BkSnjRfRCQr6vAihKyh
 ZFrf72o5/nRTAUl8mhXDWAilUrGRlCALedcpZ1bgwppGqE7EIYCopg/FWJaILpTqx+P01m
 Lrb18PDKVBVIVsRZIHCczpgssawrBbi+DgPBS/aEplRasxGK55XcF8n2L2toA+0fS0igHS
 YyqsDjFGE1guL0gw5fQktLi+ziM1hOE0jMeCP4zK7NCYrb+ppyRIPK7etoWErAYKwgP5db
 PCmSjoTuZ5dtqoSe8a2ZC3oAcEAbc6NVfzvKvqRS2Tes+XUA97qdVGnzO1rs5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DEoARQZ9
Subject: Re: [Buildroot] [PATCH v2 3/4] package/fail2ban: bump version to
 1.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fiona,

On Tue, 9 Jul 2024 12:19:49 +0200
Fiona Klute <fiona.klute@gmx.de> wrote:

> >> -FAIL2BAN_VERSION = 1.0.2
> >> +FAIL2BAN_VERSION = 1.1.0
> >>   FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
> >>   FAIL2BAN_LICENSE = GPL-2.0+
> >>   FAIL2BAN_LICENSE_FILES = COPYING
> >>   FAIL2BAN_CPE_ID_VENDOR = fail2ban
> >>   FAIL2BAN_SELINUX_MODULES = fail2ban
> >>   FAIL2BAN_SETUP_TYPE = setuptools
> >> +FAIL2BAN_DEPENDENCIES = host-python3 python-pyasynchat  
> >
> > Why are you adding host-python3 in the dependencies here?  
> 
> I saw a build failure because host Python hadn't been built before
> without it. I now suspect that was the result of adding a runtime-only
> dependency to build-time dependencies (see below), I guess it broke some
> implicit dependency handling? After completely removing that line the
> build passes, too.

Adding a runtime dependency to build-time dependencies cannot break
dependency handling. It just enforces a "strong" dependency that
doesn't exist, but it clearly cannot be responsible for a build
failure. So it looks like we haven't figured out why the build was at
some point failing for you.

A good practice when testing a package:

$ make clean
$ ./utils/docker-run make fail2ban

This will only build fail2ban and its build dependencies, and nothing
else. This will therefore make sure that you properly captured all
dependencies. And it does so in a minimal docker container, to ensure
no tools from your host machine are used.

> > Also, are you sure python-pyasynchat is a build time dependency, and
> > not just a runtime dependency? If that's the case, then you need to
> > kept the select in the Config.in file (with a comment # runtime), but
> > not have it as a build-time dependency in fail2ban.mk.  
> 
> That's indeed a runtime dependency.
> 
> Thanks for the review! I've just sent an updated version of the series
> with the runtime comment added and the build time dependency removed. If
> it's good to merge now, please keep in mind that it's only going to fix
> the fail2ban build if merged after Angelo's fixes to the config file
> handling (linked in the cover letter).

ACK, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
