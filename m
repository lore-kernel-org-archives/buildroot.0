Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A80C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 469E8408CF;
	Wed,  9 Feb 2022 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5DM5Gu3Tf3d; Wed,  9 Feb 2022 20:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88394408C8;
	Wed,  9 Feb 2022 20:55:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66D1D1BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F395814AB
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:55:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRZnSGUt-v4g for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:55:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79AC28149E
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:55:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d4bd:3395:fce0:5749])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B2070780313;
 Wed,  9 Feb 2022 21:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644440130;
 bh=brajqC7z4axM+MY8bE+Pp2WqfcI/1n1od9KV50BN7J4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t1gcKt8KrVYoXE5j70d/Woo844PmSV/tCisurRXKzIpxGOuoFzdF2ckOnW1cJaq+R
 TbsiRlrIJEhb6IQy5qJMADN1RefWHDG4MEMCoGfbFwQuwoIVVoRyUDBy4ZpN4P6vqN
 3Dm+jlmJC1OXdSN1QzPDZcPVGmWEI78K2uLrVcfkn25JizhHVBFxtXl4IPo0IvfaIf
 OUP3O7Z2alNoLEz4/sbYM12CxNV+x79nFgOMhTBZHtPItBfnr0e8DIKqt4ui1VVxx+
 UFbs56Drtln/nlE/mTLZ5k5yOZZx/xoeFNFFcuUbBcPKnY3o2879rD71wlGzFIdIOr
 uIeuETNoYsmPA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 09 Feb 2022 21:55:27 +0100
Date: Wed, 9 Feb 2022 21:55:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220209205527.GD2249818@scaer>
References: <cover.1644422916.git.yann.morin@orange.com>
 <9354_1644422930_6203E712_9354_383_11_2d5b77c2a90cf722e007a5bf3ed4227d2bd1fda6.1644422916.git.yann.morin@orange.com>
 <20220209205259.725e17c2@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209205259.725e17c2@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/5 v2] package/pkg-cargo: allow packages to
 define download environment
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
Cc: yann.morin@orange.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-02-09 20:52 +0100, Thomas Petazzoni via buildroot spake thusly:
> On Wed, 9 Feb 2022 17:08:43 +0100
> <yann.morin@orange.com> wrote:
> >  $(2)_DOWNLOAD_POST_PROCESS = cargo
> > -$(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
> > +$(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
> 
> But, but, then, how is:
> 
> PYTHON_CRYPTOGRAPHY_DL_ENV = \
>         BR_CARGO_MANIFEST_PATH=src/rust/Cargo.toml
> 
> currently working?

Because, its the name implies, it is a python-package, not a
cargo-package.

Yeah, I got puzzled too. ;-)

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
