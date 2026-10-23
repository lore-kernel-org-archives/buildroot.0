Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB794606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H/rc2tEa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA91A608D7;
	Fri, 23 Oct 2026 13:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8phnLIObI3Yy; Fri, 23 Oct 2026 13:20:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5EC1D60711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761614;
	b=rE1gM0eWVp9Gf/FvzvHx9t2JOI0ysUj43L/WzqTSnZn9wB8ZOpGltf93wrk570V0Ljyc
	 zY5biFzntX22mqbzZcnLJ003Hx8Q33apqlTcRPrt+KAuAOezMb5AvB9HHyAFGwtRtwgvR
	 VoBxMvb3KO4Kdmy0gEX1WilnPyjV3yf9+0ZwmD8ERTWKdTbSry7FNeMxxsmU+5MBEC3jC
	 D+MMmOIm06+iE6wbYwZcHXHxrWS+KpSeVSfpvyqV//9cy9nHbd3LZzeHkyxa2b4Z+KaFL
	 HtfzEfgM7YXXxzAktwAVo8rq2ENeEpLX+YszQzPu/IL6GMvuDrGS9s8kwsGT3BIr1ZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761614;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HZw+a2yAmNPD1rAtugqnUO+VhNnRyEulaZBNvhmDe6E=;
	b=APD3fNXLwBth6pPLodcGcmowdQhX/jzYklkTmpC7PXHTrlmXWObx2FWb8yXxVzF7B+QD
	 0+aYfWeAXMlO6o6mNUMVTAzH6wwFLKAwRdm2MBNdVHSFS8VH3TOIgKa6G9k4tkU7cvWrg
	 P2Nz5l54HQ/ziiw3ek5DjLZ0KiGr+MQfcY8utIucFaXrQITlsl/+Lhd3kjRPG/Wdc6lwq
	 P7KvU2uAjPzo7SOYrOpkkDwmgaCewpwQ8xBl8MNlpQqOqZC2qRB5iZyGczV21Q0IYzQx5
	 RdZZvlzdxcnfxTt4HHpE0S8y13KMFcccZOfFZHqOSXcWQfta8NmBBzLZYpFZtbF9y1w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761614;
	bh=HZw+a2yAmNPD1rAtugqnUO+VhNnRyEulaZBNvhmDe6E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=H/rc2tEay0RVOODlXi71W5UqoKT9abFXUMp9NRIl77I40M92vD4/7jpO7OiSeCxbm
	 KcfAzOMr514eBzKyBXufFrWOQzPrKIrR3AfsxRzuRdq33o9ISBy6oIarxZz4pSCFjU
	 jtE5/drDV/yIaZC9ctx7m/zYJj5m4vF1tWVcoCGZKmZxg+7ZkITIYBt/iZ8pIBtOAB
	 /Eo90KbEQxaimC+VpO09wEKFfmYn49JUYR+Duuo3u/ulKcaJvWclX+MDGJSzUbXbDp
	 8b/fUJDFGpZ15+ucmUZPh2sG6zs8caeDGod/M6JgD6hWtVPdUleowWINCC1Q3GHbwH
	 HU7TPY0pzsuNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC1D60711;
	Fri, 23 Oct 2026 13:20:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBE7D356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAAE360903
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ii2hEJAdx5ea for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 30431608EB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761608;
 b=nnGuU6xeSvI2SMGeZKHsYpJ03bKieA2YTgWspwzHrG5Dq8gfdSXeyhfvJxuyc9TmvxcH
 +H+ZJjlSEcyBVhFgYYd6j2evWNiF1tY2oZ3UfOVw8mKS+YoleJst5XdxUrtX+Q2N9WMHF
 z4ZamjQPFgCYEo2zdovqZgpKPglvFFZyoWCJHRAunaz6Ij8il3+iwPyyB6EiBwP2VkxaU
 UeV624Is05CaT36WGQ2/gI13fLahV91j5SUKLM6EWu/QHmbMkly4lD62FoGWcOpgTSsCQ
 KipaaIs1hBdKFAoBoEpauj7xYhUq0BnsH4pSElXq5DKQ3XklIyMTjRdcgNjJz1KYJyg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761608;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=1jTezZQNyeJVWQoh7GFi6K86mgkiYBlpyJAkvMPo6WY=;
 b=WwCqtGJRoRjLs9EI+yCDlS3Tui8Kxo6TIGDY4uWLc1burLl56znDohG5PzGRDKT7om3s
 LZ9T86zSj8XKn9Vh35HIgUM7pzvCugCTXeCl7FThnddvx+TTEqqIbWszNudgKDm8qyMjB
 bU9gA9SVdKpkzsjcUevoF25ylCUMEvjyX5ZdfATxi7tkcnaPCe0FyotxxO7XMvWVawJ8U
 qlh6RihHtzomc3Qyordvcst3n3UlRXve6DSZZAHGA0ePq0fC+AY6oxIKMH5BShEUPZe7w
 aNNku3+wr9kUdesJ0aK95RabyPQkeZeEKz4ZGSsEqU6Bg/T0Q9uD7cKAl5EZOP4IU6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=I7u2rjRW; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30431608EB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48dfdd0678dso624781f8f.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761606; x=1793366406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1jTezZQNyeJVWQoh7GFi6K86mgkiYBlpyJAkvMPo6WY=;
 b=tw9Ix86rlxjYVex/ku747YbX85EN8g2mQzX/CglPpDUVbyZW8peFQG/2yOCP0S3ofF
 TOyHSK9/jg0C0N+l7bZBscv+6QIBUmSVglJlvSAb+CDtU3OnXN6zNfU3jgrlKlkZcv0f
 yJ8aCSiJiImMNCsmdkGhRJNgbg4SVwsDgaWdyWXgHyHYoT4Ei5+Dk7KD/+S9PLGjvZry
 ESvREoY6Fdp8fvfclmWSC0ZDe1mi6muDXzNEj5w84hF5pS6B2/Dd3tB27kSo7KK9ttSg
 3lbpsKtXWQMFKIsbEU6qz6lg/S4ZNt82/NEuJ/FXYXfxVvDoC1fjEkbzux+5iWYRG/f6
 gthA==
X-Gm-Message-State: AFq9FYJc8LphuTlpaGUnOArkkT21QyOiM8MJXANW96MCK55KNZbw3++9
 5tOhJcGD+3JL1sA2B2S0BglkaYs9gTzgMJyriEKzdbjyELASswD8WryLKHxU/L8P+JIJVjeeq96
 WvkYk/kM=
X-Gm-Gg: AYBFou1Xccymzk9XPTPJjlvhz3sgZt7ZO3NxoJO2+IAc4VtuaUXaLnMMc6O2r+Pkg0p
 gsFlMuEpsIbWV47PIUM4D0E5QB7R4CAuvP4v6HMTtFiF2c4RleoxCXauW4DnEb+lXW08Hkb1oJV
 m94zG6a8mx/Nxwjxg6KUfhCLMPl2TcHtTfB+32nNrCttV2oWli8pAE2dasbgTMxaeKTUo2kkSW5
 SAttNCgVvHP0UFY9FLzd7ordlzkgn+v+CehuB0BRDOzL9SDKT949VTWqlh/zpjBn/32+XNDsxKc
 tjeoit2ykfGQPzFwUyR4bZjG0eUhujROcuhiuzQv5dY6dTfEz1TZuAS68zcHp/4LNO5/+26nBKd
 4QD4iKDK0Dq6WyloLB4rcwQaldd8ZVzr5uM+s/oexXnlQn410d65PqQLwjdcUBvgPTVCZPhVROm
 APRv+mhUhnQrbVlXz2/Qzpv7NXRVsLcd9usntPHdOSoGMc8oOHs1z5q0Y+YMHzygi53g1qpkBBD
 FB00XvVSxAbsbTk1eIVH47Hwu9Ujh/tHffcP96Su9aKm2w6TqKGYCBRFw==
X-Received: by 2002:adf:efca:0:b0:48d:fd1f:9a9b with SMTP id
 ffacd0b85a97d-48e385a2466mr2941267f8f.34.1792761605779; 
 Fri, 23 Oct 2026 06:20:05 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e38056d3asm4508407f8f.46.2026.10.23.06.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:04 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:02 +0200
Message-ID: <20261023132003.1606624-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014164625.1474866-2-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/3] package/libtpms: disable building
 manpages
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
> Libtpms builds manpages using pod2man, and fails if it is not
> available. The patch adds support for --disable-docs, which Buildroot
> passes by default. Found while building in a container with minimal
> dependencies.
> 
> Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...ld-sys-Allow-disabling-manpage-build.patch | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
> 
> diff --git a/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
> new file mode 100644
> index 0000000000..20849db49d
> --- /dev/null
> +++ b/package/libtpms/0002-build-sys-Allow-disabling-manpage-build.patch
> @@ -0,0 +1,61 @@
> +From 6e688d2bd1e6e1545fdb25bcfeee28f78240cbfb Mon Sep 17 00:00:00 2001
> +From: Fiona Klute <fiona.klute@gmx.de>
> +Date: Wed, 14 Oct 2026 17:31:09 +0200
> +Subject: [PATCH] build-sys: Allow disabling manpage build
> +
> +In builds for embedded systems (e.g. Buildroot) manpages are not
> +needed, and building them adds a dependency on pod2man. Allow passing
> +"--disable-docs" to configure to disable building manpages.
> +
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +Upstream: https://github.com/stefanberger/libtpms/pull/641
> +---
> + Makefile.am  | 5 ++++-
> + configure.ac | 6 ++++++
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 03ed7e65..9d0ea053 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -23,10 +23,13 @@
> + 
> + SUBDIRS   = \
> + 	include \
> +-	man \
> + 	src \
> + 	tests
> + 
> ++if ENABLE_DOCS
> ++SUBDIRS += man
> ++endif # ENABLE_DOCS
> ++
> + ACLOCAL_AMFLAGS = -I m4
> + 
> + EXTRA_DIST = \
> +diff --git a/configure.ac b/configure.ac
> +index b19db106..0fc928c8 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -282,6 +282,11 @@ AC_ARG_ENABLE([test-coverage],
> +   ]
> + )
> + 
> ++AC_ARG_ENABLE([docs],
> ++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
> ++    [enable_docs=yes])
> ++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
> ++
> + LT_INIT
> + AC_PROG_CC
> + AC_PROG_CXX
> +@@ -392,5 +397,6 @@ echo "Use openssl crypto for  : $use_openssl_functions_for"
> + echo "Test coverage           : $enable_test_coverage"
> + echo "Static build            : $enable_static"
> + echo "Statically linked tests : $enable_static_tests"
> ++echo "Build documentation     : $enable_docs"
> + echo
> + echo
> +-- 
> +2.55.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
