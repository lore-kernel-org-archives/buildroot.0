Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A883606A335
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aIjeXjpb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170B8409A9;
	Fri, 23 Oct 2026 13:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eTtWxf5yQE7; Fri, 23 Oct 2026 13:20:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2E60B409A1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761644;
	b=Gu43Xrii8MgGat1xz/N2+tSwVEGhAnHakTu1ckaDw78x2FJQFzVGPklLd+6tNz26JkBj
	 +khFcs1RdRDfwYxynv7bxlGmaawi6YOLva1QINoQkMYNxC/s2fp4xuhMC2SUteVgBPVLl
	 575DD6h7kfHB1IJom2m141JSUo00kIX97kRPc7toPbDkGgkzS71KFyLmrW4BnziU1eSwk
	 3a/QEg23nUC3MKHE4R7pemYQ/ukNojy3MHuMqXtDnUAYb5DO4JLCEttOPL8Ziak1pUtpa
	 1LjWYyH+IFqk2sxxv056Tac4pKIuKBtfWUnW+1wtsn2M2+/PgbJCej3LjyFJM8lESLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761644;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=SWdSOyDsm/qaRD7LoawSieAS+kL67uDatgEPLjB/dSQ=;
	b=WogKTLJYWpsGlEzlJpXtaeO7/plKX3iAL4BknzDPV+Ac6d+/s6ejZOUdNqvNlJDrk9sR
	 eMTexpN9W9SO9kB1/apDm/4LMiTAuhXpuH3Vh4J9PUpCrKrrpuC3+x9l4kVuWiO0kdM4c
	 CiSLzOOv6pLkje5uPsrbD9yE02Qhoa8f53hKq6WiGfB8yt9zneRLeLWHYpWc/hsB1Zmu4
	 Yt6e2HYOdb0QGV3DclIB99BEtK+k5h0GV3ha+yIoJKrTxRIqo3ZYiQhn1r7IXWtFGwQTh
	 YbjEBrpGxsrfBk81fplTTRqc2xO+SuQBYwBQhvNFx9vsiXX9RL3AauO6Wr/shF7Kh9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761644;
	bh=SWdSOyDsm/qaRD7LoawSieAS+kL67uDatgEPLjB/dSQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aIjeXjpb47ihmuDo4onHCOIpwow9khfVNoNq2bnB0dI0FMXnX8QehB4JUNimZX3SM
	 rxtB3TTfz6TyiwX6Vdu9biNbcesAYxvCzs9CFyu0/S9i+bY0WrEbLMkkD7JUXq1iIs
	 IhcjpJBnXmzL9CDqco/9l5Nd5+bj8SwgmWCat/W2oHn7RwTkjhg8PjQyY/q6tqHAWC
	 YwiTyi2vqAecMQtTmvY/0vE60fgBFEE8w8zOuHNbTKKNv+l2TV9eE4FXAAa9hzWeHq
	 hRcOprImnRv/pFqw/scayaNv+zcd+osH383p1DGdcBESG7wtaaK4CBB1maIXTx2o/Y
	 stSM7q06o1Bog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E60B409A1;
	Fri, 23 Oct 2026 13:20:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD043C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50736608D7
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CcKssSXL4n6j for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7DD64608C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761640;
 b=YOehxqhKhCZBcvLWDo6J2kieNvgrprMuJv4rPhswEoQs8rwYuU6mElpidpYjQHLqu5rN
 QyEzqKVvSFjS2z3RXTICY/Hy+R8ZGWrt12aOfFi2YqMDlKr7U1UX4aB+Alt4Umd4O7Fny
 dl+P0PHgELBesswF6Fitp8yW+mnLTIiRnndiJp3j5drzqijW1WeZIC4FlceotK5JHEDEZ
 wN56SiHCTM2rnr79DoQcQ2et8ZxF+2rITKidL8jNumdVE43XU/rJhYs3NLBPp+2Eh/7I1
 gPnpS+CXVObqpFbPnCG6b7AD+sNBDG/wP8lNNzVHd62EhgQPvv9THMrPA01GW+MRr1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761640;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=VxS74jNz2GayJs63fxKQaoeKzvki3vGdraR8pcGHbt0=;
 b=M20GjVZaLFvkZurc7v5WrUl631znGLLqCTsDKMAfS3584FchBOsJTW8FXDtK6hBWU7lU
 O6Wnjqj2ST94b1yF5IcO83UkReZqfVWZlYHGP3EIon9Th9Gj4jYQUCSHUruRycIwoDvjQ
 suL9GPrdX1eQbaCAYeE6vCX5+T0SDhsmFyj1ABWYn+VzoBmSIxCUzv5m7enNfusZOtiYM
 G1O/50zlrkbwG5aVV3D5hKE+kIcdvI71iY7MBjMSudhyjHz0zuppPki4AfUZs1TvNWlJf
 TmxRxbhSMQC1ePWTuxL5B2BBU3PwkT7UF/RWjl6NQGdsLB59TLLvX1O4+hvnzsbuXhw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZpY0WFms; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DD64608C0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so5589855e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761638; x=1793366438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VxS74jNz2GayJs63fxKQaoeKzvki3vGdraR8pcGHbt0=;
 b=P4bdzCQOHk2wozbSkaEl8IedmW2xg+hFpV38gfBB41BKXhaHv0Cvr/ZgSmw30gWXOZ
 BaKlZN26FIGz+3HL58xkRRUFsdR59CQNn2+JVkwBnX2uyUDtop8Nfc2KrjP3VnBTqSqA
 bNyxy9w8fu2ukJ7eBKUp3zSZKt+p5wHn9f8A7KhlRmWokl5kXgYtQj3h+3x3WdkcLkz9
 K+cAFWpMZ1Zthzv6thCZdveat528SxVMmYLab61croZZnHR2X8YLIks9hjttscSMyAbz
 7MjvzF4E25w9bAght/eJa7ubD+h+ShJZnUxyVoYaJD3xteD1Rpf/xmmXOc9BOGoRJOR1
 Ds0g==
X-Gm-Message-State: AFq9FYJNARp5WuCLnItMxhEqH5bv4k++r/lvb+g08rF53Wpxb74uOXrP
 g/IQhue5YK3ujS8VF4dXrw3x4JFLGtdW22tnR2wZ/yx4v1uXA+zUsKbKSzD3USze66g9mahkkyX
 /UaKkz8c=
X-Gm-Gg: AYBFou3zQhrCh7f1TfZfnB7gMQNruEcGsliPPdbifvIBgCGxQ2aEwB7xvQH7wlOCVRV
 eFvnH48eN8nSzlnkvcwEavQ2xaRneYar6zpJsvaoZehGUSb7ZdofqjXVjyye1i4dpTHNewU/rgA
 KIhxGdxoznypQDLp6T2eTJpZpmGVrjYYWn+bTh9JqiFb6MWwuzWSSSCSRe8VjLJggGzJSeTaboy
 XigORxk2eoZ5iti3DdDw+i/GuiT53yuMv54LXd83kusQcnyyz1bGz0YGIRDSjyeZqfl2wtJ0ieZ
 940fkHIp759btQ8I8yS8CzGoTvY8K0f9Ccu21lN7GHGtVNi9vm3LlGhyTIvvpUO9M3PCyud/lp5
 zT+kbKzpTmp+r3vpGrZyQQAfh6I9eD630h6kAXaD612xMJXJx7UfC0NwAEcrHfMtKcmngkdI+Xa
 lFDWux4YE8Mek3Dt1o5m3hetDFwOGh4qjaoBWfdQEjGzwqHeYcO8m139Ldgl1XYQulzWkIUn4xp
 RFUvgMq6F2g6sEcUvNLhQaEIejv0T7HZH3juFIiedh1d/WUTdYmS5XB9A==
X-Received: by 2002:a05:600c:4f56:b0:4a2:729:f7ce with SMTP id
 5b1f17b1804b1-4a211caf297mr49401445e9.8.1792761637877; 
 Fri, 23 Oct 2026 06:20:37 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2b064084esm3480655e9.9.2026.10.23.06.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:37 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:34 +0200
Message-ID: <20261023132036.1606934-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261017131247.1572149-1-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] configs/lafrite_defconfig: switch to
 Bootlin glibc toolchain
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
> As recommended since:
> https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  configs/lafrite_defconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
> index 5f70706fa0..2454d2b7ff 100644
> --- a/configs/lafrite_defconfig
> +++ b/configs/lafrite_defconfig
> @@ -1,5 +1,7 @@
>  BR2_aarch64=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
> +BR2_TOOLCHAIN_EXTERNAL=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
>  BR2_GLOBAL_PATCH_DIR="board/librecomputer/lafrite/patches"
>  BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
