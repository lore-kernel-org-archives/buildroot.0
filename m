Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73FBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 06:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55C6483E19;
	Tue, 17 May 2022 06:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-EEgr2SAGrC; Tue, 17 May 2022 06:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08F34836E1;
	Tue, 17 May 2022 06:05:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 273581BF309
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D83E4060B
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 06:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_LakccIrqjG for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 06:05:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 411EC400F1
 for <buildroot@buildroot.org>; Tue, 17 May 2022 06:05:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7A450B00571;
 Tue, 17 May 2022 08:05:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652767547;
 bh=mZAhwrXdpQITkKwlgUkde0atQA4DI+MMwr9Gb7Ll308=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FHSUmAeefwHKqScTmYmeDQOguF35ao0UKXSySczOuMwjdWAhia1r+ACkv1tHAh2fQ
 /NBtWBCbaQBK4G97Sf0AbpbVUoBQKkjHEBt5DYD2z/7Bn8x34sELMrSTGFknLGgFdI
 9vwWCt8nLbHNx+1LuS2b5edDmY1HiXggVE4MC9V5A4HK8nu4jqHl8tZFgGC28kO/S+
 nSfg7ROIVLZC4946MTVWTI5j679KtZxy6dx0yQi2YHPT0tR3/N3n+mBu5348SkERf1
 1SgeTHC/0zsmbOA2qm5pwy/BlaMgqnUF7B4ZagaibVfAMLo+bCK3AfYjPNQ432Bbf5
 6CkBveMZQg+tA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 May 2022 08:05:45 +0200
Date: Tue, 17 May 2022 08:05:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Linus Kaschulla <linus@cosmos-ink.net>
Message-ID: <20220517060545.GP1597494@scaer>
References: <20220517032459.3400-1-linus@cosmos-ink.net>
 <20220517053803.GN1597494@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517053803.GN1597494@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] fs/squashfs: Add block size option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linus, All,

On 2022-05-17 07:38 +0200, Yann E. MORIN spake thusly:
> On 2022-05-17 03:24 +0000, Linus Kaschulla spake thusly:
> > This patch adds the ability to select from common block sizes
> > which for example can aid in improving compression ratio.
[--SNIP--]
> > +ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_BS_64K),y)

I got a bit confused here, in fact: BR2_TARGET_ROOTFS_SQUASHFS4_BS_64K
has a '4' after the 'SQUASHFS', but the options in the choice do not,
so none of this conditional block was ever hit in fact. I dropped it.

And I see where that '4' comes from: you mimicked the compression type
choice. I totally missed that initially. That's a remnant from days pat,
and if we were to add that code today, we'd not keep the '4'.

An yway, applied to master with:
  - drop spurious boolean-based setting in .mk
  - split into multi-line
  - qstrip variable expansion

Thanks!

> Finally, it would have been nice to add two test cases that at least the
> 4K and 1024K options do work (the existing test tests the defaultm i.e
> 128K). Tests are in:  support/testing/tests/fs/test_squashfs.py

Still interested in seeing a test-case, though! ;-)

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
