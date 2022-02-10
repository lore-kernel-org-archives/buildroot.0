Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D14C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 15:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB52660F6A;
	Thu, 10 Feb 2022 15:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1OqWCcg_XYe; Thu, 10 Feb 2022 15:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38F3F60E77;
	Thu, 10 Feb 2022 15:14:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED2F41BF3DB
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAC7560E77
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 15:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwNDcXqm5B1M for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 15:14:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0FAC60D4B
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 15:14:12 +0000 (UTC)
Received: from [77.244.183.192] (port=63214 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nIB98-0002rk-DD; Thu, 10 Feb 2022 16:14:10 +0100
Message-ID: <489a02df-4f2b-a46c-aa49-15c3c545f8f2@lucaceresoli.net>
Date: Thu, 10 Feb 2022 16:14:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Luca Ceresoli <luca@lucaceresoli.net>
To: Neal Frager <nealf@xilinx.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <690d8e1b-fb6d-7c36-b07f-4ed9ca61b768@lucaceresoli.net>
 <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <PH0PR02MB77502EC0E2E1A577AEF5201DD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

apologies for the delay in replies. Too busy.

On 08/02/22 14:56, Neal Frager wrote:
[...]
>>>  Is this something that can easily be updated?  If not, perhaps it 
>>> makes sense to move forward with my patch set as is for now, and then 
>>> I can include a new update once the BR2_TARGET_UBOOT_ZYNQMP_PM_CFG 
>>> configuration accepts URL inputs.
>>>
>>> What are your thoughts on this?
>>
>> I think you should go with local patch honestly.
>> As the patch is now.
> 
>> I agree with Giulio, it's probably better to add the file to Buildroot.
> 
>> Here's the rationale.
> 
>> Downloading files instead of versioning them is not necessarily a bad idea. However pm_cfg_obj.c is unavoidably a configuration-dependent file, meaning each user making their _project_ (project = a specific configuration of a specific hardware) will have a different pm_cfg_obj.c. This is different from downloading a patch, or a pmufw.bin, which are reusable across several projects.
> 
>> Theoretically, it might make sense to have a repo hosting pm_cfg_obj.c only if that repo contains all project-specific material for the _project_ : schematics, FPGA design etc. But this is not the case here.
> 
>> BTW pm_cfg_obj.c is a 32 kB text file that compresses to 2 kB. Not a big deal.
> 
> I agree with your rationale.  However, not every FPGA design will have a new pm_cfg_obj.c.  While it is possible to do some customizations with this file, all of the Xilinx evaluation boards now use the same one.  I would expect most developers never even touch this file, to be honest.  So in a high percentage of cases, the pm_cfg_obj.c is really coming from a specific Xilinx embeddedsw release branch which developers should want to be the same release version as the PMU firmware binary.

Interesting, I'm curious how this works. The pm_cfg_obj.c at the URL you
provided, as well as in the patches you sent, has some peripherals
disabled: USB1, ETH0/1/2, both SPIs, NAND, CAN0, VCU and more. Do
current kernels implement enabling these at runtime, making appropriate
requests to PMUFW? This wasn't the case last time I looked into that, it
would be very interesting if it has happened in the meantime.

Otherwise one would need to provide a per-configuration pmu config or a
"wildcard" config, but I'm not sure whether it would cover all potential
use cases. Even though Buildroot has [almost] only defconfigs for
well-known evaluation boards, it is really meant to be used by custom
designs, thus we want to be able to use other configurations than those
useful for Xilinx boards.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
