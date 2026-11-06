Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1520606A985
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WFWiPSiS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F2D760AD2;
	Fri,  6 Nov 2026 16:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmE9_tn3RcYb; Fri,  6 Nov 2026 16:11:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9AB5160AC8
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981487;
	b=lpH1sqVzL5fXBw6SYFce7UlvwDbFcyFgGd5U2h+LqBZ0GaOwvkB2SnQvkR7hRwE/BXz8
	 Uj/5kC3k6DORA973oi7h467GAenN6MwRcsvPbcB5eiGQcmCiWKmf3DpSR5Zx+wszneYoY
	 VRMrlu+Z3XTuNQJ6MW3cwc7hn/gEHNFIIjOdcv5mc1rfnW7rbRBmabTXmKfXABxKNMPTz
	 SYyQpztFzvdc9GlYIbbihdc0h+r2+m9S9p7O7L3SJKjPFYl3O3JCSPxZVbg3phYqSYaad
	 qBNZ5+w/nlt5HGPCnVfbBMX1cCqZoM6Wwxp21LL/qRG8pMo3FJ1AGGphT9/hmmFxfHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981487;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=V1nLvm2G7GhbiXI6YnTU9km6Knyb8i4n3S3S+2XVUnM=;
	b=JKYxtwvcpP7s7WCXHw2Qz2WlY+znb8BvEHVeA3ZQxgF34WllTVYetkeYr+iZCaTba1pe
	 j7ERB8gDcxsMFNIsvnD2NIYH5gvVPhJbQj/2euYFb/LnLXDvdzjEE7AV59z0jDcaOn/pH
	 cViVuiJuEm/528ol1+4WIIv0+0qHwSaX8FwxBCtTTSg3RPVHZ9i5rcl9hIlP22aIvM3YG
	 NkGrq+A10i7XXyLEGFLhyy90zaDg9PtC//3ZABxGtRwn6Ve/6/FuJ++Lqmpvk60A6J3TA
	 RrZmX1o7S36RCoDBM++tyH08ruuw3APM19TPP8xL5Oz8w9THNFW2YAYSiO1eJ7t6fcQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981487;
	bh=V1nLvm2G7GhbiXI6YnTU9km6Knyb8i4n3S3S+2XVUnM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WFWiPSiSVFfyZhPiuhBiEqGuDeTj6oAnKbHDSoTT5nJsrpEQFgG8MC7b45rVkiVMp
	 1JyzxjGfg04itYakPMKgFVLLVV9xvlodVXhAJ9bAk6AJso73sj6HcDSR7SRb1n2mDH
	 TYwWGUwOPqUKk/nmcZWZWQY5qkIGbb0PRPHjBaGfakdV3g2M8ZwNNPoUrsCBCQVamK
	 P8BcEfcpbqsS2RjM4RUpxAr0Op3P2aHRAt1IrRUiEXKYBWdr3OYReYVFl0ISIdJEFR
	 PmHfglxqYuUGY43td46mohWo0LWvJBDNgaFJPbv32f8hvvA405hE0pIKqQsWoctLyN
	 05qeayracpzig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AB5160AC8;
	Fri,  6 Nov 2026 16:11:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 229732E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 081C360AC8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqovHWPEpioY for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E4FFB60AC6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E4FFB60AC6
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4918c2d727fso474559f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981482; x=1794586282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OZRyulzj70DJGrcwDec9+BIiZ7OZ2bCYUeEKQ3Xj7eE=;
 b=ofFALu/2Xfy0A1v3vHCmvnhijkTuorbWYqf+TYbg6+Ua3hAibdEZ1nj95nIzVKBqsW
 VTzhWcGqlETXzZFD2cnykjJg9pn5jTcNLrsm5zb+Jz4UBXz4MYDYaQqP38KxuM+McX/G
 FxtV9PQTx+WQG56ExWrtiTnZdWWpf5OKAOXChfN1scYhMY6e9wivjLMyGnQRvhtn731P
 fBDf5Q2tWIsdTPVx+j4l4OZXp1zsbTqNTGyQCSEhhDPVeyEfLZ6oCD7wZt9bhDcTpKvP
 7ev+E0Lc5qJgbV7IBWcZjXNa4m7h+MTAzKvcHbDM4sk2cnpfXLunKy5lOC2kyyrf+VTV
 fBTw==
X-Gm-Message-State: APuU4Z+pxbdtpjF51y2yKaLiInY5sULLofFx+Om7fW0JYArzqgZW4EUx
 yWRdDsG6vyCQfzpMCVZXRmrKcunSTlg94/VQ5kiCC6rvLt8fBbeFaS31l83MGWnL8HAranL7R/J
 LRxjkZ/g=
X-Gm-Gg: AYBFou0Mh5GEhpL2GU6R+UmXLxjNBVoRf28cvJu3CXKyYdibF8mQKoZP6w49NiaKtJt
 QdPeiZNee8L8REXhwG+oL/65/0xlY6JZ3nmCccB9pzep/lLo7ub0+aaIG/TmrApFTnzkUyzbaZN
 ovqwpNpA5+zzeRQPWvyj9sUWxNZnUjnRL1AqK24sGcBQykTLoWhnOL4p4jtBd2k++wohgGVyR6p
 H5233JvIAsMhwcTbNahtyndc8Qq/haWdvOGtLxJlxUWh/w5XGYR1ySEwUWaI+ovBojGpd6JFaX4
 cUg/OGykhv+BadRKHOuiRAN0urYdSKvudJczcB/FfSyGAY5mLK8uY7KIF+EEINM79KQaJjg08Cv
 GhLduSQnB6+GtdYcMchFRfdCVgHGTZmsjfCfTAyAvzOhB1R+9R+F9nyjQ8mrx+mbG5272EqaY0g
 VbnByCT9ljj3gokUb9ZJDh8j8/xBjktv8eTuxnyNqzq+uhWjdVemPAnoIQDVlo5DUd3Kg1gri0v
 DOo+koAR+xlxnEp7YdgfjWNSix8jxbIYtAfy9SmO+BFTOVIJFiR7KBpNbnBeY4L3kuyfJ+vb8w5
 oGJkTNf5Vv4/nNIk5V+AjPuA8Ojn6ZQMDeSw9qhGT2NakKwboy/b
X-Received: by 2002:a05:6000:24c5:b0:48d:e101:5707 with SMTP id
 ffacd0b85a97d-49274bc84c7mr5992123f8f.13.1793981481812; 
 Fri, 06 Nov 2026 08:11:21 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d770248esm4643233f8f.42.2026.11.06.08.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:21 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:18 +0100
Message-ID: <20261106161120.608057-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101102813.2047542-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/wolfssl: fix build on MIPS r6
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The MIPS assembly code in wolfcrypt/src/sp_int.c uses the
> multu/dmultu, mflo and mfhi instructions and clobbers the hi/lo
> registers. These were removed in MIPS release 6, so the build fails
> on MIPS64 r6:
> 
>   wolfcrypt/src/sp_int.c:4217:5: error: the register '$hi' cannot be clobbered in 'asm' for the current target
> 
> and on MIPS32 r6:
> 
>   wolfcrypt/src/sp_int.c:4418:5: error: the register '%hi' cannot be clobbered in 'asm' for the current target
> 
> BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS was meant to exclude MIPS64 r6, but
> the mips64/mips64el conditions test BR2_MIPS_CPU_MIPS32R6, which can
> never be set for a 64-bit CPU, and the mips/mipsel condition has no
> r6 exclusion at all. Test BR2_MIPS_CPU_MIPS64R6 for mips64/mips64el
> and BR2_MIPS_CPU_MIPS32R6 for mips/mipsel instead, so assembly is
> disabled on all r6 CPUs.
> 
> Commit d8dc5315eb71 ("package/wolfssl: disable assembly when not
> supported") introduced BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS to fix the
> MIPS64 r6 build, but used the wrong r6 symbol for mips64 and added no
> r6 exclusion for mips, so the issue was never fixed. It therefore
> affects 2023.02 and later, including all maintained branches.
> 
> Fixes:
> https://autobuild.buildroot.org/results/10c901b8c57f6322b127f1b14c78f73dbb7f28b2
> 
> Fixes: d8dc5315eb712eca0a5cbf793a6714a47ab6e57e ("package/wolfssl: disable assembly when not supported")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/wolfssl/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/wolfssl/Config.in b/package/wolfssl/Config.in
> index 9d173412fe..8eb789274c 100644
> --- a/package/wolfssl/Config.in
> +++ b/package/wolfssl/Config.in
> @@ -4,9 +4,9 @@ config BR2_PACKAGE_WOLFSSL_ASM_SUPPORTS
>  	default y if (BR2_arm || BR2_armeb) && !BR2_ARM_CPU_ARMV4 # clz
>  	default y if BR2_powerpc
>  	default y if BR2_powerpc64 || BR2_powerpc64le
> -	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS32R6
> -	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS32R6
> -	default y if BR2_mips || BR2_mipsel
> +	default y if BR2_mips64 && !BR2_MIPS_CPU_MIPS64R6
> +	default y if BR2_mips64el && !BR2_MIPS_CPU_MIPS64R6
> +	default y if (BR2_mips || BR2_mipsel) && !BR2_MIPS_CPU_MIPS32R6
>  	default y if BR2_riscv && BR2_RISCV_ISA_RVM
>  	default y if BR2_s390x
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
