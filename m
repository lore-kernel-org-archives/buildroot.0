Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF3C54E67
	for <buildroot@archiver.kernel.org>; Wed, 20 Mar 2024 06:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12E0D40BD7;
	Wed, 20 Mar 2024 06:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qE5_Dgr6Kpfc; Wed, 20 Mar 2024 06:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D00D4029B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D00D4029B;
	Wed, 20 Mar 2024 06:14:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80D641BF30E
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 06:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D7E940802
 for <buildroot@lists.busybox.net>; Wed, 20 Mar 2024 06:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FwEiVIdSGnD for <buildroot@lists.busybox.net>;
 Wed, 20 Mar 2024 06:14:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3BA9C407F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA9C407F8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BA9C407F8
 for <buildroot@buildroot.org>; Wed, 20 Mar 2024 06:14:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E324D13F861;
 Wed, 20 Mar 2024 07:14:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Mar 2024 07:14:06 +0100
Date: Wed, 20 Mar 2024 07:14:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Dannenberg <dannenberg@ti.com>
Message-ID: <Zfp-rk1BDxhDnkZi@landeda>
References: <20240304153253.732708-1-dario.binacchi@amarulasolutions.com>
 <20240304153253.732708-6-dario.binacchi@amarulasolutions.com>
 <ZfoNHD-DlqkkYCRh@landeda> <20240320021823.gbwmzxmfmgqmbyiw@dasso>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240320021823.gbwmzxmfmgqmbyiw@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1710915261;
 bh=VnWRAvvYfoTbtnYqtuT4T6xXksYhnG48v08sseRcoX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKw+RqcgDsqJnkika39cyS6SiJTpRzk6KtF+bCAZHrYYJ6cAF9Nm2KWRNdbCs3rcP
 6W3KJ+ukosf7fhLv+FXPBrU1p/JEoWhhGe/LvEPR22xpmcsTcvkardvn7/j+1b0pnI
 VnVjLuxnVNIGN72p29EUUV3vor/GUklxIa0FIMgqL6y4ronqyJ+afwBufmCN5lXShK
 FJ733RkguvKZrbzloxkndAqC96P85SyTZRfm/LtOKBd7b1xJpPx9DqvQK1N+bo6JHe
 mV/dDWiq6TM4tQwfVS7D6Be2o/I9Fvs2wQAFVvHLdPF60gM/6RAjL1x9a6ejuJmxyr
 DZfmlwG2LKB0A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aKw+Rqcg
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

Andreas, All,

On 2024-03-19 21:18 -0500, Andreas Dannenberg via buildroot spake thusly:
> On Tue, Mar 19, 2024 at 11:09:32PM +0100, Yann E. MORIN wrote:
> > On 2024-03-04 16:32 +0100, Dario Binacchi spake thusly:
> > > All in-tree configs with the ti-k3-r5 bootloader use a custom version,
> > > so this patch is mostly for the menuconfig default version
[--SNIP--]
> > Speaking of that, by the way, ti-k3-r5-loader really is uboot, so I
> > think that it should share:
> >  1. the same DL_DIR:   TI_K3_R5_LOADER_DL_SUBDIR = uboot
> >  2. the same hash file:  have ti-k3-r5-loader.hash be a symlink to
> >     uboot.hash  (and have a xomment at the top of that hash file that it
> >     is shared and that old hashes should/can be kept)
> The entire boot chain for TI K3 devices (like all of AM62x) comprising
> what's known as ti-k3-r5-loaer in Buildroot as well as U-Boot SPL/U-Boot
> [proper] should _always_ be built from the same U-Boot source commit, as
> this is how it's developed, tested, and used by pretty much everybody.
> So your suggestion to more closely tie those things together makes a lot
> of sense IMHO.

Ah, interesting, thanks for the feedback.

So, it looks like for the situation for ti-k3-r5-loaer vs. U-Boot is
very similar to the one for barebox: it can build a "base" barebox, and
an "aux" barebox; they both share the same implementation (the
barebox-package mini-infra), they each provide their own (def|.)config
file, and they each have their own set of (Buildroot) options (the aux
one has fewer options).

So it looks like this is what we should have done for ti-k3-r5-loaer,
no?

Also, does it make sense to use ti-k3-r5-loaer without U-Boot?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
