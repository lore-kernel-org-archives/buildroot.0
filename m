Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43F0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fVL6OioM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C28F660711;
	Fri, 23 Oct 2026 13:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zrAlmOGIc9x9; Fri, 23 Oct 2026 13:21:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D2F2D6071E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761672;
	b=H6jbHX8doc3HDSriTaP5fljZkK8AjoakbLDrS0AEDDuF+fO7ydniYh0R1mUy3Y8S6obM
	 QDTgjtMcYiLOLl4a2MD9f1aST/UC0CstgbDzAKU5Tn7TGXes69UFcH92Q19JQsGrP0A40
	 jWD0ot+mXsKrdCQ09nQdwsQUxbFaNEklcoFf91uFKLSJXbjNzX8AF45g/Eo3JV0tzrPD/
	 Y4kuBrKwXw5eL5RkunQrvCEKw38LJyFR7d+t7eXx/wY7x1eCAwqXpkXTn1f9fGgInyFdH
	 502oDIaGQwtFv+p1hdL1ykmkDFrNF02BIKm233kqMUC7eUMnKTAL7NRQKlQI/R5Bf8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761672;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R1qs0cKAoe0Z6nAeoUQPia5dv+ForYtgH1p3XJ9DAks=;
	b=RKmBj73JylrfdE1imvKwKyCe6lGTbCB1HclVmPFRRAIyQQEoIP6CRwS/d3V1WNyQuIq4
	 aPlk2jPuOMrg4k7vvN4uSegaNmxZllEU38vqOEfs8CwlaebFSxfqUqM/qIQON1BK4n7Jq
	 GaCiDY1RLZ2/PYA8/ST9Nl8GjsglC9S2ZEn3sUWdxDPQKddyj4v/v/yCWukeFyLzwGcUD
	 T0Jtdm7KVoBSed/aXq/I6TPMI+h6BDM8MKJeJ50QrX94HuwDVe+iML9yXV6/dgnD3D1ny
	 IEXz2N40kw4ovDt1mwH9zKjo1inlLKK2iXfq39odjz09gS/scN6i4xEBnpxOOUNgMSg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761671;
	bh=R1qs0cKAoe0Z6nAeoUQPia5dv+ForYtgH1p3XJ9DAks=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fVL6OioMcbSA9VGPUpav/1Gck/QDZOiXYRJ6qwZGhBA7ZHltZmahEwmUCrNPVpHsC
	 bn27RPuidsZdMfFH4UIfDw0JSUJWDS059NiqhLZAoI2CKwtDDDqocybhnS0fdxg/zW
	 ijcmgsAIVpV+/njH0A7MTjFvJK2KCMX/9WvwytoCTWE4uvbpsE4VoIQDoZ8v0gJ82q
	 WLef8w0/p9FoJ+ZdiTjUBsp60gvlqOa3bQ+CsbfVR07PKjlwzLGZY3Gj1Xz9D7P+hQ
	 PJGeGhAyuWcX07Sqd6WB3DuwYyShvUjNr5RmrCKfsIk2DWvfyAbYXEy8+0FmxOGotR
	 K//sGdEdSoP7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F2D6071E;
	Fri, 23 Oct 2026 13:21:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97491356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89399401CE
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EvNUDGoh6f-5 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5AFCD400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761669;
 b=XCNgqdhNOKJvH1Ia5uTTqZ5mLFr2W3twd32hMkcl+y86pbyUIaipSh/wu2B5I92Ch0wc
 9A/jgQgiO4CdyZ3CEN/McyGjmXmD+BtJuHyAHNcWQCZlFDSDb5Wh+/jOVPDAYiS6hRa3e
 Zch+6sZSvUg/ow9hsXA+e1Rue85n420fkXDc6iqqISPRdOLzqFS/BmizNAZB8KjpensvD
 bcb07B5rICn0tRBARBUGDkfGIIQmxvNwMtwInZ2q6U0zWOSZi+efRj9wU3RJDqZh+OPEB
 GgfNlsw2Hy0Fd977pCHNpf/iY5F4IOr6fCQXEpSFjpr0AsvvusDE5H76AbijcvqRV8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761669;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=SoWzd/Vv3hISoOtAqj/8oRuelS2FfIJ3twDRKraUCwA=;
 b=byBW7vUzj4KAvLPPtdyioYkXD3WUE1LxSdJZ9N9i5XCJSK4lzZGyPa7QK1staH0TcWR6
 8YXR5nQ9pfaU8C5Sr7SXw08Izu8kPmwUkG4Ek3JP6eDv7pbLIvahg00cMKFwIMG5fGQRJ
 hxyI22hua7Gs5mvU0TczIXNqz36RFMunMCfB3vZ5loT6K5MMLPaJWXbkZ3P0jf6HmSPzB
 LFj8M4YvR3OQs1tCqROf6fK3b6Fk3aUy/ALITi/1yHa85G31IxOly8CIQO8ugQYIMZTDI
 r7jh7jrwdiYCUnAR7qYxnUiIHdmvJfhqsyM0vt1qj+xcUAGlpQirSKKyYCIh4C3uZng==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VXuACiO3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5AFCD400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso6862265e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761667; x=1793366467;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SoWzd/Vv3hISoOtAqj/8oRuelS2FfIJ3twDRKraUCwA=;
 b=SZKzB9XKPrUHeE/iig8fcXvELQNMOBQlv11i8yUulDe6SrxbCC/WbWnqvW5lhMzp4L
 nTpgL4iLWU7c45w1dtSp8tW7kxQXbpPtVabbivp+SLJF2GFmvNpZuDfhmg/17D6nI/Ca
 n9aYMcWsGLpZ79vbFs6fVM2g9/9iToPHyJOki+PptowJ5XY3eLLO2SPnjZqsU8Yqcd80
 P+puUrxX5MSxtdRgR0G2Pto+kNFG4nXOx+FHPjpvmrdpX3GabAW5XefsceyKD6j274sP
 E/Z0fviWKFDoYpq35/oK0qrr2qGf5XAAO7Li36w8YS5pBZrts61cFS+QhgK3qefnlGA9
 Su+g==
X-Gm-Message-State: AFq9FYIWDmdgHbIdw68lRnrcRr5mr24kUwCp6wU/rkVjrmEUcwoJi49t
 VsixFnomnnthST3DSadQmsBZIBrEiqWaMGkAZBHdX1ZxQZBNahvhues3LUDGVFDNich94YU/px4
 IxGHbFig=
X-Gm-Gg: AYBFou2TRim8Wfs/sQXapH9yiN0big0E52guVWA8O2k/nnKSxjlHrpaOY9KKKTHZqrM
 fvsL3PAcMHHI0BYZBjFgWt5ndEn/4TYXC6vE5eutZ5Ht4FNbRbqw9eOY7ENr1AKsqfTLmcgIHTb
 ksi8CNfO1G8kkrMc1QMswfM/4uEl46BYKDnjpa3vO0EBU0oWbkj+V4HGGkSBdxb0tRj626z80G2
 flPSR9s1wVH/QQ491E7cjDbWexo+Dl15ZYmz3klztUPlNn7fCRkDM8pgYwJ3oXJahliD9WVGHeh
 0bk4ule0prLZOKdaKXNhxkK3NbisofwPWbVPwbUEYXAoRQPiHypXE4nQngvbtE6P9MldFjZfSkV
 Fw/fNLi65yRQPWogG3MiGLT+JgE1E1FEh5XH4rZ4CgafVJd8rRhn3fylDWmRGtV02ZDA5B+KP5U
 KVRTaQc/xscv9oAYKXD3YR4BfaGf0356oH/8DLdKUzasPYYDKMUS/qG82pvIOCA3lk0XMuWzY+9
 5rgI77q36qsoOXbXfbH0kNDa2rqSsWTictdirMSU3ki54OmRgnrDoREEA==
X-Received: by 2002:a05:600c:c16f:b0:4a2:5267:3cd4 with SMTP id
 5b1f17b1804b1-4a2526743eemr11148945e9.3.1792761667265; 
 Fri, 23 Oct 2026 06:21:07 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a29cd9d09csm5266345e9.5.2026.10.23.06.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:06 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:03 +0200
Message-ID: <20261023132105.1607353-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018143816.1780525-2-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2]
 support/testing/tests/toolchain/test_external.py: use HTTPS for downloads
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
> The servers already redirect from HTTP to HTTPS. Use HTTPS directly to
> prevent manipulation along the way.
> 
> Also switch from the autobuild.buildroot.net alias to
> autobuild.buildroot.org, like all other toolchain downloads from the
> Buildroot autobuilder.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/tests/toolchain/test_external.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> index b3bb961aac..038b072d1b 100644
> --- a/support/testing/tests/toolchain/test_external.py
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -80,7 +80,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>          BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
>          BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
>          BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
>          BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> @@ -109,7 +109,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>          BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
> +        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
>          BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
>          BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
>          BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> @@ -137,7 +137,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
>          BR2_TOOLCHAIN_EXTERNAL=y
>          BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>          BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
>          BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
>          BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
>          BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
