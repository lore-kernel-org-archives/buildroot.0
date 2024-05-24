Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC98C25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 22:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D26831E7;
	Fri, 24 May 2024 22:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_QBY7EzB-nQ; Fri, 24 May 2024 22:15:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C31834E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3C31834E3;
	Fri, 24 May 2024 22:15:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFFDB1CFF0C
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 22:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC9D2834E3
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 22:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6JyGgdAuvRmX for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 22:15:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.164;
 helo=smtpdh20-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E2A5831E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E2A5831E7
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E2A5831E7
 for <buildroot@buildroot.org>; Fri, 24 May 2024 22:15:55 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AdCasFP9r9WDgAdCbsF07u; Sat, 25 May 2024 00:15:53 +0200
Message-ID: <dae874c0-969a-499f-ba4f-a6857f669bd8@benettiengineering.com>
Date: Sat, 25 May 2024 00:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
References: <20240522194610.2553161-1-giulio.benetti@benettiengineering.com>
 <877cfikj3c.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <877cfikj3c.fsf@dell.be.48ers.dk>
X-CMAE-Envelope: MS4xfHGsPHGi6RDCeN1fxY+DUD6ooCbuy8Bqh1jsnOhPAM//luOUyFnzetDozskcUWailA3+zigrnl2Fd8Y8xC7+J+74Y4Zw01dOguhanmac/srS4ni6kAMC
 /UiOHyVcZrrSFhpIkaQgT+JFm8o6adpWwgOHj7/G2PNXNIhjxsGrQaGIQxaWZxIC18TvKWeD0NP7EFVH9HTPW0sDPHUCm4v7l/KcYLf2l2DbTaR0jEvNs5Cn
 wmUe4Leq+Y8HyWd9fVKBRYuugaQTGY4ORKBhLt3V00bEYhrEp9cnJLTfjyuvrKxG
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716588953; bh=vhR6xaPl0EBqQP7C2I04t/ZkqcH9QAcvDX/9xIZgxUQ=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JLLsll6deaxoO9wYbJSGYWr/5OT20zjBByAI70gq/jzJX7poNGMCMcE+DiuZ6oVLW
 OJco34XSIGfdYGAok+ZFxUBFLQEmuxSGHW9sjnskiZU2HDrzN32VTycwjULh7njo2W
 4LfIMVCvzkoPjLkXUzFGh+bVm0d5UXexCfUFMEDEXLr2c/gQRAatwulwiJgACXr9DH
 mnD8ViAIRDys/n3J3XhSxOyrGwMIbsZXaksOD8msFkJ4GN8J+qv6ujVqZ0tQmq3Wl9
 5W7CP38YXEcE1x/VShNTjaQaU6k6b0kzilsWsieNaCPo7s+RG1mXM5/dEfd9kTzF1U
 8pVn7TCba0mgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JLLsll6d
Subject: Re: [Buildroot] [PATCH v2] configs/amarula_vyasa_rk3288_defconfig:
 bump to Linux version 6.1.91
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 24/05/24 23:15, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Build fails with gcc 13 with:
>   > drivers/ata/libahci.c: In function 'ahci_led_store':
>   > ././include/linux/compiler_types.h:357:45: error: call to
>   > '__compiletime_assert_302' declared with attribute error: BUILD_BUG_ON failed:
>   > sizeof(_s) > sizeof(long)
>   >   357 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> 
>   > As explained in Linux commit[0] that fixes the build, sizeof() of enum
>   > like '(1<<31)' translate to a 64-bit type, but we expect a 32-bit type.
>   > So commit[0] makes sure the data type to be 32-bits wide by using BIT()
>   > macro.
> 
>   > Fixes:
>   > https://gitlab.com/buildroot.org/buildroot/-/jobs/6865596548
> 
>   > [0]:
>   > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=97e28deab8bfe70d5687650f94484f8f9101e566
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > ---
>   > V1-> V2:
>   > * improve commit log as requested by Romain Naour
> 
> Committed, thanks.
> 
> Could you also send a patch adding download hashes for the defconfig
> (see utils/add-custom-hashes)?
> 

Sure, here is the patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20240524220421.710392-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
