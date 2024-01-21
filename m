Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF65C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 09:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2930482377;
	Sun, 21 Jan 2024 09:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2930482377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNGkMdsAPFyP; Sun, 21 Jan 2024 09:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 755F782125;
	Sun, 21 Jan 2024 09:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 755F782125
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91D211BF4E7
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 09:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AAF060E53
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 09:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AAF060E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m7f2a3K-rMT6 for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 09:17:22 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8342160E32
 for <buildroot@uclibc.org>; Sun, 21 Jan 2024 09:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8342160E32
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 650A713F88F;
 Sun, 21 Jan 2024 10:17:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 10:17:18 +0100
Date: Sun, 21 Jan 2024 10:17:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZazhHre673cygtkX@landeda>
References: <20240117210756.265708-1-ju.o__23021.2395939574$1705525733$gmane$org@free.fr>
 <pan$7216a$db0a3b9b$57a2a7c1$969e35b@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$7216a$db0a3b9b$57a2a7c1$969e35b@ID-313208.user.individual.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705828640;
 bh=kvRBi5sp7qNLLfrU7b32gnRwF3oTgWFIVrdD/LjJd3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WItfDqPl19qcovZfMCLSo4sCbqLLQ3dWaqKsbm8RY36/68XC1Yso42gfZ4w4co5GX
 7J/StK8a/FxXHfMZZMwS6kxqkQjRcsZrEhOi3NXYJjUyoT+dbPKZk9fbjWgBHJxTQf
 uTvXb2ymVOgUMGAmYjeOGoweuc2AdBXvrutTuAzzcyIVGaijyY/vSMBiwBOVoxC0RN
 l1cPRXviG4xQZ/ed4T60MJ+ZQDeyWiFWfgVrJH65a1aJaOrhP2IobFqqi7pH09lw9l
 CtiZjTMfTeH127JOSpgQY2pICSyWqGpV0jgx1JzvMBSRhXk2naMfXfoIGFmzVO8TaR
 CM3nvYYiNtqHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WItfDqPl
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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

On 2024-01-20 16:30 +0100, Bernd Kuhls spake thusly:
> Am Wed, 17 Jan 2024 22:07:56 +0100 schrieb Julien Olivain:
> 
> > Since commit 2a8065e "package/postgresql: bump version to 16.1", the
> > postgresql service fail to start at runtime with an error:
> > 
> >     FATAL:  could not load library
> >     "/usr/lib/postgresql/dict_snowball.so":
> >     /usr/lib/postgresql/dict_snowball.so: undefined symbol:
> >     CurrentMemoryContext
> 
> Tested-by: Bernd Kuhls <bernd@kuhls.net>
> [run-time tested, the dict_snowball.so bug is now fixed]

Thanks for the feedback. However, as this is was not threaded as a reply
to the original mail, patchwork was not able to associate your Tested-by
to the conrresponding patch, and thus it was not recorded (I only
noticed your mail when searching the mail from Julien to reply to it).

Sorry for that. Next time, be sure to reply to the mail. Thanks!

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
