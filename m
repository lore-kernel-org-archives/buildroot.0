Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357BA60A2637
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VLVrPjxq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E66560E52;
	Fri, 20 Nov 2026 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Kt16Had86hK; Fri, 20 Nov 2026 10:01:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 372C660E3E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168863;
	b=WeV2mapRPrlvMbJ+BIKAf4qSTRV5O/NRz1Nl1DTcGF//qU1ewq5SGKQKc4YGz6FfhHHV
	 pWfogmH621MebJDJ1MWt/L2BM4Ionqcz4h63U9lTqXDmmOE/UzlP+cOPNOyhqhGM5z480
	 C+QI/Wzx2ANlLsqQnsGliB9WGaOG1ckhxLAcpkI34uc++XP4F0LDzjCVfppX8A6SWkEhH
	 FeQysGjIDH+k/xv3L+/GdaQiFGd1dIqIEByCZy3+of0Jy1wWFbVUyfsd1s426c6pXIjpB
	 GLxGKAmRzFrCFouEuRR3Lxaol4ImqKhg5cZTCs4xTS56afhxduYkmr1L+YV3XR5hu0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168863;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6Ech274HJ+l2722SKTcC/OF9UfDJtQIwGfOq61qNp+8=;
	b=TYlC1zfoVUe12T8ZT11t001b/gfLAPxHswnXsof7KiEVfVEIakmiEtDoQRjLAypqM5S5
	 7usc6rsM67bKqbHYea1OiMeUL1hAkd22A4XF4pNLiNziigRzX6Lf9fYhxMWUJIyn3jWMd
	 yQ39dX775dD9yjrYk41nXizaZNP1Zdaq+Ra+RQI/vIjJ44mCYwRp2eset7n9DjT38bZtT
	 ikI2eYeQrQdwGdLNUWY0U19e6x3TziB3WNjgQo6knhNlLQCalUa//YmA7hUe8K3vGU2PK
	 eHCs1ZocWnTk/SBovU2v9zKcCFrVCUIoNmUaYWaW5+6ttEBDbBJWQ6X+OIgfnORn1nA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168863;
	bh=6Ech274HJ+l2722SKTcC/OF9UfDJtQIwGfOq61qNp+8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VLVrPjxqeW/eaaVipX8hzU8yBgAgxQO4Lah/kpdOdVS12wcZSTEqC/NnX8I3TTkC/
	 vYGdu9qEb5JwxdUQX60wV+JwRYdsrVaYNJ/j9BDmlGaFNG/AXT5Y3VcAoYLoLUnQ11
	 BbUg8kniupzeX0s4EeC9dw9nuNJu8lDjEZzrcNm5MlJ2X490KucJvzuJz6AFxXAXkX
	 a+1aqQOVHg3+FL8PzqSxeNV4RE2lPydEn6zKPbAZ1+pyoq/x0FKm9ndWIqzLdabbYB
	 +aZCBhwwInJSPlAALUwiG0/EkrTCuGw/rmdYVtb1P3HkswaDlrvaE8yNRh/T01u+kc
	 nxpi8/GXRGiFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 372C660E3E;
	Fri, 20 Nov 2026 10:01:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA7EC169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AC4C4016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ju_N9Eo2NzeS for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:01:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7EAE5400D6
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EAE5400D6
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:01:00 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4bb606491faso3344065e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168858; x=1795773658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=BDEjWjsq/efcmTu1YAjChsGGxqblybvpD68jYpSKalM=;
 b=W+ggJpVVKkUssl+7A0nDX95vgGcxBL7HudAyEZgF3fsRT1TYcQxRwOioIV9zFr+Nq6
 vSjb/fjowz0wthbr0xIkvnrPXhICXMkFVe3UqErU9GdJfLVjC9VcQ4EvqSGIta1wPg3E
 aEPqABuVqcyxTa+NKHh3IuS5v7XjoYJe5WysgFR2z3pFeuElQMYq5yGFOA+mzn5l/57H
 zl+DNt2EhJGyewYhoM/B6hbGNNKEO4/Zn/GV5jkLNmsuSuuV+DF56IJEtzbSyx+ApN94
 zb9OuCCziMGnuW8hlmouCPNiHtPNe/yCjc1cNHajrPcqR3h8BP3zbkg+qNl0xHqCAMVQ
 s8gw==
X-Gm-Message-State: APuU4Z+I40izX1ZjajjvdKAJLguY3eZgw2F3MUwkr13YjX6cI/AJLnb+
 A+vIKTL6WlpAnuA0kCaVwu4EpiB3DcH2v6PznKLK9X/1AVSu2Ye9W6Yu9VhWFX3TfJuu5kvizpK
 IonjSEjBrhg==
X-Gm-Gg: AYBFou2QT1LNsLCxLKpwE7yVyWg7hKkOma8kvy+N6sHwvF6ujBuNQOX19f/PRiIkDn/
 JSyeRx5ipBAaZvGGszOD4DBqMlbrqvyCwgcB5dO+RBDxsYA+JotZSxZtnfS6vuAKT2voGJ/doEo
 Xa1q4Ho8vu9IN7+bTWX4Y8+U4srdqbln7eeYRwmkdRvlQBi50qfeiJWWNwP6lhXmI+zSKG8uuoH
 2aPCMVNBx/PsoR4aK/NhKS0yY8arYoUR4yYYQs71gJPmUJ3lFLTNZmjahvMBODNlWDwXCEdL6sS
 9eVQt4W0WgvYUxHQfe0Rz36CweiP7T2qfdiWU1ONrH6L2a+B5D1LcaXPQgTOb+cHAjM6eTrqa5G
 5CAU2X1FqADXFnfGdVpyw3caeHxVuS0kvQUsIPeI9SaNqSIuvEfU+UsmM/65kcNtkysZV3yK2GO
 2jjgOcRtyVYXkvL4qc0LEvUBn9xStAKrCsrLjI4BL3iG1g1KV1bE0ghSrsbiVME2B+IMhYbtA3Y
 A3TahsZPvy1BVokccETJSrfGnhWofrBf9MhrTN4Ge1wYMpMVOseB1jXlr9K/61xVO1RG0HF0ZyF
 JCitoBp86zcLi/RSnNUZGY/QWj1SMg==
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id
 5b1f17b1804b1-4bb8881c5bdmr56908385e9.20.1795168858159; 
 Fri, 20 Nov 2026 02:00:58 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a1e8bsm89121425e9.9.2026.11.20.02.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:57 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:52 +0100
Message-ID: <20261120100056.542433-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115065803.1426249-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/musl: fix build for POWER10 and
 later
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
> When targeting POWER10 or POWER11, gcc generates pc-relative code by
> default, and the resulting C functions do not preserve the TOC pointer.
> musl's powerpc64 assembly calls or tail-calls C functions assuming the
> TOC-based ABI (bl without a following nop in crt_arch.h, b __dlsym in
> dlsym.s, b __setjmp_toc in setjmp.s/sigsetjmp.s), so the linker cannot
> insert the needed TOC save/restore stubs and linking libc.so fails:
> 
>   dlstart.c:(.text+0x24): call to `_dlstart_c' lacks nop, can't restore toc; (toc save/adjust stub)
>   ld: final link failed: bad value
> 
> Build musl with -mno-pcrel for POWER10 and POWER11, so musl itself is
> built as TOC-based code. Applications can still be built with
> pc-relative code and link against it.
> 
> The issue has been reported upstream [1], as musl does not accept
> AI-assisted patches.
> 
> This issue has been present since commit 3523e1ac79c1
> ("arch/Config.in.powerpc: add Power10 CPU type"), which made it possible
> to build musl with -mcpu=power10 (and later power11, added by commit
> da1b45dd00fd ("arch/Config.in.powerpc: add Power11 CPU type")). It
> therefore affects 2026.08 and later, including 2026.08.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/1342da7c9258a93eada96f92f53a643e316ce7f6
> 
> [1] https://www.openwall.com/lists/musl/2026/11/15/2
> 
> Fixes: 3523e1ac79c15c5199a15589692e269191abd546 ("arch/Config.in.powerpc: add Power10 CPU type")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/musl/musl.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index cb9f7f8870..b6e0ae6d97 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -49,6 +49,13 @@ ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
>  MUSL_EXTRA_CFLAGS += -marm
>  endif
>  
> +# The powerpc64 assembly code assumes TOC-based C code, but gcc
> +# generates pc-relative code by default for POWER10 and later, which
> +# makes linking libc.so fail.
> +ifeq ($(BR2_powerpc_power10)$(BR2_powerpc_power11),y)
> +MUSL_EXTRA_CFLAGS += -mno-pcrel
> +endif
> +
>  define MUSL_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		$(TARGET_CONFIGURE_OPTS) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
