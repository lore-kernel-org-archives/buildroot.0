Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E51CDB483
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1718403CA;
	Thu, 19 Oct 2023 07:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1718403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35vclPq6gqbM; Thu, 19 Oct 2023 07:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E71F4249E;
	Thu, 19 Oct 2023 07:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E71F4249E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AD5821BF5EA
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6701F4265A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6701F4265A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQNsYbCAcvdU for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:19:17 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B70954264E
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B70954264E
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3615C0002;
 Thu, 19 Oct 2023 07:19:12 +0000 (UTC)
Date: Thu, 19 Oct 2023 09:19:11 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20231019091911.0ca4f8ce@booty>
In-Reply-To: <CH2PR12MB5004F0808389B4F67C1936A6F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230924151205.2099293-1-neal.frager@amd.com>
 <20230924151205.2099293-4-neal.frager@amd.com>
 <20231016121148.0eaec482@booty>
 <CH2PR12MB5004F0808389B4F67C1936A6F0D5A@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697699953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFnAafkZLrIGsuVwk8/QThtVFhYqsf0rPMU0aSmTbLQ=;
 b=KkWFrb31t2fAWwoAkr/uT3wNeuutodBEISlLQDIcgO90mVzz8Dk7mSfzED3YU1Ds1+rxw7
 D+yWWeJ1bAzO71O69BFP3aPqxcyRqTuVPmDiL7kaCJihjpGaUgaw8iFzwV55LHG0ZdMjyS
 547rIrNUY1TSmdLB/DqQXZFEPONIAKVuuN1zrWt1jasso9ufCxHYTNb/LG+QCP8P9dBgPD
 iG4JAT1A/skW1umrJZYlqpGt8bhe6NfJ35txWjmKhSfN1D+2Gu59VhZX+eOHtQj2V64C+C
 QeALoe8RtROiy+edUUBxNvL8q1JA5pmhVRWtnsjdGQW4/bkrlxw029zG6C/KOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KkWFrb31
Subject: Re: [Buildroot] [PATCH v4 04/10] toolchain/toolchain-bare-metal:
 new toolchain
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On Wed, 18 Oct 2023 12:46:40 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hi Luca,
> 
> > This patch adds a new virtual package for adding a bare-metal 
> > toolchain to buildroot.  By default, this package will configure a 
> > bare-metal toolchain for the Xilinx microblaze little endian 
> > architecture.  When configured for the Xilinx microblaze architecture, 
> > this toolchain can be used to build the microblaze firmware applications for zynqmp and versal.
> > 
> > Signed-off-by: Ibai Erkiaga-Elorza <ibai.erkiaga-elorza@amd.com>
> > Signed-off-by: Neal Frager <neal.frager@amd.com>
> > ---
> > V1->V2:
> >  - adds select option to bring in all packages needed for 
> > toolchain-bare-metal
> > V2->V3:
> >  - no changes
> > V3->V4:
> >  - moved from package to toolchain directory
> >  - improved menuconfig help comment
> > ---
> >  DEVELOPERS                                    |  2 ++
> >  toolchain/Config.in                           |  1 +
> >  toolchain/toolchain-bare-metal/Config.in      | 21 +++++++++++++++++++
> >  .../toolchain-bare-metal.mk                   |  7 +++++++  
> 
> > I wonder whether this should be in
> > toolchain/toolchain-bare-metal-toolchain to make room for a future toolchain/toolchain-bare-metal-external.  
> 
> What is the value of adding another toolchain in the name?
> 
> For example:
> 
> Internal Toolchains:
> toolchain-bare-metal
> toolchain-buildroot
> 
> External Toolchains:
> toolchain-bare-metal-external
> toolchain-external
> 
> If anything, I could argue that we should then rename 'toolchain-external' to 'toolchain-buildroot-external'.
> 
> That would give us the following:
> 
> Internal Toolchains:
> toolchain-bare-metal
> toolchain-buildroot
> 
> External Toolchains:
> toolchain-bare-metal-external
> toolchain-buildroot-external
> 
> What do you think?

My understanding of the current naming is that the "buildroot" suffix
means "built by Buildroot as part of the build" while "external" means
"already built, by whatever tool". Ans as such the toolchains are
currently named toolchain-{buildroot,external}.

Following this line of thought, the bare-metal toolchains would be
called toolchain-bare-metal-{buildroot,external}.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
