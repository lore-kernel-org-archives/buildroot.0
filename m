Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2F5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 11:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B49D405E7;
	Thu,  3 Feb 2022 11:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRkJtqRo_Oqg; Thu,  3 Feb 2022 11:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A3C040544;
	Thu,  3 Feb 2022 11:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A52721BF20F
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 11:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90A16404CC
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 11:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PELf6qLa8rDV for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 11:04:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 594FA40544
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 11:04:30 +0000 (UTC)
Received: from [77.244.183.192] (port=63514 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nFZue-0006Dh-5o; Thu, 03 Feb 2022 12:04:28 +0100
Message-ID: <5b3dfa87-e879-e4d4-2797-7801bcf24435@lucaceresoli.net>
Date: Thu, 3 Feb 2022 12:04:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220202165555.3497977-1-nealf@xilinx.com>
 <c36be0d9-f525-ff0b-5b05-d5f512f92105@lucaceresoli.net>
 <SJ0PR02MB7758DE2233B5C11EC28FCCB4D7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <57bd27fd-09c8-9441-8429-bb4983287c6c@lucaceresoli.net>
 <SJ0PR02MB77589ED41FD77C52F936C3FED7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB77589ED41FD77C52F936C3FED7289@SJ0PR02MB7758.namprd02.prod.outlook.com>
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
Subject: Re: [Buildroot] [PATCH 1/1] configs/zynqmp_zcu10x: Bump
 ATF/U-Boot/Linux to Xilinx 2021.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 03/02/22 11:07, Neal Frager wrote:
> Hi Luca,
> 
> Thank you for your feedback.
> 
> As for the ATF, yes, the mainline version should work, and since it does not have the same build issue with the buildroot compiler, I will move the patch back to the mainline ATF version.
> 
> Unfortunately, U-Boot is another story.  The mainline U-Boot will boot just fine with an SD card.  However, I know that the Xilinx U-Boot QSPI driver is not yet in mainline.  Since QSPI is a very popular boot flash medium, I cannot in good conscience recommend using the mainline U-Boot until QSPI is well supported for Xilinx devices.

OK, so you have a good reason to stay on the Xilinx fork. Just mention
this in your commit message. Hint: the above paragraph is a good draft
to start from.

> Xilinx is working hard to get all of our U-Boot and Linux kernel drivers in mainline, but we are not yet there.  I would be happy to update the zcu_10x_defconfigs to using the mainline U-Boot and Linux kernels when the level of necessary support is better.

Sounds like a good plan!

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
