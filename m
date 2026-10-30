Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135A4606A325
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sX1/pzux
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E1E740ECF;
	Fri, 30 Oct 2026 15:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5FyxPupV5D2; Fri, 30 Oct 2026 15:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C31F740EB0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374199;
	b=aubk+eYdYPsq6PyvoeeGH3Gb0+Kls5pwcr7ObUnDqfiDV/OmldECNEIkawYMwTkUBENh
	 4rQyuOnExuOIJ8OxwhDBymdLH35hlM3UgnEuLawnnGlm2Grk4wFwbZAz2t5cYWWTzDvXl
	 GrVYR8n2ZVuE5BrfWKhqlk9rTbqG4GfFyUdfaS02CA20gQxi9wVVuyyHlUWkLbzrNwmX3
	 tRusl53Gk7WziybnT10x4+MiBo4PVgUMLPFJEZoidcjx4gTm2zQ1TvFZ/FQ6ix3Ugjpyw
	 L2+Lr4GGexZp0YBFPkKD7K5sheiFefGsyrD7GhNzrZYRIoFwbGF8V9iPrKERpSGP8KQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374199;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lovWmJlBqytBcuyz3aE7uBIXBI+gU1WlTY2rrTNZi2E=;
	b=kCBWLZKnNTs9BjX8CH4gZyKFyzshmIVSTdMdgr2wwHP05yzxLQQGPHhN/EkjdyVgIClz
	 6m7MF48gczHlkDjqFdbjYcsK0KHKfPwujSQdsc5bnMHOkvj2HuDUzhbUzyv4pPnVrVMjF
	 n2cWPLde166jLPdIebzJZ/jVIenDt+WjMeScNsz4j4tCNyVsAUcsUPegCzObMoGlqX4BT
	 wnRAGY0DZpWt5CXYSzLtYE2T1486OgczKabm3mRyBYpTjjV4QAr+3OxlgHX5dJTV+jDFb
	 786ZSUQhtPuNWKisnHTZrsrTGHs47+sE/6Jq/6nk6IbYt4lEuULbjMbP4IPHjhycrxA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374199;
	bh=lovWmJlBqytBcuyz3aE7uBIXBI+gU1WlTY2rrTNZi2E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sX1/pzuxDz6ma2DMWONWWoL3XfZj/PSvGQo+zBoTCBSLbQ5IE5AUbX6Iq+7wl7jmh
	 WNUQJtST74bTshztAJOlvqX9s68/fPUZNdDCO8Op/nwkq9MWQc7FuQdGEMpgnPmUBZ
	 w3ad2QQ+rzBysu0U82rDEWWnJJP6B/glO2uuZzsebVS/x8ToRTrDO/A5NlatdrmS0S
	 y/akYBItxsYdYQeJECPuYfO/9yIO8EBIjv5U+AeG6OL6a0FqT7IkWhQ2NTKn+lmfuh
	 0pwHyTXSY9SqA0VZNneVAYdYQEQHjNFNvrK6Ylih83s6M0XtfBtojZb4F25MgGXCWE
	 0kv6zKK/tNDlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31F740EB0;
	Fri, 30 Oct 2026 15:29:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDE57235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B470381A47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtTssIaPXnxy for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDDDC81A30
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374173;
 b=Q5PGYsYw6goPtf7wPyE31gnp6HX55KR9FtxdPRe85EOYSV++AlLa7Eu96ZLXVNqYYRK4
 2wVQpkWdTkUtyU4SwrFQbYPwu7zCTL2jLswLKrKxm9LIgj7qztg9jmzogfHtz3YpR/MZf
 YUcQvfGBLBU7uLUS0x3sPQ+s4GtaOGHr+5ngaO/8my5odsfpPv/v58Uvw4lM6WV5huv16
 DAAr7IsBv284AIOH1YTi9jz5ZTj0mEC1XLUjsFx65LBlZXuNNiralcZctMTP61rC7zHPs
 DJ16FLq/krf7FVzqrxyrHFu3MbwWrRJClZPZ/ixbAKpLSpN2v9brE3Omz/sdDt72Qkg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374173;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GWaT1yj3f/qVK02FiKzC1n5JtkOsPiglSVsnKz7y7sk=;
 b=c1LKHfu0JKUc8hdaBhgrSbyxJzHyhD+aaQbl/zST18i9fG8qTLNevv7IE8y55Gd5e7Ie
 Xq49yUN7lrsRS8GtMboE3s2nh4poe5qP2I6t79w/gupuI6xwj8kLxg7zj4PQMu4NV1CJy
 wBSyemmJSsfobjo2gU8/nQKxK3p1yQ/RntKih8a+j1AUME+U5qqmauaaeMh5hgFCryexk
 Pm5WOuFOpSqIUSVfreMvBLzy8eC4FzNuoWWbjSYmYch+bz7sPLNvOXgQ4Ir9i/iGokRtA
 mnTyCxZFV8OhcCX39kPtQxOnbj+mUjYddoA7QoIEmYZRErCa2RomkA1EbpyUblgDK0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cLsYcp1H; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDDDC81A30
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a7992e2f7dso8888755e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374171; x=1793978971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GWaT1yj3f/qVK02FiKzC1n5JtkOsPiglSVsnKz7y7sk=;
 b=CUlCNEJJ/ymdTKF13+Dn0TKQ/BbLCJqC+H9I8VHM5iBnJxouEg7ZsrWj3lP7tVUfBb
 ZlpOIg4fW5eIMB5O7Lj4RJI0I5YsU2H4FmCaqo9XUdvSHxmsGamOeQJ/P380b38uXcXh
 AtXZS5YsqUARleu0+WMnaNh3C8seQuivBk/KpMfmCtsQubAM79fjdQjJ9FwXXBROUh5/
 ERHII1ExE8sbvxjtAjJLuwkHYNiUl08DtypAlBx7HK4/4GEdSWk3HZZBxY0t09IQro4d
 hMy+UVeKwBzcL8I5zNiyq5gWTbrZc4K+EXQiqpvhQdPnhZmzKmCtZrNSsNMa5WYD0sAI
 we/Q==
X-Gm-Message-State: AFq9FYK+J3IVJeePzyUrpYyPzNQI1e2yWKPEsSQ3wj3D0Zc8biIw/Y9F
 RI6qKTJq84IcixVLbVzznK24EiUgTW8ZqVADJqn2T7/fu8Yfi/l4b9zTo80VjJ7WfDk17LCP4Gc
 fbfPI5I4=
X-Gm-Gg: AYBFou2b9fU7rLQicbipRPLZI9OA8rAXbwbBLSIqcC93cRZWGeRitkrCHjiAoGGr3w0
 Hq0ZaIqbaiQm2xKAqo7xqzUXuHvv3ZWVwf1nKS7IR67/au0Edd463hL2w8y9svnjWPXGSr993pn
 p7bkzIkXxmAfNtec9Zv7Ka+P8nvA/yMVAVruPLkQ7NenY/jSGxP1NlOlGI1bxecK4GTCDaiOG//
 i3p8aRmxxRsXSi53HldkGs1HrBQ++6WjZ38FM4lF0XMcJserVkuUBNGJrtMHgPGiHHYZP2ny1me
 85cl4gYELriiv8yKGAZV7NykGaK0cb275de4fQSCfiN82JwpPKREuclb3+3nkYElkS9YJKWOEog
 7DnLbPUY1BJYrnS1vLUUOQsMvQkOK3Dq9ZDve4of8SeIovefF7dgS0QK8wrZIJ6X0UT95V1Ebvf
 2R8s2aCWw0uCKkIEsOntq0+C7DZT83J08gJPnsMaSo7zmfS4pvS5tynPxE4xbLSlbzdZ0YEXmqK
 kGwGMwxAtGkq+mol/DazoUS0kD3fT5ZMbX+lSWO0RApZ5KsiMH57etFdUOsGFvwLnCBZDSym8Fl
 /98tYMo8smi/e2s7shqpeo51kVMiiL3uystfUQy8I7ZaFJ/3Tr+etKMj7YMTFjmt/BVEu7u0
X-Received: by 2002:a05:600c:46d1:b0:4a1:df52:3e36 with SMTP id
 5b1f17b1804b1-4ac17b2cdc2mr58840315e9.27.1793374170705; 
 Fri, 30 Oct 2026 08:29:30 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ab61d8b9f4sm104380265e9.12.2026.10.30.08.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:30 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:28 +0100
Message-ID: <20261030152930.1907947-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024075628.3205436-3-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/jimtcl: fix optional openssl
 and zlib dependencies
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
> Since jimtcl 0.83, the "full" configuration is the default, so jimtcl
> automatically enables ssl support in the aio extension and the zlib
> extension when openssl and zlib are found. As these dependencies are
> not declared, the result depends on whether openssl and zlib happen to
> be built before jimtcl.
> 
> Add them to the dependencies when they are enabled (with host-pkgconf,
> which jimtcl uses to find them), and otherwise pass --disable-ssl and
> --without-ext=zlib.
> 
> This issue has been present since commit 283821fc31c4 ("package/jimtcl:
> bump to version 0.83"), as jimtcl 0.83 made its optional features
> enabled by default. It therefore affects 2025.11 and later.
> 
> Fixes: 283821fc31c4890f141111cbc5994e36703c91eb ("package/jimtcl: bump to version 0.83")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/jimtcl/jimtcl.mk | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
> index 5e09e776ad..e81b2a250d 100644
> --- a/package/jimtcl/jimtcl.mk
> +++ b/package/jimtcl/jimtcl.mk
> @@ -24,6 +24,20 @@ define JIMTCL_LINK_TCLSH
>  endef
>  endif
>  
> +# jimtcl automatically enables ssl support in the aio extension and
> +# the zlib extension when the libraries are found
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +JIMTCL_DEPENDENCIES += host-pkgconf openssl
> +else
> +JIMTCL_CONF_OPTS += --disable-ssl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_ZLIB),y)
> +JIMTCL_DEPENDENCIES += host-pkgconf zlib
> +else
> +JIMTCL_CONF_OPTS += --without-ext=zlib
> +endif
> +
>  ifeq ($(BR2_STATIC_LIBS),y)
>  define JIMTCL_INSTALL_LIB
>  	$(INSTALL) -m 0644 -D $(@D)/libjim.a $(1)/usr/lib/libjim.a
> @@ -55,6 +69,7 @@ define JIMTCL_CONFIGURE_CMDS
>  		--host=$(GNU_TARGET_NAME) \
>  		--build=$(GNU_HOST_NAME) \
>  		$(JIMTCL_SHARED) \
> +		$(JIMTCL_CONF_OPTS) \
>  	)
>  endef
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
