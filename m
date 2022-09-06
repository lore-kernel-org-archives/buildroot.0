Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C3EC54EE9
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 10:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28B92416AC;
	Tue,  6 Sep 2022 10:42:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28B92416AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmUK3-n2vl7l; Tue,  6 Sep 2022 10:42:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D299541554;
	Tue,  6 Sep 2022 10:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D299541554
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36FE11BF25F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 10:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11FA6404B5
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 10:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11FA6404B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZj6ItYPuwn9 for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 10:42:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3D0A4049B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3D0A4049B
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 10:42:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E73E7B0058A;
 Tue,  6 Sep 2022 12:42:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 12:42:00 +0200
Date: Tue, 6 Sep 2022 12:42:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220906104200.GX1490660@scaer>
References: <20220904144233.2795176-1-romain.naour@gmail.com>
 <20220906102546.GW1490660@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906102546.GW1490660@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662460923;
 bh=xHYITOpfTeSmwzhcaofgGLKX/5R7Cg21wPEIjLqbODQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=klBecsA799aP0JnLwYGWl4oyh2+SI85mDpYRwKXhHsKISHyHskhGPH32jGBqMqi5O
 2zb2KjBveyDzAs+veQWml/vG9+hb4IvwlfNFiRXBaEmUrV8Szn640+stPIh15XxbxF
 GHGPUN5stVPXPKTLHYdSbseNe56hCjbGlwaDm7d5wB/4MEWFUpiykwUiJyE96yICcG
 IbZ/8Tji32WeRmW07ARQ/NIweeXPE9QbqATx9YiVyP7ply6WRyoC4v7IHUgR28rAY+
 WnRfV2l93YmCQJ5ldz0dJ5aFV9Gb57PYlAZlz+M7hR5A/NLlgviAKbZSJghKyYJzmv
 ci5zR3Dgq42Bw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=klBecsA7
Subject: Re: [Buildroot] [PATCH for-next] configs: remove uClibc config
 options
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

Romain, All,

On 2022-09-06 12:25 +0200, Yann E. MORIN spake thusly:
> +Joel for PPC issues, see below...

For real this time... Joel, could you see below, there's a question
about ppc64: we removed binutils 2.36 recently, so all defconfigs that
you changed in 193547fda467 are affected.

> On 2022-09-04 16:42 +0200, Romain Naour spake thusly:
 [--SNIP--]
> There are still a few build failures:
>     https://gitlab.com/ymorin/buildroot/-/jobs/2984744356
>     https://gitlab.com/ymorin/buildroot/-/jobs/2984744357
>     https://gitlab.com/ymorin/buildroot/-/jobs/2984744359
>     https://gitlab.com/ymorin/buildroot/-/jobs/2984744362
>     --> Missing: BR2_BINUTILS_VERSION_2_36_X=y
>     --> all on ppc64 or ppc64le
> The binutils one, however, is not due to the switch to glibc. We simply
> removed binutils 2.36.x earlier in August... What should we do? Joel,
> any idea?

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
