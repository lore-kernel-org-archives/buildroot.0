Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E78C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61EEA607F4;
	Mon,  8 Aug 2022 20:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61EEA607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZW70QpI2H46C; Mon,  8 Aug 2022 20:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7629460768;
	Mon,  8 Aug 2022 20:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7629460768
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89D481BF316
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 721EF400A8
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 20:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 721EF400A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M30wXZ23of_2 for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 20:06:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 613B340112
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 613B340112
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 20:06:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.6])
 by smtp4-g21.free.fr (Postfix) with ESMTP id BAC6419F4F8;
 Mon,  8 Aug 2022 22:06:05 +0200 (CEST)
Received: from 37-171-26-40.coucou-networks.fr ([37.171.26.40])
 by webmail.free.fr
MIME-Version: 1.0
Date: Mon, 08 Aug 2022 22:06:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220807192229.0d697a6c@windsurf>
References: <20220807165538.850640-1-ju.o@free.fr>
 <20220807192229.0d697a6c@windsurf>
Message-ID: <eed2947e5e7f833e6b8fe71e60e09580@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659989165;
 bh=Gm40+MpL88lRY6OSnENpSDwhMD4AryAA76p8ZEwD3r8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HK09GnPwZCoJiIIjMAVCLGDyRMhUfgox6cvm/oP86igkA+L6cG07z4Wch/9vPw4EZ
 gSFZun9AtvzGdMNZf+0ktsssJL7omTPloPQ6gcDFKODf9PshKABdmHMy96EgtZ+N+u
 o5/g/s9QBp6n73BwSH9efJdm4WqQRo2VgrMj7GBbOZ/Lt+bpKAwssBd1mWp+YXMRcZ
 JaUbN1oRKqnjnn64Dx3xageruDfQRvm4zR4oA+ZPAmjdoDYgHAHGy1vHavAz7LCwha
 p68fyxhjL7RcCwItJM+qno8NxyYXqbE6+SQPETN4F1QcomiInlAfoRZ6+VK+gBAZDt
 vuK+Qb+08XivQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HK09GnPw
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: octave: increase test
 timeout
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

Hi Thomas,

On 07/08/2022 19:22, Thomas Petazzoni wrote:
> Hello Julien,
> 
> On Sun,  7 Aug 2022 18:55:37 +0200
> Julien Olivain <ju.o@free.fr> wrote:
> 
>> Octave package test can occasionally fail due to timeout.
>> This commit slightly increase timeout values to reduce those failures.
>> 
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>>  support/testing/tests/package/test_octave.py | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/support/testing/tests/package/test_octave.py 
>> b/support/testing/tests/package/test_octave.py
>> index 82a70e09c2..2d808e0cca 100644
>> --- a/support/testing/tests/package/test_octave.py
>> +++ b/support/testing/tests/package/test_octave.py
>> @@ -34,6 +34,7 @@ class TestOctave(infra.basetest.BRTest):
>>                             kernel=kern,
>>                             kernel_cmdline=["console=ttyAMA0"],
>>                             options=["-M", "virt", "-cpu", 
>> "cortex-a57", "-m", "512M", "-initrd", img])
>> +        self.emulator.timeout_multiplier *= 2
> 
> Thanks for the patch.
> 
> I know a few other tests are tweaking timeout_multiplier, but I think
> it's wrong. The idea of timeout_multiplier is that it's defined on the
> command line, when running the tests, to indicate that you're running
> on a "slow" machine that requires a timeout factor.
> 
> Tests should only tweak the timeout value, and the timeout_multiplier
> will be applied to these timeouts.
> 
> So I think we should remove these tweaks on timeout_multiplier in test
> cases, rather than add more.

Thanks for the clarification.  I'll resend an updated patch without this
timeout_multiplier modification.

I'll use run-tests --timeout-multiplier 2 on my end, instead.

> Best regards,
> 
> Thomas

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
