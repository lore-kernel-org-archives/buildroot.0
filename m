Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C53CDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 18:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C764408C4;
	Sun, 22 Oct 2023 18:10:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C764408C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BzNHNZZ5fDAy; Sun, 22 Oct 2023 18:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85638408BF;
	Sun, 22 Oct 2023 18:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85638408BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4251A1BF40F
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B61B408BF
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 18:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B61B408BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPEwmekb5gAe for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 18:10:14 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C8DF8408BE
 for <buildroot@uclibc.org>; Sun, 22 Oct 2023 18:10:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8DF8408BE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:9668:e224:b510:3431])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7B13DB0056A;
 Sun, 22 Oct 2023 20:10:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 22 Oct 2023 20:10:08 +0200
Date: Sun, 22 Oct 2023 20:10:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231022181008.GR2607@scaer>
References: <20231022154133.1619344-1-bernd@kuhls.net>
 <20231022163659.GQ2607__65.0460877054115$1697992660$gmane$org@scaer>
 <pan$a8dae$c263fa31$c5524ffb$9910d64@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$a8dae$c263fa31$c5524ffb$9910d64@ID-313208.user.individual.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697998210;
 bh=ybK2SmThpbPRZbehZFa/oNfH6efcdgJF9yG4HYW2YFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PqLdQNitunSoW/yxU/Lmd7PH5V7Rn2ia6Vln6s6gXr4q47gMxkYZ6j+6BmQATq6Jq
 etjhr9geZLepiDZcJCEm947ocVou6c8mFRXOBPi5/Lv60AuxSBB1SY+4Lr4pgT4YIo
 lGPtfQ5VQH/2zFaYNo0GAoY4K5veqpNR5ae3F2tpjb0vv33Ej6uYakEOs1ugq9taP4
 Nc2wcEOle7bGkvH0NYWw4tD4qbJqzrGKdwNPUVmYio/QUG1ld3QY4sJGFIEdmk5ZXv
 yB7v4CpW42kWVlF9ppWLtzIxTsJCeuSak12+Ivn431Czsyd6CKj6eL5L0SdaKfjeBq
 dUxRunHRIKxKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PqLdQNit
Subject: Re: [Buildroot] [PATCH v2 1/1] package/elfutils: enable on musl
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

On 2023-10-22 19:03 +0200, Bernd Kuhls spake thusly:
> Am Sun, 22 Oct 2023 18:36:59 +0200 schrieb Yann E. MORIN:
> > Bernd, could you check if upstream has changed something around the
> > handling of fts?
> maybe this commit?
> https://sourceware.org/git/?
> p=elfutils.git;a=commitdiff;h=da855fc9cd415c288bfcb9de1f3d5eb329de0557

It looks like it has all the keywords, yes. :-)

Will you send a patch to drop the explicit -lfts in Buildroot?

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
