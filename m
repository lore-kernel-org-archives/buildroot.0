Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A3BC54E58
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 09:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C94D407DA;
	Wed, 20 Mar 2024 09:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUt4pywNLhvu; Wed, 20 Mar 2024 09:17:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83BD540778
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BD540778;
	Wed, 20 Mar 2024 09:17:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 23DD71BF59F
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 09:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 171FD40791
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 09:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HDv7doO8s0tc for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 09:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7304B40743
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7304B40743
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7304B40743
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 09:17:19 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42K9HGkW087209;
 Wed, 20 Mar 2024 04:17:16 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42K9HGaM075737
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Mar 2024 04:17:16 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 04:17:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 04:17:15 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42K9HFeT078600;
 Wed, 20 Mar 2024 04:17:15 -0500
Date: Wed, 20 Mar 2024 04:17:15 -0500
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20240320091715.a65mdipyyp3qbk35@dasso>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
 <ZfoNHD-DlqkkYCRh@landeda> <20240320021823.gbwmzxmfmgqmbyiw@dasso>
 <Zfp-rk1BDxhDnkZi@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zfp-rk1BDxhDnkZi@landeda>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1710926236;
 bh=vUK7LGSRJ7bkG3x7RnH+68qyEB6cR86hwvqe9Dwn3Uk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=oa2ab5uRWPfML5iFPDpBXA1shWrhpEiId6/6K8Ix0f8CvHW/iUDvirmI4TAj5jd5d
 lSBseCbzIq8D8H0eLALjeyqOnwijzb2USeZLWYtXK3okBYxfEqWLpbalxtP7cZsxEz
 8TLVH/HACLgp8tO5E/oZSdOIgCitej7HYLkCDskQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=oa2ab5uR
Subject: Re: [Buildroot] [PATCH v9 05/22] boot/ti-k3-r5-loader: bump to
 version 2024.01
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On Wed, Mar 20, 2024 at 07:14:06AM +0100, Yann E. MORIN wrote:
> Andreas, All,
> 
> On 2024-03-19 21:18 -0500, Andreas Dannenberg via buildroot spake thusly:
> > On Tue, Mar 19, 2024 at 11:09:32PM +0100, Yann E. MORIN wrote:
> > > On 2024-03-04 16:32 +0100, Dario Binacchi spake thusly:
> > > > All in-tree configs with the ti-k3-r5 bootloader use a custom version,
> > > > so this patch is mostly for the menuconfig default version
> [--SNIP--]
> > > Speaking of that, by the way, ti-k3-r5-loader really is uboot, so I
> > > think that it should share:
> > >  1. the same DL_DIR:   TI_K3_R5_LOADER_DL_SUBDIR = uboot
> > >  2. the same hash file:  have ti-k3-r5-loader.hash be a symlink to
> > >     uboot.hash  (and have a xomment at the top of that hash file that it
> > >     is shared and that old hashes should/can be kept)
> > The entire boot chain for TI K3 devices (like all of AM62x) comprising
> > what's known as ti-k3-r5-loaer in Buildroot as well as U-Boot SPL/U-Boot
> > [proper] should _always_ be built from the same U-Boot source commit, as
> > this is how it's developed, tested, and used by pretty much everybody.
> > So your suggestion to more closely tie those things together makes a lot
> > of sense IMHO.
> 
> Ah, interesting, thanks for the feedback.
> 
> So, it looks like for the situation for ti-k3-r5-loaer vs. U-Boot is
> very similar to the one for barebox: it can build a "base" barebox, and
> an "aux" barebox; they both share the same implementation (the
> barebox-package mini-infra), they each provide their own (def|.)config
> file, and they each have their own set of (Buildroot) options (the aux
> one has fewer options).
> 
> So it looks like this is what we should have done for ti-k3-r5-loaer,
> no?

I'm not familiar with barebox but what you are describing looks similar.
Note that ti-k3-r5-loader (building the initial boot binary) is building
for 32-bit ARMv7, and the next boot stages (U-Boot SPL, U-Boot) are all
64-bit ARMv8, so this might complicate any possible unification efforts.
 
> Also, does it make sense to use ti-k3-r5-loaer without U-Boot?

Yes, you could do "Falcon Boot" where the ti-k3-r5-loader would directly
load the Linux kernel, greatly simplifing the boot flow and booting much
MUCH faster. Actually it's a much-requested feature from our customers
(you know, the real world use cases :) so I wrote a technical note [1]
about that last year on how to set this up manually but it would be
great if we could bring this into Buildroot as a package/option somehow
at some point, after we get the base support accepted into the tree.

[1]
https://e2e.ti.com/support/processors-group/processors/f/processors-forum/1205638/faq-am625-how-to-boot-from-r5-u-boot-spl-directly-into-the-linux-kernel-skipping-a53-spl-and-a53-u-boot-falcon-mode


--
Andreas Dannenberg
Texas Instruments Inc




> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
