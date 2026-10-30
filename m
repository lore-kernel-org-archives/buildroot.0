Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2706606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=d8DdQdDS
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0C9140C05;
	Fri, 30 Oct 2026 15:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQawh2b4hiww; Fri, 30 Oct 2026 15:26:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BF27840BFA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373985;
	b=SjrpjpnJG/AvW5bi2dNMmeWxaGZMG01Va4+OUOvkh4wHbkO1VB8Q/CPVq6MM0Ija5qBA
	 UOJdDY4Y940GUO3W+UerQIMw6KKV06SDMNatsBz/Q2MLeqyaTJmZjhiV6k0Its4yfi33L
	 5Ch5y2kmFIbw+toOWbTRNP56pHe5HMpP/EkjN1iM2VSAbp9PRLhANLytj2zVur1fY4YTw
	 eHvUHFkDbw43YMy79ndJ5lMhXK3+6QbvNCXTT8hPyPlF17D5EMLsiY90afMnA0rLhk+4b
	 J+AfYMZtBBvMXh6idsBZP0xJAogrbl/YM/fgmeeZWAA+dE3MchjBC4iBpEbQV2vEcxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373985;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6sWxlu4k+co/S2TFGhy2QOOl1dd5sbrSlxXNUOo2BN0=;
	b=D1HY2RW881nZgl3VdElw4HsefpalKP/fgNAxWWxS5Ll0/h1CEwZF6VaBmsGAEJsGQXeI
	 3XhyKe3FY1KdoOj4AudjcFO3+rP6E7YZWUO7e6EvSNxAskLchqWYUbQ/JR3Tj9vVGxGNZ
	 WHeLvnt+FmP0d7qhRVWEyQFCbnXr1SKHbBxFwoeOQVNEAdpWOl4IL12yFPT07QjoizdlD
	 lH8WUgOuijAZV6eH72y0UviZdKdz3TM25qK9lC94jBfR6MeQHlDpTr3NP30+Lz/T3ObWt
	 55bUXcefvQUqJqt1nAl6rrsC3sp8baSeRnzjk3QC/XSrB36a761FT5D5Bu66bTbXFSg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373985;
	bh=6sWxlu4k+co/S2TFGhy2QOOl1dd5sbrSlxXNUOo2BN0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d8DdQdDS47wRQGo+tc9MwaUypx1zI4KVZ+zm/1t5kC/sm06+jMOHkJjnAEWJMj5EZ
	 03BIwtrk+dEoFyBFG/bDE0WHLu7q1XeileH+uAnG83HOx8lKQGtPGp4vEcelgEyt5t
	 cYc8SEvtOD8iEvStkhyzOUDPBbm/cZBc+gertF6VtFPNT1JgZilbSxS2y81qKc2+p9
	 78XweGB87jmoQdReqeXS6xNAbx9yEsN5dZicDDuqfdz+Bd3kzr5eVca8m8beQGjnGE
	 +Q0clMvZO6c97S1O7x6l3EijcDXIODT1zqvShutXNXJPSooib9hFXFqbrmdNeoRt2h
	 pfkF2EUp1Dqyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF27840BFA;
	Fri, 30 Oct 2026 15:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79186529
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A81640BC1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abKJBv-_7ATZ for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8276840BC0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373978;
 b=KMCZJ7bYo80XQ8fG09BCrHArZ7h7xyDUb8tezABPO6ahzlZ0MWWSJSyaMTjJS+6VkS1y
 zeeRvQroJ91JdPtZ27rYMz2VPy/cpSlWp6g7VQkXZZnbFuaZ6Ui21Uj4JEKv7Sn2VTlHU
 jPgQTUAE9Mbna8A/mJzXban9CDFPGimtBzH1eq0dLaxzKHzeBsuj1EM/y7FstbeUIzDUa
 djQpVQHYRNd7Ks38Psn3VBi5G4ZPy+CsaDCNO+GfihCZc7sZGyo+6IgWLStV10sL7cBRc
 XLC4P+TKda1Wm5Q8f2lxkIBtA4dCkWplyifpUhUQq5r6SAkFplymKUh3Wh/ssnqtZ0A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373978;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GAu7Rn2rqjm//lrI0stocqbjNQI8w7zcr1bhKJPLOWU=;
 b=qAba2hY4/URtYrvGoSwAiix+JZ/kgSdFK7exMQgcOVRz/Go/iFy++vUbNxTJlmKR8zo4
 G4D/y1oOrcnVtOTQExcfaD8ekhXGACRZ8GelwelqQw8KExeszcrROnZ3xAIi3slVN40RS
 4A7P4wpHpPNEDbyr4x4uI0z4VeSLIDW/KPdmRuPqvUPAjh+VLMB3z98MadG42eRi5KSmT
 8b9lADse/8mbH2DYEU99fRNuvDwkkhnP5878vjHQLykTBy/j1yy85SBGeYDwGxfrtgq2+
 9zcwwrLMqe+jbj0hPkG+pmhLaGBxIxJqm6W0CCYdWjLjOwf0Zjj2/WajkgfhFmzFj4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KD4KzfNl; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8276840BC0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso613632f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373976; x=1793978776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GAu7Rn2rqjm//lrI0stocqbjNQI8w7zcr1bhKJPLOWU=;
 b=p8n37R1930f4FhteXVRtNcMJF5VBVGnxBhfzfVaP2A+IVahLOLY2xqSyk3YlSQ6C2Y
 vW2PBwXIxxhKHz2XUzQRHjld5KoaPy1GjD7eVIDzI3W41oRvHs2cpRmIiYqk01Xg2y6p
 U9mXLhsB0IhyffnC4n7m9Tf/XalgduSpa5MJEy6gh5ApnpzYBljmpAJo7XDM7Q4lO1mU
 k2Mmdk93br2ZtY+z3ER6BlQ8gc9f2Hx1k1c1zbML62tpVvBfcDS1yYxEHmrSTEXmrqix
 K4JpMJvC1DUp4cOH44ihH6XHF8lOphnz5DwsP3uptPjHbwqm5/v8TfMKBAw8ZnEMrQzk
 UwIg==
X-Gm-Message-State: AFq9FYJFm5Q7RDXX4tc02zKi+12k8VT7CKyQAl0yJ5G3VzQuqnBKKNwZ
 CCIFjRjFjaRcXZKh9xnGjfF6H1NqnwGWWBvizBHJn71JO+70pP90e4egue1SlDlJhfwM+okHpNu
 0d/z/gBY=
X-Gm-Gg: AYBFou0LN4sKrYoAQMu6pl3OamSWM30zzETYPDhUgepM82qDy/3mFyhOW2Jc5nXDC3h
 EqtYD/5soRGVBpED48Z8jD1aX2VMMB5r8tmajR+D6THv+YifGDKn1dkK9NkqRBPeDJQLJ+8jgmw
 t8wBml4wSsSyOr8Lk0RFkKwfJjGpldQPAt2orxSon+LTygSvGygf9eh9DBfwdRcrjc/alljdYxN
 TUEKkcC7L/OirQMcRmyRgWdF5vj5zzZvt1ukb+jTqxBSkkIlKRfZHd5ZT/OOoDaRtEY98iOeZA/
 LzS6tRZZaoCSvJq60Zvbwc8lsliPdU++HPko9FRawWmmSUE7uIDeTBUjwt4m4w7kOWlmjkcj1by
 NelCJaw27kfFuTOR+ilErN/Jgttf45fyjm2fXd1LlAEHPDSvUkkwbY2NF/5Opr0wyNn+aedlkLw
 sZ0Pj4aREhmP96OpVToWPDfdQM7YIOHIc9qxyw0T2TvCJjd/zgDAb9XCO6h6AZ3llLeVfw0fxOM
 v+WJZVK8pAS2swbiQyX/yxz8tj37bYUX7G3Mj0zg73LbnquaF8sme//mzKk1UHkMbRH0J/BTAxi
 47kUVL9ro9Gx3JjVR3bGECLV7N8+FMTXEGN3aR/R2FdpFzXgEGb9w3PhH4vbDVoJ3+duBl8f
X-Received: by 2002:a05:6000:2c09:b0:48d:ff06:c626 with SMTP id
 ffacd0b85a97d-48e6e50089emr6210461f8f.35.1793373975839; 
 Fri, 30 Oct 2026 08:26:15 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b959c1sm3792906f8f.45.2026.10.30.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:15 -0700 (PDT)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:12 +0100
Message-ID: <20261030152614.1906021-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014073743.3673307-1-dario.binacchi@amarulasolutions.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/am33x-cm3: fix build with gcc
 >= 15
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
> gcc 15 defaults to the C23 standard, where bool, true and false are
> keywords. The am33x-cm3 code base defines them in its own stddef.h,
> so the build fails with:
> 
> src/include/stddef.h:18:15: error: 'bool' cannot be defined via 'typedef'
>    18 | typedef _Bool bool;
>       |               ^~~~
> src/include/stddef.h:19:8: error: cannot use keyword 'false' as enumeration constant
>    19 | enum { false, true };
>       |        ^~~~~
> 
> The upstream project has not received any commit since 2018 and none
> of its branches fix this issue, so rather than carrying a patch that
> cannot be submitted to an active upstream, force the GNU C11 standard
> in the .mk file.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2026.08.x. Thanks

> ---
>  package/am33x-cm3/am33x-cm3.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
> index 8c890a75fc3c..f753e46134b3 100644
> --- a/package/am33x-cm3/am33x-cm3.mk
> +++ b/package/am33x-cm3/am33x-cm3.mk
> @@ -13,8 +13,10 @@ AM33X_CM3_LICENSE_FILES = License.txt
>  
>  # The build command below will use the standard cross-compiler (normally
>  # build for Cortex-A8, to build the FW for the Cortex-M3.
> +# The code base predates C23 and defines its own bool/true/false, so
> +# force an older C standard to build with gcc >= 15.
>  define AM33X_CM3_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC) -std=gnu11" CROSS_COMPILE="$(TARGET_CROSS)" -C $(@D) all
>  endef
>  
>  define AM33X_CM3_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
