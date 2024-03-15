Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8524FC54E58
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 090D660F93;
	Fri, 15 Mar 2024 19:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ijqac93w3wfE; Fri, 15 Mar 2024 19:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C53760F86
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C53760F86;
	Fri, 15 Mar 2024 19:22:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D230E1BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF3E382404
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:21:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSqldteP2gz9 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1631D81757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1631D81757
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1631D81757
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:21:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33e6aca1ca9so1843866f8f.2
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710530512; x=1711135312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fW9oipACYrb/hZdq1m2KkBhu4DP6tpJ9f0iVjLEPIXA=;
 b=iLiTe+QcReTGxB7UIFB57R22y9pyeC0EqdoJoDWUvSBUJUUKs5LBvIC3yADakMuD2P
 ji6EO2S2rFsePXH/siFwCi5Lz6pQRoqIOywoWyecRG5ZGa2xbS68FamqRtroLT1fx7RS
 S7kWs1kpmSKvI1bO+T5llepQEcm51ZBGLVCrgS+VvE0/qWrGdyd+WW8rcKWYsIvNfnGf
 b9/iur0xjRQBsPbXNMFYRfrEvlI0c0j0fX7Mr67nroi9hc9npDtAjWaxMZRUzdcRJ1wq
 76SvlTWLajJADRdy80KjeDlzXYI17OWKZFvmHNZpmgJFdqEiXRPcnbYLBp+xu0nzqvuT
 sdhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB51hNFRxKrx4YecplsizEDkbkCpVUhbLH701f/dPVq52rkR6dReQFjZBdCIUkI1r8ib0vwQt+Q7/L0ukDJGpE6eZrT3C7IA==
X-Gm-Message-State: AOJu0Yw78ni+HGrDKxw4b4afQrYwt0PP5CL4weOVopR2fYNJG1NhHCVD
 VXqXJShF7ejmKf3pkHs67Bjhs616uChNm7rEztnetHBwSfG997mapwxg9ERnzWB22iugW2ktuxq
 P
X-Google-Smtp-Source: AGHT+IFzOzVXaesnDj4C47HqxlhI7wP5B4Xo44wjoWVR2+hnCE/K/K4/6BruMZ40jbF7UDL245VaAQ==
X-Received: by 2002:a5d:6191:0:b0:33e:6f9b:7abc with SMTP id
 j17-20020a5d6191000000b0033e6f9b7abcmr4168633wru.65.1710530511700; 
 Fri, 15 Mar 2024 12:21:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bq22-20020a5d5a16000000b0033ebf702e17sm1863302wrb.21.2024.03.15.12.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 12:21:51 -0700 (PDT)
Message-ID: <62a315b6-f0c1-4387-b89e-d64ba3358e50@mind.be>
Date: Fri, 15 Mar 2024 20:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240314213252.346954-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20240314213252.346954-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1710530512; x=1711135312; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fW9oipACYrb/hZdq1m2KkBhu4DP6tpJ9f0iVjLEPIXA=;
 b=CK4PX1tBazLCUjW4BWrEUfDg+rKC0GAyGSt+9YHJJcu+YalUa9CY4AvQDKSOrvjqiD
 MAP1fxIFLoyJszeLmiWypdJwAk1YwbB9LSWwYzUgTWTIQCgxVi6YAfvVnMuy82JttBVp
 Hp5ciNqQeL/q/td0uPSHoEOQWu8f8E7DtdUw8Slm7HQR4tJHgGyYoaLwrJ+ixWpYPviT
 K7GNOHi+HZGjy+JjeUj+L9IUdNreAkJbpwJQX8E0GT3g36qdBkxlGP0pdKDH+3Osk1/S
 RFXiaG1c+quOmtOeqdYth6Ui5Dwm8GEtITzJwUCMYptKWwTLlJX7DEaSsOMrFgbW8IoB
 hWNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CK4PX1tB
Subject: Re: [Buildroot] [PATCH 1/1] package/libkrb5: force arm mode instead
 of Thumb mode
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: =?UTF-8?Q?Andr=C3=A9_Zwing?= <nerv@dawncrow.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/03/2024 22:32, Fabrice Fontaine wrote:
> Fix the following build failure in Thumb mode:
> 
> /tmp/ccdzbA2E.s:845: Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/08be1fa0fee0f05818cd78d4718caa3476c570ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libkrb5/libkrb5.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
> index 62a34b2379..c58763eddd 100644
> --- a/package/libkrb5/libkrb5.mk
> +++ b/package/libkrb5/libkrb5.mk
> @@ -33,6 +33,13 @@ LIBKRB5_CONF_OPTS = \
>   	--without-tcl \
>   	--disable-rpath
>   
> +# libkrb5 has some assembly function that is not present in Thumb mode:
> +# Error: selected processor does not support `mcr p15,0,r2,c7,c10,5' in Thumb mode
> +# so, we desactivate Thumb mode
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
> +LIBKRB5_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
> +endif
> +
>   # Enabling static and shared at the same time is not supported
>   ifeq ($(BR2_SHARED_STATIC_LIBS),y)
>   LIBKRB5_CONF_OPTS += --disable-static
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
