Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A378FC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FD180D5E;
	Wed,  1 May 2024 21:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ne1IJonFjD95; Wed,  1 May 2024 21:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 497AF80C53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 497AF80C53;
	Wed,  1 May 2024 21:23:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 475221BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3331740137
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBEHHWyIBXyL for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:23:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C687D4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C687D4012F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C687D4012F
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:23:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 222EB13F88E;
 Wed,  1 May 2024 23:23:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 23:23:43 +0200
Date: Wed, 1 May 2024 23:23:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ZjKy35uEme6yqi0z@landeda>
References: <cover.1714243078.git.yann.morin.1998@free.fr>
 <fac4dda319388b1d32d2f105ba29d47e68c41f4f.1714243078.git.yann.morin.1998@free.fr>
 <c346128b-2e45-4e71-8adc-6754e1629a5a@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c346128b-2e45-4e71-8adc-6754e1629a5a@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714598626;
 bh=I9DqTJE84LSbbqvZ+jwtXPyPm2XTWUiWHOrwwjHHpuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SbMF7FkLpMYwWG2kjd3COFC/UH4cuFkOA43u6vKPAnJCfRh0d0MU0pRbwWSTXGK7q
 K1MQu3MyZRVFHcGlDkmbBI0Y5lHvea3sovpSBbkzszVyRdW3hxYjnFO1ffMywDvdON
 j9xy6rk9E9j4Juvl39EQgAWCojZbi5KoDsgMTV0Wq3El8WBbAXfi+8t74pb6sY6Ep1
 EYVKP49YkOltMJYOsX90i04+h5591SzuUyme4WyYW/2xqFCC0drfHT3GuIZba7RUL1
 hsnCrDqSgCgr2zLRswtdnEcFvRwzf/Rv4K0J204wXf34B8leF4ivtgiyYVxWpXbvTs
 cOZV55yxjPpmQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SbMF7FkL
Subject: Re: [Buildroot] [PATCH 07/15 v2] support/testing: add test for
 export-subst support in git-download
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

Arnout, All,

On 2024-05-01 23:13 +0200, Arnout Vandecappelle spake thusly:
> On 27/04/2024 20:37, Yann E. MORIN wrote:
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >   .../package/export-subst/export-subst.hash        |   1 +
> >   .../git-hash/package/export-subst/export-subst.mk |  10 ++++++++++
> >   .../05/482df734b3715b849ef4a3147a9b1b1f8cca38     | Bin 0 -> 35 bytes
> >   .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26     | Bin 0 -> 197 bytes
> >   .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8     | Bin 0 -> 28 bytes
> >   .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0     | Bin 0 -> 112 bytes
> 
>  Since the git repo is included as binary, we can't see what is in there.

Yes, I did that way before the xz fiasco... :-/
See below.

[--SNIP--]
>  I think it would be worth to change is in order to test that no recursive
> expansion takes place. I.e., use this as the commit message:
> 
> Subject: [PATCH] file2: test export-subst
> 
> Test that strings like $Format:%H$ are expanded when the export-subst
> attribute is set on a file.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> 
> And in the file, put this:
> 
> $Format:%B$
> 
>  I haven't made this change though.

Worth a try. Can we do that in a follow-up patch?

>  (BTW, another nice change would be to generate the git repository on the
> fly from the test infrastructure, based on a series of patches that are
> git-am'ed and with GIT_COMMITTER_NAME, GIT_COMMITER_EMAIL and
> GIT_COMMITTER_DATE values set to fixed values.)

Yes, this is on my todo-list, and I have alsready testedt that indeed
that generates a reproducible git tree.

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
