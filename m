Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3070C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 15:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63E95409DB;
	Thu, 24 Feb 2022 15:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rPucJjKIlRm; Thu, 24 Feb 2022 15:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3922A4046D;
	Thu, 24 Feb 2022 15:12:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EB301BF389
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BE6C40204
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 15:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GtqQcSEtgvmi for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 15:12:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8ABC401B7
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 15:12:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.16.188])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NFmsnarbX0FuyNFmtn7VjD; Thu, 24 Feb 2022 16:12:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645715532; bh=YKMsA+UhaDkZL1LETOWgk8bpAoL6biRrWEcmyJ54wyk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=lwztkaudHUjk8zfbC+uWAOMGQKV9pty8+QuEafpXaz0921ralUgVcxSaMw8PNUh8u
 Q+inZQC+4hskBi7Sqjmz1LW92H6kPMYw1xNriOjg1AnHoxOX+f+mdfiRrGscQVzOvo
 /22ST8vc26rFYbQ2mT8wgnL/kNvkAVHVBKBKwXsJj1aTJKYm0d30MZq8h6unL/TQh6
 WWhgWdfFvV5nJHRgygPCNZmhcarCNXy03gEubeM/0U1yzPZhw8SfWkWB+8WXLdk/ge
 bzy09vvI6Y8/ukGhG6mDI5IJmYwt5Nf+2w77NntIQx1PrUl5F77uVtTiGim+JorjjQ
 ia2KdBVEnCUUA==
Message-ID: <111a4578-2489-09db-909c-774017800746@benettiengineering.com>
Date: Thu, 24 Feb 2022 16:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>
References: <20220223071049.21153-1-peterlin@andestech.com>
 <84e159d2-0123-e5b1-c42e-99b70c99f43c@benettiengineering.com>
 <YhYHxAZuz+wY4Nl+@APC323>
 <dcb73632-8dda-4314-838f-2db1c9f91102@benettiengineering.com>
 <YhbwYcWi9WtPm4Mo@APC323>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <YhbwYcWi9WtPm4Mo@APC323>
X-CMAE-Envelope: MS4wfHXj3HxQIOHCK5gVNuMkP/gtTsQmlpFv/ZPLVChWOcuVOxNwlS2WUVubGw/B645Qq40sV5sPZQguijhNJIKuQRy14D/kPNlFQ6DckQM5DCkKrhD7oFhR
 kFvQrtyIp8GdNvlzeN8NS0bWIg2y0v1sPJbR8itRyKlbxtdzgddVnWY0UmSI84I/fgqIUIniMiqCoSsuz6uRwwI2+BpfSWRAsSuc3y+IDgFFqfIpUG8OHHyX
 5C0eTlk+gsi+Nl09SXKa9WnYTBOh9nmlIeMD2D4TPrY=
Subject: Re: [Buildroot] [PATCH v4 1/3] board/andes: rearrange andes folder
 structure
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 24/02/22 03:41, Yu Chien Peter Lin wrote:
> Hi Giulio,
> 
>>>>>>> Changes v3 -> v4:
>>>>>>>       - rename ae3xx folder to ae300
>>>>>>>       - rename andes_ae3xx_defconfig to andes_ae300_defconfig
>>>>>>>       - update readme.txt and item in DEVELOPERS
>>>>>>
>>>>>> Some of these change ^^^ must have been moved to the single patch, like
>>>>>> DEVELOPERS is updated in patch 3/3. I've also forgotten to point you to add
>>>>>> a --cover-letter, so keep in mind both points for next time.
>>>>>>
>>>>>> I've built tested both defconfig successfully, so:
>>>>>> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>>>> Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>>>> [Giulio: build tested only]
>>>>>>
>>>>>> And the other patches of this series is all reviewed, so to me it's ready to
>>>>>> be committed, but this will happen after Buildroot 2022.02 is released,
>>>>>> since between rc1 to the release Maintainers only accept fixes. Another
>>>>>> possibility is that they will commit these patches to next branch.
>>>>>>
>>>>>> Please remember to tag V3.
> 
> Oh, I thought you were refering to format-patch with v3, sorry.
> I will mark the patch on patchwork to rejected state except the latest
> patch version.

Ok, V3 it's still tagged as new in patchwork for the moment.

>>>>>> Thank you for your effort!
>>>>>>
>>>>>> Best regards
>>>>>> -- 
>>>>>> Giulio Benetti
>>>>>> Benetti Engineering sas
>>>>
>>>> Thanks for reviewing my patches and the guidance.
>>>
>>> You're welcome.
>>>
>>>> I will make a new patch for the Config.in,
>>>
>>> Which one? I only see:
>>> toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
>>>
>>> Do you mean you will add an entry in DEVELOPERS for it?
> 
> I found the modifications on these files in Git history, usually have
> its own patch. 

No, maybe you mean there is a cover-letter that summarize the changes of 
all patches in patchset and then in every patch you list the changes of 
on that patch.

> So in PATCH v5, I will split [PATCH 1/3] to [PATCH 1/4]
> and [PATCH 2/4] for
> toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
> other patches remain the same, 

No, wait. I've meant you only need to split:
---
Changes v1->v2:
*
*
[..]
---
for every patch. So, don't summarize all the changes on patch [1/3], 
because those changes are related to different patches. For example in 
V1->V2 you state:
- update DEVELOPERS
but you do it in patch [3/3], so you only have to move the changes into 
the right patch, that's all.

> and attach [PATCH 0/4] cover letter.

And yes please, add a cover letter that briefly explain what patchset 
does and that's it.

>>>> The last question, is it tag V5 for the next submission?
>>>
>>> It depends if you need to modify these patches. Or if you add a new patch
>>> that depends on these patches, then yes, please send a V5 with all changes
>>> moved to the different patches, including adding the patch if this is your
>>> goal.
>>>
>>> Best regards
>>> -- 
>>> Giulio Benetti
>>> Benetti Engineering sas
> 
> Is there any the new comment?
> Again, thanks for your help. :)

For the moment I don't see anything wrong except the changelog.

Thank you!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
