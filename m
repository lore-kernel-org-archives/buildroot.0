Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70075C04AB8
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2153661388;
	Wed, 20 Sep 2023 17:34:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2153661388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZDQVc4XmYqn; Wed, 20 Sep 2023 17:34:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62A636136A;
	Wed, 20 Sep 2023 17:34:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62A636136A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B56B1BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E45C8404DA
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:34:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E45C8404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEcQa2EPkQGi for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:34:40 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04E1C40280
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E1C40280
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a117:66c:8b6b:25fb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 47A205FF95;
 Wed, 20 Sep 2023 19:34:35 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 19:34:35 +0200
Date: Wed, 20 Sep 2023 19:34:35 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230920173434.GE512384@scaer>
References: <20230920043113.36674-2-dalang@gmx.at>
 <20230920091208.62a8b2fb@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920091208.62a8b2fb@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695231278;
 bh=5Yc51ETCZmwNaxUtILaVZIQPkjGM8pL+nQHsmLfb6lI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KgnFpz1BTTztxY90GSfTgJKMkySb0s5wRrbZCz43xTmBtk6AEz+/ZyomFkDbJgXAU
 XaiRka2FQcoyGXAjnfKs3mSiT9AWrtYR7KgPuq0yqa9UEP4wRRu00ssnqTqz7lZBpd
 T8dbQufsMS7vEl8uOeuQcBDxFowyc0QZ/g2oyorueXIcCN/E8iNcWNcQNckjMuEFBc
 TqGGxvYJrF2UV6fo5camON4hOH7+DDAnTBKOgok7Yrh5e5zDokVC4DzqiYjoDPQ8ED
 sGCaeDUr9qsamSRvaM/SgZTbqefsq5vlCKEq7f0mdkaMMpxUrBKa0bhRiovz1YlYF8
 fPeM7RkRoqNxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KgnFpz1B
Subject: Re: [Buildroot] [PATCH v2] package/bind: drop CVE-2017-3139 from
 IGNORE_CVES
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
Cc: Daniel Lang <dalang@gmx.at>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Daniel, All,

On 2023-09-20 09:12 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Wed, 20 Sep 2023 06:31:12 +0200
> Daniel Lang <dalang@gmx.at> wrote:
> > As of 2021-05-14 CVE-2017-3139 is no longer listed as affecting bind, only RHEL.
> > Signed-off-by: Daniel Lang <dalang@gmx.at>
> This makes me think that the pkg-stats script should detect this: if a
> package has CVE-2023-12345 in its ignore list, but CVE-2023-12345 is
> not known to affect the package (in its current version) according to
> the NVD database, we should flag this.

Ideally, we would also like that it be done in check-package, but this
is going to be a bit more involved...

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
