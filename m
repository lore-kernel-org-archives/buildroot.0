Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E991E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WrnOLoKL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C84B440E0A;
	Fri, 30 Oct 2026 15:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t--zB2agM2za; Fri, 30 Oct 2026 15:29:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CE16540DB0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374172;
	b=KzGz6oRuzI+uxKdUv5Ch4D93YmVOb8kL5l6nesKZnvIQ2tL40/nG836FHaQKlN6WEjWP
	 fU2O/gxMB22crkteImEmh8gt650bWRR5NJz/pZMMwBTdfeqdazuvUBvnqdJtanm+A0WbV
	 6m9XUR28gsvIz+1BKt6qNz9q0lbR4e9OPcu1Xt7XK8kwWGGZXPpIJt+eHqW62hL8DFXsa
	 dwpfoESHHKQWNqIYYJZ9n+IW/6lLpFnF2S+xf7eclrk3g3OqGlqjLQsQ26IXcZI0YCQFI
	 RKuUdaOpamDYCoM/cPAw+lgBqTNx+UV2Q5aqFouZsvvBHv+AW2+rNvqkFDNbdObhkQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374172;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=4YKr4RRH2XBIjuIL1jdkGZgExrMB7FcaXB6aBTslQvE=;
	b=ZHGSuPS23k/8dVWup+cEZpFe4P+CwFpCM7Dmi4me1Qa4YEJfKV1RJD0M4PZ+Kg0CfaxJ
	 XM4g3U7Ck3O3mxpZ45oQL/FGuB2/BIygCktMefGv47rrljwAysF7NYrJSKq0IMGXRfaYv
	 U/SZ2y9yf/00dIkm9BZ/dmmQCPGMT524JvUQBhIhzVVofel5ZHpFWRlMqhYpZqLdP8m4p
	 sUTFKbowdXrKAVjd3GmEo965tOG90dCn1vg9avOYWufal6SK2ePE/MrCzePFJmwmV0Ell
	 XN1syEmjYEeFOPpsX97R95JDsDGLAGAejNDsLw+NUPqaMNz1oTsEWUVfjBzLOVMNVxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374172;
	bh=4YKr4RRH2XBIjuIL1jdkGZgExrMB7FcaXB6aBTslQvE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WrnOLoKLQIVtYFNF3fQwJhmTJQRJo4csaT/q1N1+jfySh4LFnL53zMchxRkuv0spq
	 iLgTeXYGKpUlF8M3uOf8y5dBdFaVsad4TdSjVvwj7Gs6bHecxbLULgpLPLOaYx7yuS
	 11hyzDEYKjV6IMDRcRFhLmBJhbPWsTze4FF5b310e8DLeGcHes46CP0o+2zSzpGtGo
	 m2kw7C34l08KoQ6vPzv/BlgFpl3Ymqzm19c7AgfSqdCGbsE+SzvaOfBgVkfVcmONzR
	 4YdXxkOYq8fIhBIcCU6/UAqSbBDI9QppwmICLhy5gD+nZG6wudzyi81QFDH3guwFNW
	 Wh/JyLAurwu8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE16540DB0;
	Fri, 30 Oct 2026 15:29:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C838235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 823F681331
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4R30mYtQge2z for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F32281129
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374129;
 b=faklqb9PTbB7j4u4H18d0IZwTSlfCAYF1izbpbs/2X2ZZQqnVG3sCD/zRsKtLCh+gQrK
 qZvEjPUqCP2a4OLjuFI7GAzE9i6d9ITmQGGci3NfXsuokPo3pmOHnNbgauMA2RTJkFerf
 kBBp2npbTnNNSEEIQ2zjwPuba4L6FpkQMxv8yY/KiAyCBFoLa8nn2rggrxqhn+9as+YQB
 AZiLxulmG8lbG+uO36lbSfbUzG0Qdpa8OvQXyUiRaFdvjkxxpqXqnZHJjpPx5o7eJ/9Jc
 4/G1sCK9l3qpSc2uQ5Mbv5IaTGgCyb9Jms4ajQEi1V6FZKI9fJN7LWMVx/jmM6ABS7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374129;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PW9ozvcVQ3h/OORhBxFW0vxLB+cca4/mPzRoGTfg+es=;
 b=Y/0tmL4oeEXxysE66WFD7kpAVP0bpwUHU2VggZtO7WRlmX0HNDCgfSrCH/sBQN4wKJUd
 snwc/mU80o7kacBG5QE/YD14ja56KIBh240yzJaLE+1s67kLX5vaDyYSDS62YL0Pze7Nq
 DLaOg68UxmVEjw4fRIy0BNKYcSG6mHuuDv7OTGxUXBMoPmUoGLPk+xRzH6tbcep24OB4B
 8iOEBSv1DLd0Stps2twA1wmvPXourPoQQ5Trq9j4TEXBf6njHbgn/mRv+fy23AatLZiJH
 H072UH2aBSRidCMuwXIYAeMfoKtqT1LIWCoE0YKtPmv03cOIB10vQOtIu0ujFUaZxfA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OscVJYHw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F32281129
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:48 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so6208085e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374126; x=1793978926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PW9ozvcVQ3h/OORhBxFW0vxLB+cca4/mPzRoGTfg+es=;
 b=2AXj4lJnaYJMszuK6KRM68kjzUCsDaqoTJydTLiTEebj5OsSDakoRIlIPuemaPkDpI
 71Wtbivdv/CEZEC2hiB6tLw3maSeNszlc+o19gamOvyzt2aca9iZDl/351fU7Xz4KwuV
 lDXAly0IdeAUECqVKZnb1iU2OHmvekYdOsJRolyydKZJUPKtSZtlzjO7TrzMabzqpl7d
 EGcWyYfTQIH3GaPt7S+GPGckHrp3eP65Nxba8znHVnEoaymE1DpUq51vRYhReTDWzWvL
 y8Vab3fAeBhGhYqEHIR/f0bPdKiPryHXudArn94Ew8alru7nNwLPT5Mk4yU1OYQE8/oi
 bGlQ==
X-Gm-Message-State: AFq9FYLWzcMaCsUi4FmY+1AVE3NMsoDbUgl8+F1xyNeG431mMUpn5wEd
 uujzppUFbm2TTvo+6nDFSyV/cg9S0q3Jf6xbYVso11KbLEGvfOkBsu3B9avogqxlbQSz1y5/706
 cfbM8Lv8=
X-Gm-Gg: AYBFou3iLtEfxD6AEqFsce3LUBvfKwEEcX9CY8B371lZwKH4AI07h8OO7dt9xe8GSA+
 srxJMvQxwR6oNjvijb27rWnYy0Nbo0hUCr9Xird16Tcd6SB5Wkd0EhxE0hBFL1+hxbmuPT26wrk
 166jms0l37ZtrrFhPOm52vqmY7UFABs2fTkZluYP/fwXTT5A8IMUkBSatZlvsQIfVF6gDkoHqkN
 3gsDdNJQYOVckAz7r8pdQGRrHrhTphLE6SRoQr0UvKH45VOmLmdZfn4RrLIDS24t3bJ16LVnruD
 gqpDRH4jjQAr5GVLhlKPNdcHGBduGH5x3htYfxAk9og2Heg/r0ySAnq1W7iyalG0Grxi9QNYaAw
 DaCfoZDiPA/3TDfSPySl5j3yXQ1rIuTN17WzgArIaNVTDIyJljGKyfebZOQ3my1ENvMvmVnw47h
 khHCSr6YJu7QvmvXLp1mmvL8TMFeRXwYNWmBELEIgUDEctyRgZFrubZ56Bh6AYrUY7eDzoeD0Zt
 yflT3mcOiUL+dEQrswZSvxQN1EVF7y6GmqLgzE9QBP043/I7UXe57CWVC2DrdgiLKmpl3uSbLrn
 Oc/3XUyK3DT20+07SW8KEmwL+nIOrM83EemaldRPPuqm8G3vozdFPzM/2P3Um4OxhUOhg1PZ
X-Received: by 2002:a05:600c:354c:b0:4a2:8c5:5e5 with SMTP id
 5b1f17b1804b1-4ac17d16b1fmr59720255e9.7.1793374126520; 
 Fri, 30 Oct 2026 08:28:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac08b72578sm26475115e9.2.2026.10.30.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:45 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:43 +0100
Message-ID: <20261030152845.1907511-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023083137.3767694-1-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-2025.02.x] package/brotli: security bump to
 version 1.1.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following vulnerability:
> 
> CVE-2026-111497: out-of-bounds write permits remote code execution
> 
> https://github.com/advisories/GHSA-9v8h-qqgm-4m35
> 
> https://github.com/google/brotli/releases/tag/v1.1.1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x. Thanks

> ---
>  package/brotli/brotli.hash | 2 +-
>  package/brotli/brotli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
> index 145467c420..0500fb79d5 100644
> --- a/package/brotli/brotli.hash
> +++ b/package/brotli/brotli.hash
> @@ -1,5 +1,5 @@
>  # Locally generated:
> -sha512  6eb280d10d8e1b43d22d00fa535435923c22ce8448709419d676ff47d4a644102ea04f488fc65a179c6c09fee12380992e9335bad8dfebd5d1f20908d10849d9  v1.1.0.tar.gz
> +sha512  f7f3a7e4620403aa26d69458e0bb886d322f7677685c55717fac824f0b789e0c25cf4ff7d8d455d70a8526d0150d7a09b9df292a11f9ef5d3bf625878cb51368  v1.1.1.tar.gz
>  
>  # Hash for license files:
>  sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
> index 80aa2566b5..b7049b104e 100644
> --- a/package/brotli/brotli.mk
> +++ b/package/brotli/brotli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BROTLI_VERSION = 1.1.0
> +BROTLI_VERSION = 1.1.1
>  BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
>  BROTLI_SITE = https://github.com/google/brotli/archive
>  BROTLI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
