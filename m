Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C6F606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dvU6pxAv
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3878760E50;
	Fri, 20 Nov 2026 10:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q5gEWARToNAw; Fri, 20 Nov 2026 10:01:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4DD1E60E3E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168878;
	b=m111lvXpj4sZdB0If6KAM4EQKhr4lPl9MQ86vV9CKi8CaJg8NS6ymySZT8fNN8RT8JJo
	 QYUbKZ9Bpfb+BmSf6v8JtmkHFwsbdxPGO+TjyRbnofdXjmLZcT7bZJFtPV722EBIexhli
	 3aDwzndnzh9ErWzxLdl6tRbDiHghOJdbwrZ932gWZkENXz6M6rolWFOOzuxaTVCwmGZmg
	 NbRld5lWCTlCaXaL59iUvWO2sxBKywQjQnWEK+CUBptpC+2xsmxZYcVUx7Y416XClilud
	 T43SV4YfxvBQbSojismXwRxKKQ8bWgX4G1HxQHz28c1cXVRvlqa1unWAwq5IqcR2hLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zq8TguSWcOzgSuk94csyJTJD2bPk1gnihlweTqBgWlM=;
	b=aESfFMw1DKV6lZe9JELj8HnuiRiuu1Sds8GDDgUiBDCW5uP9PQg+8D+wQeXzsFShks8K
	 3FDCjB9MgohU53b9z1WE0U07dNzhHOT2W3mnJHAC4wSacomj09keJMrgqMFL4yG/t6ati
	 TMJPiovxBQjhPJ1bQ7QVzHn0rxzIAFKZCQfCU+GmOHQlczRpLr0nMOi1JUEbkENqr/GtR
	 y9KuUBzSc/Za7U01Q7PGRaIcP31C1sJ2LR5TzOhySee3d4aHbMkZpfe8IlTyiNchgqIxn
	 0g4Vwy2rirmdhqF1ySyQSn+VeQS4yT23XO+Ote98tn98CMWMr5PJ+updbkoFmWNDu/Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168878;
	bh=Zq8TguSWcOzgSuk94csyJTJD2bPk1gnihlweTqBgWlM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dvU6pxAvbhswkZ3crN1OGLC6qgJfoFug/g9XdYpJJYyJ996sRyIt8sqPyXZY7Lge9
	 aiQyhq8QvRXgjosa7UqFX0Z/BM22M5UrzFcwEV6SMOF/fTakj19/75ecjU9eWRBF/d
	 4rU+7EhUEwLftbKNkP+G5i97u8ALnIT5Z7xuo6qDPBM0XjOKcgx1LPfkjRSXPi6ViO
	 GyTqCtCBfxUhX0wZsSNevNxZHS0TEbGEXD+YfgpOdyQHNAy/XLeohjJXyBgCQ5DZXu
	 NqbO1LEJIEISt1QW3lQzGdKBTvLiQUA+70FrxryJwkdPmXMnYBQ3YUo869ty8mrp25
	 8QGIw5uXwQ7mw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD1E60E3E;
	Fri, 20 Nov 2026 10:01:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC702169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE22F4016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHe6F463kuiA for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C2387400D6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2387400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-492f0a1b685so454873f8f.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168873; x=1795773673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rJ9wm+kfh5neLp95Zh0AGqDNRdSGXAiSnlJ/XEfQw2g=;
 b=CsyP/nNpUOHasWWmZw/z9MJPdnh97zTGaGapzGlWOYYcrS28ZMNwKJuBo1RtWTSPij
 BFoQvqQMxIRXLwD6kLXkRDEqhVS0nCLojXqBuejrO52rT3CJ9TIBGi7xme9xruie9E1Q
 8wbgt6vbjbTEaYDQj/5u1QABXB5wM5z8NwfC6xGFWYtucv5QS35krkkPqDFRncHBItnb
 +6rj999e6pLAeAV8txPMv44orDlNL6Q6LnKwXePR6BR8UTGEMazRYuJs/xnivro9glQU
 RxP+HpfgVrRjK9ap2lpb26k3yG5sLPNX1kYKJDD91oB5fecsTTDWd/aYcXSqLCXjSjOM
 CO4Q==
X-Gm-Message-State: APuU4Z9ZJXpddxGHoAIAquuKy0X13XNWwlONVgI9WkKtR0HDYDMlPJeh
 d48eSwiXzTtdqVE8k0majlpiI2uqQ+wtln++nt7SlCkdpKEXmFyQwi7Sfi1/xDxQaIZt+iS4utm
 +ftC6Vksymg==
X-Gm-Gg: AZFdTZdOiNq3b984xZFUyBSlgsjgGhIzDbUGV+BKubeiExZH3Ywpib9vKQCSU252S6H
 HLRBz15zDR5zyJZ2sPCrswsIcZP/1h1xbpJvYObQqEJwbo45iOVTN60DHKsQQIy8O3CEcn8mluW
 kIjGqqAn2OhxGRgCdWcc5jl1GD3YSoFOB5uFzJfKRVMMz1Fw7XAo8+84hhs7nxfKU8EktejoK9O
 fkz7Sp1t4kTGfs2xkavuPx0Xru0o3DpVxYR6h0csqdreuTEVY6mWKRpBHGLZLAd7eiOxxnwwj9J
 2DpLbqkR/gzv0T2/1OkFJYUa+YYV3R74/Yf+AH/qN7SqQhppfmwmcYXSrOhMU59e8VU2Qdt8WcO
 kEETBSViHSkXSXlDPs/2b5Jl8QRhjv8p0VcPld0N6Myv7nKZ7L/OUwnnY3BzB24bgK7wLK0/xmD
 AkUZy666ND7XIxvDiE6HkRZ0H7ZPWb8o1eYqsaq62KvThT97o2eIIa4SbThQZAulBMf/Qh+8QQI
 TOo63v31jkGv/tG00buwXPIMjAYQylCy8soX7q7wS3D1929Vee2xY2KW9FG9RlIZvDeTR2DkY/q
 yfCg4seqquegc4VVAu63dQoUpXD4F+fyEXUXPsbmUOWT
X-Received: by 2002:a5d:4b8a:0:b0:4a7:b8ab:df75 with SMTP id
 ffacd0b85a97d-4abb4f5a070mr3897485f8f.44.1795168873199; 
 Fri, 20 Nov 2026 02:01:13 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f281sm4323436f8f.22.2026.11.20.02.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:01:12 -0800 (PST)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:01:08 +0100
Message-ID: <20261120100112.542738-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115123005.1448809-1-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_syslinux: fix
 test by selecting BR2_i386=y
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
> Buildroot commit [1] changed the default CPU architecture from i386
> to Arm AArch64. The test configurations which were relying on the
> default i386 architecture are now failing.
> 
> This commit fixes the issue by adding BR2_i386=y to the test
> configuration.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158062
> https://gitlab.com/buildroot.org/buildroot/-/jobs/18033158063
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/86240fa45d11e3388968520b4a35f0a40954c132
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/tests/boot/test_syslinux.py | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/support/testing/tests/boot/test_syslinux.py b/support/testing/tests/boot/test_syslinux.py
> index 17fe904263..8e3820e9d9 100644
> --- a/support/testing/tests/boot/test_syslinux.py
> +++ b/support/testing/tests/boot/test_syslinux.py
> @@ -4,6 +4,7 @@ import infra.basetest
>  class TestSysLinuxBase(infra.basetest.BRTest):
>      x86_toolchain_config = \
>          """
> +        BR2_i386=y
>          BR2_x86_i686=y
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_I686_GLIBC_BLEEDING_EDGE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
