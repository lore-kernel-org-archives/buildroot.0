Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82644C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19C3960AC0;
	Sun, 16 Apr 2023 19:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19C3960AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXuK9EdXD0bP; Sun, 16 Apr 2023 19:59:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BC8560A77;
	Sun, 16 Apr 2023 19:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC8560A77
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28F7D1C410D
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0084E4186E
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0084E4186E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWx5bk0X9glg for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 19:59:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B71AB41857
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B71AB41857
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 19:59:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 626F65FF9D;
 Sun, 16 Apr 2023 21:59:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 21:59:05 +0200
Date: Sun, 16 Apr 2023 21:59:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20230416195905.GG2819@scaer>
References: <20220918122239.189147-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918122239.189147-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681675147;
 bh=0LpZjzzio5KYxRveY1NBJl0JHOOz62+pCoBOYeXaYyc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MnuMLPhAEfLj7ICr9iiv3o8K8wufNL97RXRGaqbHMQYyz+cVzbRBpxAzUOR9ebjOh
 CFQSDPBQBoKfPskR09IGrObS9ls5PS+2YVM/37zIF2g3qHd/mTQeIhONrFKEGH1uLa
 8oJ4MnYI1dcyY11ZIQlksmGevyN5N7hGc50lic8B9skiZeT/9DQZzUvoTUvKYWmZWy
 fh4Npsm4lJmJz4DjVuu6a9bJEvc1b8THNfaCAjBfu8tkswvdCs+Tigol4FCfEnkFyt
 FrirZdYyRLPzlr/MRkwPtmVdsKbtovSnHYUADIHVarFsCvuq5zoFqXtyNlW9gxcAPV
 yvwJB7XT4R4vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MnuMLPhA
Subject: Re: [Buildroot] [PATCH] package/pkg-golang.mk: add osusergo and
 netgo tags in static builds
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

Arnout, All,

On 2022-09-18 14:22 +0200, Arnout Vandecappelle spake thusly:
> CGO (the Go language C bindings) normally links dynamically with the C
> libraries. It seems that passing -extldflags=-static is not sufficient
> to make sure they link statically. As a result, a build using CGO will
> fail with
> 
> runtime.gcdata: missing Go type information for global symbol .dynsym: size 72
> 
> There are two modules in the standard Go library that can use CGO:
> os/user and net. Both of these have pure Go versions, however, which can
> be selected with the osusergo and netgo tags. Since these two are
> standard library modules that get used in almost all Go programs, pass
> those flags in the common infrastructure.
> 
> It's not entirely clear if this is always the case or only depending on
> the specific way CGO is used. In the former case, we could instead
> disable CGO globally if static libs are enabled. However, it turns out
> that this doesn't solve the problem completely anyway (delve still fails
> to link, with different errors). Also, it is possible that other cgo
> modules do still work. Therefore, just stick to adding the osusergo and
> netgo tags.
> 
> Fixes:
>  - crucible:
>    http://autobuild.buildroot.net/results/c2f/c2f29f55b461899e8e15c0494578304e6f74bf51/
>  - containerd:
>    http://autobuild.buildroot.net/results/699/69910fc6b9f474a7eb0ca7ffa27ac5512cc1bb37/
>  - delve:
>    http://autobuild.buildroot.net/results/552/55225d5da17e85271943f7adce6f07d014d9717d/
>  - probably others...
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Applied to master, after adding the link to the docuemntation you
pointed to in your reply (without any typo, I hope), thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-golang.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 0b3dc3d32f..a4fc353e78 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -100,6 +100,7 @@ ifeq ($(4),target)
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  $(2)_LDFLAGS += -extldflags '-static'
> +$(2)_TAGS += osusergo netgo
>  endif
>  
>  # Build package for target
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
