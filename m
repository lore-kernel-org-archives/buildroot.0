Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF73C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 16:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B9881B9D;
	Thu, 10 Feb 2022 16:54:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yE0eHufw-I71; Thu, 10 Feb 2022 16:54:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2570E81A73;
	Thu, 10 Feb 2022 16:54:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 137701BF20B
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01C2A40184
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YajZJpvkTCRx for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 16:54:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2CBD40132
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 16:54:26 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ICi9nWQQyNVvLICi9nMEri; Thu, 10 Feb 2022 17:54:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644512065; bh=4cIoLqobpkkhC+VKCmmfbW4V2dhivXYMbvQz6oFbLns=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=YOtxH1KAom6EMG/AG/HZH9DlNUJkYvrTmVslKhtlCoKtd4JR/ll/A4zaMxC8CinYA
 xzVj6m1Hx0xzgKpbMD3meZI/XN1cJ3rxHj3N3yOLSyyJLwDNqI+8hMTRNQIRibx5zA
 Biw4uqC8/H/jaOwhib07M0du6KdnVSzCw9lc1nieztdFsPsXuwYX2+R1Hvfn6mgCry
 DDVl4qFuobAiUHonb1a4b6OWaassHSqEei6YzmmZRxgegZ3NFN5ZdVJs1yktXJPcI6
 O73Ayb8XxPMsq2t8VwF0zv3R6OGxaa6x34zzskxBast+w21VuyuErBkulp2mEhq/19
 mz5BfKPq+VPPg==
Message-ID: <099dd7ff-c841-f7b5-88b7-f036ebc02a66@benettiengineering.com>
Date: Thu, 10 Feb 2022 17:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
 <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
 <489a02df-4f2b-a46c-aa49-15c3c545f8f2@lucaceresoli.net>
 <SJ0PR02MB77583C51A75C70EDA6E1AC29D72F9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <acd2a42d-dff6-45f1-607c-1fb74294d1f1@benettiengineering.com>
 <1EC54279-220E-4043-AFBA-953D2CF5E54A@xilinx.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <1EC54279-220E-4043-AFBA-953D2CF5E54A@xilinx.com>
X-CMAE-Envelope: MS4wfGZ9duBSPIf0NywMxN7UAUFhrZYh8mIgFUGybZfvWNihJp8gN17eYZq1EVwe5qKlIG3vl2E3sZXAtWeV/RddYodINT595UOOEo88t5BMmc/ypGQOq6H3
 GbcaACo5V7foeSCyB4B7FEaOW33I1bm9v5eshSql1H3W1gw8HnRzCISwCVRKEE6Uf/bZuIE5kP1cCj3xbTv4nYlQmwJSZ9LJZeor5n0zJyuvRmhOK4mP31wB
 Qb7s03TW4czhwVhiQN0+iJnodfrKK8yNa1j8eB4jzuQlin5c3dc1Z1pwCp6Db+fy
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 10/02/22 17:44, Neal Frager wrote:
> Hi Giulio, Luca,
> 
>>
>> Neal, can you reply about this ^^^. At least, are USB1, ETH0/1/2, both
>> SPIs, NAND, CAN0, VCU present on those 2 boards?
> 
> I confirm that the pm_cfg_obj.c file provided is correct for the ZCU102 and ZCU106 boards.  These boards use USB0 and ETH3 for these respective peripherals.  The peripherals disabled are not connected on either board.

So I would keep the pm_cfg_obj.c as is, but so why .dts file disable 
peripherals that are not present?

> To clarify things, I may send another patch with two separate pm_cfg_obj.c files including the board names in the file names.  One thing that is different is that the ZCU106 comes with silicon that supports the VCU whereas the ZCU102 does not.  So I could create a ZCU106 version of this file which enables the VCU.

I would definitely do that, so 2 pm_cfg_obj.c for 2 FPGAs

> I think this would be a good example by having two different boards with different pm_cfg_obj.c files, so developers know they will need to modify this file for their custom hardware.

Exactly!

PS: please wrap lines at 72 characters! :-)

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
