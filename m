Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FE0C77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4622A415D3;
	Sun, 14 May 2023 13:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4622A415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9mKMs6wfie-N; Sun, 14 May 2023 13:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD2F410E6;
	Sun, 14 May 2023 13:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AD2F410E6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7761BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 421A783B1F
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 421A783B1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLQOnHPlCv1w for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:43:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E0E83B18
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64E0E83B18
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:43:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 5BAA1B0059B;
 Sun, 14 May 2023 15:43:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 15:43:13 +0200
Date: Sun, 14 May 2023 15:43:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20230514134313.GE2582048@scaer>
References: <20230130144655.1193660-1-maxime.chevallier@bootlin.com>
 <20230130144655.1193660-5-maxime.chevallier@bootlin.com>
 <37a680ce-9213-de60-4d6c-306a787d4bad@benettiengineering.com>
 <20230131161558.5982b380@pc-7.home>
 <51634838-32b7-4ae0-0251-2cd4fc2207ae@benettiengineering.com>
 <ea48dd89-b89f-479d-7df7-a739b66f3101@benettiengineering.com>
 <95838e6d-1271-b347-61c9-94b5f0cae29f@benettiengineering.com>
 <20230131174440.227df853@pc-7.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230131174440.227df853@pc-7.home>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684071798;
 bh=gpP7ZV0egMRBGpZJpuivO/dV2+P6byD3ITtmqiW2LjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ozQxFVZTNutFRok+PXwQAZ827lF3W47ZXOchIhadoPW/vjqryM6AEI1M5VZ8GsMjt
 Ks56ZT6/4Gl6iBjYPDjdUgt0ZajXgzQZdXSLamoDM4bTE+XsSGRy4cLBQYvHlYHrNw
 noKWBEDJ5wST0+3FvOoZDz7fWdcMYztNQpPHUVsjS0v9IVI43Aa2sTuUgdMH2lI1SL
 HknRvRtQeT2HDyVDm1cNVpQqXyDen1JdGZbYbBwfLMpMiFGKUEcb3U24n+1xnDoeWy
 M7OtocoZqqgQo5FznjWmAzct34zNmk3nuyLDW3Q9p3lXETy8o4V2kMLgSlIYgeLsPN
 00lbCE1s+tBHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ozQxFVZT
Subject: Re: [Buildroot] [PATCH 4/4] package/trace-cmd: bump to 3.1.5
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Maxime, All,

On 2023-01-31 17:44 +0100, Maxime Chevallier via buildroot spake thusly:
> On Tue, 31 Jan 2023 17:31:25 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
[--SNIP--]
> > very strange. And it still hasn't finished. I let it go and see if it
> > builds successfully. It sounds like a make problem. All other
> > buildings I'm doing works correctly. Just to be sure I've also
> > rebooted my PC.
> Wow that's strange indeed, I wonder if this is a parallel build problem
> in trace-cmd's makefile.
> I'll try to reproduce on my side, I've tested that for arm but not
> arm64, I'll give it a go and see if I can spot any similar problem.

Any status on this issue?

I'll mark the patch as Changes Requested in the meantime.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
