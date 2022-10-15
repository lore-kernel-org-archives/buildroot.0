Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA2AC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 21:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA0AF408BB;
	Sat, 15 Oct 2022 21:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0AF408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eM0pZ_-sTGQA; Sat, 15 Oct 2022 21:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECCF040483;
	Sat, 15 Oct 2022 21:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCF040483
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 906881BF368
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BC9081882
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 21:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BC9081882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L_t7wD4OPgYb for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 21:27:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3FF58187F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3FF58187F
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 21:27:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a23d:25f5:317d:1e3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 48FE013F87C;
 Sat, 15 Oct 2022 23:27:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Oct 2022 23:27:46 +0200
Date: Sat, 15 Oct 2022 23:27:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yann.morin@orange.com
Message-ID: <20221015212746.GA3666@scaer>
References: <30214_1656937450_62C2DBEA_30214_425_1_ebc1b4a9ba79f014485eb6c21d96956d9ebc3f5d.1656937448.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30214_1656937450_62C2DBEA_30214_425_1_ebc1b4a9ba79f014485eb6c21d96956d9ebc3f5d.1656937448.git.yann.morin@orange.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665869272;
 bh=FcZUVvTZCXvjqyDk6dY9bugQ8ebSlLaQ5RGLDKQ9CSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7a+oQbOjL3uaQ90QjoV4PK+RVPzkESE2Vr9TZBL0d+mLoh7abYrt1vVTaNZWmcOr
 2SV1mSu0mPI7rrbQUvV34npBxUzISpXhINpR6o3C0vsD/XVe4e2gZu1PxShNbVqd9+
 8xmhI2qeDNzpbFqLdYlSKdlaEDdgkuEMM0Jk2Pd+Ojb47BEEPciS7gIsiPt8TCtg5C
 fDqucJER2rxvvPeGRngy6wPKSkZiGykgXnJcc/X8/twm4zvoUGtvQ+xo5EVp28DA20
 9csC9VfFKp425p4pch3KDyzxKzyIRIYfdEOdrqHOJFb2T8Af859DWe+hqCRfTsCfkr
 dIJZ0R+lAuynA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p7a+oQbO
Subject: Re: [Buildroot] [PATCH] package/skeleton-systemd: systemd-ify /var
 on a read-only rootfs
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
Cc: Norbert Lange <nolange79@gmail.com>,
 =?utf-8?B?SmXMgXJlzIFteQ==?= Rosen <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yann, All,

On 2022-07-04 14:24 +0200, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
[--SNIP--]
> Even though we could have split the two changes in two patches, one for
> moving the tmpfiles unit away from /etc, and one for adding a systemd
> mount unit, the two really make sense together as part of having an
> empty /etc, so we made that a single change.

Yet, you should have known it would been a bit more easier to review the
two as separate changes, so this is eaxactly what I did in that series:
    https://lore.kernel.org/buildroot/cover.1665868987.git.yann.morin.1998@free.fr/T/#mea2407e6384ddf35d618c720ed9c6bf8462fcfd2

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
