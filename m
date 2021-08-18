Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EF19C4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:23:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D293F6108B
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 22:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D293F6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B03400BB;
	Wed, 18 Aug 2021 22:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8w2BhHZV169h; Wed, 18 Aug 2021 22:23:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE3B400E0;
	Wed, 18 Aug 2021 22:23:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5231F1BF869
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4820680CF3
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 22:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzZg5Q0Ud51L for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 22:23:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-ws.aruba.it (smtpcmd01-ws.aruba.it [62.149.158.241])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67FD780CF0
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 22:23:43 +0000 (UTC)
Received: from [192.168.47.129] ([89.164.22.37])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GTyGm3jfFZx06GTyHmhifX; Thu, 19 Aug 2021 00:23:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1629325421; bh=u+xBDgcAThAMCjFCnVndTGaIkS/rlF/w889RJ9g6tWI=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=HxuwEKsQxK6q6Op8vxxkBZFNPg2e//0y/FAWPPAXkCLJYe9QF6VZkLMFAY6d8qV2B
 EjCwBgK9XiMRETb+OQvQvEIcGgKVYLyZ3Es1RPAL6U2FeM/sI5RS6/Z9O9hyCejKqm
 k9pg1LrelOHBSnlQpQItfvZcJMqB9l7AqNYK61sNlG6PheIEy35Vc8i/LDcBY2l0Hx
 x8KET3cJbI8Ax6G3HL3zAxyDrywUaiidnRvF/Vm+FSyZa8W0LFWNgqsOSA2IDi4wWk
 wFj+zqd+ujIPvNdWL6fa5kh9Q1uSRP5t9mq+27kUD11gOEoVbPN7DxDIJXq3tLXIlg
 J23yhFnlUI05Q==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210818210635.352231-1-giulio.benetti@benettiengineering.com>
 <20210819000356.579c339d@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ebd69515-63bf-5345-832d-0047d4cfae38@benettiengineering.com>
Date: Thu, 19 Aug 2021 00:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819000356.579c339d@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfCckI0UlI49d+JhK7iDx2bRIUXX83yG02ipE7Znu/rlXue+EDXWo1WuTBBbNUlAPLRXWdU2N1sPVfhWG6OIyN9h1nDbGgPRz+Quxja/wNJ23uRwi8IYw
 tpUjMxzLAA0gj90HQEujEG1cEqJswQ9z0KeWnszPl2r688smtIcbrDpSumEiF8b6Oo3kk+zgP+AlLJgFEtqVq8u9n4Bauhu3blr0RSsdKT00Rpub3kosQ8eM
 Df3HHcjwsgoWf5CqV+HxOg==
Subject: Re: [Buildroot] [PATCH v2] DEVELOPERS: add myself to toolchain topic
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 8/19/21 12:03 AM, Thomas Petazzoni wrote:
> On Wed, 18 Aug 2021 23:06:35 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Since I've dealt and deal with toolchain bugs and their work-around very
>> often add myself to toolchain topic(toolchain/).
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * correct alphabet order
>> ---
>>   DEVELOPERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index af97de02de..874d47352c 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -1060,6 +1060,7 @@ F:	package/nfs-utils/
>>   F:	package/sunxi-mali-mainline/
>>   F:	package/sunxi-mali-mainline-driver/
>>   F:	package/udisks/
>> +F:	toolchain/
> 
> For internal toolchains, toolchain/ doesn't have much. It's really
> package/gcc, package/binutils, package/gdb, package/glibc,
> package/uclibc and package/musl that matter the most.

Ah yes. But also I touch lot of timer toolchain/Config.in to create new 
bugs. I would add that file too IMHO.

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
