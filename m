Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90186606A332
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nvVfWefn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6637881C20;
	Fri,  6 Nov 2026 16:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPXdH6TaRQx8; Fri,  6 Nov 2026 16:10:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 818FE81C56
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981410;
	b=ruJZuAibRQcDwghuRi4O0utPhxcEUG9IXPjEUSnEK6k7LNXD4ITdOxOn6LIstRicFRV3
	 Aoo7sNbioQ6ecZnS/uX9Wh8UsL4Uyg39DipBBz4W/R9p7SaZ4sIfFbjWEmL7AEEaDqaW+
	 Yu+47wyBmbxOlYhddvygWSlfEWVYM+Nb1YSYqm9kmZ3zoqTZbY7R49jRK5zJIedtpzUtj
	 +0ZBQ4tilWzx4xgKOVmdqaJ0edsH8VY1yg1ffQk+XQXlJBT3usEiexfXzQn3rN2KrEdaO
	 WQo7FP4n2PK+JrE1mojij4botNXmULj4G/hFyhNa8KqHScOxrzlkKHa6B3PSgEtvaBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MVYFff4bg4nlpbT55kglhLogkRwM4PyIZXfws07xtLI=;
	b=ImVWCDQpb0uxCyVaMqZbZeO6kXzBgxxRWBM9+OLU1YhtaKibpuqwq1XVIu+mySgMkvGe
	 77XDTl4olvazYzb9PCjBaqgmheHbgwtBLY56TYEQ1EMA+ItiE0zpBw7Q3vLvd9GTBVwjN
	 5T95N15opO+2n0kokeDnwworJ/cXSZKLIzAgdrXqGxfQ46vrent84sVF34Jfp5h89z0ii
	 /McBhOJhl2TtUtmq4rg8S97CuzqnRmJeeIXKMixUA/KNy5eYIZpIhY47iQXZeTk4ju2k5
	 bbYB9VML3Kmn8wKeSGioUfdFFiCAFXEwBh1hfEpY392fVrRjqf3c045RPTJDicUab1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981410;
	bh=MVYFff4bg4nlpbT55kglhLogkRwM4PyIZXfws07xtLI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nvVfWefndb64ajvcAXrVyBTxwLEkTpo5Sz5tdZp0lghD9m7N/yQ7WVjVNq1f+1JVy
	 r7POLw1Oqa7OWMaoShA0yym+AqYnyFbUsa8srHuhLCycqoUoja9nZLgHjulxnefz+9
	 BFX3I6iDIFaDO1c5IE/0MRyyrKByGR7RitU60C2JUeptfqvgaXkr15NVPFtHLfepsB
	 s5VUnZLsJP6id+8ReM3aNc3m2Sksv8nw1vvxYUuK83ScAWQGKat5WJyFosG84+8jPI
	 CVJ5kcy5TYdJjKIUyHTO4aEjYUhs+gAg1ci23sm4y4pBoIEgxoFxtzfYaIB97AZ42s
	 GWXhBBK5qSDqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818FE81C56;
	Fri,  6 Nov 2026 16:10:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C4994B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28BBC8149C
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOmkDJvRgmTP for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5883D81C26
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5883D81C26
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so6791315e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981402; x=1794586202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FFQZCgb1UQ8n0V4Gt4ekKVm0qaW0ILl/mpg3jZw9C2k=;
 b=ivcXTOv8rg75Ne8aADhdfXnEFaBnqIudMLxMUM1f48ecvb0AYYfpIR2iRnG76D6ECx
 frc+XdrKpjomAi9xWyUQx+fjaDo/KqTzDO8+K4GOhYsGhGe+qqxDPEIcBNQPpZJCxdMg
 03blN5571o2JYYxIixRcAQjauHmyKpu3v4V8x6kb9FcjaStH9LqGiXkkUD4u4Oe04WGN
 xIgiW8NZ0GOW6OL4XzVxWlr8/yI9bDxPG8h+uHx2+siRp8YnolGyCbkdR1UoMpXgrlO5
 oBDXLed+1t/sSPrWPEPpdvc2lxGHvOZJGrGPKRaYyW5V6FpnJ4LyS5yUBT0arE4VYNgq
 z7pA==
X-Gm-Message-State: APuU4Z+Bh5WhLu0eLi2tWG3fzpNGBFAL21nG/aoBzrY44GX6Ja3ERgw+
 4vWhKfSqrAxQKF0lae58nb0AzDI+j/PrmNfmyKfv+NdT01EsUTQGR402SAhmcw0wGDGqGbsRK5+
 XplOAy3g=
X-Gm-Gg: AYBFou2vagoxYA/Rf3SRsp6DaCMjpxpl7ajEsE44ht67B6b06h+BeuypQgXB0+/xSNn
 xCaQHpVLjqips7eX+J3glAh/5hvnUcPFlmyE0XVc08tj+dnSs/Tjx1sHYQ/rL8e/2ePh/BEpFlO
 z6I8m4GQdGFihGI3rfX0G3Sc7pKMbPPNTSTVAirctZ1xld/yKJyMEFXXozvjGl491pHT0R5EgyF
 5qZgRuC2JWfDxmstNKUzIUdxxsgQLKuIuWOo5Y71Qp6VDmwYp/MqborNaFuVY9SdXmHiKyNMJI+
 9TbTS7coFr2W6aa9ZBB04x/kApkQx2v4F8ZXD2kvvLa3ZCpcnI4EvqT5I1g6BP1oYCN7gxD9wTw
 q4/iaDFiIerna97gURBdlg10yQniT8lMcQ0lW++tJo061K7EXvtsrRyRhE4K8iMB/xRc1RG0Ylm
 UXzK91He/18L1ah8BZlfW8UPEwMxm9nH6YzzJ0uaijYeOTP9x0gGsG31qV4lcUR3izIERm8hVMO
 H2U++bJHXoGrnL+54cf2GQ++3p6B1bzltjSrW/0VZ13TjXLvb2v4SgqsWGSz/gGo4AzTyE/nV3I
 4kbnQ5GTDb7MoNuS6QMqo5jEdWTwNJU=
X-Received: by 2002:a05:600d:82e2:b0:4a2:18d4:f9e0 with SMTP id
 5b1f17b1804b1-4b6df6deffbmr53237745e9.25.1793981401776; 
 Fri, 06 Nov 2026 08:10:01 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b572bba207sm140940855e9.10.2026.11.06.08.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:01 -0800 (PST)
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:58 +0100
Message-ID: <20261106161000.607429-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027145351.1527631-3-giulio.benetti@benettiengineering.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/rtl8812au-aircrack-ng: fix build
 failure using gcc >= 14
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
> Starting with gcc 14, several C diagnostics which were previously warnings are
> errors by default. In particular, -Wincompatible-pointer-types was
> changed to a permanent error by GCC commit:
> r14-6037-g9715c545d33b3a32ddc1ae817ba9356ade1fb9df
> ("c: Turn -Wincompatible-pointer-types into a permerror").
> So let's workaround this by passing -Wno-error to USER_EXTRA_CFLAGS.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> V1->v2:
> * rewritten commit log as pointed by Thomas Petazzoni
> ---
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> index 7981a382b1..f8c62608ef 100644
> --- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> +++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
> @@ -13,9 +13,7 @@ RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
>  	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
>  	-DCONFIG_IOCTL_CFG80211 \
>  	-DRTW_USE_CFG80211_STA_EVENT \
> -	-Wno-error=address \
> -	-Wno-error=array-bounds \
> -	-Wno-error=cast-function-type
> +	-Wno-error
>  
>  RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
>  	CONFIG_PLATFORM_I386_PC=n \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
