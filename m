Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6CEC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64614404ED;
	Mon, 16 Jan 2023 20:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64614404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZfJ9ssZlxZt; Mon, 16 Jan 2023 20:30:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393D34049F;
	Mon, 16 Jan 2023 20:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 393D34049F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7B51BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF6168149D
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:30:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6168149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Smuf-zDxCJWJ for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:30:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EECBC8148A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EECBC8148A
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:30:13 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C090A5FF33;
 Mon, 16 Jan 2023 21:30:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 21:30:07 +0100
Date: Mon, 16 Jan 2023 21:30:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230116203007.GF2770@scaer>
References: <20230116105032.1890904-1-peter@korsgaard.com>
 <20230116105032.1890904-2-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116105032.1890904-2-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673901010;
 bh=7pRsMrxGBgSaS06TUQpRo/jWNkmMzhkCEdAietbLlD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rkm60D7jLHt02V3DMZAIUFovh16U3IRcjpxwJP2V8z/7ZSGaPgsCjUmh7idbn9okC
 4yu2y3L0Izr1dipJs9lYPi8PWbSSxFY9yjm1N4cnvJQDEitnXFhCaOrY5K/rIbSpQN
 Qj6zl4CwEoCAMe7jzm5nKgsE0LHAIzTwe3Jn8s9YNG8LWuQ1uAGhXXNs7mgNqYUvAm
 mH6FCyLfzWjGf6acqcWXxD81yUeXw4zcumOBqjMXv2JWpyLVJC2auZmNX6Gsx4eZbg
 GoFKoiiHnv2FaPVlZ7ECNz8EU3T47By5zQGHLDPRuoMVV884TYIoLIggVzEHQELryA
 998jRq1dm98lA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rkm60D7j
Subject: Re: [Buildroot] [PATCH 2/2] package/go: explicitly set GOMODCACHE
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
> go mod vendor caches downloaded modules to the Go module cache, which
> defaults to $GOPATH/pkg/mod - But can be overridden with the GOMODCACHE
> environment variable:
> 
> https://go.dev/ref/mod#module-cache
> 
> So explicitly set GOMODCACHE= for reproducibility.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks, but see below...

> ---
>  package/go/go.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/go/go.mk b/package/go/go.mk
> index c4f72d403c..c38ae0b99c 100644
> --- a/package/go/go.mk
> +++ b/package/go/go.mk
> @@ -26,6 +26,7 @@ HOST_GO_COMMON_ENV = \
>  	GOROOT="$(HOST_GO_ROOT)" \
>  	GOPATH="$(HOST_GO_GOPATH)" \
>  	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
> +	GOMODCACHE="$(HOST_GO_GOPATH)/pkg/mod" \

HOST_GO_GOPATH is $(HOST_DIR)/share/go-path, however, with PPD, HOST_DIR
is per-package, so there will not besharing of the cache between two
packages, unless there is a build dependency between them (unlikely in
the go ecosystem).

If we wanted to really share the go cache(s), we need to hit somewhere
in $(BR2_DL_DIR), like we do for cargo, see 8450b7691870 (package/pkg-cargo:
move CARGO_HOME into DL_DIR).

Still, this patch guarantees that the current situation is reproducible,
and does not depend on the user's environment.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	GOPROXY=off \
>  	PATH=$(BR_PATH) \
>  	GOBIN= \
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
