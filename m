Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AF3C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 20:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BE5560ADF;
	Sun,  6 Aug 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BE5560ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id udmH4OGNyWk7; Sun,  6 Aug 2023 20:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF9260DFE;
	Sun,  6 Aug 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFF9260DFE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 361221BF421
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FE44605AC
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FE44605AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pXStiql84bC3 for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 20:51:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4610B60B9C
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 20:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4610B60B9C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3114E20002;
 Sun,  6 Aug 2023 20:51:28 +0000 (UTC)
Date: Sun, 6 Aug 2023 22:51:27 +0200
To: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Message-ID: <20230806225127.02236235@windsurf>
In-Reply-To: <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
References: <20230802220321.6af766af@windsurf>
 <DS7PR12MB9041FA314EB2D49935CF2D85A10BA@DS7PR12MB9041.namprd12.prod.outlook.com>
 <20230803001230.284ba84d@windsurf>
 <DS7PR12MB9041C235443BB70E65A561FEA108A@DS7PR12MB9041.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691355088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FNbMR4r9wNKNl6jtEwhyHCpv8zFe846x2WGRV0bwvh8=;
 b=Naf1clxZ2ofoSGzI1LwMdvRvRPGipSGPCzvKTzBaRJ4gaEa6ZXlNeO3nCFfaE03ENQsf7t
 vR9cKoqPECnI9+j1VjU/2JBB8drvC5YjG8VGs4wYAl0W/gDy9EqH6B13pImmp9ASbaKgaU
 eHILOSKkjrnA0MjZfYgeOQwR6b+/YtqslCKuHvHR6BJgqiIFnxQMXmoB2LeOY3FgNhcsUV
 o/F3vyMmsXSn1ie+13Xo1oS/MfXvFBsx946BahyHnBkUYsp0/pEb8/T0uIJRwyYNBQqd/s
 WAid8ro2MiNFEGfq81/P7R8P2ArfdAsH9MoU8pPXrmrKFSyy+xrEuoQI1Knm8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Naf1clxZ
Subject: Re: [Buildroot] ARC support in Buildroot
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 ARC Buildroot mailing list <arc-buildroot@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexey,

On Thu, 3 Aug 2023 07:59:56 +0000
Alexey Brodkin via buildroot <buildroot@buildroot.org> wrote:

> > Can we drop those special versions and assume what's in upstream
> > GCC/binutils/GDB is good enough?  
> 
> Well, we'll just update it to say 2023.03 [1] or maybe even 2023.09 later
> in the fall :)

Looking forward to your patch doing this.

> And the reason is that ARCv3 support. As I mentioned ARCompact/ARCv2 is
> well supported in upstream GCC/Binutils/GDB etc and all the fixes go right
> to the upstream repos as we have our own maintainers who take care of that.
> 
> So, in theory it should be OK to remove "arc-xxxx.yy" toolchains from Buildroot.
> But since we were a bit late with ARCv3 changes for GCC 13, those will only
> land in GCC 14 which is going to happen sometime in 2024, I guess.
> 
> Thus, we'll need to have "arc-xxxx.yy" anyway with sources from our GitHub
> forks, primarily to support ARCv3 stuff. Thus, I didn't want to introduce that
> turbulence with removal of ARC toolchain and then adding it back next week.

Sounds good to me, but it should be maintained then :-)

> > (1) Drop ARC-specific versions of GCC/binutils/GDB if you confirm it's OK  
> 
> As I said, we'll update ARC toolchain instead:
>  - Primarily to add ARCv3 support and while ARC toolchian will be there anyway
>  - It makes sense to keep it for ARCompact/ARCv2 as there're some fixes and
>    improvements which are not yet upstream (because release schedules don't match)

OK.

> > (2) Add readme.txt about the different defconfigs so we understand
> >     which platform they target, and where it can be found, if freely
> >     available.  
> 
> We'll do that.

Good.

> > (3) Perhaps make it possible to build the ARC-specific qemu, so that we
> >     can out of the box have a qemu that we can use to boot test one ARC
> >     platform. Then we can enable that in our Gitlab CI  
> 
> Well, QEMU for ARC is easily doable. I guess it's more of a question on how to
> integrate it with Buildroot's GitLab flow, any references to docs on the matter
> (sorry if asking something simple, but while I have your attention, possibly you
> may point me at something immediately)?

We probably need to simply tweak the existing Qemu package. Not a
priority, but would be nice.

Something more important: fix the broken snps_arc700_axs101_defconfig.
You're normally receiving e-mails about this. If not, let me know,
because it means there is an issue in the notification machinery.

See:

 https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673779
 https://bugs.busybox.net/show_bug.cgi?id=15446

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
