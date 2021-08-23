Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98101C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:00:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DDC61052
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 23:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1DDC61052
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 900AE40360;
	Mon, 23 Aug 2021 23:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0y3jBxMhfnrh; Mon, 23 Aug 2021 22:59:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A9ED40392;
	Mon, 23 Aug 2021 22:59:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B85B1BF215
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AC936081E
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqVtMiDVqR5W for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:59:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02111.aruba.it (smtpcmd02111.aruba.it [62.149.158.111])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DC4F607DA
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:59:49 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.10.203])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IIuxmds9NqG1wIIuxmFRy5; Tue, 24 Aug 2021 00:59:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629759588; bh=So/uD8zeYllickfKmEsd9k3t00k884y4wVAQgdF5jT8=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=m2vz8JK5zphXiVpLNqNc/EK+27te+ScBVKYRQDnGs/GYY5YLv5+WTu9s6bf457t08
 BLtt7VD5KxX/GigaJ3duQfNPz006vEFcJR9njpPw7TPXOazxbWcMTH7hCmFvMKPxlJ
 Ul/5dl7rubNplXso+TKFrn0pbIrM2IPWS13KbXqERp05m6XbSac1RIAf1IEOJMdXw1
 ixPCNObg1GGVRIrUqm44Unz+AXUh7AxcdyWuI4QhgH4IHHjmirv2T/oVCakI68CuJS
 uYz2uBo1uexNreLyrq9xaFdqWipb6Vmf+RSdbrxaLnh+5V7fOdXGeMvhJMszw9u4k6
 s8X8oB9hodftA==
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <CA04665D-1E5D-400A-9CA1-860F8579C01A@benettiengineering.com>
 <20210821213303.283387-1-giulio.benetti@benettiengineering.com>
 <5cba1f8b-1434-c38d-1b86-fc380b9de458@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <53047934-0172-c589-2f4b-95535ff6d0d2@benettiengineering.com>
Date: Tue, 24 Aug 2021 00:59:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <5cba1f8b-1434-c38d-1b86-fc380b9de458@mind.be>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJVoTuD2dZJQ0Rhw6ABj5RJAxT0vyXsbDQD1Sox8YA9EbP298P5XNIeJjeo9l/82vjtWmZlxt0vL/9cgHheAudLWejcFfspzysULu/hVTCO3R+rR4+DA
 TEmQkZv/o6rbHKqwAqUoBbJIbY/quj6HnYxv5rVa27CMEOPs2eKUT+HjG/DeP8gbmltIjF97/u1RWXDiGNK7fZ0G1TEy2KeVPJFIoCRT5uqQhLbaEN3/d3WM
 s9XkMwNACn5QCcAuSaq67zAWKQlTAiS1YW72RMCQhZcs0jpq5PpATgVVrGIt82cU5DQsn+YYn3fmVIoTTYkMHB46er7xZhs9O6GK+kQMjOO1WrJ099MknPw7
 omdqrc/m
Subject: Re: [Buildroot] [PATCH v2] toolchain: update gcc bug 99140
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Arnout,

On 8/23/21 10:01 PM, Arnout Vandecappelle wrote:
> 
> 
> On 21/08/2021 23:33, Giulio Benetti wrote:
>> Gcc bug 99140 has been fixed on gcc 8.x but reappeared on gcc 9.x while
>> it's been fixed on gcc 10.x+. So let's update
>> BR2_TOOLCHAIN_HAS_GCC_BUG_99140 accordingly.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/c55/c55f50a8d657695f0d5492c32efa666254cd7f99/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * gcc 8.x works, gcc 9.x doesn't, gcc 10.x+ work
>> ---
>>   toolchain/Config.in | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/toolchain/Config.in b/toolchain/Config.in
>> index c35c52d142..d033ce3962 100644
>> --- a/toolchain/Config.in
>> +++ b/toolchain/Config.in
>> @@ -165,10 +165,12 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_93847
>>   
>>   # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99410
>>   # Error: branch offset out of range on Nios II. This bug
>> -# no longer exists in gcc >= 8.x.
>> +# no longer exists in gcc 8.x but reappeared on gcc 9.x and has been
>> +# fixed on gcc 10.x.
>>   config BR2_TOOLCHAIN_HAS_GCC_BUG_99140
>>   	bool
>> -	default y if BR2_nios2 && !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>> +	default y if BR2_nios2
>> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_TOOLCHAIN_GCC_AT_LEAST_9
> 
>   Unless I'm very mistaken, this is basically saying "depends on any GCC version
> except GCC 8". However, from your commit message, it seems it should be "depends
> on GCC < 8 or GCC 9". To simplify the logic, I would say:
> 
> 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9 && !BR2_TOOLCHAIN_GCC_AT_LEAST_10
> 	depends on BR2_nios2

Oh, that is a very elegant solution. I've learnt something new!
Thank you. I've sent v2 patch for this

Best regards!
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
