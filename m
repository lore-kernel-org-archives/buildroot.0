Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55E3C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 16:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 380624040C;
	Mon, 17 Jan 2022 16:06:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F1RWl12zPGLQ; Mon, 17 Jan 2022 16:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24CAF405A4;
	Mon, 17 Jan 2022 16:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39E671BF359
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 16:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28B008131B
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 16:06:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmVCDTQtryid for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 16:06:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 971B9812F4
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 16:06:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c4f:55a9:fb74:ca3a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7347413F8C9;
 Mon, 17 Jan 2022 17:06:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642435565;
 bh=S3gbBJU5hODebVwe2oLHO+09+43uGAxofBqybt1TaVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZK5sVJSkv28nkcZg0FTpqWvh5TcYWBxPvWkZ6Y6y4jQoACf79MPPEAKBVcwcQwR9u
 1R5v5kbWhKJLeJsevOFhlklqueFAWpR8rh+ZCtJQIyhUHYRBtLtR9ww5YCcjXu8y0/
 WtNpzIbyBC2izmMluC61DDDhEwuwRWYf+MVKCNQv4uAD0jPN0/dUsSEXorejwOFb7b
 QRBpi4AHG3rlpsYdZDaIaYoCVKX3Y0DBzdMSKj0xGIw2O/uMMhmYcH12mOuojj9RR3
 a4Cy9SATZf4u8YmHQnaAYTrLTnSrrg+LbiPYdUTPRPg9D3tkliDtBwjSvTOGD4UoKs
 dtP/8+tYOdrUQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Jan 2022 17:06:02 +0100
Date: Mon, 17 Jan 2022 17:06:02 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Danilo Bargen <mail@dbrgn.ch>
Message-ID: <20220117160602.GF2313964@scaer>
References: <20220116230404.71f68dbb@c3po>
 <CADvTj4qFSfOYQ+AkOsQyGgNbuRROEmgx1giiKGaJn2jRVyhsOw@mail.gmail.com>
 <20220116233758.59918490@c3po>
 <CADvTj4pjgwNt4ZnFB2ZmDeZP0nGaGPveqAapCTC+TOx3SEoBrw@mail.gmail.com>
 <20220117101705.GB2313964@scaer>
 <1ae38367-2e5c-20c7-0ba1-ebaff05cf8e7@dbrgn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ae38367-2e5c-20c7-0ba1-ebaff05cf8e7@dbrgn.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Hash verification from GitHub
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Danilo, All,

On 2022-01-17 11:24 +0100, Danilo Bargen spake thusly:
> On 1/17/22 11:17, Yann E. MORIN wrote:
> >I.e. it means that we prefer using tarballs as-is from their upstreams,
> >when they are vendored; we only vendor packages which upstreams have
> >not.
> That makes sense! I am the maintainer of tealdeer, and I'll provide a
> vendored source tarball for the next release. (I've heard of "cargo vendor"
> before, but I haven't used it so far.)

Note that vendoring is definitely not a requirement we impose on
upstreams.

We do prefer when the vendoring has been done by upstream, because it
means (at least we hope it does!) that upstream has validated the fully
vendored package, and thus we have some confidence everything works as
expected.

It also avoids the case where an uppstreams for a dependency mucks
around with their releases: we already noticed the case where an
upstream for a dependency did a re-tag of their release, thus breaking
the vendoring of the dependees because it would no longer match the
expected hashes in the cargo.toml (or go.mod?). Also (but that's mostly
for go, IIRC), we also already noticed that some of the points of
distribution (goproxies?) are serving some incorrect archives, thus
causing download issues...

However, if an upstream decides to not vendor (for whatever reason),
then this is perfectly fine for Buildroot; this is exactly why the cargo
infra has been made to support doing the vendoring.

All in all, it is better that upstream vendors their releases, because
it avoids any of the pitfals I mention above.

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
