Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF9C433FE
	for <buildroot@archiver.kernel.org>; Fri, 21 Oct 2022 16:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF2F9414F8;
	Fri, 21 Oct 2022 16:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2F9414F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O0G6K0J1RfTo; Fri, 21 Oct 2022 16:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFCC24097F;
	Fri, 21 Oct 2022 16:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFCC24097F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AA351BF27C
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 16:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65A36842EE
 for <buildroot@lists.busybox.net>; Fri, 21 Oct 2022 16:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65A36842EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weqLbN-mk41J for <buildroot@lists.busybox.net>;
 Fri, 21 Oct 2022 16:31:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08EE7842A6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08EE7842A6
 for <buildroot@buildroot.org>; Fri, 21 Oct 2022 16:31:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e722:2033:afe6:a970])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id B99A95FFB6;
 Fri, 21 Oct 2022 18:31:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Oct 2022 18:31:33 +0200
Date: Fri, 21 Oct 2022 18:31:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Richter Simon <simon.richter@ptwdosimetry.com>
Message-ID: <20221021163133.GO2503@scaer>
References: <20221019161513.994988-1-simon.richter@ptwdosimetry.com>
 <20221019205236.GG3666@scaer>
 <AM0PR09MB3411C21E0EF14DF3040DCFD38B2A9@AM0PR09MB3411.eurprd09.prod.outlook.com>
 <20221020202557.GA2992523@scaer>
 <AM0PR09MB34116058D25F14D6FEE90F058B2D9@AM0PR09MB3411.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AM0PR09MB34116058D25F14D6FEE90F058B2D9@AM0PR09MB3411.eurprd09.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666369896;
 bh=AFFquGcCd/2+c42mILPOKPzwouR1aXvXdqvNNb5EQmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nYmDeSuzb5aal+K/ERxTqwl4kXeO16nM0k7wzl3H8Ev52v6C0wjvcHfeIG73sCWmJ
 nNk6PxmtG6Pl58KOWv+b0f6bBTQPW/8qqENIE1zdxcuNoCMMU1Nqg9aa2wabYkPMZX
 7KtVoHgdIdM31SauLcxwpq5EznBvgSGzpSmRjdSIQsNOz9Ek/fFZUj/qXtLuzv7wgM
 2mpG9G3PtNS10W5RdBOtGlU7VVy45xxIdI0+lpcYJ3U+Jm2bg3W0nI4Dga+8DXNKz5
 A30ISAli0YL7GTs9sbQ5tOugc/dHqmzhtYSCzyr/J3ndrP2pC7EGAME5h76e3cOKAt
 g17pmT524BhIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nYmDeSuz
Subject: Re: [Buildroot] [PATCH 1/1] support/download/cargo-post-process:
 use cargo output for vendor config
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Simon, All,

On 2022-10-21 12:10 +0000, Richter Simon spake thusly:
> Am 20.10.22 um 22:25 schrieb Yann E. MORIN:
> > I see all the above use git repositories directly, so I suspect this is
> > going to cause explicit git-clone + build (that's OK). However, I was
> > also wondering if one could have a "registry" like crates.io, either
> > internal to a company, or another public resource elsewhere, and how
> > that would work...
> 
> It is possible to use an own registry, yes, but i did not use that yet.

OK, that's fine!

> > Yes, I was wondering if there was a publicly visible package that we
> > could cary in Buildroot, so that we know the feature would be regularly
> > exercised. You pointed to conduit: it wouldbe good to have it packaged
> > in Buildrooot.
> I can try to do that. But that should be done in a different patch i think?

Yes, as a followup patch, that way you provide the new feature, and you
show how it is used. And we get a new interesting package! :-)

> > Please, also note that this has the potential to generate different
> > hashes, so please check existing cargo packages to see what breaks.
> I did, and with my last suggestion (using cargo and tee) those packages 
> broke. The problem is that `cargo vendor` outputs a preceding newline
> that must be removed.
> I came up with this:
> 
>     cargo vendor \
>         --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
>         --locked VENDOR \
>     | tail --lines=+2 | tee .cargo/config

Now, one last issue: if the 'cargo' call fails, the script won't fail,
because cargo is part of a pipe.

The script is already "set -e", but we also need "set -o pipefail".

> This removes the first (and empty) line. 
> 
> With this, all packages i checked were fine.

OK, so don't forget to mention that in your new commit log.

Also, the rationale that we can change it, is that it produces the exact
same output that we do, and if for some package it would not generate
the same output, that package was not working anyway because it was
missing parts of its vendored sources anyway. So, that can't regress.

> These were:
>  - bat
>  - dust
>  - hyperfine
>  - ripgrep
>  - tealdeer
>  - python-rtoml
>  - python-orjson
>  - python-cryptography
>  - host-python-maturin
> 
> I hope i've got all.

You missed: host-sentry-cli (is a host-cargo-package).

> If you agree so far, I would send the new version of the patch.

Yes, with all we discussed, it looks in good way.

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
