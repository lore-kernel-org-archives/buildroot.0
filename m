Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1330606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ckNH03DN
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7B840EA6;
	Fri, 30 Oct 2026 15:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVeUjblHh0yT; Fri, 30 Oct 2026 15:31:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 09E3C40EE4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374299;
	b=Ayhde0PTufSFhN8E7MgoMjzaNVjkJvSr4RiYszzBpFCgG3MIupI3tHnljXX82ZntKaO7
	 PSZKq4sqwMzt+eh9WsO2+UhRYVadvhp9KOeQBgQafllCaZ4WwyJDGOdoJF3tlCJjulb/T
	 kmxHzzQECaBp3Rg2+XzpieapMXG0YSAcwK3jYOvnJJRbSNXk10RAvFZVALHK3/VGx8Pz/
	 GMXWUryJvGdlyozEKA8btVMSmkzRYsxvlWAAtp+kAz74GNXWBra8GfCDMV25C/PG6q1iH
	 QEWEG8HnmH4L4slce71odmhxBqE99VUFlMaNZXJ5/685HFfp6qukajn2abfLDgN2q6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XLb91ZebDvLMoUqh6Ag6XTA9S9u4STWZg7cE0/L2Dc0=;
	b=JMis6i+nhM8E0ajuQfBAoNUYknqz2BUDw5cPcnvgHASYC9qWb8FRXYlTUC2uSx+oaWZj
	 I0ENzFatnsk+NJ5fsDyJgH2K7iid4RgTdiRjiKQPGwoLqAj/7hjNB1achXM0FPuqHbloV
	 bQTbKT1t+u3CdwFVNiZp7S/0uSMvXthlSb/RZFqzGQ2kkXsDntvGj4qTNWkTQRVcLToh8
	 9ZDHtQtNTdsKDKbuN7SG5ctX0uB6lv287ZDgt94ILkPtVH0m5iFevvXNy3k2BKsZO/6SP
	 cXYWyKAkgygPr6MZLsmKwlNXdTzQ/HJeK+8S49GaBPXU30s3+hF9hS7eSC38cOFlEYA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374299;
	bh=XLb91ZebDvLMoUqh6Ag6XTA9S9u4STWZg7cE0/L2Dc0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ckNH03DNvOXFx9+kXLxd3rBCIl4PR41ZskYvi2BZmqQ3bwRgXCcuHYMUaPCStmKMo
	 RzJn+XyBJ04fMf1kytutdb/C+ZFIkAQnQsHhPoYOTZ3xxMwDBdULC6q/37JgT+F9Yh
	 Yk9BcTpIFdp16mg9wv4Uxg4frukH46e2Hs3byZxXA6RfwsE9CeJWlDuMXN2vBCJVuF
	 BzI9oSsRH84CKmLSthkxEz4LwSbOX0Z7bvNLVlPXl5gX2VYSqkYkOH6wsK3QK+J6xp
	 61bUr8t/aSOvWj3lpfWt+0pRcM/wttlR4ljLq0YmqC8nQM2V4HqeBY0yOLzpca5d5q
	 tCVe7IWNbErXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09E3C40EE4;
	Fri, 30 Oct 2026 15:31:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 728ABD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63C5381B7B
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmnEnWFByCMy for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B35581AEF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374185;
 b=SrZSuoe/6wlvqHHB7V/m18WlRe+hPV4pg+NS6ldv6cah6q0WWsmm/GzoboXITE+CpJOd
 1sNb4e+wG6cp7iy1iyNSvkkFv0KYf9Wg6k7ncH+D4oVhQ+CawcFAfuXSEB5+QodVTk63o
 AY+s00t6D3Oq/aH7lIhFP3UyLiENnFcOyE2TVR1wuhNf99wAqdTuB6QG8t0Nowh7lMhRM
 lQ6CpLha3IenVgElVv4TbBoL+zGiwlNRvudUGdGGwymMhvA6CtCU5HFPD/azlZ3szPZX3
 CWeVhhdKgGCuuHvLS+Iy43gF6f24HT/2dSyRH7RFK6VwFcl1RJTbUud0XPzPBrNobrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374185;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=h5VNZyKkZXmyV02+vFZElwLKewIhoNWWKhMumI7lDV0=;
 b=KrcG5LBTXpdpwSNSeqnhyzzMg+A3DuWM+Iac87UU+8I6vvKPo0dzMcZLcwh/F6qP+J8z
 /+Gh3elCHtZanVdQ43e8YJ8e/0sU1nnmJZigiLD+MaE8vQxJcCJNU0R8yu+IenBX8bEMA
 nFciPgJoXW5aZXHUX7u0NHN1wtbsTH2e7Xw5pv23N8w9paH1lcfCLNRtHfShD+tibWwM+
 xCq8ZRITHTwdiN3tQSk/RnT12K88Huo5NYhDJKXMvbCO8kbg9HDznNjRkcFuGDX8vapgU
 eFO/CvoikcqX6XBZn5Dio+01/EQ7gIkxUHjBun2QkOf5ibq1vvXx+Tu+w1BrYzuhQIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IIXb41Om; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B35581AEF
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a208d93758so8828465e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374183; x=1793978983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h5VNZyKkZXmyV02+vFZElwLKewIhoNWWKhMumI7lDV0=;
 b=WYShWJLyl1IhqpJILoPDx+iy4SZYFA3G+eQW8wAQDPWaArH+2o4qrNw67LsEDOaxs1
 gKYvBeH1HtUFtfrnS1NPzmPwliEkpzNDfsXPED0A+kyNrE/YxgNGF+WqcPZan5/+p7n3
 a3K3LO+4s8ayEPm1fbsqV9pMumdyQMpPUpI+9sm4eZ27wIxpWkAz82hoKu7wr1LKvYf3
 abJXH6X7Tx0OwrYW/29A1jQNNVQw5xZy6qUma90gKDefwulYnz4zBB0WJkqReTf/g1QF
 0Uuo0dk1X2tYRGfqEdQIgQW7+PvWH4ICb40hU7Zn2QFx5ijEfTJiT1NCi2fXWuJtecJ0
 DrzQ==
X-Gm-Message-State: AFq9FYKBDbA0WaSBj9XwVBqspTmXUxRAWAIzVd/EgtkA/swEVrK/msNN
 dufGHLgpWGVvjTBB9I0CXNYTm40k4dJ5z0b8gEkEfP+7c9Kvy1q2/H39RpN/Hq2fsypUfZXd1Lz
 HI3l4igo=
X-Gm-Gg: AYBFou3dlkt2cWAjHyjjepb8GbhxqNc584EdVU0+hl+0KX9G/9B2K/uwgjmqKaL8cxN
 mjimfJzu7UHGMNnUgygPDhn9NJSrygIwEj1RVRxbFB6Sjq4MvwcIy7Ta5/3cb5An3/XrDn1Kp+N
 dLW52VG+GQ6Y5be9/ZMNhy26l1tS9RiVuLzxK190Onv1k6cNcHKd18K0Ocl3TsFcfQks316gMPY
 RVbIQLaY4cPvA6Mcs1O38EW1uy4yfMhRBGwemv5CtnSso2wSZGsjqGZdnYYj9B8HWib5ls+oFF8
 i7Cx2ZTlwKeK/StQqNyNH9mIcK+ofsI3wLzqDA+V8M/yS2d090aIObkDzKiRef+twpi4mjQUcLE
 jIE8BL43dR6F5XizgSIIfX15sg2lRsHLxU+VFrkXG4t5ofxwC/GlXoxMmI2tSJkuSI+wE+qIN/+
 GWhmQXOaAisuB67LXFMaSccU45iSns/xpNNqSphuf2CHZLnZHf+zHV9dFGdMZomJyGEdNxhtUMS
 ThzaEZ9mysHzMIdyeK5eAY1EmnrX1uA7o+qJkMnQpLeWRvpLcBMPfX7z8Z90S0P/KX/aNEEKXgw
 2eawvvxulWyuGGSNpIGn5XOTxvTfrfdvc84PtVkYKH/4dd3Dx0RhpFZfxCp7WB8MyBxPM+DoySB
 9Gd7upf6fUtEtdsj7pw==
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4ac16fa15edmr60210545e9.0.1793374183271; 
 Fri, 30 Oct 2026 08:29:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0a0a3495sm49662815e9.4.2026.10.30.08.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:40 +0100
Message-ID: <20261030152942.1908070-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024182139.3264878-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/domoticz: remove configure
 option needed for CMake < 3.16
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
> In 2020 the fix we remove now was committed with buildroot commit
> 6e6bd863093605419044d6e376185ff3caed9fbe as build fix for cmake < 3.16.
> 
> Buildroot commit 53beb8fc1a4f3ba20ea6c856b4ec8506570f17c1 raised the
> minimum CMake version to 3.18 in 2023 so this fix is not needed anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Building unpatched domoticz fails for target
> bootlin-aarch64-glibc-old/build/domoticz-2024.4/.stamp_built:
> https://gitlab.com/bkuhls/buildroot/-/commits/193b593de0c65a10581abe808368cd736c8f47b1
> 
> This patch passes Gitlab pipelines with the same build error
> https://gitlab.com/bkuhls/buildroot/-/commits/f2f37f272b02ca379a429832d14abf42a9a39242
> so this patch does not introduce new build errors.
> 
>  package/domoticz/domoticz.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
> index 95d3335adb..498ca232f4 100644
> --- a/package/domoticz/domoticz.mk
> +++ b/package/domoticz/domoticz.mk
> @@ -22,9 +22,6 @@ DOMOTICZ_DEPENDENCIES = \
>  	sqlite \
>  	zlib
>  
> -# Disable precompiled header as it needs cmake >= 3.16
> -DOMOTICZ_CONF_OPTS = -DUSE_PRECOMPILED_HEADER=OFF
> -
>  # Due to the dependency on mosquitto, domoticz depends on
>  # !BR2_STATIC_LIBS so set USE_STATIC_BOOST and USE_OPENSSL_STATIC to OFF
>  DOMOTICZ_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
