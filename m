Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C320C4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE5D1417BE;
	Wed, 19 Oct 2022 21:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE5D1417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CeCvXvLf2kcx; Wed, 19 Oct 2022 21:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C135417AC;
	Wed, 19 Oct 2022 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C135417AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 726D31BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CF07417BC
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CF07417BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MogRbnvWJygd for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 729AE4177D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 729AE4177D
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:05:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:97d2:b3b8:72e7:abf5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 319B7780333;
 Wed, 19 Oct 2022 23:05:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Oct 2022 23:05:19 +0200
Date: Wed, 19 Oct 2022 23:05:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: moritz@h6t.eu
Message-ID: <20221019210519.GH3666@scaer>
References: <20221019085353.8864-1-moritz@h6t.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019085353.8864-1-moritz@h6t.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1666213522;
 bh=Zd9ghEgTUcCQGj1PPMATV/jnRDCVgYC5rjqjzLQMFQA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOVAF88fzSrDwB1bhAUM5LZPml9IEIRpzIsuC+d8V7eZlQwYVA4dOfGSl31EBYUTC
 CHYy0RxLD7niti4i/W3w7OGFXZDWTENyE87AJd6l7iET5mb2xROB5Z7/F6liMl4AcP
 /YqpDEVcxdNnYdfUvJt28SMcpdwNYFnxMkwGJ4XvA2KYV6Ft+3iaTdXRdkdAv3Jjlb
 or+zbnIU2KMSQL9elPdpDkUUKRd7AQtZLQx4F4zzmxsRxabqC5CKTlgDiCj43fO3Ua
 f1u+SI8ta8aRYNKcvVusnxRIMEM8Sr+0Z4DQ5+5z8uEbztylQSvrlqgHdLtjDrsp8P
 zOwZrrsMNbCAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DOVAF88f
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix handling of
 debug and runtime debug builds
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

On 2022-10-19 10:53 +0200, Moritz Bitsch via buildroot spake thusly:
> From: Moritz Bitsch <moritz@h6t.eu>
> 
> * when not supplying --release to cargo various optimizations get disabled,
>   resulting in slower runtime: use BR2_ENABLE_RUNTIME_DEBUG
> 
> * Debug symbol generation can be controlled with the RUSTFLAGS variable:
>   add -g to RUSTFLAGS for debug symbols

Two changes, two patches, please. Yes, they are very related, but the
second one is a new feature, so should be a separate patch.

> Signed-off-by: Moritz Bitsch <moritz@h6t.eu>
> ---
>  package/pkg-cargo.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index f7e3f39503..7ce7867f67 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -51,9 +51,15 @@ PKG_CARGO_ENV = \
>  # and should be removed when fixed upstream
>  #
>  ifeq ($(NORMALIZED_ARCH),arm)
> -	PKG_CARGO_ENV += RUSTFLAGS="-Clink-arg=-Wl,--allow-multiple-definition"
> +	PKG_CARGO_RUSTFLAGS += -Clink-arg=-Wl,--allow-multiple-definition
>  endif
>  
> +ifeq ($(BR2_ENABLE_DEBUG),y)
> +	PKG_CARGO_RUSTFLAGS += -g
> +endif
> +
> +PKG_CARGO_ENV += RUSTFLAGS=$(subst $(space),$(comma),$(strip $(PKG_CARGO_RUSTFLAGS)))

I was about to say that we had the make-comma-list macro for that, and
that's too bad I badly named it, because it also introduces a space
after the comma, so it is not fitted here...

We could tweak it not to introduce the space, but it is also used to
create meson lists, and I'm not sure the space is required there or not.
If it's not, then we can tweak it (and introduce make-comma-sp-list if
needed elsewhere).

Meh, forget it...

Regards,
Yann E. MORIN.

>  HOST_PKG_CARGO_ENV = \
>  	$(PKG_COMMON_CARGO_ENV)
>  
> @@ -119,7 +125,7 @@ define $(2)_BUILD_CMDS
>  		$$($(2)_CARGO_ENV) \
>  		cargo build \
>  			--offline \
> -			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
> +			$$(if $$(BR2_ENABLE_RUNTIME_DEBUG),,--release) \
>  			--manifest-path Cargo.toml \
>  			--locked \
>  			$$($(2)_CARGO_BUILD_OPTS)
> -- 
> 2.37.3
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
