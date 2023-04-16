Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE9DC77B61
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 20:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CFDA418F1;
	Sun, 16 Apr 2023 20:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CFDA418F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jz6aRBLXLMeB; Sun, 16 Apr 2023 20:10:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FF49418C2;
	Sun, 16 Apr 2023 20:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FF49418C2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A527D1BF35A
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B9C9403FB
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B9C9403FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4mfG7fU-cId for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 20:10:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D5740112
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95D5740112
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 20:10:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B87CB5FF33;
 Sun, 16 Apr 2023 22:10:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 22:10:07 +0200
Date: Sun, 16 Apr 2023 22:10:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230416201007.GH2819@scaer>
References: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920064550.520645-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681675809;
 bh=NN9n1cqnck7pAACwI5vgfjbk+Znxnxu8rRm6jiuRpZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FxZiKAyIJCoI+I44hZQLQeILOlx8CoZ9yPKXW9yfFOq0a2UWxnriwTMaUC6G900hP
 gAkohgl5PVy9eelMVp4HXKhajJrw77F7ZYebnE5kjbyn2InQet47ZXIlVhOPRrUXFj
 AXQpdDGhAksKvvqq4++/HEbHZoLcIq0h3QgbdeBOK8c9e/xhWa6orEaOVTSV+PgfhW
 /PKIhRAG8SgjjAEWKql/OofTMvC/iR3rLatYYqF97lKtR0nAlibr59/xj4U5BBdYuM
 DgTkZ2zjQaCJ8++b+XjwdS32BaaJG/jRTaKqL5nuZ0ZKDBpu5ku1AXdxetjcvHfO1V
 SpHfe7UHd5vTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FxZiKAyI
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-libs: add new
 check on host binaries/libs
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

Thomas, All,

On 2022-09-20 08:45 +0200, Thomas Petazzoni spake thusly:
> One frequent issue in Buildroot is that when building host libraries
> or applications, the build system of the package detects some
> libraries provided by the system, and happily links to them, without
> Buildroot knowing. Sometimes this doesn't cause any problem, but
> sometimes this causes issues, and we're regularly eliminating such
> mis-detection by forcing those packages to not detect the system
> libraries that have not been built by Buildroot.
> 
> The new script check-host-libs added in this commit, which is executed
> during the host-finalize step at the end of the build is an attempt at
> detecting at least some of these situations.
[--SNIP--]

There was some feedback on that script: it is way too slow, but it can
be made much faster with some shell tricks.

So, I've marked it as changes-requested in patchwork, now.

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
