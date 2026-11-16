Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48306606A322
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eyAMIZoR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2351C607EB;
	Mon, 16 Nov 2026 15:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LheGMmxfad8d; Mon, 16 Nov 2026 15:38:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2C71F607EE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843537;
	b=OPvhFaBp/dGupeeRgBq5zqpLIwbLe33TCLKwX1gtj84ro1r+X6Rf6dv9d2CytD7Oiud1
	 OYDVKwM+I78sLx8bR7+fgeLaub/VLj7v/U2VDQblRSI0CkcBz38H61phAtsgZvko1sEVK
	 qQrjJM7WqUJUAtkNVbpPTnpUtTglR0jFYPKkhKIh0IaUyLBKB2ckdetiZV9UWCclZ55fi
	 /hFn9eb+1Xvgod8EHByASfT7PvLZK4QIU2za09Tgk0n3hUndoOBvDD9dmBBkoxWPw20L6
	 bwNifbuWgzJ80D+L8OGDBYLoJHr5XsrIakjbbIHqjjebZIR/H7EhRYKbO9nRrPu2zlA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843537;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=CDp+jdqCVQksj9iP6yO6GW9/pm3I1zb+qqPkpAuRUIg=;
	b=lnZjPrqHX1HSgdB/R6lnVR8WBNiHwqjO3sHZTbxS7hWaov1HI/fPvV0jmHLULT7dy1K+
	 Zcud9yfh6AO8G4smBNIL69avgOn3rCEVoTcRawZHQdh0ob6le/DSAJs5STwBBNk4QoyCG
	 kWJrY8Bd+3LjWXvsXqE5R2gduvradVY32UQFD0joqw7NDKKEa3h098eoCOW9tX7YKx2LN
	 Ly/CLl2eOQGYq5FQdHOd3vWjenFQsX4dp3tI753pdY1eepOyOkLMTq2QATqR9WSSag4um
	 J9HhnpoIchypdArqGs4rQgXaJ9BXIw1ZD4vCYaEm/20oV7bmVc6IZ8YxQaNe/GCFaGw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843537;
	bh=CDp+jdqCVQksj9iP6yO6GW9/pm3I1zb+qqPkpAuRUIg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eyAMIZoRpG8R41YQN/GRxfrPN2csZF2kkkHvZAN8oNTvrdkcfgkPLEQX5jt28XbLj
	 T9U6O/8c39jlqKDZEX3cqKm7rvOc7UtCd7ZnLYNUPfXtuaJPnD91J8s9y4ZOiGUxMC
	 kFKAX7c895zHXRPmwjIQ+MqAPrkzSeiVaxkYgRpcuSH5TzpBEAyARGYT7y/3PJcH6w
	 jEvBRJoYzXJ+FBpKIsCc0n23MrOCVxSax3khBFDMBznEfnZPDvhnAJBNLbJNAnCsNo
	 GHDXt7XEMAf90bE9A5kMIInPXM26O8ORs632arvHdaEB5tyL3tFwxfaBGY9tR2H1xf
	 lPqQhl70zKALw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C71F607EE;
	Mon, 16 Nov 2026 15:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CD09109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 332CA607EB
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lkRBRtxzwxsI for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:38:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 019AE607EE
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 019AE607EE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-49465892f7bso2992768f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843533; x=1795448333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OmvnCpLwI8W0fGsGbkuBgtH+UGSzoTXEhqyxTLXhxw4=;
 b=rL/05YxDACuJttnRJU3/ZjVG2ahDiXshX6uTaRsS8UsGsyfAwVrobevvmryyuFksfC
 adGUInfsNcncIKSZMKtRBi8YwLkJ1rSlSFl/Swx84kqwkl1u4I6e3KaWXPIxW4g2qRXX
 Lhdy98ZLEqnQj8h+Qox+TT8SZrjp0jvc/gfOxvSXFWCd7Ulk70r34uo2KenqGbEKU7xp
 3ww2W1bfEhDRN3CogD7bGnvN+N1PxZn3YKrUU2gXuICUOmkVpXUz0qfsE45ksuY5PaJu
 6/Cnd1QZN9V3YG81gBRsMymm/FJQfZNNyaKOkf5qFnw5hZUoJuuuKPsACMsUHsUkcmS1
 wk3A==
X-Gm-Message-State: APuU4Z/4cHqP2EhCCyU8Y1QiIm1uEuXRBhRG57B4KJWIuUEOIbaKrk/R
 IBdZ+ox+QIuDqvZL1gMXF0gG/B7K0C8/mT7G4wqU2edGEOZ9jaRTx0or2vY032J8WOtpSvcUMAu
 jwYhYwH0=
X-Gm-Gg: AZFdTZeYZnuCVIj8kWpF8jU5e9Dpg7oTHEWODxV76BHbRTOFNSic8vYkoZUN0DOEEs3
 NNg37qIf+b/efjnBcSQ/U6aPh/j60p+8XBVF/KBgJo5q9dB1/cVbsOzBRl8wtUjnMW4ddNBH2+E
 ILCDg4kiTWKOUhPwK/n9bLh3+CT70p+5uXkfBqCcg8Wv92/+auJhXNydh171Z1JPMUSQSy5A4mg
 fKsWqeB0AJ64plR3RJr9iFNxO/nHWu2pm8Hsll+nVDL3gku4ZSZQTTtEK/O7lm+UZ/SPOwl7+R6
 HwEQwyun2FZ141Efs3BDxacVshPtEQumVmNvGLyXcFaogwr1yD+THsH6wbHIMxOd0jjau60omVm
 pFRP3p3uhlx0mCAxVTf6A4o16Tlf3FivjKfXz3mRSedcJA+/qEvwMBFNZNxHVvM2pmGeWrt5Vnx
 oKy0rM9SqAnT7jjK4Z+0lBUXohzA+cIyy5Mev6ObCwajqxS32y1dWRp5hCIHj7PQyoPrldTv0aI
 T3oGXKNALQNqPogtvYYFSez8Vc4RKHS60SRV3lYAm86uuXeRswvanrz4CUUa7whBzQ1nEl6gF3a
 FI6kwVt2R8oTzKEUXTZ5hCCWslYNqbA=
X-Received: by 2002:a05:6000:260a:b0:48e:5e1f:9a36 with SMTP id
 ffacd0b85a97d-49c727cf557mr21370062f8f.42.1794843532745; 
 Mon, 16 Nov 2026 07:38:52 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5ff2be55sm23203351f8f.28.2026.11.16.07.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:38:52 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:38:49 +0100
Message-ID: <20261116153850.725024-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022204056.2236446-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libfribidi: bump version to
 1.0.17
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
> https://github.com/fribidi/fribidi/releases/tag/v1.0.17
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Updated license hash due to upstream commit
> https://github.com/fribidi/fribidi/commit/5d829288e00b9dd709c8050f469ad0b2737f822c
> 
> Switched build system to meson to avoid fixing autoconf-related build
> errors which would be introduced by this bump. Even after adding
> upstream commit
> https://github.com/fribidi/fribidi/commit/1d42f35e26f7ee4cde23a4103ace0f9f4f86a1aa
> the build is still broken:
> 
> cp: './fribidi.1' and 'fribidi.1' are the same file
> make[4]: *** [Makefile:834: fribidi.1] Error 1
> make[3]: *** [Makefile:507: all-recursive] Error 1
> make[2]: *** [Makefile:416: all] Error 2
> 
> We would not only need to add autoreconf but also a _POST_EXTRACT_HOOKS
> entry to remove bin/fribidi.1 from the extracted tarball.
> 
> Instead of fixing these errors we switch the build system to meson which
> is supported upstream since version 1.0.2:
> https://github.com/fribidi/fribidi/blob/master/NEWS#L117
> when it was added in 2018 by commit
> https://github.com/fribidi/fribidi/commit/a991b009b11fb791a9217af23659b092eb45377e
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/0d3b5398d3dfcfd3940852f1b65d21f53d2a8345
> 
> with the exception of an unrelated build error for target
> bootlin-x86-i686-musl/build/ffmpeg-7.0.3/.stamp_built:
> https://gitlab.com/bkuhls/buildroot/-/jobs/17395269501
> 
>  package/libfribidi/libfribidi.hash | 5 +++--
>  package/libfribidi/libfribidi.mk   | 6 +++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
> index 9da9281c85..38acd814d0 100644
> --- a/package/libfribidi/libfribidi.hash
> +++ b/package/libfribidi/libfribidi.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/fribidi/fribidi/releases/tag/v1.0.17
> +sha256  6949dcde27d41cebad1fd741fcafc36d55a1020d2d872d4a6eb3914caabbada2  fribidi-1.0.17.tar.xz
>  # Locally computed
> -sha256  1b1cde5b235d40479e91be2f0e88a309e3214c8ab470ec8a2744d82a5a9ea05c  fribidi-1.0.16.tar.xz
> -sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
> +sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
> diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
> index ca0a39ccb4..1a275c5fcf 100644
> --- a/package/libfribidi/libfribidi.mk
> +++ b/package/libfribidi/libfribidi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFRIBIDI_VERSION = 1.0.16
> +LIBFRIBIDI_VERSION = 1.0.17
>  LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
>  LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
>  LIBFRIBIDI_LICENSE = LGPL-2.1+
> @@ -14,5 +14,5 @@ LIBFRIBIDI_CPE_ID_PRODUCT = fribidi
>  LIBFRIBIDI_INSTALL_STAGING = YES
>  LIBFRIBIDI_DEPENDENCIES = host-pkgconf
>  
> -$(eval $(autotools-package))
> -$(eval $(host-autotools-package))
> +$(eval $(meson-package))
> +$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
