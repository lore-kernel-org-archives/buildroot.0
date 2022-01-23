Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 22:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DD2283F89;
	Sun, 23 Jan 2022 22:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cr8B5-w35Gs4; Sun, 23 Jan 2022 22:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 661BD8349A;
	Sun, 23 Jan 2022 22:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64E201BF2F9
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5267B408FD
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 22:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXXR0DibNy2x for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 22:21:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D9CD4034C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 22:21:52 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BlF8nozOrI46dBlF8nEhfT; Sun, 23 Jan 2022 23:21:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642976510; bh=EmENQ+XFvuPUE1wjQypRo73SLtpF/14znBEObv6sv+Q=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=gBlGOVaL7cyo0y5P1rcSz1bbtSW4K/IHHRQaAuDmeCJeJi6jfK6vUAn6mIdfrr0BE
 dfhuRtRS0a2sFXOs9ngXoSFI5fIvA7AmXUR2682rVAfMxLuOR1I/xA8ATIyIelHvJ/
 tGAniivFbKTWbJbGt98IVBDM21d8ne2o457z9nsXrWJFeIAMSytBjxScm+EnmOdZmC
 oqyic61glyD8qkahjwGHQkrmZfo9viJ+eCejQSBFeePLfKZZR2TlipEo6WWB57PgHb
 7G3n+VYORWrDwx5ZLsgRPm5rDaJNiL7SHepDoiyVmqUBOEQN5vBMGq8XZ96k2INu9/
 Fhnj9gyOOz9XA==
To: Antoine Tenart <atenart@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
 <20220119222332.66485-1-giulio.benetti@benettiengineering.com>
 <20220119233944.7ba2d09f@windsurf> <20220120084804.429f1d54@bootlin.com>
 <164267096542.4497.13116457792635384701@kwain>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <2d19c071-3859-25db-0966-2fd8ca3d845f@benettiengineering.com>
Date: Sun, 23 Jan 2022 23:21:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164267096542.4497.13116457792635384701@kwain>
Content-Language: en-US
X-CMAE-Envelope: MS4wfIgx4wCVNPMqcYMIJ1Syax1PcOvnLij0e8w5PDVKM0NG4Q03k5oH+h8xi/m70e4UStzViU37kkatK9bkaEb0txlfuVJ6DxHulCVwVUzK5W9kIKIctq+0
 GOeZqBORve2V1SWBXzwcI7UOG5lh7C45skm1ax8fHdG85EaymhKFDMzsVvymss0HYw8E7Lpq9ELs4Q+j10m+DmELqclRFl6/cTh9ahq6Ih0Ki0Q2KflGhFC1
 qF4pDa0frfM5Eih62rkXzIb0k5BEeNXw0TTUvPSJnJAVQp32pHeD7XvZxptm1e3SMPfJCvdBTCxk2mefinfYa419yivAJzAwQJMjQ+1NYpo=
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Antoine, Maxime, Thomas, All,

On 20/01/22 10:29, Antoine Tenart wrote:
> Quoting Maxime Chevallier (2022-01-20 08:48:04)
>> On Wed, 19 Jan 2022 23:39:44 +0100
>> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>>> On Wed, 19 Jan 2022 23:23:32 +0100
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>>
>>>> +config BR2_REFPOLICY_DISABLE_DONTAUDIT
>>>> +    bool "Disable dontaudit"
>>>
>>> I am still extremely confused by the name of option, with its double
>>> negative.
>>>
>>> When enabled, this option will disable something that doesn't audit.
>>> Meh.
>>
>> I agree about the confusing double-negative, but it follows the SELinux
>> terminology from the rules syntax. My personal view is that the "make
>> enableaudit" target is a bit confusing already :)
> 
> Agreed.
> 
>>> Is it possible to find a better name / description that doesn't make
>>> one's brain segfault when trying to understand what it does ?
>>
>> Maybe we can think of an option name like
>> "BR2_REFPOLICY_VERBOSE_DONTAUDIT", suggesting that we're not silencing
>> these 'dontaudit' rules anymore ? The only actual effect is what gets
>> printed in the AVC logs.
>>
>>> The make target that gets triggered is "enableaudit". Would it make
>>> sense to call this option BR2_PACKAGE_REFPOLICY_ENABLE_AUDIT ?
>>
>> The more I think about that, the more I think that using
>> "enable/disable" here is misleading, the behaviour stays the same with
>> regard to what gets denied/allow, only the logs are going to change.
> 
> I would suggest using BR2_PACKAGE_REFPOLICY_WITH_DONTAUDIT, defaulting
> to y (using _WITHOUT_ would be less clear IMHO).
> 
> And in Kconfig something along the lines:
> 
>    bool "Build with dontaudit rules"
>    default y
>    help
>      The refpolicy comes with 'dontaudit' rules suppressing audit logs
>      for known and expected violations of the policy. These rules are
>      enabled by default. Building without the 'dontaudit' rules will lead
>      in more denied actions being logged, which can be useful for
>      debugging purposes. Note that running 'semodules -DB' from a running
>      system will have the same effect.
> 
>      Say y if unsure.
> 
> (Please check the semodules part, never tried it).
> 
> WDYT?

Re-reading this after some day it looks to me like the simple
BR2_PACKAGE_REFPOLICY_ENABLEAUDIT is correct. Because it "Removes all 
dontaudit rules from policy.conf", so it's true that it enables audit 
logs in the end. It's a very specific options and the one who will use 
it will know what he will enable and most of all we can specify in the 
help section that:
"Removes all dontaudit rules from policy.conf"

It changes the perspective we are looking at it, but in the end, it 
"Removes all dontaudit rules from policy.conf" and subsequentially this 
leads to show the audits logs. So it enables audits.

Does it work for you?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
