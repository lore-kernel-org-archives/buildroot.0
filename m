Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A72CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 19:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC0840C4A;
	Wed, 23 Mar 2022 19:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6RFS4Blc98Of; Wed, 23 Mar 2022 19:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B09C401B7;
	Wed, 23 Mar 2022 19:13:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60D6A1BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 19:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E1A8401B7
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 19:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hcw-_OqvYqwW for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 19:13:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC35E400C4
 for <buildroot@uclibc.org>; Wed, 23 Mar 2022 19:13:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9911:ddfc:be7c:3131])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A19F919F574;
 Wed, 23 Mar 2022 20:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648062829;
 bh=Z1tv8ULjUW8TsALEKwXIwcCGoIr30ohhAf/651inhdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7zT3H8gRN40f2/ZM7eyvzN1F0Spf0q8gxhhXP6EFr3No6nzUbsWq3RFzdz3L0fZf
 MBwnASI+0pqJ7zMC3HP5l4LBEGNFoH2r6xoRYhuanFpoQT+Elc3FFgH4DNdJgRD5yz
 IIYSp7bB7JvclmFdk2ZUbladuyvosDgasDBU2sqgPXhOHkKpgSzRcAKCZ33BXIZZJH
 O4rpBRZpg6ByipidE7PawA8UtUBN8074QqDCocb2gmYP+wTvT0sTHIa+O9UYf7FJNb
 hB4pJHOTOay9Z85R+0rr7Bz0aNnEeXzEQy06GazXZ+GDSN/k4JlpFr0pPhfSNznKVW
 3CSLDDfA8yP6w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 20:13:47 +0100
Date: Wed, 23 Mar 2022 20:13:47 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220323191347.GA3631434@scaer>
References: <20220320082201.6612060B1F__26257.1082961344$1647764544$gmane$org@smtp3.osuosl.org>
 <pan$6077$b8209ef6$6f8a81d5$e9ac7c56@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$6077$b8209ef6$6f8a81d5$e9ac7c56@ID-313208.user.individual.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-03-19
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

Bernd, All,

On 2022-03-23 19:06 +0100, Bernd Kuhls spake thusly:
> Am Sun, 20 Mar 2022 08:21:56 -0000 schrieb Thomas Petazzoni via buildroot:
> > Autobuild statistics for 2022-03-19
> it seems that there could be a problem with mails sent by the autobuilders.
> Since the beginning of March many days went by without the daily results:
> https://lore.kernel.org/buildroot/?q=Daily+results

Yes, we are aware of the issue. The script is more often than not killed
by OOM...

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
