Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92BD606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iUlGoteK
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75F8B81D35;
	Fri,  6 Nov 2026 16:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ot9QCt21DLkz; Fri,  6 Nov 2026 16:10:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C248981CE1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981406;
	b=K5l7NxkI/1eMacijuPbEMZkWxmUQ+5zXAlNLv0bF6P8OnMT/Nudh41KXByj+TYz/1A7H
	 tjShKzEaNzsWY0Sp9r4a7YVbcgWWvd9NJ8/eAUbiXjI0ynxUggtl17kN94mg8MEvN6NvW
	 Z3S+/tDiv55hQbxN60Hvbba41mHms6Z34LkhXPM2cbrK5AwurgZZhSQmrXlCKaaWHAQ91
	 Qrv2sfwQZ+aMgF1xPUy7uG5QhjWKK8DSJw2ZY2knmaVMIbtbvbONybHYJHwfrheHcO+T+
	 C6jlwyxW6jH5LpyorWulU3jT7eWGK8TaWjTYS355s8JrmtO7xcSI0xHI0ZRFImuxCcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981406;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=C01bYPPNvSpfEChCG+/Mv1E9lU9fp5GsH5YH+pJYqCw=;
	b=TaCTMyn4vZCXI38SKmp+zFH7q6yV8hIiYyIUXI5oD0jmlUAE5ys99qnHwWI5KCljGqvE
	 M0yQgMMpVuyptNgCPTIqgl2ZK+IRmO4E5KjsgvFwn4g/HYRKvYezLI68RtL8QmiSwVtkA
	 tzWKzGeCOfaBXNcSWL7rwRoS9e8UZ+G8i/x2IGz+zDdukKYcaMvk1YMGOEEh5bhhA4QxK
	 weOIyIkg9GT8d7Wsci7LazyEDAwKFXjrheZQgvmgMNNtsXDuDYSst1oUTYYekV1c/uH5h
	 sjvuUfIgWxCER9uV91gcgkqjUBLwhx88dXqN0drlx5pVSY4UTM1WUSbOZ4RZJboTggw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981406;
	bh=C01bYPPNvSpfEChCG+/Mv1E9lU9fp5GsH5YH+pJYqCw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iUlGoteK+R/nOFur1H0LJbIpJVuo67OgbPBOjPqwsNT1lvmZkUDeS/nqwS5i53iuz
	 BVNvPAigdEzqidqJOTIJ2vFCYYIs0YjRZDqLtP7Zrc09aGw7/O+MUursRUXv1DnzIL
	 XEvg4ZGDKI2DNfuvwyOAmOJgyLZoq7Ed732NajLLgohVAoG3eMrff6ncnblLCbMYYk
	 7HI/SMHLzoyz4DjyELOCXDh3ZBu+v5D6Lq4K8v8Nfaz9a4yURqqkNIn61FdDl24Sok
	 rvZ5x0a8N+amfr54LP7dusyNPDnsoMKUC6UFT34rfA64qSMGAhKYM0YexbU8GA0Vls
	 tPHZcMS5eBq0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C248981CE1;
	Fri,  6 Nov 2026 16:10:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BDBFF4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3FD760A52
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7LYQsOixSfR for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C20CE60A38
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C20CE60A38
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-491f34b4e0fso404221f8f.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981394; x=1794586194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YHsyuVnmMxZ0yHUr5/xme72rxVT9hftDux5PI9R07DM=;
 b=NJzUBpJMrhBvhdFCbNK4fQP9vFC5tlJM1bAybFZkpXTmyUcTv7WidE95yA4a8bFEQb
 psT+sGre33iIXkHeWeAfSGBsS1NqFV7nDI1Qo2XFLWYoHDt28xaOfbBRPeFIYM/cMayA
 +aVDYoStC6CN7ElNxA8rtFz4UgImiA/0CrX1zHnDnJ28YeqyRWMP6MXf5Ci1S7esa4q8
 SKE5tZ6/yx4iLF73OE1SSvEpgEflMxF9QAWxgdFoRoMJ+MXZLi+6UOxTGrsZly2icKUE
 6pevtyC3XDdy57IQR5fcaPa574sc8EpXCU15YsAcuUMj3g1uOaNfcHetVMPBiIzodP3p
 LrNg==
X-Gm-Message-State: APuU4Z8xou3H6VegVGqGjwI403hgwy+Zw8cgZ7mjegwmYCBJ3OBI934Q
 KLju0hLWTaJBtduhhG/YUAIYTPf6JnqcHdbjUx4hHnz7+SlX8HoSdjRz7pH8mmqSur5sAbtosbf
 RJKQoWm4=
X-Gm-Gg: AYBFou28jSI1FYKAvU3WUWU/j37AOdAEn8XvRie3siqwA8PE03Ohli4tHa1pTAKJd5J
 egA42T9I6gPmols+GCvHAB+/XOpTQOTiJ3u+gf8m2DBRRLTg/KJewd/u3ImJ7ZBbMlpdlsYP26M
 7qMM+leKqBGHE+EGQ6mffufhDDMrM2lw6vGwLyilGqTbG9O9xuPCPbA4F0xFWVBjLo3zutcYgHF
 Kw5pgfx+abcbfPHFSyZEzGXYHNep3WS+W9Mc3lbALKGV9EB+kHRFeDsfAWoFSiNsmzbEYs/Afdg
 k1IXhxuk/9bZIIHwnz9BrRNZP10RGdycrnIGrJ94/Xp6COcsULpuApVrpM1CtxEt83wIoku1Zgf
 JJT/9sXc7lYJMZ6XUoVX7dIXdWs45s+LpAaVag1K9cBZ5x/cO4k6diAsuTMV+7FL6CRN+qPC4HY
 hWFnoTxvDtVCWbZlpLRdZ1w5s9iHDCW0LqwHMnUsPXPP4KWP5S2Hmhdob3bBITD69aTgFXkqgsx
 CwZcvRCLzMu6HRuE8DGXFM0d2rNgiQd6dYNxZZg5VCDxObZleLe7LjS1E8qV1xLnAva2nAam36N
 wI1iryoer3f+pM5q87HTUsGDZQdYgtE=
X-Received: by 2002:a05:6000:1acd:b0:48f:e879:5887 with SMTP id
 ffacd0b85a97d-49276f38a43mr5863238f8f.28.1793981394365; 
 Fri, 06 Nov 2026 08:09:54 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4932901d9c9sm3406337f8f.59.2026.11.06.08.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:53 -0800 (PST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:50 +0100
Message-ID: <20261106160951.607375-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027144159.1097876-1-dario.binacchi@amarulasolutions.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/drogon: fix optional TLS
 dependency
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
> The trantor library bundled in drogon looks for a TLS library at
> configure time, and uses OpenSSL or Botan if it finds one. Since
> drogon.mk does not declare any dependency on them, TLS support ends up
> depending on whether OpenSSL or Botan happens to be built before
> drogon.
> 
> Select the TLS library explicitly, following the same order as trantor,
> so that OpenSSL is preferred over Botan.
> 
> host-drogon only provides drogon_ctl, which does not need TLS, so
> disable it there to avoid picking up the TLS libraries of the build
> machine.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2026.08.x. Thanks

> ---
>  package/drogon/drogon.mk | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
> index 03cba45ceb34..8c51d16ac0d7 100644
> --- a/package/drogon/drogon.mk
> +++ b/package/drogon/drogon.mk
> @@ -21,7 +21,8 @@ DROGON_CONF_OPTS = \
>  HOST_DROGON_CONF_OPTS = \
>  	-DBUILD_CTL=ON \
>  	-DBUILD_EXAMPLES=OFF \
> -	-DBUILD_TESTS=OFF
> +	-DBUILD_TESTS=OFF \
> +	-DTRANTOR_USE_TLS=none
>  
>  ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
>  DROGON_DEPENDENCIES += brotli
> @@ -57,6 +58,16 @@ else
>  DROGON_CONF_OPTS += -DBUILD_ORM=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +DROGON_DEPENDENCIES += openssl
> +DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=openssl
> +else ifeq ($(BR2_PACKAGE_BOTAN),y)
> +DROGON_DEPENDENCIES += botan
> +DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=botan
> +else
> +DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=none
> +endif
> +
>  ifeq ($(BR2_PACKAGE_DROGON_YAML_CONFIG),y)
>  DROGON_DEPENDENCIES += yaml-cpp
>  DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
