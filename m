Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA5606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UvvOyTV4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837E1819BE;
	Fri, 30 Oct 2026 15:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_htdNojuekx; Fri, 30 Oct 2026 15:29:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9BE13818DC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374168;
	b=hgYTKHH5MS045AOPMPl6wHSvrpfDKbbn3tmoJv+icrTy4JYVoTwHrBBk3prf5Mp2p0oh
	 42JfCYueZ/PJ1i0DnknK4fabGh5IJ1xaYFXIEii198PIhe2u+2n4oRhN35aGUq6fortRG
	 ExxpnAOs75tG0YtUSv0t7gVxao8s6NQOiWwAV1MkykxwNnRvR0tPEQLr9loJ37tvRkEQ8
	 nCTehLLSBCaTR9t1pxoF/co1JD+IayN61YYuUG4YpgfPFg/19VJIkdOHGBeEHqAplTBqp
	 DjGHPHWszpkL4tvbhWZCJBXz0eAcpKRtPubWdhRWur+Ywi/GeFRl8nKhj/u0IIiKQag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sr/YRxd+FpnY61z9bat8TY+VAliAyR1OtMPZR/+8XVw=;
	b=Mr9DR8SR4zGZCjzdguPpBLpff+Fkwl63B7TCU7aWI/816CLfaVpYbL+VgbDk+60uG/rw
	 Ze8f18M3YL+P7TBCAPww5sD/0/7abnPrMnzKuknq4L3Z3DbU2e6g/GxAuWgLZBAfHkDBF
	 G7x3qHhgzyW9kzwGvN2oh39Rz7GDbUZalKN+RqLcxdSaQZ0H+6x/Fv6i8iBOpo0ArIKS1
	 KFHT+euyayNQpCN8FOWWGmYHxstRfU4q4p8LZ+jMlh/VFuTFO9crpvJPX2aaK2YpQv+N2
	 iqztO5oG2qZs5h8VfADWYrvYbubGIqn0gGLqMVSlONjhmg/scMZHEUevksg82qZYMxg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374168;
	bh=sr/YRxd+FpnY61z9bat8TY+VAliAyR1OtMPZR/+8XVw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UvvOyTV4R7zWWolmnlG+L4InRnuPURAZHe55wOtBxBEJSK5VpGFxpJi3hLFdR8Ofn
	 MbPzXKe186eXucXis9rhyx4xbP5xgUnfy24lpUwdO6VEaCtEHw9ydUvr1C96aMuPf4
	 MN/VNj1OoQwTMRgoUvXoJtLGvNM2rGzA+pY8nuiqzrEhlZhpVgEoAFGC/8WIF1QGhS
	 pK2Jh1mKccrNGKqODAQE0Qqk5sfymJwoZ59L56VoXM4qcTv5iJJRYwtbRIfmf/UvUs
	 V5tOvjbEcm+WxrA55DyiqbAzYrIK3197XKcg/JJ5E8DKQ1t1jzVUkr0FftN8J2oRns
	 5eZm/EjNBZ66w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BE13818DC;
	Fri, 30 Oct 2026 15:29:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A9EAD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2843540530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-G5XiH0jM3L for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2A93540211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374122;
 b=dYsDRRYLahW2yVa9PkrgGAGD5J/IDnl6SrR4rxjOfMUdchjNsSHcHQjJ9SOEy13d+Orj
 Cb1XhbS7as9A4uJ9uyrLiP3mvu6M0AbcLuk9xpA1qjwBPoVsVADFHhkpv4DTDunZP8j1e
 ejgN7QrjtDBs2ErIHjEGf5Ia1aXHz6i1hMByQu3uV/5UkWk3o6XHw1zGQQaCjaWkuaGjk
 JJoGS/rttgdsBfXAK5oO34vyh0TT8Qhfa4PCPNjmZlDiFgaAWweACssyWX7+oKhVUZ+Y9
 9IFYy5XhuVk1ehd4v8Y0XLOFfRTnW42AFHrV02uv1aNgWAzFjUans6m52XxXtO86PLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374122;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=gBNI4i2KFL4cJ28N1sOFxnVyaHzNRKgkxkCIpW4asYU=;
 b=VR8q26PBkDJ31mrGTioQ2eyYNn0/0ctWWGLBQL2iZsbg8dvafHZT0AwULiAjyuY1g2pW
 +qzq6rkn9LgF2EgNF4DG2eDM+48r+0RJ7bzH+sMjoyzW4Hd7aOxJ40ZqRbjtSxC6HAvAO
 T4NRx0nuTKsp5lPf1jHudTpuHID3FUYL3xUZt5ooXTMWi//AsKgSG6PD6we4yUQwAt8YK
 TNLZMKPfXE590AfjKOTUCeXtjVwPrdv1gAZcEbch42pzyqHvQhWtVpUJY63uNTaDs+NBY
 5kOS0jfeUfo9YFDu0tU8PjddzkNtV3IG3rcOWLausgsQjAfBnJU6A9WQxSNuP3DgMAw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="V/ZfCxJh"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A93540211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:42 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so5474845e9.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374120; x=1793978920;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=gBNI4i2KFL4cJ28N1sOFxnVyaHzNRKgkxkCIpW4asYU=;
 b=e3Ycc0s6Vv7T1r0O1E1U2AcPQhcgSHIJAkZDj+uVoHzbC4/H874B9pgdXmm/3IudHH
 49g6nm3lz89KsiIaUVRyi70b4xzFmSr2G7wU1XHOc1tVHWoN3DUf5ohYv9lMmvJiAMdn
 JvDYXgbItRPiDaOYjiv8VSyRre5LQ15+hBi4G0YPDpZ+pfxzwUrt413tZmRADToaDa8D
 UBo3aRTcaD9RXrXjqqy/2MIfwgg/bBU7ifI9HRd60NdQYj+Q++Y5cKz/+2nQO//Ykz2F
 0uGMXsL10s6YUmk66SAc+0quFejxrFM2c/vJ2IfAfCnEOclN3x6uMH+3a9OhYXiQpyZE
 Su1w==
X-Gm-Message-State: AFq9FYLnPasit61AiZ3ywPKOBJ8mCAGnTm+h3Syh/gDhEeQFVxYVBuZT
 NRlso/rldSfuacnz06Izblto+C0boZAuuzWcq6VmMKZiHl8TA8wPZmhoYNYI1gTp8rt9/bPklrf
 Gv4mF/Zk=
X-Gm-Gg: AYBFou2OHDb/29QQo/IvCwq/Kf7U2utynevY2mywO8QMXB42ClRnWrgISLSL41f7724
 OJgzvwXoASlhXgsKlG9l9nVljOZCoTiINDvwmVblOk0TcT0zKjr9XjRTfwxoM6OS/ifj3CT5mtx
 sYCdJpwPBaHHV5p3kdsn350RrJ/R5wkEEUP+vGoq96OiraB+9Yr1ngkOPVZX/eVMnX0AFvh7x5o
 PwSrng9E7qlHrGfzbuMQ7tvNrkn956yN4d/UgT8yX5gzmMFrWMHg46Oi4NkTBtzbRWLwvuBuglD
 Ip02VLwb++5qZ6LZuPNsAUsLh2DjFhp3JwAVtM1WvXGjtjHzwizUpUq7jljrpG9W9ZdU2sSWDrS
 eQaz1ftaW4QSFdXbe/syjXKKzTQceUVorU1EaxsaIaulLF9rNCf6qs2FGvOK39i6OEDQgUIQedT
 K+3PACzZd0lewwUNe750Tdrc6ixFblhyB1FO87Y7hJSrQ7bxB7JMjy8ewTlbAgghhKvDZ6ogryf
 YhPJX2v62coYWi98Zz9A0zC8r1tbK1NC9DTIIYEJZ3YxJzXpONvLxUVyMq2S9c3N4VLJP8PyZIN
 TdNkD3m5IMgdO5BsHUQFAlFviN9jB0la9p15uHuidimy/LoK80QRAQ2Lr2K8nH5GAEFMaXbvwxg
 LUUWXix0igQkWpAHaGA==
X-Received: by 2002:a05:600c:4e41:b0:4a6:42cc:bf6c with SMTP id
 5b1f17b1804b1-4ac16acfbd0mr55722335e9.7.1793374120141; 
 Fri, 30 Oct 2026 08:28:40 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abe7706516sm43204155e9.0.2026.10.30.08.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:39 -0700 (PDT)
To: buildroot@buildroot.org,
	Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:37 +0100
Message-ID: <20261030152839.1907450-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023073509.3714686-1-peter@korsgaard.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/brotli: security bump to
 version 1.2.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Fixes the following vulnerability:
> 
> CVE-2026-111497: out-of-bounds write permits remote code execution
> 
> https://github.com/advisories/GHSA-9v8h-qqgm-4m35
> 
> https://github.com/google/brotli/releases/tag/v1.2.1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2026.08.x. Thanks

> ---
>  package/brotli/brotli.hash | 2 +-
>  package/brotli/brotli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
> index 9ec1f79c7d..a777737338 100644
> --- a/package/brotli/brotli.hash
> +++ b/package/brotli/brotli.hash
> @@ -1,5 +1,5 @@
>  # Locally generated:
> -sha512  f94542afd2ecd96cc41fd21a805a3da314281ae558c10650f3e6d9ca732b8425bba8fde312823f0a564c7de3993bdaab5b43378edab65ebb798cefb6fd702256  v1.2.0.tar.gz
> +sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  v1.2.1.tar.gz
>  
>  # Hash for license files:
>  sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
> diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
> index aded9cf17b..c040878c36 100644
> --- a/package/brotli/brotli.mk
> +++ b/package/brotli/brotli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BROTLI_VERSION = 1.2.0
> +BROTLI_VERSION = 1.2.1
>  BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
>  BROTLI_SITE = https://github.com/google/brotli/archive
>  BROTLI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
