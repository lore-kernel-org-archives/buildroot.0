Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80E3C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB7C60F45
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 22:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AB7C60F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 033A061512;
	Fri, 12 Nov 2021 22:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSt4TIPi9NOj; Fri, 12 Nov 2021 22:41:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7105561516;
	Fri, 12 Nov 2021 22:41:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7317A1BF3A3
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 639AE81C0A
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 22:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I20GBj-XqzEy for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 22:40:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54E6481BCF
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 22:40:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C57E919F4F8;
 Fri, 12 Nov 2021 23:40:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636756840;
 bh=MbQeICw75nYsFrjjqd9Hd2IkQxVGQS3zu4E2oVZi0RE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bi0qr93a7o/ChrU8z5IlzGzSKtk0lPnCa7NVVfLv6HDFSqK8SVSKUZej4FN+xkCQq
 NchHfjydJDsaTU00IB2k6rVLVtQ29ZJ8ldyYKexK6D73qwgntbnOupqsiinNdz8OZP
 jitUsLKkRGzIUku9Lzag1LvR2eCWe8Pl9QVmft8EaJQfyBF8hQu9xfI1ZVInJiJptj
 XyAU36jMHpj1ZQZklcgF+5J3pn0CcVPFIbNPwvH7irl2LKg44cNkD5vfwo926HpvqD
 N8v87yqKxWEKAKYOt4oBP0epnwcUH7NN412QFS716EVTePG5Bg6OJAtUHwMMNzRL9k
 3TtCiVepEIaWg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 23:40:36 +0100
Date: Fri, 12 Nov 2021 23:40:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211112224036.GL247986@scaer>
References: <20211112190650.84234-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112190650.84234-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 0/6] rework luvi test in gitlab after
 luajit version bump.
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

Romain, All,

On 2021-11-12 20:06 +0100, Romain Naour spake thusly:
> Luajit package has been recently updated to the latest commit in the
> master branch [1]. But we discovered several problems:
> 
>  - LUAJIT_VERSION doesn't contain the luajit version anymore but a commit hash
>  - With Luajit, luvi doesn't work without rng support enabled.
>  - Building for 64-bit target requires a 64-bit host for all target platform
>  - luajit and host-luajit needs to be built with the same option, so the
>    bytecode generated by host-luajit is valid on luajit.
>  - iteration with pairs() does not result in the same order since luajit 2.1.

Whole series applied to master, thanks!

Regards,
Yann E. MORIN.

> [1] 9450b53c8e06f1b5a75840b82c0f4663a5d75c45
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1710552605
> 
> Best regards,
> Romain
> 
> Francois Perrad (1):
>   package/luajit: disable 64 bit GC objects
> 
> Romain Naour (5):
>   package/luvi: don't use LUAJIT_VERSION for the luajit installation
>     path
>   support/testing: test_luvi: switch to armv5 to boot with rng support
>     enabled
>   package/luajit: rework BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>   package/luajit: building for 64-bit target requires a 64-bit host for
>     all platform
>   support/testing: test_luvi: make luvi test reproducible
> 
>  package/luajit/Config.in                   | 12 +++++++-----
>  package/luajit/luajit.mk                   |  2 ++
>  package/luvi/luvi.mk                       |  8 ++++++--
>  support/testing/tests/package/test_luvi.py | 12 ++++++------
>  4 files changed, 21 insertions(+), 13 deletions(-)
> 
> -- 
> 2.31.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
