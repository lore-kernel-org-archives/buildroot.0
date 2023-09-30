Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5288E77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F14240C16;
	Sat, 30 Sep 2023 13:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F14240C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1-SukxpnueK; Sat, 30 Sep 2023 13:21:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49A574151E;
	Sat, 30 Sep 2023 13:21:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49A574151E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E90FA1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDFAF4206C
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDFAF4206C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9P8R0ItkoVnL for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:21:53 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9057141EB7
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9057141EB7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B5AC1B0037C;
 Sat, 30 Sep 2023 15:21:45 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 15:21:45 +0200
Date: Sat, 30 Sep 2023 15:21:45 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Buildroot ML <buildroot@buildroot.org>
Message-ID: <20230930132145.GB2579@scaer>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696080110;
 bh=JGKLJueFzgdybcy77Zo1KmCcME2G9GKBhIT5qJj0EI0=;
 h=Date:From:To:Cc:Subject:From;
 b=qUIXdOiuJqWOJ2omLhjXH4LGZOhQQUCWkLQymxm8x/pYnY1CJ8uwUDUUzdmVqygnQ
 W9Y1JJvI7FLo/0WXoyLFq86o8QITSSCEnYAZueZeIbz1jwIIoPnQIhYy23mobbk/w2
 NaHGfmse4RT7kgX3MtVy0t45t7CUCpNttKPqO71WyMdYWmw0YrV5R8M1mjw5RevFuo
 Fpuer8FjUTOmPsA0p6G2BWTQSUAcsfBVre8LMaGfrdc9OUdAV3pZeC2brSGleTPbAn
 g7NminK0kxbq14/DY1zruO978/kQsZhaW4tlwI6Y+LxQ/FXmoIIINogpbbz0qGS7Pk
 tdrOE1xlYQgPw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qUIXdOiu
Subject: [Buildroot] New maintainer on board
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

Romain has been contributing to Buildroot for more a decade now, and he
has done quite a lot of work in various places in Buildroot, and has
been helping during the developpers days and hackathons.

He has agreed to join the maintainers team, and further his implication
in the project.

The most astute of you will have noticed that Romain has been quick to
take his new duties to heart, and already pushed significant changes to
the toolchain before I could finish this email! :-)

Welcome on board Romain, let the Force be with you!

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
