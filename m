Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4626BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:24:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B4460EE2
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3B4460EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB85240187;
	Sat, 14 Aug 2021 21:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdd8yBRzHftH; Sat, 14 Aug 2021 21:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262584035E;
	Sat, 14 Aug 2021 21:24:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C4311BF350
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0AEF401D2
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvTtBSWU4mp0 for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 21:24:19 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp2.osuosl.org (Postfix) with ESMTP id E96564010F
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 21:24:18 +0000 (UTC)
Received: from [192.168.47.129] ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F11lm4MErxC2nF11lmduMF; Sat, 14 Aug 2021 23:17:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628975834; bh=kxN1QXri6ikTH2uMwrS7AwOzpd4gVvY191lYdBW92V8=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=HJRuYPgMjqEtWF9/5TCdaY/od9vuxVGaibVhy5V+EGPyMwfl1G+MJqQbN/lU6ALrF
 pTlSIxOLFhNPLOtGwVlR6B8iafMZ0K3p4pKoLmL9ODOGLczomTElmaNuhzNgbF3OSi
 1uvTHfYacci+s9qd3VzIVERkEGakl5cBnRdiUgYwoG0Br7o1xfgkl0yBLWaLUT8IkD
 z9o/aPoAbCLLZSmQIsiGtmsMU+KHTeAl0K8rKPufdtsLjkHTl6fzgaDLXdoNAm8/Nn
 8P1cJg+mlmKnWUQjTgNJUiktOf9oU3kqhOGCUBwmzU67/dqbjmkFmrALF4fEyCZyd8
 giccDBGM2qkQg==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210813213745.1555522-1-giulio.benetti@benettiengineering.com>
 <20210813213745.1555522-4-giulio.benetti@benettiengineering.com>
 <20210814155142.12c37943@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <0a69f526-0690-7950-0c2c-3b94968e3d2c@benettiengineering.com>
Date: Sat, 14 Aug 2021 23:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210814155142.12c37943@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBQEQRNULbR5zj0ReHVCl+iotnPebmqlKr41RwBwZnCaG6E7980W5YSv0EPCZUzOdv90Ob98vKKLiD/DDvgOtuHsIbynPriTzWtp+yzcWk4unIVRY5en
 g2sAcavJiejmp3PPDs5T+0Uz5hkSEVE6k4zXYio9dj5L12EaCOlCOjjap7QWIxRD3+vkdyw3NLxYU6ivPwPLiNEE9FrTpHa6GTrdjJS1bx1tCnIj1Y0O5J9Z
 6UK5MV8SPyiQdaxHEMMYkQTtXu3nlK0/tKbwN4EX9LTFj6f1OC4IS6N/GrqsMYhxPYwDGJzzM/Df6vaawywb5aGkQciikk3Al2C0cdp2h/E=
Subject: Re: [Buildroot] [PATCH 3/3] package/lmbench: fix build failure due
 to gcc bug 97208
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On 8/14/21 3:51 PM, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> On Fri, 13 Aug 2021 23:37:45 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> The lmbench package exhibits gcc bug 97208 when built for the Microblaze
>> architecture with optimization enabled, which causes a build failure.
>>
>> As done for other packages in Buildroot work around this gcc bug by
>> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_97208=y..
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/ae1/ae1e4d61ed367c6cb64442c60d98882cc7985346/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Are we sure the gcc bug is the same? According to the word-around in
> toolchain wrapper, disabling the  -ftree-loop-distribute-patterns is
> enough... but not for lmbench ?
> 
> What specifically tells us that the lmbench issue is the same as the
> one we worked-around with -fnotree-loop-distribute-patterns in other
> packages ?

You're right, I've been biased by the fact that they fail on the same 
gcc versions and that's all. I don't know why I've ended up to this 
conclusion honestly.

So, I've filed a new gcc bug into gcc bugzilla[1] and treat it with -O0 
since I've given a try with -fnotree-loop-distribute-patterns with no 
luck. Then I'll send a patch to work around gcc bug 101915 on lmbench.

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
