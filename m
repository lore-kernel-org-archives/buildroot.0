Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A43606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EOXDJdYz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6448440DF2;
	Fri, 30 Oct 2026 15:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_A_71SAJD6H; Fri, 30 Oct 2026 15:29:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CDD9140DCC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374167;
	b=rtczEYyVkBgzL0+SIVsr36ujo3GW8mhvSf/taYqyrw/pwZFLCa2hCC+J5Iiwhoo9bFFo
	 DwZzrichvNP8fHuW09uDcO27HJVCzqejZ7PHvVSNy8upCKOkxKXhHnC7m+lCuugig+lYw
	 Umljo7uthMAf6ba9Fn+HL2OUaira6vqbEmabsnNrDApXO5B/5xYx+DT5lsnnXlO16L3wC
	 l+ps9QTZSYxFsigp9dYj0qyPrZP5Vw4hsEOe3p8ddakWhJn8iF7Sjeu2HeUTGMo5m7IRN
	 XVlCbZsK563fY0Y8MUeoB+heBx8RbcExgNTrQieo90DyeZZ7fhBEN09gHXX/sd/XeTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=dwbRkE7FSq5rbdlPd8Vp9E/a1DpXembjNCsGNGfD7Bw=;
	b=UIBRifCuj9nw1DqwJR7gmKmpNT/6yjs3wJulW2PkLEATbP3G+sE1Rlu3MV3ipyAV2MlU
	 CDobqd0nGQAi6NsIkhujC/BEl2xxxGb0y6/qilXfWU6Tzg5PzDGHEnu74BpQqdEYIiEzB
	 lvgtrSC5r9Q6DiaCKuTvIsxxAdmod3/9j3H8xE//BQQxQI3kg+XT4il69taYuMhdd7asO
	 BF4W9bIyJ7cR/uHTsbNgxWL6gIciROXEIAsDa/bHiddQt5UGGihYNHdlR5VFu5Jyvca/l
	 5pRjKe5muNJhNigpoGzHF8g+jArVu1hCPxy+YMahnhcRdTNOrkwVzZt2jAoc2aI5SSQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374166;
	bh=dwbRkE7FSq5rbdlPd8Vp9E/a1DpXembjNCsGNGfD7Bw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EOXDJdYzfzJTceS5p+xLuefHPffo9RVRxriG1EDxnkWI6yCzMn0Kc1OfOhLTBNVLm
	 OP6P1MBaIgD1tyNwSfJKBpfre2NUW/Yy6exkJj2awquDBVHHq2NHeK2BcJbAucod5t
	 scXo1fP7YjdDm0WR2Ftig2CmmhT7vKNWTPLo19t7M/F0EViSSad2fQM4FvKKrXo7Zy
	 f8Aw6omVE68uEbj33x93xTMLpi+g46P5IplaL6oV+nf9MCDpIe+3/h1tH+bHpsOV9Y
	 lQkkJ1tEamefYx8Hb4nTyrKmNDMheCEgN4nhivdLGd/EilWZOTtpPKkwSGDswDqq36
	 LWXUnykejdgug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD9140DCC;
	Fri, 30 Oct 2026 15:29:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2641D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9473E40C39
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O48Rv0Pnv_up for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 603F540C2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374120;
 b=p+BZ84MJcSlP233PlfAW2bQI2FSa0NfnHUcuv9M/umkK2iTFPDkGCZZbdbAnQL5ijlop
 C0L75jQ4GZ9MsmqVlOdWRFe2FqiSY+Dy9Vv8z57OV5yogvqgjD/hQgFhZ3B+B8AcekjuN
 A8SBgNZ/XFgOcLOvt6ADP/KhbtkyIUqwk5cTxTPcTOdTR0/6gZ7PVmYZKkKZdogsEHTvA
 CRmMz48g7amfkblOCWIldWGWoqJ7pHe5sK72jhsuhvk7iHP/ndKrweEHONzWoBQXZFS1o
 jOidSQSC4Twsg3nnydcePaoWrNthPVGI740FPvbnAI1sGfGFdcMmo6Y3R52l2v2BizQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374120;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=9T6UCCf/ZkcHO8wadn0MfBjZKaQtSXu8XSs13Sv6X0k=;
 b=tPjPbBZgo0W/rSqMOyEXHK2GuD5e7gbMSzwc3FJXe+hhb5xWZiKJQKmPxfiBFNL7nhHL
 f2Go2D1/bKhU9u86mNouLqwG7NidcJdASxrX/U04mn0kLw1ILXexsbSrxWkaE1wEoFLX2
 6TwMN6pVbYC1/BfE/IqDoUmH3jFdVqmmSjoVuO9rt6xa8ds+oxFNl4T3mWtgeiZlZtSt+
 GT0jVu70LJVycmGhtrVJ+VD8FXVIO2y8LUYdvAWVZqtec04iSZjeghln5YG7VUbrs4Kxv
 q0tosTHF5stMi6SjGpOZEEQXX6r2t1Nwlj4NceYYe93Zmd/TKshrxdN8+s5iuj0/Rhg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=gPOTOAYb; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 603F540C2C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:39 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso5439955e9.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374117; x=1793978917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=9T6UCCf/ZkcHO8wadn0MfBjZKaQtSXu8XSs13Sv6X0k=;
 b=oPf9PD5dloEnHO9Lca+VSPI+7d0onwJKcr98qtO1HQmfvlpTxm7FcVyjlpSQBo51m+
 ZchT9Iv7fZo9ncpBXguwSWBLl+tj1Q1Vo3/N6+DsdkprNTjuCK3cmC+3xgkfGIkrUdb/
 iAD89sb4ar3fVSGvDBkzh0WOPosQqlMPvac/fIaNBid+ZOS7XkRau4NED/S/rGxQSuyb
 lVMnLsVuBat8uKz2UWh87hbKyuFJAPFOoS+UbaVsn/f0aRmd1gPnnM6AP2rj5HvtwHpV
 dvQaJAmVE9DAi+iqLmXfoGujND2pMm1vtZE7jbbORuIdV6KFnUU7utV4icXTlU1tNieI
 99HA==
X-Gm-Message-State: AFq9FYKsryHBRUrHfGWKjTnGZVlT+QWDjeyeTTayFvg5sCKRuECwVwUX
 oWeKei9rb5gTvzD+gfLC+TiQiZTEBdux2f8/5SW0caI0HZMzaBUKwealRZbBRvPxoixAl1uDdg5
 W9vLg1A0=
X-Gm-Gg: AYBFou27ris3Ro1bWIdRu7HadbzKI3pXaDRoDtOkg6g8hXtcqwViezh4nh2hQRY1O2s
 XR36Rj9L+GrlY2D/pqw6/tWc+hLe9rQoXe/AaDXjxn0eT3z6Nok/St0UqQVS0wNCidNAufIDMcm
 NwNQrIKALx8T6vVYw+HsYwrWN6L2/hU+LJc78+Dgp5+ohxgI9GMd1cz7R/M3miDhAbCxeoK0Wbv
 mV2gVhMbT9c8AL3dTWUrVXCx9xEbz5bkw9XzuAfw5g5PGxj7AXo2WqHNP3UBrYt0f3VV9ocqFz6
 g1tCa8zJt8IVV+aSZe4E3LjawHXu3Fs226jZTvMBS+qRzC7nI0Ws6hiK0m73UaXbw8in0ybZ5Ko
 DVQaqh/cZq5nxShtmD6fIHeQcwJgRo6RGXKIrGIPwq/lbjnKtyNZBfMnsHrvw2/7LUg/QqKvMyq
 xAiie0qpZEkYPjEHPCZMWINY31h3xQWwtwq9NtQU3mIaVcpRbWOptmJxUdd0c5xwLUjhMvB47fW
 M4/6ogGR3Dlt11P+mHkwd7WxkuGKHS24iErCTkuYPpUpTUoPb4vryP8gdeGDy8BeYKcSDSxxUoN
 f+vnesgy7Qmdm9fh2PhdBPNN2Dt4+LQumPozq9nDSpv+PKe6wcUQy+Y7ZzwofP7tYH07UNAV
X-Received: by 2002:a05:600c:354a:b0:4a3:5a55:f454 with SMTP id
 5b1f17b1804b1-4ac17e10ac3mr61574595e9.19.1793374117234; 
 Fri, 30 Oct 2026 08:28:37 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa80f04723sm163846885e9.5.2026.10.30.08.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:36 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:34 +0100
Message-ID: <20261030152836.1907423-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022235328.3259902-1-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nghttp2: security bump version
 to 1.70.0
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
> CVE-2026-58055 [1]: nghttp2's nghttpx proxy through 1.69.0 forwards an
> HTTP/1.1 Upgrade request that also carries a Content-Length header and
> body onto reusable keep-alive backend connections, re-adding the
> Upgrade and Connection headers while passing Content-Length
> verbatim. A backend that resolves the resulting ambiguous message in
> the attacker's favor enables HTTP request/response smuggling and
> cross-client response-queue poisoning.
> 
> Upstream changelogs (no specific mentions of security):
> https://github.com/nghttp2/nghttp2/releases/tag/v1.70.0
> https://github.com/nghttp2/nghttp2/releases/tag/v1.69.0
> 
> [1] https://nvd.nist.gov/vuln/detail/cve-2026-58055
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
> @Bernd, maybe relevant for you: The changelog for 1.69.0 mentions
> testing OpenSSL 4.0 in CI.
> 
>  package/nghttp2/nghttp2.hash | 2 +-
>  package/nghttp2/nghttp2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
> index 6af7b3eecb..f77eb6a67a 100644
> --- a/package/nghttp2/nghttp2.hash
> +++ b/package/nghttp2/nghttp2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2  nghttp2-1.68.1.tar.xz
> +sha256  e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2  nghttp2-1.70.0.tar.xz
>  sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
> diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
> index 50b94582e1..7d02877561 100644
> --- a/package/nghttp2/nghttp2.mk
> +++ b/package/nghttp2/nghttp2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NGHTTP2_VERSION = 1.68.1
> +NGHTTP2_VERSION = 1.70.0
>  NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
>  NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
>  NGHTTP2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
