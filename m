Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E385606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sfCQ+VVQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDBB840D04;
	Fri, 30 Oct 2026 15:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hnv4ykbK87rT; Fri, 30 Oct 2026 15:29:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1562440DA0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374170;
	b=Eq4JL4hVoS9lGsnjepduGSzvrrYizi9dO4jMjsYysvDYGkZ45EYPnA6PIULC7c8AP5oB
	 y3nX/W8e9W/aOcq8Uxu48u/4PyeGTQI5B6oy8gOu6AIAiKYuN4UfB7+vZDvmXTJivEtlu
	 cudSk5HfGxg/xgSoz2rN5Lq3nlJyMpLLiTGW0++nr0nSFs1D47bBk1/ZPzeDNmKm8Avou
	 DDMSGGZZPUmItME/8TfrZ/f+N5Eu8RMG46aBV1nmcCDaQRGxSAK5yMo72Yw5Yuu1v0TCW
	 2IffA7FCKYe07/l1ouwKvLDyjzTz3ybhUnyDSGVGB+Azx98deiAjbGAOn68p54YnSNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2gzhmJySf6gmqKV5CeEFhrrhWcjcDy4P6vi3vtVnCQA=;
	b=icLUzNdXqmWYSVCWV0Y5UvwXdfUTUuk+3S+5jRS3uYU1UHFeHn/yQ0kHwUyEWhq0bnB+
	 vrv/3aJDUESLK14JwcgkcFfeK6E4qSZaNBNkVrf5IkAOo8QvrlfblJAq2JSifFLBWIooJ
	 n32izYb6C/Gu/d5oMAvASLhfpAIFBqGAsF83B7M0N2jKsbBLBTbEBKAssU5WfuM9DpmSk
	 kp4V7PIPqXpJLNkaCRIyfheMA5N58JTZG5YKDYo9EbmfS+XEvD3+wVLR7/imvl1C8SsOw
	 30zes/BOtnvda9FOJ/kcGkg40pcjMOf/psnhMW6Hg7OaNcc00Q0ksUzZi+LEDWsv5iQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374170;
	bh=2gzhmJySf6gmqKV5CeEFhrrhWcjcDy4P6vi3vtVnCQA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sfCQ+VVQU5ljf+b3KEl7AFCx5mQ0O9PKIjI35L+w+B18he37eljp+Y7XssOGZ06Mr
	 3TD1VDOkcWtk7RMlXP4/zj54zeLpfHPIiDWEMtVX3n/GPzR3QzclUHJx1KdcdlJqg3
	 wygNGKy2DRXu7bVqWpMHY7m5F3r9Sg2FU9Ur5A1xLIcrpSWXzuu85YIAPSHmFNh8I3
	 JHDec3c+RUe1R21JCAqwW5M0FpUFI9aN02JeQmxKCsdGbKl9M8LDqaIKAmB0KZMlZn
	 H1oKQvueiLksl4r5Cl6mpuEQIx3PqK3VldIRExor0BHwrRoM1qYWfxmJYdOk1pOeJ4
	 NwOfbw2ZsW1HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1562440DA0;
	Fri, 30 Oct 2026 15:29:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 52FCF235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44B6440C39
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ika2a8gl5RJ7 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3E96640C2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374125;
 b=XkxkJAtWeb6mHIvJiUEQbBYE8kxTR9t78xzLOUMarDhToUSw5LqVMUJxAHyASdvWykhq
 Ul9i8kIIrtTdOFlcYkhCvCWQ18CdMZx6JfcHZy1NncVfGlvKaoNaGELj17cErsolMeSUn
 lC3ZJaaLly/8MfD6mHXgP5Iw2cxtl0qXB+o8IY2mgLGDpmmc8fAeiyrTtQRjx7tr2AM3h
 gt46x3K82JDI0P4wW6ad3Khm+2rAO3E+AfOwNP/PnVWmlR1/XHa2LtPHsZfGNVFPmJkbI
 9UtVVpRqBwKaGaMvoWL1ViMBcYmTLEkcdXr5EAAP1UJragqYvii05GaUNq66U3yCG3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374125;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sCUP8t3N4Ze3uZxMYO8myeKb2GNdyTcjwxSo8vagDNk=;
 b=mSFbyJCN4Xsmyoa5O9eyu3aSvX0VXqHQX8pXj0qazysC7dUFIUGLUhDFkbORXkFAg3FK
 dym/THJEaVnzLqJBA6WL6lRhXLUF5oX1Yjvg2YWTIZLcXp4lrw3zToHntkiqayZmErJqi
 kCxREtz9a0S33CU8qvE/j+kpEZS4eILvF7vz22yKA/omuIdB4slWybJnDDp32M9NPvBlk
 cdUMhFutyHiSU2rCkkcmAd8AlPijf/8KP4wT+i6131tyc2xB9dxMoWqcfRzx0zImnRBbO
 +ywRsMS18E0/M+hCvU+76RwfbracpmSl6D4dKxPslbUH2yPqCzY4AE1wQTtQS/OhY9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Nm+Zqrf7; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E96640C2C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:44 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so8233055e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374123; x=1793978923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sCUP8t3N4Ze3uZxMYO8myeKb2GNdyTcjwxSo8vagDNk=;
 b=2cE6jqz0MK9s6poI2Kjf8+mLg9pcNtz3JyQwPJiwtaqIhNjWwSuKSWcr60Gi0lzf6O
 +5cITR8mcy0n3uoDWnYpvXDFiRLG2WC0vIzixC5zTwJpY67bssl9qTLIDMsvw2X40PTC
 SeyH06xA7Whi4Rq/hMK0/nqss/20IALyyw1kcZE8qKH8ZlCKq/Igv6Vq6kFTTTY1PhHz
 ZRF51ZwEOAxL+RPx9+m5vkfEaf1/SRJXFFs1+q54Tm3tHn+T/pp55ZueR9uDb+wg2pjl
 w65bLuGl2Xpe6JcgmYhiLBQpQpvEacv0TlohkTEHIdltUPUBtDTFUbYxPItlldAH9NqJ
 RotQ==
X-Gm-Message-State: AFq9FYI8EaDmKhz/u3rwpHP/95ACNQiTCfLmsxegenEkckxyD4Xlg+aY
 Yv/RQ4acj//lH7IKfT0RKb1Wj855gK4sevc5ETQR6Y3g1K46cBsdsbM9RNsSg0oVrDcVMFQlloN
 ZHiTAUHc=
X-Gm-Gg: AYBFou234wYUfCNdaTZzWKqo/R1MMiXZ2rV6cBoBNtjfw9S2zTxMcLq5gHJyIIXFCHU
 gWUBzpTIhGMecC7IXRFSNvLSpJfT+6c7ui3Eve6ewGEgFJYn674Ka59xV/uTOlfxsT+ETBp5wZo
 aYI7Ae++OHF4TYHkguTsAjba0knFLCbgi0D6DM1rGDex0hJYnvfSC+3xjcUvGXFDX+6/Va6t0WY
 xJLteCZ1B3GK6HZDUXq56Qp/Us/Y0gxyvH1BQSmaulqqMLUSBihd5eyZpuVLxnACYvB+M08r4KT
 AY80nqNNaaWXqEd52fy+VoN72QLG5KmarPaAo23m9WBjRbm0iuPXhpTHR0AuYGiiVg32Qgd/wO9
 nQi79AXrEatlGr/vDow8EgLjCql6qLOHNbmAYV3LrDhp9bgyKW6Am3TLtp/Bhqgb63yu/zUuUuS
 btNsgQv1QBPbmmE54eeP0BWVo1dEtQnhIX7kzGZpXjyRo8dydJucz7PwsGosNLnEZraSPeMAgvg
 Izzxx4r8CNZzoLOfEfO8uWXPDo88uFVAiO28jPjtUtH++J+YBFjT1ipDUHb0vFyL4T9a8GdHO/p
 hMjoVCbFHZoSTBpnR/QT/gzhvtsYlB9V/DiavHZNuTLB2bXXOyPnl3eOEBlYOwoPxxUOJeHX
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id
 5b1f17b1804b1-4ac182dc0a1mr64067265e9.16.1793374123018; 
 Fri, 30 Oct 2026 08:28:43 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf368bff7sm68625985e9.2.2026.10.30.08.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:42 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:40 +0100
Message-ID: <20261030152842.1907484-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023073509.3714686-2-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/brotli: use github macro
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
> For consistency and to end up with a nicer filename.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/brotli/brotli.hash | 2 +-
>  package/brotli/brotli.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
> index a777737338..c851d7fad1 100644
> --- a/package/brotli/brotli.hash
> +++ b/package/brotli/brotli.hash
> @@ -1,5 +1,5 @@
>  # Locally generated:
> -sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  v1.2.1.tar.gz
> +sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  brotli-1.2.1.tar.gz
>  
>  # Hash for license files:
>  sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
> index c040878c36..47e2f8e57c 100644
> --- a/package/brotli/brotli.mk
> +++ b/package/brotli/brotli.mk
> @@ -5,8 +5,7 @@
>  ################################################################################
>  
>  BROTLI_VERSION = 1.2.1
> -BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
> -BROTLI_SITE = https://github.com/google/brotli/archive
> +BROTLI_SITE = $(call github,google,brotli,v$(BROTLI_VERSION))
>  BROTLI_LICENSE = MIT
>  BROTLI_LICENSE_FILES = LICENSE
>  BROTLI_CPE_ID_VENDOR = google
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
