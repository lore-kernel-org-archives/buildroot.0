Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5E1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 16:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A9F82B9F;
	Thu, 10 Feb 2022 16:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8sq77EZCVla; Thu, 10 Feb 2022 16:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 042BF82B8C;
	Thu, 10 Feb 2022 16:31:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3E21BF20B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 36AEE60BD6
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWX_PUfolRTF for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 16:31:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFBD260BCD
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 16:31:23 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ICLonW2J0NVvLICLonLw3m; Thu, 10 Feb 2022 17:31:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644510681; bh=XvcMAiMBiefSjXuDszjD0fBrYTjXds8qDT9J43VavYI=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Aacz8BQ93+Hk4ToPDhMF+t06FOmx6utTJF4i2PmRIP0zaeuOi9Ri8AbSKFG51G9wr
 9sG3PUhoRjjHf4/ACwC8nbNyBDwFzXpZWKEB/RQE5NSDrqx2YfaEMp15w26xB3w18z
 St5eT0hx8KPtZWNrTGv+sLkKix+4ckI8WIWp4XKtfUj/bvhXIqosKVeIn8cKvCDEcs
 JKE2NsnGAmzuYkWIQJQalHuhh1c6Rt6zFgEgakqJapcNBD9kz5oFpm0fJ381K0oJf3
 QeWPu3Z7dPsHe+l+fE111qv4gGFr3TVY1qA5Hgn5pYTy0Nq/uR2gQpb23Kn6hB4uSR
 1TkgJSq0jK64Q==
Message-ID: <acd2a42d-dff6-45f1-607c-1fb74294d1f1@benettiengineering.com>
Date: Thu, 10 Feb 2022 17:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
 <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <489a02df-4f2b-a46c-aa49-15c3c545f8f2@lucaceresoli.net>
 <SJ0PR02MB77583C51A75C70EDA6E1AC29D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB77583C51A75C70EDA6E1AC29D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfBDE4EknC5O5i2YxuQmMa9FxrCFVFKtzuYvBCWJPdnKzHidDtMi7hvGxr4ydxmCZqZUMmSrXMXhoZDf3r0OxSuR5x6i5RF38w7y36nRcNHmhNS/TQQMm
 FbQXsOpei7OjgTrzKnTZRQ9/G596fWSt2AtAigqZJp9wRGp+Gm42FPZJJKoUmETEYXdnZcYcEjrihLqQS/BccwI8pbF1oqrdrsm9fNMO9HgnHJ6hr4qo5+Hz
 3Z3QBl51XvEM96DEDigYf176bz2rL+NJaB6vr4U+je93RrGB/vTxN43wcmOnC+G/
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: Michal Simek <michals@xilinx.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal and Luca,

On 10/02/22 16:46, Neal Frager wrote:
> Hi Luca,
> 
>> Interesting, I'm curious how this works. The pm_cfg_obj.c at the URL you provided, as well as in the patches you sent, has some peripherals
>> disabled: USB1, ETH0/1/2, both SPIs, NAND, CAN0, VCU and more. Do current kernels implement enabling these at runtime, making appropriate requests to PMUFW? This wasn't the case last time I looked into that, it would be very interesting if it  has happened in the meantime.

Neal, can you reply about this ^^^. At least, are USB1, ETH0/1/2, both 
SPIs, NAND, CAN0, VCU present on those 2 boards?

>> Otherwise one would need to provide a per-configuration pmu config or a "wildcard" config, but I'm not sure whether it would cover all potential use cases. 

I agree.

> Even though Buildroot has [almost] only defconfigs for well-known evaluation boards, it is really meant to be used by custom designs, thus we want to be able to use other configurations than those useful for Xilinx boards.

No, it's not meant to be used for custom boards, the goal is having the 
2 BSP for the 2 boards and that's it. The ones who will need to create 
custom BSP will ad new BSPs starting from your reference. So here again 
what Luca pointed above about a wildcard config is true: we don't know 
if it will really cover all cases.

Since this is not the goal of Buildroot I would narrow things to deal 
with the 2 actual boards peripherals only.

> I took a closer look at the pm_cfg_obj.c, and I see what you mean.  What confused me is that Vivado does not generate this file when you create an xsa or hdf file for the hardware design like the psu_init.c files.  So I thought the file was always the same regardless of the hardware.
> 
> Instead, users have two choices.  They can either use Vitis to generate a FSBL which will have a pm_cfg_obj.c file in it, or they can modify this example file manually.  The pm_cfg_obj.c that I have included with buildroot enables all of the peripherals that are enabled on the ZCU102 and ZCU106 boards, so I think it is fine for having an out of box example for our customers.

I agree that here we need to deal with those 2 specific boards.

> Perhaps a good solution would be adding a readme file for the pm_cfg_obj.c alerting developers that they will need to modify this file for building designs for custom hardware. 

This is implicit

> In any case, we need to have an example pm_cfg_obj.c file in order for the buildroot examples to build and run.  And I think the pm_cfg_obj.c is only one of many things developers will need to modify when moving from an evaluation board to their own custom hardware.

This is out of scope here. As patch names point you're bumping or adding 
2 specific boards, so I wouldn't worry about eventual custom boards.

If someone will deal with it I think they will also deal with Vivado to 
create specific config files. At least that is what I would do while 
approaching these 2 FPGAs.

> 
> What are your thoughts?  You have been working with this issue much longer than I have.  Thank you for your feedback and support!
> 
> Best regards,
> Neal Frager
> Xilinx

Neal, please use 72 wrapping on your e-mail client, otherwise lines are 
very long :-)

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
