Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C5606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=reiRA+Yb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E743F60709;
	Fri, 23 Oct 2026 13:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWPaKdTPyY5J; Fri, 23 Oct 2026 13:20:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 05CEC60711
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761619;
	b=VNDNwoAEKbuWqJ4kepGAVadpY8jlgXQqGc0iSgmGwju6MSNOSkjphNAynQhJ/9RA3z7b
	 /weoFoCKwrAKm9mK7XXfYZZqaIO7exi/7ZbZC1ZTl5SOjZF0ig0x/nt1kmXEWf//NKf6f
	 QuEIi8OGu0ryiDq7afMYceobACbI7AXspDgTD5/q09ejCOquj2n1K2a8Tn4NH/7Nm7cEV
	 +tP3GCFgNhH83K36bmcSemE3ihTdz+PaJWpEnNQxorbtgV6z5gK6vrE/kqqDt+gEQ6L5g
	 wlVl0CZhAUn6L0ieNJyeIJY2T58UfeVAYLD+X/lhkoXWOmxa1zcSTy6NEArBC5PhCkg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=oWOAIPya17sOAqHGzzsmmH2hFujf3kTV837Jd5XHkHQ=;
	b=F2ofQWZb5DVAGJni8FPDi8srUgSwuLNgP0TIaRXf5mzo9/hHqDNPV292h6+yxDQmH+MN
	 zAcTT6YgRf6O/QBuRf48ViE6fSc92YxPY32tW+JlCq6G6ELTq2afXlDM+evqI5SIduqgM
	 /Q2O8/yJkiywi78S874yy5r5mi8gGym/J5308Miy9y0g9vNb0zi4yHsRh5R03xZYKIyh2
	 Kl8jD2R8b6gVNENI395WO8r8L3MW0a4s8xIq5WmYzv0gU6pxQtRC/TpZp1+TR1/PMAvtM
	 cXZmeKmcKE/ocEKM58NfwDtzrSktJDwOz5V/tzJ/5Jgj14sbTUcnU+YcW6vRbqFjK+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761619;
	bh=oWOAIPya17sOAqHGzzsmmH2hFujf3kTV837Jd5XHkHQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=reiRA+YbQ6vEFClJq1YR57+nJppgMyjGNWv7Xcbi9NO2DVPnC6fsMspU1e1QBaJNF
	 Ryexfp151AK1LPkGjn0SL0PAYLYYUrFzQTA7tveu3rCnSYCeCoi+T6fKFFpNaHjquw
	 qkMdIfyQMatuUoYOkAwMkufS4lzfD6uL0Vz5x4dLt3OoM5bv79pOohMEACYT4Unr7h
	 BB5l2t9WM8yx+xeFBeAKJyQazsLkCfmQK1uGzT+PaXcmdX0oHexQg+V1lfzIY2v3UP
	 bz9FgjJHXeuTq1RgMf/bRoxne+gfN84lljcN1jgJhKkIioHlrpeiJ7x3O2gl0fH2iE
	 nidmLocrnov5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CEC60711;
	Fri, 23 Oct 2026 13:20:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 566F23C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47209408F8
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMBkvf0xR1nV for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DAE5040981
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761613;
 b=j+GKWz+tPt/SiiixJt8Su5ldQR//MtRyY50pPoRJrnFhAy3eJNxAEBZ9iftrgJJTV1JH
 h7+Fd1NcBO8zxi4o9VQfuayXDJjkMUpUIaoleAgY/6CG6FU9zdsUC39tElHe6J59XQHR/
 tuDCT88GmnovFjg9IVzEd4tUkzJlfmo1G8lcnNZdYpYIs4Bx3r1Kt6dvLQdgipf5ZHn8J
 co8wprUVE/ntwh2WIqK51LZxnCFcZP/BMfdTcOAws9C3XDKKhN1KPjz9FELBfVwZxBOgI
 r/jiJFMgzujxD1PQ7Q/xBk13CA7AUNY4AvnvOVAqBUUH6PBB9Bj0xaxCP6IyRG1logg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761613;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=w57CGZUoxsGupcUcTuIzfhKh0nZjAUWq4OD4KZM1rg0=;
 b=ZEuURlwyDsEsssrij7nFqJfZKzr2Hy12hUy4uI1TKajJIqiVlmbx4wHFgemLNXGK5p8q
 7jSYgJBhbtU/Fym51KcJziN732CiBt5FxZ5kGXBhFPSnKKbechQ11TzzNgyoRuZ7wQq06
 HtMYgY/Aa7EzZrrTlOlnIsUE2bIj9iled6JhP0QGv2Ai5fcuB+dzQVljQBMSxtYjcjYpk
 VO+AB8UwINcL1zDbCadOWpeQjCF+cOTAfZKmHcBHQgDiWNodTeE21pOwGVsLZ1L14Wvmi
 8Iaqzt20sPUDPXkF5uB6ZUN+yuYpiSb1xwyYwr700bgFb+trTBnvZwfczTLO/fuF4Ew==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SSrXaShL; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAE5040981
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a207b02a2cso5942185e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761610; x=1793366410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=w57CGZUoxsGupcUcTuIzfhKh0nZjAUWq4OD4KZM1rg0=;
 b=Jj/hlsY1USxBAXBWzDs/yIJcwNdVZnNgAJGpPfUmFBN6QWnjoXCzVfBAFmvrWx2p1W
 QSsaDh8kD0lVYzjxGtirgoR0eanLnkVIlkt8XpPWcMI9gnqGw3BmBx/ktBsiQ+1To4WY
 /B5+xB9J+FDxCTokkuGAUBkwaKwsQ24MSufCbO7hbKTtgIbu+m5S2sr+9yM9zzeeV8jN
 ThSLeTTMfqr/AZS25e9afQbG3CoxZO/ECCJG7GGMOTvEGfK9Sjuv4rtNURIBHaJxztk3
 cDtEHg5XX51gIoXc/kEkyRkHN4dpaSB7GtL4QDnSn4TX3gMeTSQot06VZQW1QVkWAJgq
 H3nA==
X-Gm-Message-State: AFq9FYIPRLOk/9DQx6SWoOoxLg+xRlrhWwxjBX9mJCuTIrs9UfBMIu90
 ol2aeDNDkvrGh6EO1VNMyDrx/t5yIMMPWk1i8lVUfHrYYlbiykURKXChg80UKVn6cghBe9o6+90
 HtRgYzmg=
X-Gm-Gg: AYBFou2Qeudo3zGEjr8Ar4AtIWMlBxth+wh6g51aF4ynl9olPkx7eWE7zjfDClMmwV7
 CgtpxtqmG0Q8gvoR8PNK07YgJ9e/WuYMcaqFvVKtT87E65gabLqStd17xAg6Y9bbhDN8VuOWH+q
 oDWRtBzmJj3fwcVfYXafbBjRhSdEwqWgaq/S+ql9XOr+2u9UyF+866jQfvcv27QnaR5g7wMNJtl
 FtPv4Y6yitmlhxOdhlg5D9OY/rXrn3lUUenQg/6v/9GbUwNadS1wT7x3pevHiTjvfTqTO1gMKjB
 1elQWNVxmug4K4JoW1xn6dpRVRCyKuV+Eh0kc7aQA8FXKKhJ8YizT89XuV0CO0m6CDS5Yt2dOaZ
 rAlcXfwk7ZHFe1vmluquCj1osamNHmPbb+Ce3MjNHN9yI7vtmL91cdy38bk5OEEKEHv7eyDiiI0
 xzFHskfWlFWhCvtlRPpFLWZEn32qc2nm8/FJjJD6qo1Uly5KIB2tqowcCWb4tTML6Lh+zK+bE/W
 7ynP9FK+rF9DCD7rU6nXf8XGP5s9UpNtyVmXjG/42WjB5aawL8nLZ6i1A==
X-Received: by 2002:a05:600c:354c:b0:4a1:7ed5:99e8 with SMTP id
 5b1f17b1804b1-4a211cb11bbmr40731475e9.22.1792761609533; 
 Fri, 23 Oct 2026 06:20:09 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a215364710sm18596305e9.0.2026.10.23.06.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:08 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:06 +0200
Message-ID: <20261023132007.1606665-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014164625.1474866-3-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/swtpm: disable building manpages
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
> Swtpm builds manpages using pod2man, and fails if it is not
> available. The patch adds support for --disable-docs, which Buildroot
> passes by default. Found while building in a container with minimal
> dependencies.
> 
> Fixes: 87b9b126d23be1e95b3d2b82438f65e28f554a87
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...ld-sys-Allow-disabling-manpage-build.patch | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
> 
> diff --git a/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
> new file mode 100644
> index 0000000000..c134b75c23
> --- /dev/null
> +++ b/package/swtpm/0001-build-sys-Allow-disabling-manpage-build.patch
> @@ -0,0 +1,63 @@
> +From 43eff71dc1673c252352c584e129e5bce312d173 Mon Sep 17 00:00:00 2001
> +From: Fiona Klute <fiona.klute@gmx.de>
> +Date: Wed, 14 Oct 2026 17:46:51 +0200
> +Subject: [PATCH] build-sys: Allow disabling manpage build
> +
> +In builds for embedded systems (e.g. Buildroot) manpages are not
> +needed, and building them adds a dependency on pod2man. Allow passing
> +"--disable-docs" to configure to disable building manpages.
> +
> +Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> +Upstream: https://github.com/stefanberger/swtpm/pull/1186
> +---
> + Makefile.am  | 5 ++++-
> + configure.ac | 6 ++++++
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 5dfaa6b..f7d15fe 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -6,11 +6,14 @@
> + 
> + SUBDIRS   = \
> + 	include \
> +-	man \
> + 	samples \
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
> +index 188b1a2..7156a21 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -509,6 +509,11 @@ if test "x$enable_sanitizers" = "xyes"; then
> + 	CFLAGS="$save_CFLAGS"
> + fi
> + 
> ++AC_ARG_ENABLE([docs],
> ++    [AS_HELP_STRING([--disable-docs], [Disable building documentation])],,
> ++    [enable_docs=yes])
> ++AM_CONDITIONAL(ENABLE_DOCS, [test "$enable_docs" = "yes"])
> ++
> + AC_ARG_WITH([tss-user],
> +             AS_HELP_STRING([--with-tss-user=TSS_USER],[The tss user to use]),
> +             [TSS_USER="$withval"],
> +@@ -662,6 +667,7 @@ printf "TPM 2 profile support : yes\n"
> + echo
> + echo "Version to build  : $PACKAGE_VERSION"
> + echo "Crypto library    : $cryptolib"
> ++echo "Documentation     : $enable_docs"
> + echo
> + echo "        MY_CFLAGS = $MY_CFLAGS"
> + echo " HARDENING_CFLAGS = $HARDENING_CFLAGS"
> +-- 
> +2.55.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
