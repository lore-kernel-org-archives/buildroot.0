Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD715C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 15:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12B194148A;
	Mon,  4 Jul 2022 15:51:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12B194148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i41glejNNV1a; Mon,  4 Jul 2022 15:51:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5053409FB;
	Mon,  4 Jul 2022 15:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5053409FB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D0851BF314
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14FED4000B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 15:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14FED4000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1q2e8gRzcDKU for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 15:51:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3348E40002
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3348E40002
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 15:51:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4999:e547:afac:f97])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id E7F985FF20;
 Mon,  4 Jul 2022 17:51:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 04 Jul 2022 17:51:26 +0200
Date: Mon, 4 Jul 2022 17:51:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20220704155126.GE2521@scaer>
References: <20220704094613.5636-1-yegorslists@googlemail.com>
 <20220704154536.GD2521@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220704154536.GD2521@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1656949891;
 bh=mCkZz2VdOyJ7OVdDJcX9Nprmx6eKyaOXZKLH/ocfmB8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mvCo+dBO5KXWbNyzsQDm/SaNpegstHHJP6GAszOysxGiaPWhz+iDJCGI5lIU2jVvR
 G1L0+RAhesw184JWA+DaKa16bB89xd7nTv8F/EBPRcP0RGepTX0fdMx+wmKmFHg9mJ
 4KdufRRNaDy+sTsQpno0VUzhAUuTQynaYhhD2Mx3DqgrlxMNuwIHtIMhQfdYxFZs/t
 nlBfYtsT5N2ieGyyZny1CYBOY315JoaT2c/pzVKDhcJcoHKWi2sOsFj/8a3VcYHNwH
 BtZt9wlQa274PlIo7QwIa5A3/fEcrrMT1WFFbDx3x8oY75Z5TAAWJa6KvUhM8E+3ci
 1apZZHAmB49Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mvCo+dBO
Subject: Re: [Buildroot] [PATCH v2] package/python-automat: add missing
 build-time dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2022-07-04 17:45 +0200, Yann E. MORIN spake thusly:
> On 2022-07-04 11:46 +0200, yegorslists--- via buildroot spake thusly:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> > python-automat needs host-python-typing-extensions.
> Isn't that similar to the patch about python-argon2-cffi-bindings?

Ah, somehow I did not receive your followup that mentions to ignore this
patch, so I guess it is fixed by the patch about python-setuptools-scm:
https://patchwork.ozlabs.org/project/buildroot/patch/20220704104820.5332-1-yegorslists@googlemail.com/

Thanks!

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
