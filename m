Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AD606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hA8HOzXL
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A7D540E79;
	Fri, 30 Oct 2026 15:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gg3n0Tw6Kwpq; Fri, 30 Oct 2026 15:29:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F4ED40E50
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374187;
	b=FIy4TXMrl+dYN4bYpmdYKBwbfV1WebL7lIb9eogerN3aXDprg+v0HhIdThrg9yyvPbNE
	 FRhQhpLN75C+aOiUkxjDDpnqWVVPUzj3RZd7ZZVrJdMrrTwEkB4RFsXQ+YoqMU4VBeXuE
	 MOOcDMBuasSHVC4ye3YT2zZPV0QZcHjLBv3fDXdkBSNujnLevbLr1jhEgieAQ0wNM9jtx
	 KobzRQoZuVyC4pmyMoakbrgl+xUE6ztY2GZ3v4RwrSxlowL56QUOKMvIGqQijjv2Gvyrg
	 QL9/7eoF2IFbjIEB1KwH7z40VBDhoaobHtnfoty/L5EkjC7GWwQ9qOfhr+X0BUSZreA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374187;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xNsTiomDzMgaWdF7P6VB8pSPpTMKiUMzUiQXyxVTUgE=;
	b=IRt7NyWacLMTih7I+X2dMUzT03O+ZlFpUVUlaBrZ1LVJNdF8e1ls1adtQECILz8r8uiq
	 OLgckBfDVE7i584WuoIqkXkFACML/ZDn7w0qc0MbgLNdaugnkk/alA8Sdyjn8enO/tqA1
	 Q9/ZnLdZ0rZB7ueSyve0n2dIxVh3670Ai08moVnnOHqe9U2FvIP1LZlhHhvLwvydewAAA
	 xczSBzfz1H4Idx90JQiHgv3xJ4gQvmo0eeRrCfZwzzVxpLFhRLQc96KipLcELZbFnfZsy
	 At8W0lolLNfe/J1iUSu52ujtic+vlBirfW4yL5pXj8BZ5u/HhuIUE7RFcIhZWGqzOTw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374187;
	bh=xNsTiomDzMgaWdF7P6VB8pSPpTMKiUMzUiQXyxVTUgE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hA8HOzXLeG9PNFWuts0RafG84ydCQ6pFNip5mBsCMC8vydbHHsIITie+eqJIuKh9j
	 ScLCen07pWcjxEZxz0uS4TNZKJGKBNsopFssc+7VHRc0wwofBBOVcp/YztnNGzSv9Y
	 CqNbustq5coiOPwSj3waUXov+oycVIUVT/0QbUM82bwtKJoG777aRQsKxuUVDL8LXf
	 0ONukAtUA4OwEVxcn9pJq8Y7P4HpesJ6/7impPaIfS1vSMcBeLGBUSNuw9IHG1dNgN
	 fmINfMevGcMgr00Th+TehW9Aok6NE7wvSW4t+yEzVu7seUI+j4dGr/6PGfAWKMfLrt
	 uAwrch/5bjFfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F4ED40E50;
	Fri, 30 Oct 2026 15:29:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53DBF235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A2CF81852
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id toI36LjvQ0oK for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA14F81776
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374156;
 b=LCPGcCf1us01TCyR8jEwZEremhsEO6z18sto8oBv6N8swI5z3GrVinqMkfMmL1TMhXxy
 ns4mXDvZlFSdsuLuwjoQrug00odhOQN2JzbtbJHVb7iRV6vUf6LZY+BNU/0KoYsexb7Uv
 t5leawYAcqBQMvuIRG5WsKl9cW1bHrJtRG5X7UTvVVFssmlpC4IwxeXJEeehBuY0nbwGv
 wpZWecEXz4zKsFVbPpSsW+u2Z0pcK6Ik4vMHz4PCrprKw+7ziCSeAFZVaDVhWAFi+39L2
 qnZrMw78mO9NCvYDIDFLnc0QzK8XysarXyO2Ysx2HSDAzAUnqChysgkLuiyFzDhuMfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374156;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=zvD5j+7E36YgTzzfVZxM3Loxvt0mNp14TrLwmJ27xfU=;
 b=a1PqMrt8wVvUiJOBqGoz2+tw549iT8UbkkHWxxv0JldaA+Eadm9pJvVVsyhIH/H0hopU
 kfcnXlmTTNUrYcV1neAR3EloPjhVIItH9Pa6MR0i9lO8iUqVLBUFz/WQiVdSrmExTkGXv
 r3pR3FvKr80S5NNRt2BgVzh3Ra+jtXrBZrmdNYkhA1eQuqeco3JmMGAjWtUxx5kSLJX+A
 vXDldjvct6HlYcsOHhXeYP6Kc7yZuK6i2JGSVFh1W1/2dtbNfZE7BiQPEmB5BCkx/y6jt
 fmWuNy/FiloBdi7XxV8YOLIpdl3g80E7B3MX7iwf3ibzBMCxOzdpQs8qln75Qfq6x8w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=azwEX4RK; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA14F81776
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:15 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so8628185e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374153; x=1793978953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zvD5j+7E36YgTzzfVZxM3Loxvt0mNp14TrLwmJ27xfU=;
 b=ri2TRP+F8YoqJGEg1PHCsdh370Y2U6XoPd3mqbHQtWXYT6X8k2H6fxsPREGhSwMG2I
 gYtXFOLv7sW6BMLAP1igSqIZPAz8EGiphBLfAuiRhZQb6m/XeM/UvdnMf8LU4w0cBd7W
 adHhnKDEH63mik7BXv3Nqwb/9QP+xF8uRblfZDPWoEPwCZ4HApI/QoYepfCr2OBH1LoR
 V9dw8KXTjWUCG1LmcUrIrm4eB8RQY7rE4bOA0uyixBynQH9l3LNVJYBCIvbRW6zGpsPA
 uA5xT1BlVNZ3jt2ElV5xhzPhsV/9rSCx/9uXodfiL50UYrGVs7FwTdEyG9CooYVpmHaF
 Ua/A==
X-Gm-Message-State: AFq9FYLO7bXisVNBZRdL9TV4Lc4P55rE83iBGDMNU3PdQSlAbqwutWBb
 mNK2rbkgHHODSgOC/8cm1ltEO6rVmpkmd4JrOu5UjGa3P1WDBspI8sODZZzzIvgvBUH++dDNkL3
 +mi+oqX4=
X-Gm-Gg: AYBFou2Akis/Y+jgOW1Lyy29zubBaVMVuvzuFUjgDcLA7AWDdPXWxgTJba5MLN3ogvw
 rYCmiKknVV4bCsrZmvQFKPYjMr/eChJ74baT4ZpdyhP3a2J4ecWojB6qnHWZGJLrW1B1VtpcWpo
 64+QtszzpOychtG1gzg5p5As+2DnOYnryRpgRFS8wNvvUFbDaAQNXjPK584zNDqCznexrMD/Nhp
 1NYIe3xHqg8wPYhWQuZN972wj60YwBxJdZIHe8CC+KCTrbQ2da0VGzl3Ci5NwjBc0SEeRQEOxu7
 wYRgY/AdZdffSp9WuTkM53MCJiXRJjQrczQh6TcoUJVMh0929RInlztDTm8OZNrfcbcUI1eSOzj
 vzemSS5uI7FbEbxjHy0se4CkmQNpmi13blSd7Ujo7Ciba4EKweRB0qpyw8kNfVJ+VyZodQkX8Xe
 4vCWi/9SEYpEd3eklh9rzKVGuIDeAsSV0QlU/o2e9RUQ8e040dW9VE06oitQFSXx2wDc+o0xj+U
 qsm/L2fqN4nnY/WxGXpz1ayn1md5bOrusHklnApssybC1mhZ/rDevUSKtJcQpdEAjACXkTL/eMC
 uabNxQI5L/rkQ2kYMy8X+FibLFohelFgz3Gs4csYe8M9051Cdx5m3m+7/yWnmWejw05b00rn2tY
 vEwhzLEYyn6eLLDYi0A==
X-Received: by 2002:a05:600c:4e44:b0:4a1:7bd4:d07d with SMTP id
 5b1f17b1804b1-4ac1932a2d5mr58907615e9.34.1793374153593; 
 Fri, 30 Oct 2026 08:29:13 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa813d295csm145424845e9.7.2026.10.30.08.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:13 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:11 +0100
Message-ID: <20261030152912.1907778-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023211622.2096562-4-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 4/5] package/mesa3d: i915 Gallium driver
 needs llvm
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
> Buildroot commit 3e296a151195f9d32dbfd62d6c75d08b822be6dd bumped the
> package to 25.3.0 which includes upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/b8b38d38b1c14b60de0324ac2f98ff7f1f4cc3c5
> that enforces llvm for the i915 gallium driver causing configure errors
> in buildroot:
> 
> ../output-1/build/mesa3d-26.1.6/meson.build:241:3: ERROR: Feature llvm
> cannot be disabled: i915 Gallium driver requires LLVM for vertex shaders
> 
> Please note that
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/4235c39a9a8378f1e2dc0899dd4c3c941f27b887
> later removed the llvm dependency for the r300 driver introduced by the
> commit mentioned above so we only need to add the dependency to the i915
> driver.
> The configure option draw-use-llvm is disabled by default when llvm is
> not available:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/37c7d19e46a4863c120186a99ac0344c2dd31260
> 
> Fixes:
> https://autobuild.buildroot.org/results/acd9039901cf4168e6318c62252ddae6ea0ec93d/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.08.x. Thanks

> ---
> v3: no changes
> v2: no changes
> 
>  package/mesa3d/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index e18d25eb8e..f45a675445 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -147,11 +147,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915
>  	bool "Gallium i915 driver"
>  	depends on BR2_i386 || BR2_x86_64
> +	depends on BR2_PACKAGE_MESA3D_LLVM
>  	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
>  	select BR2_PACKAGE_LIBDRM_INTEL
>  	help
>  	  Support for i915-based Intel GPUs.
>  
> +comment "i915 driver needs llvm"
> +	depends on !BR2_PACKAGE_MESA3D_LLVM
> +
>  config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>  	bool "Gallium iris driver"
>  	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
