Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A6BECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 07:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4F6840BA5;
	Tue,  6 Sep 2022 07:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4F6840BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tp94pe9QbhiY; Tue,  6 Sep 2022 07:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3DC940BB4;
	Tue,  6 Sep 2022 07:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3DC940BB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82E351BF30F
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 07:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DD5182ADD
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 07:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD5182ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJ5hf-UJ61Ok for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 07:22:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B44E82ACA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B44E82ACA
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 07:22:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EB56AB0051B;
 Tue,  6 Sep 2022 09:21:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 09:21:58 +0200
Date: Tue, 6 Sep 2022 09:21:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220906072158.GM1490660@scaer>
References: <20220905202002.4183680-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220905202002.4183680-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662448921;
 bh=h/64tPNCMzjdtRM8a/c7AK2GyGoHpYQ6W1vq7fOnfUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sMdh2Q9NzrRjR7FDGfJWBmEAFnx7KTMwOMW6qOHWwfhXqJTXvqcEMwxe0sgOKKrQw
 aanJW/9lMgPKFkpSgwElZbOClfdNG0KnWdaVUMhsBDqUm2U6j5I/I3rkSCr0p8WgJI
 cgD2Z8lEZgX2vKIHQlEQ3huVe+7Yl3aH8lxwkLuY2zLK/ecIabJNHvlIq8UF0emPFf
 Xzrl4/g/uSLRGlSIKEnXIlH7B80upTXKhUrF8rhRfO3EaaqTNVF6dE7hkXAbP34dBs
 vqzghBwlxuBwk+zKlDtz5649f9XtjMMFHRWuXhdH5EvcuqCMd1pLJmigFzPE+Lllsb
 lA1zcBC+CUXqw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sMdh2Q9N
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: unexport TARGET env variable
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

James, All,

On 2022-09-05 14:20 -0600, James Hilliard spake thusly:
> If set this can may break package builds in some cases such as the

So, this is very probabilistic: 'can' and 'may'! ;-)

> host-icu build.

Can you provide an actual error message and an explanation on how that
actually fails?

I've looked at the icu source code, and all I could see are plain
assignments and references to TARGET. Variables assigned in a Makefile
are supposed to take precedence to variables from the environment, so I
am not sure I can see how that can actually fail...

See for example commits which describes the actual reasons it fails:
    20ca008d0266 unexport TERMINFO to correct ncurses behavior
    2e32330c4a49 Makefile: unexport O
    d3910057c6ae Makefile: unexport 'DEVICE_TREE' environment variable
    6cff741ebaf7 package/ccache: do not force colored diagnostics

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index bd0b906cde..a82a22a276 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -427,6 +427,7 @@ unexport GCC_COLORS
>  unexport PLATFORM
>  unexport OS
>  unexport DEVICE_TREE
> +unexport TARGET
>  
>  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
