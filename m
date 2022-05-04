Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562EEC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 09:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1F6E404C9;
	Wed,  4 May 2022 09:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kHfNBlisgR7H; Wed,  4 May 2022 09:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F31AA401E1;
	Wed,  4 May 2022 09:12:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B552B1BF239
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A430581AEA
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 09:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cjk1yQs6L1K for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 09:12:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 685AE81A50
 for <buildroot@buildroot.org>; Wed,  4 May 2022 09:12:15 +0000 (UTC)
Received: from [77.244.183.192] (port=62398 helo=[192.168.178.75])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nmB3M-0009ce-Vb; Wed, 04 May 2022 11:12:13 +0200
Message-ID: <ac8c8060-7b89-5d22-c96e-a8c1dc3ea7d8@lucaceresoli.net>
Date: Wed, 4 May 2022 11:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Michal Simek <michals@xilinx.com>,
 Peter Korsgaard <peter@korsgaard.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <878rrh3gvx.fsf@dell.be.48ers.dk>
 <86b8666c-4427-32c6-c015-f9b67e963195@xilinx.com>
 <SJ0PR02MB775868320C331FE1CDF57217D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <SJ0PR02MB775868320C331FE1CDF57217D7C39@SJ0PR02MB7758.namprd02.prod.outlook.com>
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
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 04/05/22 10:53, Neal Frager wrote:
> Hi Michal,
> 
>>   >> [    4.384715] zynqmp-display fd4a0000.display: vtc bridge property
>>   >> not present
>>   >> [    4.393156] ------------[ cut here ]------------
>>   >> [    4.397776] More than allowed devices are using the vpll_int, which is forbidden
>>
>>
>>   > This is caused by not proper psu_init which setup PLLs incorrectly.
>>
>> This is using the psu_init_gpl.c in U-Boot:
>>
>> https://github.com/Xilinx/u-boot-xlnx/blob/xlnx_rebase_v2022.01_2022.1
>> /board/xilinx/zynqmp/zynqmp-zcu106-revA/psu_init_gpl.c
>>
>> And the pmu configuration object from Neal:
>>
>> https://git.buildroot.net/buildroot/tree/board/zynqmp/zcu106/pm_cfg_ob
>> j.c
>>
>> So what exactly needs to change?
> 
>> I don't have this board here that's why likely taken from any old design before this check was added to Linux.
>> U-Boot psu_init_gpl.c should be updated.
> 
> Could you please share exactly which register writes in the psu_init_gpl.c need to change?
> Perhaps you can point me to a known good one, so that I can compare those specific register writes with the zynqmp-zcu106-revA file?

I'm OK with either solution, but I wonder whether it would be a better
idea to regenerate psu_init_gpl.c (and pm_cfg_obj.c while there) using
Vivado 2022 and mainline them in U-Boot. Would that fix the issue as
well? Vivado is assumed to generate correct files, if it didn't in the
past, chances are it has been fixed in the meantime.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
