Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28479E7542D
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 07:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A897F610DD;
	Tue,  3 Oct 2023 07:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A897F610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0n3Qr0ax7pZX; Tue,  3 Oct 2023 07:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFB0560F0D;
	Tue,  3 Oct 2023 07:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFB0560F0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08F411BF3A1
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5D2240931
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D2240931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLdKoJE-S5uo for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 07:15:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC7AE4093E
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 07:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC7AE4093E
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF6AD60004;
 Tue,  3 Oct 2023 07:15:40 +0000 (UTC)
Date: Tue, 3 Oct 2023 09:15:39 +0200
To: "Frager, Neal" <neal.frager@amd.com>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
Message-ID: <20231003091539.5e26d558@booty>
In-Reply-To: <CH2PR12MB50046780037DB7AF933A119FF0C6A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
 <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60045761B225083426E7B1A1A0FFA@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230925045944.6a88abd4@booty>
 <7AD8C3E2-4A82-434F-8C3D-6B9B5E53E798@amd.com>
 <877co67fgz.fsf@48ers.dk>
 <CH2PR12MB50046780037DB7AF933A119FF0C6A@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696317341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX4K2vPOq/3FMZUHGBZGJMFC1Lbih7PHGlLJU/kx+aI=;
 b=LuQHbTZ5jlilvCbcpM6RkCeUjqDI4E4Px1pDCpe7rA+Gdrc1N7KTmoOQA8ffFllxlLPrJn
 ibdyCa7SLz/oE0+CysmeFmCwOpLwOPUxGlNTcxUwCaQ2G1K3y94dZ5OzMHSFSN99spqQp7
 d85GE9VPtucm9UC6+ZfN4VYqUZkC3yAnH44acuvu4vqN9vqj+3xaJmhPg7QQfkvjGFkQx6
 /vqZME49Vftn+rq4mokMBqq7u/KdPEmEIMC8fIex52urPgYjCsMxniBA3t0tz9A9FkTx/Y
 siPuJe/ZZW0pv8hOmYclIbKy4VBKUCFzKrLkncFLvfYtAemwIBJ7Ppmv97sFZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LuQHbTZ5
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal, Peter,

On Sun, 1 Oct 2023 16:11:23 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Hello Peter,
> 
>  >>> Is this ok for both of you?  
>  >>
>  >> I'm OK with the whole approach, except for the sentence "I do not  >> believe there is currently any organized effort to upstream any of  >> these patches"... which is probably already clear to the recipients  >> of this message, and thus is not going to be solved in this thread,  >> however I just want to be sure my position is clear. I'd also like to  >> stress that I appreciate a lot the work you are doing to properly  >> support the pmufw in Buildroot. Thanks!
>  >>
>  >> Luca  
> 
>  > Your position is very clear.  And I can assure you that both Ibai and I agree with it.  
> 
>  > It would be much better if all of these binutils and gcc patches for  > microblaze go upstream, and both Ibai and I have pushed for it  > internally at AMD / Xilinx.  
> 
>  > The only thing I can say is that change is always possible.
>  > Yesterday, we could not build a zynqmp pmufw, versal plm or versal  > psmfw in buildroot.  Today, we have submitted a solution to change  > that.  
> 
>  > Tomorrow (figurative meaning the future), we hope to get all these  > binutils and gcc patches upstream, so the upstream toolchain matches  > the AMD Xilinx distributed toolchain.  
> 
>  > One step at a time.  
> 
> > Sure! Sorry, I am somewhat late to the review game here. I wonder how this fits with Luca's zynqmp-pmufw-builder?  
> 
> From my view, we can continue maintaining Luca's zynqmp-pmufw-builder in parallel.  Buildroot will still offer the option to accept a pre-built pmufw binary without needing to build a microblaze toolchain, so if users prefer to build the pmufw outside of buildroot (to have a faster buildroot build perhaps), this capability will still be available.

As Neal wrote, if/when Buildroot will be able to build a pmufw on its
own (with the proposed approach, or a downloaded toolchain, or
both), zynqmp-pmufw-builder can continue existing even though the use
cases for it will be reduced. I have no plan to stop maintaining it for
the foreseeable future.

> > E.G. today the setup is that the pmufw is built outside Buildroot and we just point the u-boot package to where it can fetch the prebuilt firmware binary - This is nice in the sense that it is fast and simple, but makes is somewhat annoying to make modifications to the firmware.  
> 
> > This series instead goes to the other extreme, E.G. we build the entire microblaze toolchain from scratch and then use it to build the firmware and use it in the u-boot package - This is nice because it is all in Buildroot and we have it all under control, but also brings quite some build time overhead for building the toolchain before building the  
> (small) toolchain. You can naturally "solve" it by using two defconfigs, E.G. one that builds the pmufw and another that uses the prebuilt one, but it isn't very handy either.

I think the approach taken here by Neal and Ibai is valuable,
especially as it would allow Buildroot defconfigs to be self-standing.
Additionally it is already proving useful as it prompted "the
community" (mostly Neal -- thanks about that) to upstream patches
needed to support Microblaze in binutils and gcc, that are currently
downstream.

> > Would an in between option not be more interesting, E.G. use (or  
> download) a prebuilt microblaze toolchain and use that to build the firmware? That would still give the flexibility to easily tweak the firmware, but not the overhead of building the toolchain every time?
> 
> > I guess the problems with that are what to do about the meta-xilinx patches and where/who wants to host a prebuilt one?  
> 
> This is a good point.  As for the meta-xilinx patches, Ibai and I have started going through them and have even started upstreaming a few.  The majority of the meta-xilinx patches are actually for enabling 64-bit microblaze support, which is not available in the upstream gnu binutils or gcc.  Since we do not need 64-bit microblaze for the zynqmp pmufw or the versal plm and psmfw applications, we can easily skip these patches.
> 
> Our current objective is to get all microblaze 32-bit bug fix and feature support patches (such as the barrel shift instructions used by the pmufw) upstreamed.  Since this appears to be a small subset of the overall meta-xilinx patches, we hope to be able to enable the use of the upstream gnu binutils and gcc, so that the meta-xilinx patches will no longer be needed for our use case of building the zynqmp pmufw, versal plm and versal psmfw applications.
> 
> However, in order to achieve what you are asking for, we would still need someone to host a pre-built microblaze compiler somewhere, if we would want to go this route.  At the moment, it is not in the AMD Xilinx plan to host the toolchains somewhere outside of a Petalinux or Vitis download.
> 
> If the upstream toolchain included all the necessary meta-xilinx patches, could bootlin potentially host a pre-built toolchain somewhere?

I fyou are thinking about toolchains.bootlin.com, I am not the
maintainer of those toolchains but I think the idea is to only have
Linux toolchains there, not bare metal ones, thus newlib is not
supported. Also I'm pretty sure downstream feature patches are
absolutely not welcome there.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
