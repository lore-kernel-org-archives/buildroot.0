Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7B5C61DBE
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 19:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 523A66061A;
	Sat, 29 Aug 2026 19:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JctGJAgbuON; Sat, 29 Aug 2026 19:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788031473;
	bh=O+73ZVgocjtibo0CdO8jzLXCDNy3iMPaUR6EPDQS5gA=;
	h=Date:To:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=lH4Nbmbf3tiqS2lkYjhJjbi6pomcrNG1D9OPrc/aqARHfr9yuPxQsJNyf20M0zisn
	 X/kVFPgs81m5NnVAeSaZ1VQRRxusyKTl1zdT0hpBH04sAB4j2RD4A1fTz/lH258ci2
	 xm2OpA7U+jCR3ayvbtVUaYVzcuBKd3CCSJfBSozughad/+TCYoFUUSDb8h/GPC9tBV
	 Fsc/kmjjkk7gV6zO/Mqob2VaNOFnfid0uGy3VFkrlMaDb/W5UisLE123O3mFIL71JN
	 4xmwIRE6b9X+l/ZJv/KYHw0oez2HT61f4LNh3PKqYEBuPvIWgMa3oHjaH3sqyOlIkk
	 +3vo77Ghvybmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CA7D60617;
	Sat, 29 Aug 2026 19:24:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E535B127
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB69A4007B
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LwmxziAw7TiV for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 19:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B88640059
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 19:24:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 014AA78035E;
 Sat, 29 Aug 2026 21:24:23 +0200 (CEST)
Received: from 2a0d:e487:118f:32f7:a07:17e2:1c81:e739
 via 2a0d:e487:118f:32f7:a07:17e2:1c81:e739 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Aug 2026 21:24:23 +0200
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 21:24:23 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <apMogNfb_5pg-OmH@windsurf>
References: <20260827095520.1049186-1-thomas.petazzoni@bootlin.com>
 <20260827095520.1049186-3-thomas.petazzoni@bootlin.com>
 <8733vxypoh.fsf@dell.be.48ers.dk> <ea3adbc598ea273edba25e595fad4969@free.fr>
 <apMogNfb_5pg-OmH@windsurf>
User-Agent: Webmail Free/1.6.18
Message-ID: <8aab4881ec10eb0524327ac9e9467fd7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: add bpftrace test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Cc: romain.naour@smile.fr,
 Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, All,

On 29/08/2026 20:45, Thomas Petazzoni wrote:
> On Sat, Aug 29, 2026 at 06:52:08PM +0200, Julien Olivain wrote:
> 
>> I initially had the same question. Then, I assumed this new runtime 
>> test
>> has been simply copied from the existing test_bcc:
>> https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/testing/tests/package/test_bcc.py
>> which was written with kernel 6.6.32, which was the latest LTS at that 
>> time.
> 
> Absolutely correct. And of course, I see no problem in migrating all
> these tests to 6.18.
> 
>> Once the next 2026.08 release will be complete, I think we will do a 
>> cleanup
>> in runtime tests, to add a Aarch64 builtin kernel at the latest LTS. 
>> So all
>> those runtime tests will be updated.
> 
> I vaguely remember that one intern from Romain Naour was working on
> this, I even vaguely remember seeing patches implementing this, no?

If I try to summarize the state of this activity:

I merged a series a while back, updating many kernels
in runtime tests:
https://patchwork.ozlabs.org/project/buildroot/list/?series=500282&state=*

Then, there is an initiative to build the runtime test pre-built
Kernels from the Gitlab CI:
https://patchwork.buildroot.org/project/buildroot/list/?series=210
Ideally we would like to add new kernels (aarch64 for ex).

Then, there is ongoing work to switch most tests on the new relevant
pre-built kernels. I think the most advance ongoing work is at:
https://gitlab.com/kubu93/buildroot/-/commits/prebuilt-aarch64-kernel-v7

> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
