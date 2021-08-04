Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA52C4320E
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:04:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88CCD61029
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 10:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88CCD61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FF7983566;
	Wed,  4 Aug 2021 10:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zDRw1TRDlyzk; Wed,  4 Aug 2021 10:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69E3B831CA;
	Wed,  4 Aug 2021 10:04:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5C621BF418
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94DA560685
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 10:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fjRur47djaz9 for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 10:04:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D05B6067B
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 10:04:53 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id BDlamj6jWiG5UBDlbm9WYp; Wed, 04 Aug 2021 12:04:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628071492; bh=1S33+nIfa/J2BOiES0AaN0derm1b7pB4Fp+v7rAhyQo=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=bca+M7EfGFpWcBHzYoOO9+3RJBoudpv6LSIyekzlKYijHrHig6KyDnglf9nHw70Dz
 5X7NgQUFb/b4Rnrp6X0Uq4cWJMctMmUBFJ371v1X8l2ipFjsg+CkVubbHep6B++b38
 cIxbwtet9sbuTCRLc5hzOwwVAurXL+VVVFF4pXZGkKd2poF+xJUENuboo/AcP82nQS
 TTtE0BItTeoskH046PmUVRjLT5RPxtMZN9hEXo6sP9jrr8U/YXa/lPkdda0btsObIP
 s65lmX0I3dDDCthf/YPNGKjZjRSY1MySzgqJiQugi+q3Bb/9lxzxdTTIqk/OE4nK5/
 2+YzxGRwPlW6w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210802060946.C27006062D@smtp3.osuosl.org>
 <20210802234647.6f3df99d@windsurf>
 <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
 <20210803092835.0e4d2663@windsurf>
 <b12d517a-762e-8a2f-c418-f7ffc865b4e7@benettiengineering.com>
 <4629534e-1c5b-2e18-45fe-ef532e38ce5a@benettiengineering.com>
Message-ID: <6d4c5bec-d363-63a0-67d8-4f05e910e6ce@benettiengineering.com>
Date: Wed, 4 Aug 2021 12:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4629534e-1c5b-2e18-45fe-ef532e38ce5a@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfB7Kp6xVsSEPI2vnuIO0HkxiB1yzT2UsNAIDILJKuK+Ot4yjTk7AxHTHQL/e9HcDptpKYumxJCZSymo8jcoIUnWtlZ/JCovifx4PmdY8wkKMSzaWmiR/
 81Vj4UmDzBBU44QD6mzDCGcNcATC8e3HdPmq/mxhavQvnqm93Ua+59fS6LD0NOXgZtLmyoU0MdW9z3fe4YivrfMYOyQ0tO0U9LhkSm4haZritV+ZKzA2EZwX
 TJIHTzjzMHw24BTITd6a2vr2JvY3QAKOdZRGDqAvRvyEQ0imaA6qDELtPr/l68/VSuGGknUD0eelOps/SzCc4qhoJ3rNniP91iHNRfHPqQtQciHrkcegC1ii
 whwbEFIE+jIb4XhydWhriqKfZZn7l1oZkdv2GlKWWqDaG6LkEKg=
Subject: Re: [Buildroot] Some analysis of the major build failure reasons
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On 8/3/21 2:48 PM, Giulio Benetti wrote:
> Hello Thomas,
> 
> On 8/3/21 2:24 PM, Giulio Benetti wrote:
>> On 8/3/21 9:28 AM, Thomas Petazzoni wrote:
>>> Hello Giulio,
>>>
>>> On Tue, 3 Aug 2021 00:56:24 +0200
>>> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
>>>
>>>>> I have investigated this. It fails only on sh4, due an internal
>>>>> compiler error. It only occurs at -Os, at -O0 and -O2 it builds fine. I
>>>>> have reported gcc bug
>>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737 for this. Since I
>>>>> tested only with gcc 9.3.0 for now, I've started a build with gcc 11.x,
>>>>> to see how it goes.
>>>>>
>>>>> Based on the result, I'll send a patch adding a new
>>>>> BR2_TOOLCHAIN_GCC_HAS_BUG_101737 and disable -Os on pixman on SuperH
>>>>> based on this.
>>>>
>>>> I can do that since I've treated a lot of gcc bugs. Is it ok?
>>>
>>> Oh yes, sure! In the mean time, I have confirmed that gcc 11.1.0 is
>>> also affected by the same issue, and I have updated the gcc bug with
>>> that information. So to me, it seems like all gcc versions are affected.
>>
>> Great, I've sent this patchset for it:
>> https://patchwork.ozlabs.org/project/buildroot/list/?series=256392
>>
>>>>>>                            unknown | 31
>>>>>
>>>>> I did not look into these for now.
>>>>
>>>> I've taken a look into the last ones of today(the 31 ones)
>>>> @James: lot of your builds simply stuck after Make has finished(not on
>>>> linking but exactly on 'make: Leaving directory').
>>>>
>>>> I've noticed it time ago some time, and now it became very more
>>>> frequent. This is 9/10 your autobuilder giving that problem.
>>>> And this happens at different Build Duration:
>>>> http://autobuild.buildroot.net/?reason=unknown
>>>> Also I see you use /tmp/ folder but I don't see anyone else doing that.
>>>> Isn't it maybe that your distro automatically cleans /tmp folder up? Or
>>>> it is mapped somewhere where disk gets full randomly?
>>>> I would move it to a specific user folder(i.e. buildroot user) and that
>>>> should fix the problem. If you're trying to do such thing to save disk
>>>> space I tell you that I've already done it time ago with this patch that
>>>> now needs to be rebased:
>>>> https://patchwork.ozlabs.org/project/buildroot/patch/20180919114541.17670-1-giulio.benetti@micronovasrl.com/
>>>> But in my case NOK was clear. I'm pretty sure /tmp/ is the problem.
>>>
>>> No, I don't think there is any problem with the use of /tmp. The
>>> "unknown" build failures are typically build failures with top-level
>>> parallel build enabled.
>>>
>>> If you take
>>> http://autobuild.buildroot.net/results/4ee/4eead81391d76edcdd2823e439f9b8d165b9b7ef/
>>> which is the latest "unknown" build issue at the time of writing this
>>> e-mail, it has BR2_PER_PACKAGE_DIRECTORIES=y. We enable
>>> BR2_PER_PACKAGE_DIRECTORIES for a subset of the builds, and then for
>>> the builds that have BR2_PER_PACKAGE_DIRECTORIES enabled, for a subset
>>> of them, we use top-level parallel build.
>>>
>>> However, when there is top-level parallel build enabled, the output is
>>> quite messy (due to multiple packages being built in parallel). And due
>>> to that, the build-end.log may not actually contain the actual build
>>> failure as the failure may be visible much earlier in the build output.
>>>
>>> If you check these "unknown" build failures, they all have
>>> BR2_PER_PACKAGE_DIRECTORIES enabled, which really hints at a top-level
>>> parallel build issue.
>>
>> +1
>>
>>> Perhaps what I should do is cook a patch that keeps the full build log
>>> file for builds that use top-level parallel build, so that we have a
>>> chance to debug these. The problem is going to be the disk-space
>>> consumption on my server, but I guess I could do something that
>>> compresses the build log after X days or something like that.
>>>
>>>> On @Thomas autobuilder I see failure for:
>>>> - optee-client(already found NOK):
>>>> http://autobuild.buildroot.net/results/5e9/5e91bc53c3fbcd2ed232db79dc5c947394d66a1e/
>>>> - failure on fetching as mentioned above
>>>>
>>>>>>                       zeromq-4.3.4 | 30
>>>>>
>>>>> Giulio: this is happening only on or1k, with a binutils assert. Do you
>>>>> think this is solved by your or1k fixes?
>>>>
>>>> It is. Those build failures are due to the use of binutils-2.33.1 that
>>>> have not patches for or1k. While all the other binutils versions have
>>>> local or upstreamed or1k patches.
>>>>
>>>> Of course this can still happen with actual external Bootlin or1k
>>>> toolchain that use exactly binutils-2.33.1 not patched. So the problem
>>>> will be solved once you recompile and bump them with patches provided. I
>>>> still see that we're on 2020.08-1:
>>>> https://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk#n586
>>>
>>> Yes, I have worked on rebuilding the toolchains with 2021.05 + a few
>>> patches, but I have a runtime issue with Microblaze + glibc, which
>>> doesn't boot (well the kernel boots, but not user-space). Microblaze +
>>> uclibc or musl works fine.
>>>
>>> I guess I should probably not delay further the release of 2021.05
>>> toolchains, and leave just the Microblaze/glibc toolchains to 2020.08.
>>
>> As you wish, now we have OpenRisc Buildroot toolchain working, so maybe
>> we don't need to hurry up. It stayed there for long times with bugs.
>> It' only annoying seeing those autobuilders NOK, but we know the reason
>> why they are there.
>>
>>>> NOTE:
>>>> I also add libnss-3.68 new bug on Aarch64_BE to be fixed. I'm already
>>>> working on it on spare time.
>>>
>>> Great! >> PS: I've found my autobuilders stopped, I think I've forgotten to
>>>> restart the daemon after updating the Distro. Now they're up and running.
>>>
>>> OK, thanks. That being said, additional autobuilders at the moment are
>>> probably not that important: compared to the CPU power made available
>>> by James through its super high-performance 63 machines, additional
>>> "regular" machines added to the autobuilder pool are not going to help
>>> much.
>>
>> Wow, now I understand why James has so many build!
>>
>>> However, they are going to definitely help when James will no longer
>>> have access to those machines.
>>
>> +1
>>
>> Fabrice preceded me for gpsd as you've noticed:
>> https://patchwork.ozlabs.org/project/buildroot/patch/20210803120714.2797624-1-fontaine.fabrice@gmail.com/
>>
>>
>> And I'm working on libfuse3 right now.
> 
> This ^^^ "error: symver is only supported on ELF platforms" seems gcc
> related. On meson check if symver is supported everything is based on
> the macro __has_attribute(symver) that must work as expected, while in
> the code we have something like the following that fails with that error:
> ```
> __attribute__ ((symver ("fuse_new@FUSE_3.0")))
> void func1(void)
> {
> 
> }
> 
> ```
> 
> So I try to patch microblaze gcc.

This is fixed by this patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20210803224106.1619032-1-giulio.benetti@benettiengineering.com/

I've opened a gcc bug, but they state that __has_attribute() gives false 
positives:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
So basically I've only changed how libfuse3 meson check if symver is 
available. Patch has been merged:
https://github.com/libfuse/libfuse/pull/620

Need some more time to fix libnss Aarch64 BE and eventually trying to 
re-enable the parallel build that seems to be fixed in version 3.61:
https://bugzilla.mozilla.org/show_bug.cgi?id=1688374
and I've retried to send a patch. I'll try to loop a build in 1 of my 
autobuilders before sending that. Also, I can't access Mozilla Bugzilla 
and I'm waiting for them to re-enable it, otherwise I can't access and 
give bug a number and consequently upstream.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
