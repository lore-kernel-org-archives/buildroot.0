Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCDE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s/7eCJDW
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C511409AD;
	Fri, 23 Oct 2026 13:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yK_xi8zpjGWw; Fri, 23 Oct 2026 13:21:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8E03E40900
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761668;
	b=J44P8vlccwWKfiGsfExDMVQ7Na+26cmEVLtmsxZIu6fyjQQl12sZnIy5IJXX1nr52xzU
	 9i4NcLlRROyd5jYdo3uz5U07SGkW+X+0RuSPq/PwsK+SP3dl4oZNdstcBTnTr9ILZlYww
	 PKE/9TesKJIsVnZk9vAimDKWBQtNmgjqh4vatrvPVjqumqv2VSaZXfJDQXWhzrvDfAMu8
	 kalnQ8ynTjdajWWGmiAoPObCsF4fDOT2LDZAizWgAarjkSikB+oR/XP3DBPBL3l9gcVHY
	 I2wbdsuOpHBhMlv1+ztIod5UZISlxxkx4E3PjovWVhHymMQ/xGs/kIAA0BDyNJ3hK4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761668;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tk4UKu6qtLJ4hGUu2zjK2LCaYTE8RlkSLJB06QR1Yck=;
	b=jvdJCES63hvzhJvcz1OdC8cVIb2gsXyy/YH536qkK8Gz0HHlLC5CN88EC9wV0387xSA9
	 NFXj6r4hLFoQaZC2BUY4KdfbNpiIFbtIOvP+1oZhCXhoEGF9t39L+C6eCyUeWyg31PPGP
	 emJkTnMTEYdeyvlGstycGv6Yt+UvByU5xff6Nl5iZkYTwf5dc1rvdCvZlW7N0mJdyL2C/
	 QaUvajLJppOLsRXWT+aIz9p4Xj70F+BfzPIwalfffOt9nFUhp6SIJX9B3otR3XpaWzjZJ
	 2uy5mDiWsDnIAbyxqBifWF+uFV7BLSjx4/OLKm0REOLis12R/2arVThMdP0Bc91sOIw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761668;
	bh=Tk4UKu6qtLJ4hGUu2zjK2LCaYTE8RlkSLJB06QR1Yck=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=s/7eCJDW4NfBJtF9xTjIiTghxf1t6rs10K+lBAZm+kvOs6pRNA6MD1PsV6UXWJTOf
	 3rPfdIqXZSkHznZyZnx5orAoNZOI4MkfLy6U2Eyby2dYU0HiyT1aTOxrAPoWloIDGI
	 qG8env0Oc1+8tEyBKFeV0It5yERn+yvcvIFDUGJsnpXnCU0dpzK3hUxwr9wP+sQwAV
	 UceMeeIo6tf5ky90+5632SRkQAuRQqIIpGjpMKgBv3/mS+HVoal7tVzX1znLHCzEJG
	 2FTJ4mGE5b38h+MT0s9x2Z5rmId3Feowv0vAUStD0uNPWcJh9u6XlQ4AfWwf1v+a9e
	 KgtqH5ixtpW4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E03E40900;
	Fri, 23 Oct 2026 13:21:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 680D93C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59D5F81496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTVgKobH8Kd1 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 224EF8148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761665;
 b=HPJmR/IGEWGT86B9rRkkUx4E0yZiv3wTvnCnzjtWVOlpSym30FM77HiEu0zM7VWfs+ji
 vEAmoIo/rLPboIMGNONwg8x5UOdXO6q6n6U6dnUq12Sc9UMikABkRzHmUEwfvt57k7aks
 pg0zGetflfqoVfcsUcwqYKN1MWo0CyBELAfc/mH0cQ7xJApGW3RA8GRof+Bd7+L4pOX2S
 ZwdxypPkaDuQvTMOGd9zn2twGFaF50cWiKTTQ85LIwoxLwzc4+9ibAaHmVrHqqfvPQZ5G
 tYVrDxOCCLITXxMNHGrO+OEg/eHWf4MhbeGj9YGAvITWC6xlsxsLgaeRnB5klt3CpcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761665;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AnnVQzUV5Vk/6TGKz4OHOAa9UrLHA1Tn94wOEKz5/vM=;
 b=TM4PBVOOkiBkvblWXZ4tHDSxqcJZhaeaeRK47wXX9PsFxyRLc5Rv7zN352STUyyRlIwF
 fQ5VsvPSIdMw8sbqUbF4axDkEwFiFlf8NvHBIwj09JdbRTPfg3Qw9rposeuPkA5oSpRz6
 r2Hu1pQWNBpLY3PYSokEKDBOnLzpJ+XNWR6s94aiIymKvgvVrEkFPkXyoyo4JJgW3HOTD
 qp+uUYVUtIhbOHXf3qnbxdvFLrmG2mmUUFqlTO1qZ8pVtlSt9oX1tPTcQjpf5xRSTCp3S
 lhXy7wnkM7Hn4QJZii1Dr6Z57djJnIzTrdi6XxiTOdRLalOq/tTXXUIjUzhSrAlqLeg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ClDNuxaJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 224EF8148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a218c463d1so3118125e9.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761663; x=1793366463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AnnVQzUV5Vk/6TGKz4OHOAa9UrLHA1Tn94wOEKz5/vM=;
 b=j9EzBsd8+iWVaGqTsg/frOrk447FNtc7Zh/v15unatN6F7IUhi7T7EcjynYkRAZv4J
 b1g3E8Pldu9Cb8X5uRUuxwfefKMVMP9Wpwu0fKmqH07N/EdeRHO5re6X7BU8UfpAorqE
 G5K33sjtzH3NC3bdUMN6uEbswdlB6ScEFanNSwAkZOxhgFWaKd2zTj53bZOlONvffzia
 iGvG50SWask0ysf9Ch0RgPLZ5B1XdoVs+0sb5ufZ/bKZ33PFYySPeVbzVAr88A+istcc
 OEhYklfB0vGLHAeT/zkBk+K4oAFUttiT5sMdoXbB7CysUBKNQH7b0vvUIxz+neBDaWAA
 Gdrw==
X-Gm-Message-State: AFq9FYJgFiiwRyUFBWgsIth+fjr2vsHDmec5lmntF2Zdb4XrGvwSzP4S
 2RLoDm3yufBB/OhJHHSxodUKSZ2ef+b38YvExnUphVyjJHsN9tpRNdSnsQZudLXI13Ee0KP/BWR
 TovlR30o=
X-Gm-Gg: AYBFou28rz4QAd9DPiHQz8jHZdgd7bIYk1cVQr4WHDbbNwCPh5/GkZ/Zx+ppVPF+T4T
 jaEmMLOaPozc9nNWXea/kCcpDC/zR76aWoeK+aY3iVP6HUc4q0bGxSIsG91B7t2icXdq0VpNctv
 3faXWVQPp+0y860i/FBiuAgQSqGIja3QEOhxZsDnHyKHVYgzOmbiB8Fza+H1BuXnmuY6yTbmvDD
 P02mDDBhT3fy4VYme5eFTgIoisKOgBELSTQ3j76lYe+oYYhviINhyPe4pT69d7dlEPgyWmIZ6iQ
 mwRYCDay4lYtfx2n9WjKkJXKzQW6L0tUKh3kRWgr1hyjyp740lEU1fEwd9/6xeCuARjJxM0AWyB
 h0fGYG5E2C4AtV281usNz2kgYR0EXrBbr8SN74AiF2xWBNr6OJ0eFa0spcZOTNFSTmEisNiimba
 2AH0jsaGi1RcH72VY2acYR4ugU0WTimI8I4wuOgqGUqZSaQO5sPAAGXKyTx3c9Dwgar4GTIgEX+
 OfzoV586vnPSGQ9hWI3gOkeTW70acHeAz5ThCk7EJGMr+wdkr/YtiSioA==
X-Received: by 2002:a05:600c:3d90:b0:4a0:2488:71cc with SMTP id
 5b1f17b1804b1-4a211f34fd0mr40330935e9.32.1792761663024; 
 Fri, 23 Oct 2026 06:21:03 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a29cd9d0aasm5023825e9.3.2026.10.23.06.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:02 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:59 +0200
Message-ID: <20261023132101.1607294-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018143816.1780525-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/config-fragments/autobuild: use
 HTTPS for custom toolchain downloads
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Both autobuild.buildroot.org and toolchains.bootlin.com support HTTPS,
> and even redirect from HTTP to HTTPS. Use HTTPS directly to prevent
> manipulation along the way.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> This isn't as good as setting BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, but at
> least a good first step.
> 
>  .../config-fragments/autobuild/bootlin-aarch64-glibc-old.config | 2 +-
>  support/config-fragments/autobuild/br-arm-basic.config          | 2 +-
>  support/config-fragments/autobuild/br-arm-full-nothread.config  | 2 +-
>  support/config-fragments/autobuild/br-arm-full-static.config    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
> index 1b811f267a..7637a99cc8 100644
> --- a/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
> +++ b/support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
> @@ -2,7 +2,7 @@ BR2_aarch64=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64--glibc--bleeding-edge-2017.05-toolchains-1-2.tar.bz2"
>  BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
>  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_9=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> diff --git a/support/config-fragments/autobuild/br-arm-basic.config b/support/config-fragments/autobuild/br-arm-basic.config
> index fbbeaaa773..3212cd5a66 100644
> --- a/support/config-fragments/autobuild/br-arm-basic.config
> +++ b/support/config-fragments/autobuild/br-arm-basic.config
> @@ -2,7 +2,7 @@ BR2_arm=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-basic-2020.11.2.tar.bz2"
>  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
>  BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
>  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> diff --git a/support/config-fragments/autobuild/br-arm-full-nothread.config b/support/config-fragments/autobuild/br-arm-full-nothread.config
> index 71592d688a..855a24f969 100644
> --- a/support/config-fragments/autobuild/br-arm-full-nothread.config
> +++ b/support/config-fragments/autobuild/br-arm-full-nothread.config
> @@ -3,7 +3,7 @@ BR2_arm1176jzf_s=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm11-full-nothread-2020.11.2.tar.bz2"
>  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
>  BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_9=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> diff --git a/support/config-fragments/autobuild/br-arm-full-static.config b/support/config-fragments/autobuild/br-arm-full-static.config
> index f3a4d91fd1..33c7cffc72 100644
> --- a/support/config-fragments/autobuild/br-arm-full-static.config
> +++ b/support/config-fragments/autobuild/br-arm-full-static.config
> @@ -3,7 +3,7 @@ BR2_STATIC_LIBS=y
>  BR2_TOOLCHAIN_EXTERNAL=y
>  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
> +BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
>  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
>  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
>  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
