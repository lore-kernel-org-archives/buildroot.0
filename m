Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33BCC83F1A
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 14:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C0483B2D;
	Mon, 21 Jul 2025 14:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBLAintI5BbC; Mon, 21 Jul 2025 14:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5701083C4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5701083C4C;
	Mon, 21 Jul 2025 14:03:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77467DA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 14:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69343400D5
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 14:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PP96HM2Qm4pQ for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 14:03:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.246;
 helo=fllvem-ot04.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 970BF40069
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 970BF40069
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 970BF40069
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 14:03:49 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LE3mSA1272323;
 Mon, 21 Jul 2025 09:03:48 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LE3mak3347625
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 21 Jul 2025 09:03:48 -0500
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 09:03:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.55; Mon, 21 Jul
 2025 09:03:47 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 09:03:47 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LE3lKj3944722;
 Mon, 21 Jul 2025 09:03:47 -0500
Date: Mon, 21 Jul 2025 09:03:47 -0500
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20250721140347.xtd5h77ecufexxdh@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250715081938.108853-1-heiko.thiery@gmail.com>
 <20250715081938.108853-2-heiko.thiery@gmail.com>
 <20250715140207.p5z2khln5cvfismv@bryanbrattlof.com>
 <CAEyMn7akwpuZkigJ1KcmCjXtm3oD_LNS7o_2KNSYkUbZRnP1fg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEyMn7akwpuZkigJ1KcmCjXtm3oD_LNS7o_2KNSYkUbZRnP1fg@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1753106628;
 bh=Q2Lx7ks1VcCo698vAvQoQXmNXTqY4ZQlkBZXHAHczec=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=caewKWwyFIv/V7taWxnu8BP4IJ/BAJdA529qCXIDh5VErHs2W+9psF3Jg8c/s6GCu
 CSVVOEuPCdSZYxhxk4wERxzcfLyOv9dIJn9NkpQiClZ0ZkTyTlrmGiFm3INiidWDXL
 M2icKaaD2GcPPD/PvBujrACxNDNMw1b6bgsL0erw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=caewKWwy
Subject: Re: [Buildroot] [PATCH v2] package/linux-firmware: add support for
 PowerVR rogue
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, Michael Walle <michael@walle.cc>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On July 21, 2025 thus sayeth Heiko Thiery:
> Hi,
> 
> Am Di., 15. Juli 2025 um 16:02 Uhr schrieb Bryan Brattlof <bb@ti.com>:
> >
> > On July 15, 2025 thus sayeth Heiko Thiery:
> > > This "powervr" directory has been present in linux-firmware since
> > > version 20231211.
> > >
> > > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > > ---
> > > v2:
> > >     - add entry to the hash file for LICENSE.powervr (Julien)
> > >
> > >  package/linux-firmware/Config.in           | 5 +++++
> > >  package/linux-firmware/linux-firmware.hash | 1 +
> > >  package/linux-firmware/linux-firmware.mk   | 5 +++++
> > >  3 files changed, 11 insertions(+)
> > >
> >
> > I don't do a lot with GPUs or VPUs but I seem to remember the GPU driver
> > was kinda borked right now. It's no reason not to let the firmware in
> > but I just wanted temper expectations before we start rendering some
> > triangles :)
> 
> I know that the mainline support is not yet in a good shape. But there
> is progress. So it is good to have the FW already available.

Oh I completely agree. I'm totally excited about the continued progress. 
I just wanted to warn anyone if they assumed the progress was finished.

Thanks for sending this
~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
