Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6779606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MrjxDUjR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE27160E57;
	Fri, 20 Nov 2026 10:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-7LoB4bAy64; Fri, 20 Nov 2026 10:00:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0191C60E43
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168841;
	b=BTNTsa3TDmO+8lHZBbzuE1nl6PzoPhdxVO6cVKcpmQ3YAL0hSX9SMd7HqEs8bUQ6TV2E
	 BuGGFTJXwJdSJQ2n2uILbLdtbezEooFVjGsoqTlOVE3cumr1DRDZUDsqWh6exAmOQRvjd
	 jgV45FZJaLBXotgKjd9yAYh+7T38ahEeNGHT2D2bG/4Ile6UBkH4jTIglFqaQlxdBg9UE
	 UkP2WJARpmf8OZopcleS1GwkmQT9qLd7W644WP76L//At9NGSqxCnuE90hwFmEtROlIYw
	 4T0umQd8k3hjyQAmv2BMSY5G14K6biwdrKPzcxWX7I2JaoA2g3c65EK/Rxs7GlWgOpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168841;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dwZT3On4VVtAIB0MXb5URRtB8zkXSlagVUXAeT1Rm8Y=;
	b=DP2pGJBCX9mwWIKq0ZcOsImNjJhXAGcxL7E8+BS8Umro9G7KpSDYx9fRcMHILoYfMq+b
	 zoO37OrzX+kQeh5U1wv09qjrlGf1ClWbcs7ohGb9vLuvCLQsI42EFk7z47ZCkmrdm0C3u
	 ip/UKsojq75At1rTPLAnvvdGTjsFEzyFCpuFjwX4SYZi4baQmL8gtf5CUwElUVAPgxcPM
	 sXzUTHaN8DhHqxyHUAfn+Rat/er5ftirivnTVSgfhbsSn4Oa8MNgjjmkxWXMT0vlmx8T2
	 ntjCuz/cCEuOPBbVR+wIKZtlolUoy+6UyeI0OKkJl+oNjMQ071HgcRmERbKJEsfpbiQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168841;
	bh=dwZT3On4VVtAIB0MXb5URRtB8zkXSlagVUXAeT1Rm8Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MrjxDUjRKNBF/2fTpPJFQkpe4xpLz6d3K27YWHHQimURkH/go4KLdUPjBFdmEfd1U
	 qaH+EyJ4paWBhV13MjdqIWZxl04HP6aDJXxP3CWJXBJEASx1vXXzt1/oSEDVZECWUg
	 sVZZR42p+NZSVSg35Ea2Jqfiq4KqGy8zYJ6kQg3RQuBW9jMJrDR/AaxCBeNA7v6qMo
	 c2Tq+viR8FUXJ5QFIoASqY6hcy4ukHl+o1LJ6q5t8knNqE1Q1xjU7nYTTaG86uKd9G
	 isR3DWnqJ++5xwaOev8sW6/RM1MAD4z4LtV2qCc2EYQWNZhkBopxrr52rnc4VZRJoV
	 2tJv0hN9ygY7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0191C60E43;
	Fri, 20 Nov 2026 10:00:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C7F3E22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02FB840E1F
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdzp-Wftz3AD for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7295740D07
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7295740D07
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so372648f8f.2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168835; x=1795773635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=n4YRRguiWaW7L383rlHLyqYbzpE+jO6LBDM/53i7b0w=;
 b=EIlYNXJ56C4DUv1sCxp5nLYYLMS1vcXZgrDW7gUzePpdB8T82KDimdfqEtyoPmf7A1
 OrCqBgrxwFOmk5Kjw5VORNXfFATq1ks2CSGy266RifnhKkm/PKP4Tfzk/NTieukbFKkb
 FQQC2PgPENOvl3DYeZECd7rMRTEHbg+P//2yxFT7FZ8YJR9Zftxeb/8eCwDtdTgluptl
 U5anki0Mhl2w1FkfVdw7M0LFk3y0cj0x2gszVrj9D0+F3LdvdRFTPHtMwWU4VLwO3lyV
 a6gm9GzBr92pe9fF2Dm5EMULMiK1xRbX1eILtCvsA5/CoXPoDhvF/F3/KsIhgSRqTg2S
 oaoQ==
X-Gm-Message-State: APuU4Z8b6ZP00tekaJ4COnyrZg16nMarIDiuNC5bsMqnsM9rHPGnLaO7
 0MiLh4EVZ6r2kXdXzoAe+IlD6x1SVGVIzghK9ZaH7wNkYP2Di2qihRlU8UPXxwr9WOEYvgCxj3q
 qDRXGqgMbfw==
X-Gm-Gg: AZFdTZc3U29zFLT8yns1AoOsda5r/ngBixyZinQJ6ZQu+XV33ToIGl1W8JHK3Lv1Mvi
 cbWJe5R+ko8cXXsA8kJvc7t7VGnzYmD606nFeRLhvoYrHqx+DDI7Inc1beFwJ0BZKw2Zao6f8Ld
 lnNOFPjj1yj20WeAbyDSqCjbjv03u8MsHdLfe6b+kjIpZhQtM4JmTigzlEwUzTkqhgwxC2y6oFa
 k5gbU+x/uVPale/3mB43jycNb7aek2I94+0D2vsljRILVoVF3wCGLfujTB564tmBdilMVJ43T8u
 FxOcsRMDeR9cuLhAs7hVqAGOEus/U54W0wNkWi1PDH2Fn1m20p0q6BQDdfLeElDWMEMvsgJm8r3
 kwaOx6Vlza/AOXnv7kZJQUaSk7Kfn6PZhWl2ryQFGRu2WP5iKogoUAzGmjFGZ7GPNoOvFZbMdqM
 eZehnU92gwm4aEMMQjht+uD2xChY71ukL8RGTpBvTZIAfkv1ETbQvKefn8YGcQRBkXcY6uHoOxq
 HwE7jiacZ47kCBgWtLtatZgu6nE6/ZpMWojs5+6jn2SRbAESmbH01v9Ijy4DBkGL4qXm4ykXQcJ
 7LcCEJQUz+9zqNzu/YiH+sSzsWbEYvoBMdQ/29EiLTjsoImIaJuvAf8t7l7Ds2U/kw==
X-Received: by 2002:a05:6000:46cb:b0:48f:d3ba:7314 with SMTP id
 ffacd0b85a97d-4abb42ea2c8mr3740636f8f.21.1795168835228; 
 Fri, 20 Nov 2026 02:00:35 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b8b7888sm4430648f8f.42.2026.11.20.02.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:34 -0800 (PST)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:30 +0100
Message-ID: <20261120100033.541995-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261114210449.1550804-1-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/libblockdev: bump to version
 3.6.0
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
> Release notes:
> https://github.com/storaged-project/libblockdev/releases/tag/3.6.0
> 
> The crypto plugin now uses libdevmapper directly, so add lvm2 to the
> dependencies of the crypto plugin (it was previously only pulled in
> indirectly through cryptsetup).
> 
> Refresh patch 0001 so it applies without fuzz.
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2026.08.x. Thanks

> ---
>  ...ide-replacement-function-for-strerror_l.patch | 16 ++++++++--------
>  package/libblockdev/Config.in                    |  1 +
>  package/libblockdev/libblockdev.hash             |  2 +-
>  package/libblockdev/libblockdev.mk               |  4 ++--
>  4 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> index dbbe3e5c4a..d350609373 100644
> --- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> +++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
> @@ -1,4 +1,4 @@
> -From 3d198be196bdc59ba332b87d8c2959de0b9160d2 Mon Sep 17 00:00:00 2001
> +From 3cddbb1e225b4361fdec9c79799bdc35270c1f7a Mon Sep 17 00:00:00 2001
>  From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>  Date: Sat, 20 Jan 2024 13:29:28 +0100
>  Subject: [PATCH] Provide replacement function for strerror_l()
> @@ -11,7 +11,7 @@ Upstream: N/A since it's due uclibc only
>  
>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>  Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -[Giulio: ported to version 3.0, 3.1 and 3.5]
> +[Giulio: ported to version 3.0, 3.1, 3.5 and 3.6]
>  ---
>   configure.ac          | 2 ++
>   src/utils/dev_utils.c | 1 +
> @@ -20,7 +20,7 @@ Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   4 files changed, 8 insertions(+)
>  
>  diff --git a/configure.ac b/configure.ac
> -index e5d65d8b..507fa854 100644
> +index c129e1a..6a48df1 100644
>  --- a/configure.ac
>  +++ b/configure.ac
>  @@ -123,6 +123,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
> @@ -33,11 +33,11 @@ index e5d65d8b..507fa854 100644
>       AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
>       [],
>  diff --git a/src/utils/dev_utils.c b/src/utils/dev_utils.c
> -index 89a54b4c..b4be5b44 100644
> +index 8587bed..619cc30 100644
>  --- a/src/utils/dev_utils.c
>  +++ b/src/utils/dev_utils.c
> -@@ -23,6 +23,7 @@
> - #include <errno.h>
> +@@ -24,6 +24,7 @@
> + #include <stdlib.h>
>   
>   #include "dev_utils.h"
>  +#include "utils.h"
> @@ -45,7 +45,7 @@ index 89a54b4c..b4be5b44 100644
>   /**
>    * bd_utils_dev_utils_error_quark: (skip)
>  diff --git a/src/utils/module.c b/src/utils/module.c
> -index 11e139f8..c8b124e0 100644
> +index f36579e..edeaaf0 100644
>  --- a/src/utils/module.c
>  +++ b/src/utils/module.c
>  @@ -28,6 +28,7 @@
> @@ -57,7 +57,7 @@ index 11e139f8..c8b124e0 100644
>   
>   /**
>  diff --git a/src/utils/utils.h b/src/utils/utils.h
> -index 801a8b6e..b2bdf0d0 100644
> +index 801a8b6..b2bdf0d 100644
>  --- a/src/utils/utils.h
>  +++ b/src/utils/utils.h
>  @@ -9,6 +9,10 @@
> diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
> index e9e9faaa05..beebf523da 100644
> --- a/package/libblockdev/Config.in
> +++ b/package/libblockdev/Config.in
> @@ -28,6 +28,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
>  	select BR2_PACKAGE_CRYPTSETUP
>  	select BR2_PACKAGE_KEYUTILS
> +	select BR2_PACKAGE_LVM2 # devmapper
>  
>  config BR2_PACKAGE_LIBBLOCKDEV_FS
>  	bool "filesystem"
> diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
> index e76e02a756..22cb9f271a 100644
> --- a/package/libblockdev/libblockdev.hash
> +++ b/package/libblockdev/libblockdev.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  bccd30e6b5d11504de60d9889ff6a2a25b07a4ec8f04070f2387e168301b3e3a  libblockdev-3.5.0.tar.gz
> +sha256  9c21338257746cd00c25fcf5975716d016b6d43bfde20ee21f254cbf7d0d2742  libblockdev-3.6.0.tar.gz
>  sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
> diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
> index 89a398c6e5..b439ecd266 100644
> --- a/package/libblockdev/libblockdev.mk
> +++ b/package/libblockdev/libblockdev.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBBLOCKDEV_VERSION = 3.5.0
> +LIBBLOCKDEV_VERSION = 3.6.0
>  LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
>  LIBBLOCKDEV_LICENSE = LGPL-2.1
>  LIBBLOCKDEV_LICENSE_FILES = LICENSE
> @@ -27,7 +27,7 @@ LIBBLOCKDEV_CONF_OPTS = \
>  	--without-tools
>  
>  ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
> -LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils
> +LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils lvm2
>  LIBBLOCKDEV_CONF_OPTS += --with-crypto
>  else
>  LIBBLOCKDEV_CONF_OPTS += --without-crypto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
