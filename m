Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20436606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WaxnRgxP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 305BB6071E;
	Fri, 23 Oct 2026 13:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J189x3fwQt9H; Fri, 23 Oct 2026 13:19:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4EB07606D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761579;
	b=iVVYR1mElXnKKibomBrUTdu0Zt2ffitHeR+0X4S8Tfd8SKA/yBUw/KxlXVhNvYaSSvdN
	 oFJ6RqcFlFhRbCU3f//iMl65yrk1H5DXoav+q2O1KuSQzF1/eZAi9DJ6bnTgfRy9IfzPL
	 0vy7tf5zV2ovN9Wad562XUUuVtf7UyjRfbEbfa2TaDA4Q0ASPL2uz0VSDM2iCWCD9IoSD
	 +bU1D+OTgBkz1HsGoSBYOVm4tzcKkASSi0lXHdGHVI4mPGT28TNocE+BrL+9Z7gT2Yocx
	 IYAY9N52Df1w6BHOis+CxbO0fDRZQqSaolQJeUmBIhIt9j3FJT2pBl1SVk9N9z7Lkvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=I8W6IZtu+CBEG5AVv6nsPWbM3g6I6N4e61H1f/zCvKo=;
	b=A6BydnpbLdgsS6GgHyKjJtB7FZJv4fXaraUCLuGAQzzLOzoVPRkZJaoSlk3O/pCYovvt
	 aT1zxe93VFJYsXAGeAV5ldHFKcH0XrxxbHrVRM3lSzY1iaZeM2x6ndBlzSyXsuaoTomay
	 ffNMfrVMMUlKkxCw4NVNHwXWvWwGbGJgLfyInt7b/JKfUisysrvFWG7nfvjpHiIu6v5A/
	 nH3IM6ePWax7NP7TnlNsfqQW8Ulbp9ZTBHUpn9LueV/pAmlJPNvXwrHj8TLuW0izWaF6D
	 QXqrXZgWjfZOBZBuwF4qyRaGguN3+h7Z+Gm9mlLZxla0pnJobVcrzYfhf0RNmF9CUHw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761579;
	bh=I8W6IZtu+CBEG5AVv6nsPWbM3g6I6N4e61H1f/zCvKo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WaxnRgxPyHmej9LZuyDtigDphovosJDmmcSoHlsdeKLLZ4QLEEGYcWD7XTAkoHQaL
	 1UoJlVczy5YLQnoPr61J8HUjPMTp98MZh4EEZ3Opwqk/iooxHIH8lDVZZS/qgVzdLz
	 Vs35n3698kuYigBisbudrqidZ7IrggQBrI/mC1iBT7fCvqFelIWE/x4vCtwHFtMmVd
	 O49vtYGAzZFwY4K+bDmO9wPx7HVGqvsciIoV8HRUsvYXPltUQOLnsxxmASU/e516nQ
	 DgzFxSseOC8LT5MN9r1jXhwOwAm7XfWHDSstFmIMPuuoHQq4oiSUdVNVAGspE/dVZe
	 mihYrJSl5Mz2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB07606D6;
	Fri, 23 Oct 2026 13:19:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E44E33C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C47408EE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u38rLNp4t95l for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:19:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 60F0A408EA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761576;
 b=hawIREGVVeXrswo5lwXkE0xoq3DVMTh1qBUwRMVg/vBY/afQi7o8vsMHKiC23nwvAz9B
 sywRHwv8HE/0mPwkAZzezNn1g/HOCHtwkOgd5L1g7cqrAag8abFgjGD46sDsOMjTLrgTR
 ciHWzwR7T2QC6xNp6GCmjxQBMdrxRDKVApz23IiuxQ+aD7Qd/tdaEZBb7akivx6+nbHBo
 wF/WobVGhgCpixQRYg5U+zUbJR0DAE0Ayikaaq40iJURCHZNN606VC1v8Fp1majZQdFKZ
 8U0xpLZaBrmGLd98LdK90ExxsNlv8vZvnpXMMaIjGCSr96Gg/yiXQF/WzLQeggAKDtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761576;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=KcKcJZR9HgQhMq82kK7DESNn1W2+8GwsWMgoKo4DL+0=;
 b=BYRktYM4vMpuSfS2WaSDNpKpCCDOZy1iSHVhrblhkXdEXXAqOhKLPM29UAdD8wA+eyGd
 hUg3nJmd/Y6Gr2zHDSIE0RpDwO2sQpRQPLoqzO+SS9/p9C+4xWNuw4Q1zV9VBIXqb5U4u
 ZTEnjaak0P7LEw0szkTIKntmEJ5hFyksY4X0go3QmapTZpIWm1g+9qSCacAuFYVi+UkEd
 RmEzIAVjioJ4sVPM5LPD4x3BYWVhWKueB71xAuY57M2ATDn5qFPwnvDKbNM1HAaCF+rGl
 BPz7/ySeR2h8yH1tm8mq7+v1o/sseeqBIrP7321836ZuSM3d1Nd3pHIxtDQJk/60/zg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ApaJ8cUQ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::429"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60F0A408EA
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:19:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so608815f8f.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761573; x=1793366373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KcKcJZR9HgQhMq82kK7DESNn1W2+8GwsWMgoKo4DL+0=;
 b=wyOQRdL3v5ZdiQpArEvPeqCVuRTjm8J1rgCpDbULtijpaANcCr2KFJy7U+WI22IvY3
 EGW+8d06CboYTwhg/qmw4Iyk2BFco4JxA9uP9HayG6KCrsODbKAjCavNd7krLj7DIIiF
 bUI90CFHzbVW6LlEFfiMuwspB7HARP4pG5dY3tL2pc92Ut+GYLtyzKCA8eYt0gnsCYQq
 ii1qg/5WaUiFqnVk13OYixANIo66u6AmjmBdktBsSc4tbg+3IQnArNQ8xraDMiNPjxAW
 dj7YD/HmkrqcrJCC/UcTC2hTWwiBVnTaSikiHAZy62sVKJzupfoCGjGNEzHjhaRWS8sZ
 Fn2Q==
X-Gm-Message-State: AFq9FYIBhKMpmDxLC1cv8fOagsENtogFiQiaZyx1taauihCYdyAMc8pJ
 VWHcY4mVnzk7lT7Jc++E6SS9YfYaqPLKMgs7vyXJKlyJd022BHjEpaan/Z+C3PQQxD/C9pLPLA8
 iKl76swU=
X-Gm-Gg: AYBFou2nVaSYwjIVKzGPiPyywdSdZfCuZfvpEjlHP69+96NC9E9G3ZVAfjMELXUMA5u
 gKey+7XtM91/N0FsdXRE0PMLEZ6lePxGkZji9HQnFBPgvsWHbllRQm1FUuBdW5s9ar3/JhVs+l4
 4xCHCk5AZeu0Hj3W0fM2bMPukOhFL3MEJ/kcXoKbGtulAg6B/ldVQPxCmmt53frydifSlb7Bwrz
 VZHxEsQAmdAd9m4a1a3LcTrvakVps/fLn+Nn1ZqSAHz5T7WnbcUgFUYnSSJLWxHuvqLIJpxDNKt
 MVNWUZk0/Jr2iiJYHjqf94N1/AxUvg7Vx6JWvLJnH+A1M2rr2LOimAgzyOLIE4nAlI8Bmge6Wfn
 JA9R5KQfhwp3xBIpSz19iRlb6HTIOQXFWq/6Q2kHpQ0B/PI68i9p7y1AbTd0MpyOQkfHDX75Zw+
 XCTTYWN4oI4DJuf7YpHl9Df2L/1ph55Zl5g+QlUlD2DpdPW2ZdIECv4kFoYll8BJaHOzIydSx82
 kLg9JVf4aAkKxYIonv012zT5RvHfeDI84QFk1z4YzSPmpkXDkmUYM3i7Q==
X-Received: by 2002:a05:6000:29d7:b0:48d:cb76:548f with SMTP id
 ffacd0b85a97d-48e3859a7a5mr2309841f8f.38.1792761573439; 
 Fri, 23 Oct 2026 06:19:33 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38025d76sm4990956f8f.13.2026.10.23.06.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:19:32 -0700 (PDT)
To: buildroot@buildroot.org,
	Romain Naour <romain.naour@smile.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:19:20 +0200
Message-ID: <20261023131923.1605754-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607213030.1509913-1-romain.naour@smile.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] configs/sipeed_licheepi_4a_defconfig:
 glibc needs gcc >= 15
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
> The sipeed_licheepi_4a defconfig doesn't build since the glibc version
> bump to 2.43 [1]. Glibc increased the minimal gcc version for riscv
> w/ ISA RVV in commit [2].
> 
> Select gcc 15 in this defconfig to be able to build a glibc based
> toolchain.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14728914049 (sipeed_licheepi_4a_defconfig)
> 
> [1] 227378b5930b681c79a13476ae60a98753a98a03
> [2] https://sourceware.org/git/?p=glibc.git;a=commit;h=47975914fb106b83c42bc0baf6435a0944a23d30
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.08.x. Thanks

> ---
>  configs/sipeed_licheepi_4a_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/sipeed_licheepi_4a_defconfig b/configs/sipeed_licheepi_4a_defconfig
> index c7867ed05d..602cd50e0b 100644
> --- a/configs/sipeed_licheepi_4a_defconfig
> +++ b/configs/sipeed_licheepi_4a_defconfig
> @@ -2,6 +2,7 @@ BR2_riscv=y
>  BR2_RISCV_ISA_RVC=y
>  BR2_RISCV_ISA_RVV=y
>  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
> +BR2_GCC_VERSION_15_X=y
>  BR2_GLOBAL_PATCH_DIR="board/sipeed/licheepi_4a/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_TARGET_GENERIC_HOSTNAME="licheepi4a"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
