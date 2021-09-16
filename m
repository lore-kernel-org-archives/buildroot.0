Return-Path: <SRS0=h7+E=OG=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A644C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 11:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0AE61207
	for <buildroot@archiver.kernel.org>; Thu, 16 Sep 2021 11:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C0AE61207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ecosystems-group.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F1A280CB9;
	Thu, 16 Sep 2021 11:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EnaKeDaMmHJZ; Thu, 16 Sep 2021 11:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5103880C89;
	Thu, 16 Sep 2021 11:39:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D5211BF48C
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 11:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CAEC80C89
 for <buildroot@lists.busybox.net>; Thu, 16 Sep 2021 11:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wvk65-cS2WF1 for <buildroot@lists.busybox.net>;
 Thu, 16 Sep 2021 11:39:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.ecosystems-group.co.uk (mail.ecosystems-group.co.uk
 [194.73.217.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 069F880C61
 for <buildroot@buildroot.org>; Thu, 16 Sep 2021 11:39:47 +0000 (UTC)
Received: from ECO-SRV.ecosystems.local ([fe80::e556:f4a8:df18:453e]) by
 ECO-SRV.ecosystems.local ([fe80::e556:f4a8:df18:453e%11]) with mapi id
 14.03.0513.000; Thu, 16 Sep 2021 12:39:45 +0100
From: Rafal Gorczynski <rafal.gorczynski@ecosystems-group.co.uk>
To: Peter Seiderer <ps.report@gmx.net>
Thread-Topic: [Buildroot] A problem with running Xorg 2021.08.x
Thread-Index: AdeqL9o/pAo8duwvSgSta/nZhHw8SAAG8MeAAAcwJQAAIaP1QA==
Date: Thu, 16 Sep 2021 11:39:43 +0000
Message-ID: <00597E818BDD634EB31FF8A2ECBC4934AB0ADFF8@ECO-SRV.ecosystems.local>
References: <00597E818BDD634EB31FF8A2ECBC4934AB0ADE22@ECO-SRV.ecosystems.local>
 <20210915190617.5d64460f@gmx.net> <20210915223206.43a7bda0@gmx.net>
In-Reply-To: <20210915223206.43a7bda0@gmx.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.10.58]
MIME-Version: 1.0
Subject: Re: [Buildroot] A problem with running Xorg 2021.08.x
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Peter,
Yes, got it, fbdev driver requires that configuration as well. 

I have added 
Section "Module"
        Load "fb"
        Load "shadow"
        Load "fbdevhw"
EndSection

to my /etc/X11/xorg.conf 

I have no idea how make a patch :/

Thanks mate!

Rafal



-----Original Message-----
From: Peter Seiderer [mailto:ps.report@gmx.net] 
Sent: 15 September 2021 22:32
To: Rafal Gorczynski
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] A problem with running Xorg 2021.08.x

On Wed, 15 Sep 2021 19:06:17 +0200, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Rafal,
>
> On Wed, 15 Sep 2021 12:47:56 +0000, Rafal Gorczynski <rafal.gorczynski@ecosystems-group.co.uk> wrote:
>
> > Hi,
> > I'm looking for help with running Xorg in my image, tried multiple branches such as 2021.08, 2021.05, 2021.02 with no luck.
> >
> > This is what I've received from Xorg
> >
> > [   353.565] (II) LoadModule: "intel"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/intel_drv.so: /usr/lib/xorg/modules/drivers/intel_drv.so: undefined symbol: vgaHWFreeHWRec
> > [   353.565] (EE) Failed to load module "intel" (loader failed, 0)
> > [   353.565] (II) LoadModule: "modesetting"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol: shadowRemove
> > [   353.565] (EE) Failed to load module "modesetting" (loader failed, 0)
> > [   353.565] (II) LoadModule: "fbdev"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbdev_drv.so: /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol: fbdevHWSave
> > [   353.565] (EE) Failed to load module "fbdev" (loader failed, 0)
> > [   353.565] (II) LoadModule: "vesa"
> > [   353.565] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
> > [   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/vesa_drv.so: /usr/lib/xorg/modules/drivers/vesa_drv.so: undefined symbol: VBESetModeParameters
> >
> > Full Xorg.log https://pastebin.com/nu5wpHex
> > Full defconfig https://pastebin.com/RLJRwMES
> >
> >
> > I don't have problems with branch 2020.08.x with the same defconfig.
> >
> > Any idea?
>
> Seems similar to the problem fixed by commit [1] (for the fbdev use case), but take a look

	s/fbdev/fbturbo/

Regards,
Peter

> at the linked bug report/mailing list report for hints about the module loading order in
> xorg.conf file and/or needed patches...
>
> Regards,
> Peter
>
> [1] https://git.buildroot.net/buildroot/commit/?id=9dc2b4a4eee557d3d9e7df31e9d2e96f364a2f03	
>
> >
> > Rafal
> >
>
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
