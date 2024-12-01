Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A6D49763
	for <buildroot@archiver.kernel.org>; Sun,  1 Dec 2024 11:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B1C14F07C;
	Sun,  1 Dec 2024 11:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C5se3Ggtz9CF; Sun,  1 Dec 2024 11:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB34B4F07F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB34B4F07F;
	Sun,  1 Dec 2024 11:37:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 789616C
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 11:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6BFEC4036F
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 11:37:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDsr3EHYE8rd for <buildroot@buildroot.org>;
 Sun,  1 Dec 2024 11:37:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C87A2400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C87A2400DA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C87A2400DA
 for <buildroot@buildroot.org>; Sun,  1 Dec 2024 11:37:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D8BE719F5C3;
 Sun,  1 Dec 2024 12:37:12 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52862])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Dec 2024 12:37:12 +0100
MIME-Version: 1.0
Date: Sun, 01 Dec 2024 12:37:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20241128012217.21455-1-christian@aperture.us>
References: <20241128012217.21455-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.9
Message-ID: <b11604c62e77db9b7b87d985850be89b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733053037;
 bh=6MFuP/EI2CivSydBeGW6rGPh4udFWc9ixKxGaNEf5S4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LwvONLIEtDiXhD/p16I52i5QAakIfFk8DnGHSb5gWUK5BAUqP4xfIJ8F0EukrD99J
 3zLbNR0jz2cvozqlK7lm0fE1S+cYcliFR0gY9w+rxtveNz4F8I/jBSxDRH+SKWEHlt
 dB2GCZqBCaRA6l7SssdRGH3WEa0qwBaUXRWT+/sGNtrt7N7BxTPe7OzMW1nlFKQ0Ij
 bO/u93W0NcQ4aAOfZXn7XHoytM0mHuAL1dtnfQ6hdREPHXhp7TlEuug84xFvS2uEfw
 pk8hOydwJkASuWsQRPWH+UutSvSANVAPyUhoZWNUqbzXElotSVHNfSqyb9qWUqvrFn
 YL5JfyCgWH5fA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LwvONLIE
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump version to go1.23.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/11/2024 02:22, Christian Stewart via buildroot wrote:
> go1.23.3 (released 2024-11-06) includes fixes to the linker, the 
> runtime,
> and the net/http, os, and syscall packages.
> 
> https://go.dev/doc/devel/release#go1.23.minor
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to next, thanks.

> ---
>  package/go/go-bin/go-bin.hash | 14 +++++++-------
>  package/go/go-src/go-src.hash |  2 +-
>  package/go/go.mk              |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/go/go-bin/go-bin.hash 
> b/package/go/go-bin/go-bin.hash
> index cc87cac3a6..5f008c773e 100644
> --- a/package/go/go-bin/go-bin.hash
> +++ b/package/go/go-bin/go-bin.hash
> @@ -1,9 +1,9 @@
>  # sha256 checksum from https://go.dev/dl/
> -sha256  
> 36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  
> go1.23.2.src.tar.gz
> -sha256  
> cb1ed4410f68d8be1156cee0a74fcfbdcd9bca377c83db3a9e1b07eebc6d71ef  
> go1.23.2.linux-386.tar.gz
> -sha256  
> 542d3c1705f1c6a1c5a80d5dc62e2e45171af291e755d591c5e6531ef63b454e  
> go1.23.2.linux-amd64.tar.gz
> -sha256  
> f626cdd92fc21a88b31c1251f419c17782933a42903db87a174ce74eeecc66a9  
> go1.23.2.linux-arm64.tar.gz
> -sha256  
> e3286bdde186077e65e961cbe18874d42a461e5b9c472c26572b8d4a98d15c40  
> go1.23.2.linux-armv6l.tar.gz
> -sha256  
> c164ce7d894b10fd861d7d7b96f1dbea3f993663d9f0c30bc4f8ae3915db8b0c  
> go1.23.2.linux-ppc64le.tar.gz
> -sha256  
> de1f94d7dd3548ba3036de1ea97eb8243881c22a88fcc04cc08c704ded769e02  
> go1.23.2.linux-s390x.tar.gz
> +sha256  
> 8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  
> go1.23.3.src.tar.gz
> +sha256  
> 3d7b00191a43c50d28e0903a0c576104bc7e171a8670de419d41111c08dfa299  
> go1.23.3.linux-386.tar.gz
> +sha256  
> a0afb9744c00648bafb1b90b4aba5bdb86f424f02f9275399ce0c20b93a2c3a8  
> go1.23.3.linux-amd64.tar.gz
> +sha256  
> 1f7cbd7f668ea32a107ecd41b6488aaee1f5d77a66efd885b175494439d4e1ce  
> go1.23.3.linux-arm64.tar.gz
> +sha256  
> 5f0332754beffc65af65a7b2da76e9dd997567d0d81b6f4f71d3588dc7b4cb00  
> go1.23.3.linux-armv6l.tar.gz
> +sha256  
> e3b926c81e8099d3cee6e6e270b85b39c3bd44263f8d3df29aacb4d7e00507c8  
> go1.23.3.linux-ppc64le.tar.gz
> +sha256  
> 6bd72fcef72b046b6282c2d1f2c38f31600e4fe9361fcd8341500c754fb09c38  
> go1.23.3.linux-s390x.tar.gz
>  sha256  
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  
> LICENSE
> diff --git a/package/go/go-src/go-src.hash 
> b/package/go/go-src/go-src.hash
> index b475ec4a46..1a185d011c 100644
> --- a/package/go/go-src/go-src.hash
> +++ b/package/go/go-src/go-src.hash
> @@ -1,3 +1,3 @@
>  # From https://go.dev/dl
> -sha256  
> 36930162a93df417d90bd22c6e14daff4705baac2b02418edda671cdfa9cd07f  
> go1.23.2.src.tar.gz
> +sha256  
> 8d6a77332487557c6afa2421131b50f83db4ae3c579c3bc72e670ee1f6968599  
> go1.23.3.src.tar.gz
>  sha256  
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  
> LICENSE
> diff --git a/package/go/go.mk b/package/go/go.mk
> index 33dc681358..3dd590bf6f 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GO_VERSION = 1.23.2
> +GO_VERSION = 1.23.3
> 
>  HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
>  HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
