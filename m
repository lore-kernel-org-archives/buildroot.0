Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41D2C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 22:56:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12AFE60F36
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 22:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12AFE60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67EF402FF;
	Mon,  2 Aug 2021 22:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xkYdJPxaCFds; Mon,  2 Aug 2021 22:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A160402F1;
	Mon,  2 Aug 2021 22:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC6D1BF338
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 22:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A2A882A95
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 22:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UJAZ_16M7eGj for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 22:56:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D40382A4F
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 22:56:27 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.149.252])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AgrAmkcrtrXl6AgrBmij1K; Tue, 03 Aug 2021 00:56:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627944985; bh=8UO54inqndp9EYqx/JfGPOVe41XvcMqYBvsPPpgWkNU=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=GZnvkajlmxlx+D4n0IjnI+IgCnkfYFlkLivRAyD3Rk02eS+xfritA28NwMTwIMiLK
 z2ck6AYcDE2v/mE6pMEpKnXM/6Ze3SBXzy6ybh1t7bl91Yd4gj9UUx8OVJCur/5VUk
 fuvzk0zPi0qqsdcSSRgl0E9a3aHBiwVuwFT4L0/Rmwbcchf0tC6dZI+ZWvM/8xOf1l
 Zk50nASMoG8mRZqtpR0k9cf1jWU6DC0RqQTC4e1ZGV9wQoM6A2q6/zp9WAVp2aFXy8
 P6qY/6jbw71KaWek7oZ1lDg1sO1KJQOjWVradrjdF3EImJrNHbaC2DtMse9bZRenUU
 ExlFg3YOLcXPA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Adam Duskett <aduskett@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20210802060946.C27006062D@smtp3.osuosl.org>
 <20210802234647.6f3df99d@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <0c80668e-d1c0-3516-4a9e-54e6eb32cfd8@benettiengineering.com>
Date: Tue, 3 Aug 2021 00:56:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802234647.6f3df99d@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfByZZhuwGg4wgJDvjlDl8S6ccmdlma6U3a0MzFJSW2zapiInjhIlhPDy4e39VCz+kLdWNt9CsZLMHVomjpXzNWkJMoRxdg0vwes2XfYrlZIUAzcTe9Jb
 ZkV6mOWt5z4AoTY8/LckuzBq4CYHgcYb6LpJKygeZXlnqmglZrzH3wd4kyYM3SxK2Tql2QJQmsQPHPqHIZ6cu+Up6jGPSPxzNddxHHp4yG4u8OO3+4Z8AVUw
 hOkw+kYwE0XIPuJFE5AfIyN2sD4/zpy5/r1W0G3c2TRod48KCTkzhf0gLnwrqH51otyX+1yrUAyEpTe5RIXEwImMJX4OgXNTym+zPhVRLZpHr6EKRzmmIV/E
 YGLH9lbkL+Ir3dWjpup8G2pJcmwHhYCCJOwipu11QDeM5hEWBOY=
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas, James, All,

On 8/2/21 11:46 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Giulio, Bernd, Adam, there are questions for you below. Thanks for your
> support!
> 
> On Mon, 02 Aug 2021 06:09:39 -0000
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>>      master   | 1903 | 802 | 53  | 2758 |
> 
> So it's getting a bit better, but we still have lots of build failures.
> 
>> Classification of failures by reason for master
>> -----------------------------------------------
>>                   pixman-0.40.0 | 31
> 
> I have investigated this. It fails only on sh4, due an internal
> compiler error. It only occurs at -Os, at -O0 and -O2 it builds fine. I
> have reported gcc bug
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101737 for this. Since I
> tested only with gcc 9.3.0 for now, I've started a build with gcc 11.x,
> to see how it goes.
> 
> Based on the result, I'll send a patch adding a new
> BR2_TOOLCHAIN_GCC_HAS_BUG_101737 and disable -Os on pixman on SuperH
> based on this.

I can do that since I've treated a lot of gcc bugs. Is it ok?

>>                         unknown | 31
> 
> I did not look into these for now.

I've taken a look into the last ones of today(the 31 ones)
@James: lot of your builds simply stuck after Make has finished(not on 
linking but exactly on 'make: Leaving directory').

I've noticed it time ago some time, and now it became very more 
frequent. This is 9/10 your autobuilder giving that problem.
And this happens at different Build Duration:
http://autobuild.buildroot.net/?reason=unknown
Also I see you use /tmp/ folder but I don't see anyone else doing that. 
Isn't it maybe that your distro automatically cleans /tmp folder up? Or 
it is mapped somewhere where disk gets full randomly?
I would move it to a specific user folder(i.e. buildroot user) and that 
should fix the problem. If you're trying to do such thing to save disk 
space I tell you that I've already done it time ago with this patch that 
now needs to be rebased:
https://patchwork.ozlabs.org/project/buildroot/patch/20180919114541.17670-1-giulio.benetti@micronovasrl.com/
But in my case NOK was clear. I'm pretty sure /tmp/ is the problem.

On @Thomas autobuilder I see failure for:
- optee-client(already found NOK):
http://autobuild.buildroot.net/results/5e9/5e91bc53c3fbcd2ed232db79dc5c947394d66a1e/
- failure on fetching as mentioned above

>>                    zeromq-4.3.4 | 30
> 
> Giulio: this is happening only on or1k, with a binutils assert. Do you
> think this is solved by your or1k fixes?

It is. Those build failures are due to the use of binutils-2.33.1 that 
have not patches for or1k. While all the other binutils versions have
local or upstreamed or1k patches.

Of course this can still happen with actual external Bootlin or1k 
toolchain that use exactly binutils-2.33.1 not patched. So the problem 
will be solved once you recompile and bump them with patches provided. I 
still see that we're on 2020.08-1:
https://git.buildroot.net/buildroot/tree/toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk#n586

>>                 libfuse3-3.10.4 | 23
> 
> This only happens on Microblaze, with:
> 
> ../lib/fuse_loop_mt.c:361:1: error: symver is only supported on ELF platforms
> 
> Giulio, does it ring a bell to you ? It's weird because Microblaze is
> using ELF binaries.

I'm going to look into this.

>>                 nfs-utils-2.5.4 | 19
> 
> I assume would be fixed by
> https://patchwork.ozlabs.org/project/buildroot/patch/20210802172116.10073-1-petr.vorel@gmail.com/

Yes, it does. This bug confused me because of lacking of -werror.

>>                       gpsd-3.21 | 17
> 
> Giulio, the workaround to pass -O0 no longer works for some reason. -O0
> is still passed, but -O2 is passed *after*, causing the build issue to
> pop up again. Could you have a look ?

Sure, some upstream change that makes my work-around useless.

NOTE:
I also add libnss-3.68 new bug on Aarch64_BE to be fixed. I'm already 
working on it on spare time.

PS: I've found my autobuilders stopped, I think I've forgotten to 
restart the daemon after updating the Distro. Now they're up and running.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
