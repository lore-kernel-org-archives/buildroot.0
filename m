Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139AEC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A01CB40124;
	Tue, 26 Jul 2022 21:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A01CB40124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0t_rJbs6yCh; Tue, 26 Jul 2022 21:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA20540116;
	Tue, 26 Jul 2022 21:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA20540116
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAE6A1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FBEF40057
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FBEF40057
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNWOMOt5azUu for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:08:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90864408BB
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90864408BB
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:08:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QL8WZK082687;
 Tue, 26 Jul 2022 16:08:32 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QL8WQE010506
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 16:08:32 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 16:08:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 16:08:31 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QL8Vig093774;
 Tue, 26 Jul 2022 16:08:32 -0500
Message-ID: <7d8fd7e7-34e6-e5ac-b272-6a4fb50329df@ti.com>
Date: Tue, 26 Jul 2022 16:08:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-4-x-shi@ti.com> <20220726205820.0dfda49b@windsurf>
In-Reply-To: <20220726205820.0dfda49b@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658869712;
 bh=UyRkWJFgcuixqtxujthPWlex/nerDdkvaFKcSy0HSyw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=g6g/bet9YuDWa51PzOYxmfCStBeMnmkhw70hITIqMmPF/wm34l+yb/SqZ00nSL2Hf
 oGPEvrVlE/0fyiCMNqNfZ85NYGmBkLAykQwtYX1MhZFQmmeSCPZlySXBO0rv846DH7
 Bu76yL47NDRkCxW+Oc6BaUgsmpZf2aa+bF96e944=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=g6g/bet9
Subject: Re: [Buildroot] [PATCH 3/4] board/am6x: add new board support
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/26/22 13:58, Thomas Petazzoni wrote:

>>
>> diff --git a/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig b/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig
>> new file mode 100644
>> index 0000000000..7000ee1170
>> --- /dev/null
>> +++ b/board/am6x/am64x/linux/ti_sdk_arm64_release_defconfig
> 
> Just board/am6x/am64x/linux.config
> 
> Does your board have an actual name? Because am64x is just the name of
> the SoC, no?
> 

Yes. The SoC is am64x, and the board's name is am64x_sk.


> 
> [...]
> 
> This is a huge config file, with obviously stuff that isn't needed for
> your platform. Could you review it and strip it down to some reasonable
> level? It enables zillions of drivers that make absolutely no sense for
> a TI platform.
> 
> 
>> +##################################################
>> +# TI Baseport Config Options
>> +##################################################
> 
> Please do not manually edit the kernel configuration file.
> 
> 

Noted. We'll review the kernel config file.


>> +Description
>> +===========
>> +
>> +These configurations will build a complete image and
>> +device tree blobs for the the TI AM6X boards.
> 
> Which "boards" ? Normally, we have one readme.txt per board, as the
> details are board-specific, such as where is the UART connector, how to
> flash, etc.

I see. We are planning to add more k3 boards here in the future, so I 
think I will make sub-directories in here for each board (for example, 
am64_sk, am62_sk, etc.), and I will add more specific readme files for 
each of them.

Thanks!

Xuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
