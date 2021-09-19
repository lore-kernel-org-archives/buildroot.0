Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580AEC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 15:21:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B786E61019
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 15:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B786E61019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EEDD404A5;
	Sun, 19 Sep 2021 15:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yyqMsxU1q_W; Sun, 19 Sep 2021 15:21:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6764049E;
	Sun, 19 Sep 2021 15:21:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B85C1BF5A2
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 15:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B47E4049E
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 15:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QssOgXtYZSmk for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 15:21:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D4C4049D
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 15:21:21 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.166.2])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Ryd6mo7dYrIRlRyd6mFBAg; Sun, 19 Sep 2021 17:21:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632064880; bh=/5VPJdJO6pQcFZr5Bao5GmGeu7JUoNAal//iHdJ/DL0=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=M0JFhBRAfal/wnWrrywSNcxQxAdsgI/7sHCRoFApASXp4Gv0F4AwpA+oHKnlcV5LT
 t+wpY0Jx9SHZXMSJT2114Sol4vefBuBC3JvTyUCNrPwwXPMIShBxk5L2Qb7BOQD9yh
 fEEEfuVfaGxo91Cz9CIZ3G4S6I4xeOu+t3igmlQmZjn6pV3kWejbfPsho9/fw3oaCW
 O9CsomPVMJrKsxCmidJf/JKcCTkCf8eqTxH46OksIlwMYAWTz3Dd7zp9+nPoJP4Y3B
 xuJWY+7xVKQWdJG88u64PyaHvh2VtaEzUtcSkyiS5WNYKm+Bk7eCIw36QMkHjBojVQ
 0ZD/BdHdC60Sg==
To: Arnout Vandecappelle <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210914221053.265590-1-giulio.benetti@benettiengineering.com>
 <20210918124739.GN1053080@scaer>
 <fdda838e-e64b-d3bb-8745-260443d61122@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <b67c109d-cbca-82f5-6856-450be99f887e@benettiengineering.com>
Date: Sun, 19 Sep 2021 17:21:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fdda838e-e64b-d3bb-8745-260443d61122@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEY/Zu5T4gCgK8QjhyWkySeJR3g3l3BSgYxs02fKu4464TipnAu8jEsff5o+G7BchA9fclneB9cnT+HCmjEwns+c/Jpv5zFDdJNYKqPdU6fmz5ulLEwq
 EdHGiSdHOyn64aQ5lYLz595ohZ8SWVESJwXJHxNf5N4f2xwBVdZo46e9rmzKC/WFrQugvs59aNR5LlyH77/Z3A0LuIquRqOZPc6NoZeZiq9BHPcOPHf4rCt5
 iWIh7cSDFuvVzp6yhiq+xdb569Gprjvodqkjt4SpI6ngp5ferkuHIbFVxjmwKuQz8lAy1JXxQmqo8xuzCM7oC+QVNOhKdGp+MtTuLI8HvGs=
Subject: Re: [Buildroot] [PATCH] package/mesa3d: fix build on m68k
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi Arnout,

On 9/19/21 1:49 PM, Arnout Vandecappelle wrote:
> 
> 
> On 18/09/2021 14:47, Yann E. MORIN wrote:
>> Giulio, All,
>>
>> On 2021-09-15 00:10 +0200, Giulio Benetti spake thusly:
>>> To build mesa3d for m68k we need to pass -mlong-jump-table-offsets CFLAG
>>> since 'switch' blocks are pretty wide and lead to build failure. This way
>>> 'switch' blocks will have a 32-bit addressing by default instead of the
>>> standard 16-bit.
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/60c4653c2a93125edbdd0beb43cd47301643464a/
>>>
>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>> ---
>>>    package/mesa3d/mesa3d.mk | 9 +++++++++
>>>    1 file changed, 9 insertions(+)
>>>
>>> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
>>> index 54b50f684f..809a7d8e88 100644
>>> --- a/package/mesa3d/mesa3d.mk
>>> +++ b/package/mesa3d/mesa3d.mk
>>> @@ -259,4 +259,13 @@ else
>>>    MESA3D_CONF_OPTS += -Dzstd=disabled
>>>    endif
>>>    
>>> +MESA3D_CFLAGS = $(TARGET_CFLAGS)
>>> +
>>> +# m68k needs 32-bit offsets in switch tables to build
>>> +ifeq ($(BR2_m68k),y)
>>> +MESA3D_CFLAGS += -mlong-jump-table-offsets
>>
>> That option has only been added to gcc-7 [0] [1], which makes gcc >= 7 a
>> pre-requisite for m68k, while mesa3d currently has no such requirement.
> 
>    It's been merged, so OK for now, but I think this is exactly the reason why we
> decided some time ago to just pass -O0 to work around compiler bugs for niche
> architectures...

My bad here. I was sure that -O0 didn't work instead it works while 
another package I was facing had no work-around. So this is only due to
my mistake :-/

-- 
Giulio Benetti
Benetti Engineering sas

>    Regards,
>    Arnout
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
