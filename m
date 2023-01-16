Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94320C54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4706040ACB;
	Mon, 16 Jan 2023 20:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4706040ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tq7mswwdZWHH; Mon, 16 Jan 2023 20:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6736C405E2;
	Mon, 16 Jan 2023 20:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6736C405E2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D0711BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32573405E2
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32573405E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3OAyOliMD-6j for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:26:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0C0403BE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A0C0403BE
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:26:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 771F85FF3F;
 Mon, 16 Jan 2023 21:26:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 21:26:11 +0100
Date: Mon, 16 Jan 2023 21:26:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230116202611.GE2770@scaer>
References: <20230116105032.1890904-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116105032.1890904-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673900774;
 bh=CYZtvhI+nvEm9pg9eYED9NbWoNccHsLx+O2GVsWKwVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z1H0/KWNrHOFfhBnACr303dpTq4KjD8+ZiwQYACOcuttVbJT1DLW3C/1MkQcRUy2F
 Zu6RGqm5pbBklEYZCHUVhd9jhLKnKJ56WmP8xEPLSj851TgSGBRpl49n7YeFLTLjF5
 jMCUGMENQN96B3S1mFakjHzehW6OHqteIRrvRlU5eoV9bufnLG6J3f1dPI0xrP28J6
 1Rh5xTKKlVmgnGViHuRcebkvWCPXFg5pFeeIjXdA0EJ7fzQ0xh31dk4+mcWvowgogz
 hjz2sfYV1JZcLDNbwGW9qqPJ0X1e1iTHWWR82Gh5kDU8y/lSEh4iYYsTn4SJy4ARQy
 x0BsFViAuhKAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z1H0/KWN
Subject: Re: [Buildroot] [PATCH 1/2] package/go: set GOCACHE for download
 post-process
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-01-16 11:50 +0100, Peter Korsgaard spake thusly:
> The go mod vendor call in support/download/go-post-process accesses the go
> cache, so pass GOCACHE= in the environment to ensure our cache directory is
> used.
> 
> The go cache defaults to ~/.cache/go-build if not set, so this fixes builds
> where that location (or GOCACHE if set in the environment) is not writable:
> 
> rm -rf ~/.cache/go-build
> chmod -w ~/.cache
> make docker-compose-source
> ..
> failed to initialize build cache at /home/peko/.cache/go-build: mkdir /home/peko/.cache/go-build: permission denied
> make[1]: *** [package/pkg-generic.mk:189: /home/peko/source/buildroot/output/build/docker-compose-2.14.0/.stamp_downloaded] Error 1
> 
> We use two different cache directories for target and host builds, but the
> download/vendoring should be independent of the architecture, so use the
> target variant even for host-only packages for simplicity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/go/go.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index d3ed07f03b..c4f72d403c 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -25,6 +25,7 @@ HOST_GO_COMMON_ENV = \
>  	GOFLAGS=-mod=vendor \
>  	GOROOT="$(HOST_GO_ROOT)" \
>  	GOPATH="$(HOST_GO_GOPATH)" \
> +	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
>  	GOPROXY=off \
>  	PATH=$(BR_PATH) \
>  	GOBIN= \
> @@ -75,7 +76,6 @@ HOST_GO_TARGET_ENV = \
>  	$(HOST_GO_COMMON_ENV) \
>  	GOOS="linux" \
>  	GOARCH=$(GO_GOARCH) \
> -	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
>  	CC="$(TARGET_CC)" \
>  	CXX="$(TARGET_CXX)" \
>  	CGO_CFLAGS="$(TARGET_CFLAGS)" \
> -- 
> 2.30.2
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
