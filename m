Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0CEECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 19:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B486100D;
	Tue, 30 Aug 2022 19:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B486100D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zi6n5xWPYo0Z; Tue, 30 Aug 2022 19:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B955361004;
	Tue, 30 Aug 2022 19:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B955361004
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AEEAE1BF57F
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9727940BD5
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 19:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9727940BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNdM6UvQ6yzj for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 19:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC3A740BCA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC3A740BCA
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 19:22:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:677e:d766:490c:af47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E2E36B00721;
 Tue, 30 Aug 2022 21:22:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 30 Aug 2022 21:22:42 +0200
Date: Tue, 30 Aug 2022 21:22:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220830192242.GD68979@scaer>
References: <20220727083753.935654-1-romain.naour@smile.fr>
 <CADvTj4pSAe_nAr993-GpCGUdsz2RcQa8n+ECme3tvhQwne6s5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pSAe_nAr993-GpCGUdsz2RcQa8n+ECme3tvhQwne6s5Q@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661887366;
 bh=f9K+u0Rcr5+qyWiwA3J98biA80O2MjKkphhGTOZZHq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IJMYdbVHQzgaoXSM6r68/0Yu9spkfuuLFqpuvjk/TnA2xSvWHz+PLbqdGa2nWwm/K
 utlmnetwD49t9eIVAk5znSe81cfwW2arnP+wFRap20nP7LV+EsrHNRQaXFjdc6xHkI
 uOrcbCVI30/SQImJntOXwYl26o/F+TeEdKPAn/6tsoOepRAw1LSJnLnO4Mqu328SMe
 QWbKji9A7DPVoKIAH261hpnfor67Ml99ZEdWwHtmU12grfbdpPDeU84vTDlu9J3IaV
 IE+bU24I3XkZRpELbbCyeAyNn4j94YL8Bp39vuszyuW6PEGs12o6XL/Dtk4XQRND5N
 i/pG8uJxhucyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IJMYdbVH
Subject: Re: [Buildroot] [PATCHv3] package/rustc: needs C++ compiler with
 musl based toolchain
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-07-28 15:07 -0600, James Hilliard spake thusly:
> On Wed, Jul 27, 2022 at 2:38 AM Romain Naour <romain.naour@smile.fr> wrote:
> > While building host-rust with a musl based toolchain without C++ compiler,
> > the build fail since libunwind bundled in rust sources needs a C++ compiler.
> >
> > cargo:warning=i686-buildroot-linux-musl-gcc.br_real: error: [...]/host-rust-1.62.0/src/llvm-project/libunwind/src/Unwind-EHABI.cpp: C++ compiler not installed on this system
> AFAIU rust should be able to use normal(ie non-llvm) libunwind which doesn't
> require C++:
> https://github.com/buildroot/buildroot/blob/master/package/libunwind/libunwind.mk

I've applied Romain's patch as a stop-gap measure, until someone comes
up with a better solution, like implementing your proposal of using an
unbundled libunwind.

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
