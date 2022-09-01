Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916F7ECAAD1
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 18:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E1060BAF;
	Thu,  1 Sep 2022 18:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23E1060BAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TkldB7aAOYYP; Thu,  1 Sep 2022 18:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41C8060B67;
	Thu,  1 Sep 2022 18:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41C8060B67
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4EE1BF31B
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 18:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A94403A2
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 18:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A94403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0keKMvBxk6px for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 18:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A8E40134
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7A8E40134
 for <buildroot@uclibc.org>; Thu,  1 Sep 2022 18:58:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e679:ffcd:1bfc:6eba])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B1D4C13FA43;
 Thu,  1 Sep 2022 20:58:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 01 Sep 2022 20:58:25 +0200
Date: Thu, 1 Sep 2022 20:58:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Grant Edwards <grant.b.edwards@gmail.com>
Message-ID: <20220901185825.GL68979@scaer>
References: <tequdh$10ie$1@ciao.gmane.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tequdh$10ie$1@ciao.gmane.io>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662058708;
 bh=eKemwawaalLyaa93QdQZBPvysoQ360iUxAzKmeQpif8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CQtVcff29tncPFr2FhWVAQJeLn2uPqh8N+OaZZN4Sy/YzTzIE92FZIWQ1uqJ+hhE5
 KQwSIlYYQCn2/F3i8Rd2OYmWAF7wXjj42L0+5FMD9Scj54VmK2WUt8V6Ddnf7BRRtI
 pSUSkH3fLnGm1OjnPd8TQ2c7U6JJOh4vAyQ8OhsMYaaClnfMVl7AwVKurBYGcQaVOt
 Y4TpYopevf1X5OXQSfRW+HWmwoNP1GUrHG8kvc7uBahgPgnqiHcVRhjMLZc7UTaqKM
 VO8YxoaWLbp8pDm9FQi+gQS7Q3iK5UIp4p3hnuBdHlIYzxN8t8RvaMfr0bYPcMOutz
 JoaVWG/qWuXkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CQtVcff2
Subject: Re: [Buildroot] sftp-server for use with dropbear?
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Grant, All,

On 2022-09-01 18:41 -0000, Grant Edwards spake thusly:
> Is there any source for an sftp-server for use with dropbear other
> than openssh?

What about gesftpserver, that has been present since Buildroot 2013.02?

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
