Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F4F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rj4XGtHp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1059540E36;
	Fri, 30 Oct 2026 15:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qg3873rq3njT; Fri, 30 Oct 2026 15:31:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD6F640E90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374278;
	b=bNTuDkP6yVFwB6N4cbBae6MxFnUsKRslAVKaKRGkPtw/LhuuxO3gcilFQV8fraLUErf2
	 1wB5XIK2MQMjQwRrWq/bh2gzH8uk+gUwJJYQtEaKBCIfZ0LpWFqNEl6G7ez6kP28d7WdJ
	 6sUiskSU20vv9/LBhk1J0dkn4F4tQG3WFCttZpMrAuz1kQY4paU057UQl92en3uOzNIbT
	 MjmE/kaVX/0KbieTrv3h2zIqA4Cs1bHMY8WSIeBjvjAvIgyMjZtp710SqGuosCqBeKnwz
	 TFFGejgwqhDebPeTGVOYpEgch2DjYCT3dcajtTi2Mvp5B8S6pVc8uJu8hy6JB+RTpmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kdFlIlDf5UUin2gVZcvOD89BUPtnrsjnvcIgrqyU0as=;
	b=CwGpgfSHQQotjrAjVsIRqlnyTbY8tFg8JNnuqeMsPxGpQdXNjcKpp/dRDr+fyP6sfxTs
	 epwPebp04zgiUNcK5qfckq55gil42MDA+rBjaqElwZsT8e+ZWtvycXCqFSSGcWY8B04cO
	 joF9qHMDMLVCKanqEZtgB6R/uVCYmLOAfeHOaYTGUBzOZFdnAuLoVVbqxxQB4un+2iZYJ
	 +lm87GPp2RKJNYc7it0Spt6w3Z03+bUXZdLWAudb+MGAszF13HWrJ3IWXjUjrLSQ2XIfv
	 cZ6GkW2rqyxICNEdxgMW7ZJCeE52EwusKceDC0Ybu5Kn5Q23Z1j+g8DwgOlpGJ9rJDQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374278;
	bh=kdFlIlDf5UUin2gVZcvOD89BUPtnrsjnvcIgrqyU0as=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rj4XGtHpL/f0CoXNlQb/C85rNmUet3O0AqYUMJYy0PhdcX/7xzKCkTf71rSzEgFYm
	 IUmfYqr7O2XHLQCTQTf+ZTzjbgEfzW83TJ7huTByZDXECirfSPUXxv4xCQIEhTOnuk
	 V7kN3qNOZ51fJ1rLTBNTMiAOcvppOnieMmGv1bHkZwpPj66JiWsu4JxeUv1SHOjWJO
	 RGXOlvqBt0yd7oZvnZOyf/xmG63OCUWweB+ai6x74Ig95bFuVy01E5UEDaCiK44tJh
	 8WPYftyvc66/MaQSsAjET8QbkM143jzmrIbOlRTr+wkIOETNLRSwwUAWCWxABhQ6VQ
	 za0STREwZFAlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD6F640E90;
	Fri, 30 Oct 2026 15:31:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E94FED38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD87781CAF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EL8gplnDMVMZ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:30:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93BDF80E4D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374206;
 b=OE0DhP0ErHatyqNDy/qoQeWbzFCKgFvRMirLq/GRkgPPp773RShQpjw1lwkYkOkllsKL
 lFNhuw87MfaOJNc65BaTwRwzt5ewdv8ULzgTRmK99O3HEOGJu2UAy+nnpstKH3BO/gTxt
 kx8O58B3PSh/05RQ9/eoaQm3/m+63TO4j7gLhYvJ9eQ1prn1dUmkHy4DCIn2BY0cPPkjT
 BQ23QshTRegQmnxMHDNxAvWF+WxVQMdCVtPcaHC6w1aY7mQImeGsgx3gvYjM6WJf4OVZq
 KC1/oi3/ynsGM2ri+neyC11wvj6JuH9tSFI1MJwk4SpIAyhwoF6cFeVNe42btJLsZjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374206;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=P0IYoIw3RUL6x3K+SkPiCW1QPk9UCDAdKWsRyIMWdS0=;
 b=dIlQqBbA2qNgliBMEj7MYaU2cOrwq2wI7I52qffhnKV+ohjv2yIZF2UN4KRatF3OEs/K
 8hu3TXxWd1GCbYTqgkogQQ0JjymQNN1kmjbtBdHItKdMgNuPunxrmHmPJe+DwtxL03ImK
 5lfRp+ZnEmPV3JXBV/uCGT9/xrdVyMniBt/kGk60gx/2fDFvgqwJSYPu16C3z7DTfoGif
 aCeVcS7kTdqMRVMMr5L/W+oy5QvxUygtCoKWVt3JVxXaI2mhtEn1YY264a3kD0HheU3En
 bU0QhF6vXlLEPwuaKnLoP4oNRzPY1ds9wPrvw2Y8qYQNROIYfUoCmud9OWGGnBpJHtQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Qcc1Axqj; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93BDF80E4D
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:30:04 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48e04773687so300493f8f.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374202; x=1793979002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=P0IYoIw3RUL6x3K+SkPiCW1QPk9UCDAdKWsRyIMWdS0=;
 b=kr0iI1CjT4oypx+p1hwACwlnBTHTDrcmR0FOm619TOY8sdVhYEs6k7yybImzKZssT3
 RvSfch3e04Zxu8pmuBQq2dH3crdOS31fSsKI+SFESh21po6DRoTyzMHFjEo4X9cN7TBq
 j+GohwYVF9nWhPT8Dko3drSrzXVjcSyjnfJxZMZQOtdB326guO5cwNc7pdiFA9f551cR
 YOSoKwKv1LfpqnfMOgdQ0JRXnVbhLOlm1W6FTSpe2S+Zvvrneaeiu9deVfW0rkZCh1EO
 mkvyw3BrqZFOeHnfxVP/kjIFQwhzJhp8E6EdonBfJ2shU/fMIu85L1aaQMJzRt7ZAFqt
 jQKg==
X-Gm-Message-State: AFq9FYLjQ/k61LYwy6AZjW+0WhPArXVZotwtpXQrjk2jT/3fab39Gfju
 Leny7U0GQPu/xPUqvANXwoJEFjRNQdnZ7JH4NHeVvj38CdzG6l13EqO0FOFiMeYwHHFcQE7D72x
 OUpoMPgo=
X-Gm-Gg: AYBFou1ITf8GNZMdJW1cf9XOeK5kTNqDIvyMX6KVOrYtwqKFzT4ObfN42w+JsUukOcB
 xhEGaRzSlDdc7CXKvH8E9ofGEwpkDGfYYnTGVTy+7RwolGld6loAfK9oMU3Nc4aKqdnMCwJs1HA
 103m07INtSJCFU/T5g3r0uTnez1VxF12bPFI2QXFDZprjb+EHs59PVXe7xZG/g+a8JHhwm9A1uo
 IaEMFf54ItEGF8YeIgWu3uwmhzcy2/Ms3Tx4L94S0NV/haIcidmIjqqav1x/7t7/+kAhoR4Q7iu
 qOXQGLIitufy30kfAVgy58NMcjxbYz/RCgfj0xPPtfgcyOU+ylDL9kMRXNJaiWRhrtrmRf7PSGC
 RKWb4zx99kkd1AO5zCEL/3PmCfksFVaeOx6s8UXeiM7IwOOZdBIubFvN1gfh5rk2aXH7XBEZLHG
 N5RMnNpYyzsIGSwv5MGJRNoQQG29Eq/ak3X9ZNT+N/80mJySamtPx+JqzHWedyIofNCRl4IFmpI
 607jlkKFujJ57BpEQr+497cDtpdsWhYWYqs6d4TJ7avLp8IrAwkQ9bUH1uldAJUbs4G8OAoICgD
 RdzVt2cI//E4ehs7r46xH0Qda8jR/5OfsgJNBYmnxCKEdlMlJvMZjjyr4ioPeQ8S+tYzESM/
X-Received: by 2002:a05:6000:1445:b0:48d:f464:6989 with SMTP id
 ffacd0b85a97d-48e6e30bc13mr6526386f8f.27.1793374202450; 
 Fri, 30 Oct 2026 08:30:02 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d511sm3840090f8f.8.2026.10.30.08.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:30:02 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:59 +0100
Message-ID: <20261030153001.1908243-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025103355.3701150-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/docker-cli: needs NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> pthread_unix.c: In function 'x_cgo_getstackbound':
> pthread_unix.c:96:9: error: implicit declaration of function
>  'pthread_getattr_np'; did you mean 'pthread_attr_init'?
>  [-Werror=implicit-function-declaration]
> 
> Fixes:
> https://autobuild.buildroot.net/results/756/756ceb50b78218ac6085e0143d9f358f97d9568d/
> 
> The build error occured already in 2023:
> https://autobuild.buildroot.net/results/c0b/c0ba9647824dd2dc811c31e7b999167f04d0be49/
> A backport to LTS branches should be considered.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/docker-cli-buildx/Config.in     | 6 +++---
>  package/docker-cli/Config.in            | 6 +++---
>  package/mender-update-modules/Config.in | 6 +++---
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/docker-cli-buildx/Config.in b/package/docker-cli-buildx/Config.in
> index 486f1196c3..d1f9bc2804 100644
> --- a/package/docker-cli-buildx/Config.in
> +++ b/package/docker-cli-buildx/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_DOCKER_CLI_BUILDX
>  	bool "docker-cli-buildx"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # docker-cli
>  	select BR2_PACKAGE_DOCKER_CLI
>  	help
>  	  buildx is a Docker CLI plugin for extended build
> @@ -10,7 +10,7 @@ config BR2_PACKAGE_DOCKER_CLI_BUILDX
>  
>  	  https://github.com/docker/buildx
>  
> -comment "docker-cli-buildx needs a toolchain w/ threads"
> +comment "docker-cli-buildx needs a toolchain w/ NPTL"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
> index 52e7f7c871..2befb87578 100644
> --- a/package/docker-cli/Config.in
> +++ b/package/docker-cli/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_DOCKER_CLI
>  	bool "docker-cli"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	select BR2_PACKAGE_HOST_GO
>  	help
>  	  Docker is a platform to build, ship,
> @@ -20,7 +20,7 @@ config BR2_PACKAGE_DOCKER_CLI_STATIC
>  
>  endif
>  
> -comment "docker-cli needs a toolchain w/ threads"
> +comment "docker-cli needs a toolchain w/ NPTL"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index 1fd7384f59..7c5a7e4442 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -76,7 +76,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
>  	bool "docker"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS # docker-engine, docker-cli
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS # docker-engine, docker-cli
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # docker-engine, docker-cli
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # docker-cli
>  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd -> runc
>  	depends on BR2_USE_MMU # containerd
>  	depends on !BR2_PACKAGE_CGROUPFS_MOUNT # docker-engine
> @@ -98,11 +98,11 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_DOCKER
>  
>  	  https://github.com/mendersoftware/mender-update-modules/tree/master/docker
>  
> -comment "docker support needs a glibc or musl toolchain w/ threads, headers >= 5.2"
> +comment "docker support needs a glibc or musl toolchain w/ NPTL, headers >= 5.2"
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
>  		BR2_TOOLCHAIN_USES_UCLIBC || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
>  	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
