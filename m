Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70C7C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:37:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B9ED60FED
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 20:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B9ED60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FA0B40114;
	Thu,  4 Nov 2021 20:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8w6fcWsyFKJ; Thu,  4 Nov 2021 20:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5214D401E7;
	Thu,  4 Nov 2021 20:37:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5098A1BF335
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3864D401E7
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 20:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6Fp4S8CaaE9 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 20:37:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A73E140114
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 20:37:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d011:289f:59c0:9f5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8481613F86E;
 Thu,  4 Nov 2021 21:36:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636058219;
 bh=lXajFPB0ZazXfU4tT8SlzAmeL0EJ/TblTPKexpZbhSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QornhzlZZzRVe3St7w8PmLg0Cq6L7voXbB6CPhG3Zkx1qFN4wftYKS+zpH1Gsj4CT
 eO5dMG85CaZI3G6FcKBYnhDK+XAxgmpe2rJ2dtDq4leJyDlLDnbE+bvUISYcLA9WZi
 H0nxz5LO19LVUZ9k16xizIWTN0OGL8b9wstZ3pmQp9H6vTQ9aAvnuUcL8AXXQXskac
 g4ZuCA7JrBIVxaaXIbtBCywvz7UcR/obmaVqH7opvjimqEDPCqqtvCNSvekMpBu5Ka
 6OcLW+6vKUIZxNhUW+5hL7sovIT9vUYxdhMzO7BUgXxwswmzBM0u+h1Xgju5MstidR
 2dNrXmvHQ5v6Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 Nov 2021 21:36:55 +0100
Date: Thu, 4 Nov 2021 21:36:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: stsp <stsp2@yandex.ru>
Message-ID: <20211104203655.GA2400@scaer>
References: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] generic code with i7 bootlin toolchain?
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

Stsp, All,

On 2021-11-03 22:52 +0300, stsp spake thusly:
> I configured buildroot for
> corei7 CPU to use the bootlin
> tool-chain. As expected, nothing
> worked, as I have the (very old)
> AMD CPU.
> Then I did the following:
> BR2_TARGET_OPTIMIZATION="-march=x86-64 -mtune=generic"

Do not use BR2_TARGET_OPTIMIZATION to set your CPU model. Instead,
select the proper entry in the target variant choice. Selecting the
proper variant will pass appropriate -march and -mcpu options.

If a toolchain is not available for the CPU you have (and which you
select in the choice I mentioned above), then that is on-purpose,
because that toolchain is not usable for that CPU; see below...

> make clean
> and full rebuild.
> After that I've got working
> kernel and the user-space
> starts booting, but still many
> user-space apps or libs crash
> with an illegal instruction exception.
> 
> I even checked that the toolchain-wrapper
> generated by buildroot, has these
> strings embedded, so my change
> certainly had some effect. But
> it was not enough.

This is not unsurprising. The toolchain contains the C lirbary, which
has been built with the optimisations for core-i7. So using that
toolchain for a CPU that lacks some features of a core-i7 will not work.

> So it looks like the
> BR2_TARGET_OPTIMIZATION
> is somehow applied not to all
> built packages? Why can that be?
> Is there any other way I can
> utilize bootlin tool-chain for some
> "generic" (non-SSE3/4) CPU?

You will not be able to use that toolchain for the Phenom. You will have
to build your own toolchain.

Note that you can build the toolchain once, and later re-use that as a
pre-built toolchain. See the manual on directions on how to do that:
    https://buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain

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
