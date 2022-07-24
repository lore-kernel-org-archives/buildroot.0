Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75370C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 16:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 010D340C55;
	Sun, 24 Jul 2022 16:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 010D340C55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gGINrs7iG0BT; Sun, 24 Jul 2022 16:08:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B8A940C4F;
	Sun, 24 Jul 2022 16:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B8A940C4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA5B51BF479
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9299D40C4F
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 16:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9299D40C4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_Q4LU7gUEhW for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 16:08:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A37E40585
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A37E40585
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 16:08:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2A3CB13F88A;
 Sun, 24 Jul 2022 18:08:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 18:08:33 +0200
Date: Sun, 24 Jul 2022 18:08:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: moritz@h6t.eu
Message-ID: <20220724160833.GA2641@scaer>
References: <20220217230638.98748-1-moritz@h6t.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217230638.98748-1-moritz@h6t.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658678916;
 bh=Z3pgBvWEQR/m53FwGwL3LGXLyYvmRHDEZjbfoHPaWKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gd6IOEkRAh2vYUpTgjA6GwglMWMd1imV/Zv+Hi7DGSCta5Qg1J4cwb1o3L31j8x5I
 XJlikGqibux3Ic05eDhMp0Z8rC8QTdMzCvxlBOnKpcvH6LV+4v4tibzECbfLSZJd7z
 Crs19LE8Fhsne/vJTVOn1utxN6PCCYg5hVe9vjGuWTgVxpjXEKoeIOTbJF1wGtGNDQ
 0gLEkE66Lr3igE3NmEMWFJkyMjfHZ2qT+B9lY+g4opNVjMlK/stVPbVMRsRjeDaKuj
 tlgs78o0p4575hG+2tj4jaXUk1JRIITDxQh6VoI4JiOxRzhAzLPrII9kGCwudF0MfG
 nR+M3dhtMOLjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gd6IOEkR
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix building
 cargo packages on 32bit arm
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

Moritz, All,

On 2022-02-18 00:06 +0100, Moritz Bitsch via buildroot spake thusly:
> From: Moritz Bitsch <moritz@h6t.eu>
> 
> there are duplicated symbols between rustc and gcc. Specifying
> --allow-multiple-definition to the linker as workaround until
> rustc is fixed.
> 
> rust-lang issue: https://github.com/rust-lang/compiler-builtins/issues/420

This is supposedly fixed upstream:
    https://github.com/rust-lang/compiler-builtins/issues/420

which leads to:
    https://github.com/rust-lang/compiler-builtins/issues/412

which leads to:
    https://github.com/rust-lang/compiler-builtins/pull/452

and:
    https://github.com/rust-lang/rust/pull/93696

which is now merged.

We recently bumped to using rust 1.62.0.

Do you think that this workaround can now be dropped?

Regards,
Yann E. MORIN.

> Fixes: http://autobuild.buildroot.net/results/53f/53f5598b8e520caaa135fb4923c09da382dab329
> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> ---
>  package/pkg-cargo.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index e74a8358bc..71d695d926 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -46,6 +46,14 @@ PKG_CARGO_ENV = \
>  	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
>  	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
>  
> +#
> +# This is a workaround for https://github.com/rust-lang/compiler-builtins/issues/420
> +# and should be removed when fixed upstream
> +#
> +ifeq ($(NORMALIZED_ARCH),arm)
> +	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> +endif
> +
>  HOST_PKG_CARGO_ENV = \
>  	$(PKG_COMMON_CARGO_ENV)
>  
> -- 
> 2.35.1
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
