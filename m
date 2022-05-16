Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AA1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 16:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C76610F0;
	Mon, 16 May 2022 16:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nLl_qDR9Po4b; Mon, 16 May 2022 16:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6E19610D8;
	Mon, 16 May 2022 16:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7879A1BF362
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 16:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75662408FB
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 16:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4XkKQCfu75yd for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 16:47:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6B6C40382
 for <buildroot@buildroot.org>; Mon, 16 May 2022 16:47:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BFA23B00565;
 Mon, 16 May 2022 18:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652719635;
 bh=q2guD156LqBFosM4bExPBSnfjj/TrqXG2W50nFqrFTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5oUiW0t+z37b9bcOQyq50GZbkAkj8QcXh6ZaX61ant2FmAErg0yl0YngddsVnkr8
 QbAo2hYGCqxOIeSv75AnbtOn+nY6Cm2TryJeoSPOiv0/S5qVIu9PgEeJL33uDpfO2M
 Oacgv64zko0h2eboIBDJ5h/SCwKalXa1IHMbJJtEZOHEX+mF6siANXzp758s7XfeB7
 lhIKnBU20/BbcpA+1Z9RTqrSO4VuwWe8RXSj/0tPJVBWJbvXCA5bRdvQlI6mKgTzA8
 6eHluqyEJ8tJRIrpwwL2U3987LgyY7FyiJ49HL0OM3wFA8L7+C+Hh8JW4fIW5hgi9B
 37Rf/SV68itZA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 May 2022 18:47:13 +0200
Date: Mon, 16 May 2022 18:47:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Linus <linus@cosmos-ink.net>
Message-ID: <20220516164713.GI1597494@scaer>
References: <20220515145441.3682-1-linus@cosmos-ink.net>
 <20220515205235.GG1597494@scaer>
 <5027e8d8-02e3-b5ed-e1a6-8f9804d68d68@cosmos-ink.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5027e8d8-02e3-b5ed-e1a6-8f9804d68d68@cosmos-ink.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: add more options to
 customize creation
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

Linus, Al,

On 2022-05-16 01:56 +0200, Linus spake thusly:
> I have already prepared the patch for blocksize, using choices
> from 4k, 8k, ..., 512k, 1024k. That one should be pretty straight
> forward.
> 
> I also find 1k to be pretty ridiculous. Not even sure if it would
> work. This size seems to be pretty old and also only start at 4k:
> https://tldp.org/HOWTO/SquashFS-HOWTO/mksqoverview.html

Yes, 1K and 2K are not suported, but that page is about mksquashfs 3.x,
which supported from 4K to 128K, but we are now packagng 4.5, which
supports from 4K to 1M.

> I've used the same style that was used for specifiying the compression.
> Not sure whether the later string without a name is hidden,

Yes, it should be hidden, i.e. have no prompt, because the actual user
input is the entry in the choice; the hidden string is just a
translation from a multi-boolean to a the actual size. We have such
constructs in a few opther places. For example, see the version choice
for the kernel version;

      129 config BR2_LINUX_KERNEL_VERSION
      130     string
      131     default "5.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
      132     default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
      133     default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
      134 ...

> but I've
> so far never encountered that. I can add this of course if this has
> some benefit (maybe being able to specify a specific size in raw
> config values??).

Nope, the choice is the only way to set it.

> ## Compression
> 
> For the compression arguments, I'm up to anything here as well.
> I'm not sure if we should use all extreme options by default
> 
> >Also note that lz4 already uses -Xhc unconditionally, and commit
> >     07e37bcc42f notes that an extra option was dropped, so maybe we
> >     should just unconditionally enable all those options when possible?
> Seems like a easy way to confuse people or cause errors should
> a option somehow make problems.

In that case, people would not enable this option if it is causing issue
for them.

> Or is it a major problem to break
> the assumption that only lz4 is already optimized?

Well, to keep the existing behaviour we could do something like:

    config BR2_TARGET_ROOTFS_EXTREME_COMP
        bool "extreme compression if possible"
        default y if BR2_TARGET_ROOTFS_SQUASHFS4_LZH

> >   - for the comnpression options, I think a generic boolean would be
> >     better:
> I agree with that. Will try to get this done tomorrow and do a couple
> of tests to ensure there are no obvious problems.
> 
> ## In conclusion
> 
> If that's okay with you I can prepare a patch-set tomorrow and
> send them in for review (hopefully also tomorrow).

Yes, no worries, as you can make it. Thanks!

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
