Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72788606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iU+AssBI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C5F40DC2;
	Fri, 30 Oct 2026 15:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NaIlN12e9_io; Fri, 30 Oct 2026 15:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9603A40D44
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374161;
	b=e38BMetfsaf6lRijlAP2CoONOSGqQ/xd/1pw19PHhpCACpYfhIi3bTpy2DmqU2Ol5sPP
	 RmaZgwKi/x5AnuOFF6Mq44S0Mrwe9mIg+agUC5/u06n3oLUA1XnDgVceErXWHBR3swk1U
	 f8TcUJ6hTKPOzzu9D1b/RiOG6K9FSpAElBbVt2abJglEZWOyPSBxkEopiC5vHi1bsdsLe
	 Q/YkzCljNAvMv5CsjivdIIoJw3CIcLOS1pxON40Iy3j0lpuTNYQExxG1/UothTc0+ZM2O
	 /hvWC4VkFcT6cgYeT9xv5tQwrKqJzB4AeBpxaZooSUo28p6adv5jSB9bctZBpIQBwRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374161;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=av8xPIimJfJArr6CBGe5u+GB+7JvzpmOsYtaVPMF9bg=;
	b=Od7/BxeufjPpyosB0Lkvl+dV2MEmtHktjU3sNtg+pQ0Hv2/uAqezB7QsYCsMTBLigCUJ
	 fHZcgkXWM3frvw0TgsH+1f9UR4PZ9DNwgKgKsEYGisxjTf0Jao1mAZCDgHL7xyDaxBWJZ
	 RCnvog7N9b3UYsHqxNJYrjQI6Ee9EPuib2px874ti2m8fo6hOWjWO2vFiY8zvMS/bgpdv
	 I5DewRqUZlKxUlgfKmBzV5U0VLUAhrFW42ZdqNOFdBCEZvN65u36jQkDHh4W+WUNsxfm1
	 qN2lufibYFJtInTtrUdA6hwIMUL7mityNl+Ghzsd2RXQ3Idk9ySZhMTACT7Owe9cQqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374161;
	bh=av8xPIimJfJArr6CBGe5u+GB+7JvzpmOsYtaVPMF9bg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iU+AssBIIaRsw29/45jWfTBCMd80bYUzn/CKlVZyykA1SvQ+bQRLotOpBqe08a+vr
	 m3U/AKakao7OZ3Dw1RdCeKChQaysc2zkK8xbdUO17cRjgtIjQWjke8wb+aXVSc/Wqm
	 Wjye2MlvE43Q7vjtnKrbxbQpQkXYNTSy6vXPdAE6ObFcmrXxX5u8vdjpEVGD4HAf5l
	 6Upmj7z8OvrSBhTw4+YZt8n3zZJmdKfgHPaJZQ8+c5PlugrPulqjkGKC0PDQO9ny6+
	 9XEAgGAwDQihWFDWmFwwq/65u3JI7fWAGLoJUS2+c30POMJ2tbDB23EG5YC2QiuB0x
	 d4PWaveZ5ZZ7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9603A40D44;
	Fri, 30 Oct 2026 15:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D5CDD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0317D40530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3Q3P0WW4ueY for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 627DD40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374110;
 b=V+AKvRu0bIF0/8fGTtb9Nopq7fyrWVjXhUUgVlXRYomUzWxrJkva9LS7IclI2QXSdhnf
 EgToSko25JMbmgt6hPp8wlSmWsrSTsMo3utlqdYrtKbxipXBNTcqrZPreSFLo906MmcCc
 kgFmPdJyuU9HpEel1MlIjODi0kmqdtX/YQBIYKUcvNd9FllUs+1fs9ngMQo9MxJ43FojP
 LzH5tDjdkNdTyTTgkBFfHL/RhzyqZrGQRELfeIS6x7LWBur9kCQCGeR5C79DutWo7GkZQ
 sZiDbqbdd0EY7vswkRmZ7PPt38gbmQNgR6TqEFc85PRvXAq3+Hnru3j4tsR7xZP/BzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374110;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/qVkaBLIVHurJ1bWwDERbFWGl+X+28a0z435r1n8yyk=;
 b=U5Y1r4kc+kzIyKpz79bVa4QRBAzZEQnhioDmfE5vqumS+2ew0l4Bkxgp95QkM8H941Yr
 6YMAPU+KptMDOc65kbqH/aEdIKdIeAAgA2hj3BZ3b6brKxUv90hF0+TG3jiqbS5MvaYk0
 8NIx56XQR1mP8R0nAuj1uBdOy2Vq4v/m3WMG73X2WH+zYjaOHXZVg1ztZQMnTn94nXVAl
 V7sP85mX8Z0hkeCAjz8Rx6ag/y6Y+FNrWrjqi8Pwzgf4JHdwMk8LyP3/6/uEwy2Q1X3dF
 2DtMcXhnSeKsBt94TX33j5wV3aHhJmkzTYDdd6S1HC53Mi+eMoEnsqwJzQ79fhCFDDA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KZd3NrxG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 627DD40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so7955625e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374108; x=1793978908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/qVkaBLIVHurJ1bWwDERbFWGl+X+28a0z435r1n8yyk=;
 b=d7/fHL9rBjYJrtft71ztiyoQe7jmP3uUgzvMeeNq6vL6idpThMq/RaQVlaDIleiJXV
 IqgVWv+o3u+myywGb8vEf6lWg3ICSMt1HWGLfMjZd6NmlfEP5hr6zr73HLz0rTMON3pk
 L6RTVumQ7K5Te8eRXh51d9XHYdeO1XdBAEvZNS+4o7PMyGOmpLOLzbbRtVJTVueNmIai
 OaHhCstiJk1M/5YV9vvb1csyRzmMrgiYqmKo0laqsj4yagKPhwK3bh7CtrKgDYK0lBOR
 cQEMaPbv2U91cUcqUlt3Lc16IBMmJO5SBcZaTbm0meVcx4sXEaT3wC3f/FONZZf8fYm3
 bK/A==
X-Gm-Message-State: AFq9FYKrv8fXxI00fvWLE7fEmRIBo+/4toQH3GGwT+EukE8DReWmwIY/
 ecNSurYlEr4xM4rnkNbPXcRTZBWuwm9ElhjG7q1wpIKMbigkCr86AGSp7oHrtJXJOnIp3t7udxy
 /CGA6XoI=
X-Gm-Gg: AYBFou2uEVylUlRXFogdtC+xuW9BCoUbjp8i5a9Rz3iJfylXbuGQy4GxzTG0j/F/Plg
 Y7Ga73GMhGUsnCgxliAdARM2Q8JTBv6J99OUnJw6bqKm4JynyF1cdWp7BV8jA1IuXHxBOrwshpM
 PTg92GOY2zDcnBVpuf5nljXxnP+16ygOICjlqyMpuZaqXDCnHgSa5PEZa0fg8X3vmnW3lIwIJuH
 3PtlnHx2DA4/Ri1x5r6UTj+XeQdDmj7Qorw+rIQtSGzcGNIpgpn804/3gM91Ufi3q0rA9N4JNqh
 ophmRfRAK6yv5h6grCtuNf+Crsgv6WOCy8EQPE1Hh4itEyjx1IBiGGIVJNXiETnVjnGit6MPuPA
 vFcAziPNGdbFI5ua1+Oxx13fAsAMZXoi2qPjSh0dltSsnLOfD4zs1k/D8IlfJJ6bKJla5onwIne
 Sudm2ipvZPAfSEkO9bsTpcFfDXq7feqWP5QQENz/1InRfIDWFrN94GuQu4aXF3QepLMWGNjyWv1
 tdEf4zAIxXB8JqeADfeKUADOEQmOsvN7SfRra3FEWkfR1URD4a0AVJ6s27VK4chp4WcfbItfB1o
 +H5TjD2u9W+OsH6naOwvTF0IMDaXabkYJ5Dm4+hwI79Sw29snB8Z9+KvBpNtKCrQg6uahH024g=
 =
X-Received: by 2002:a05:600c:a00b:b0:4a2:180b:3153 with SMTP id
 5b1f17b1804b1-4ac185bcc7dmr66438085e9.14.1793374108267; 
 Fri, 30 Oct 2026 08:28:28 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09fadb75sm39819285e9.3.2026.10.30.08.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:27 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:25 +0100
Message-ID: <20261030152827.1907335-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022211048.1243312-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bind: security bump version to
 9.20.30
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
> https://ftp.isc.org/isc/bind9/9.20.30/doc/arm/html/notes.html#notes-for-bind-9-20-30
> 
> Fixes CVE-2026-19630, CVE-2026-94300, CVE-2026-96888 & CVE-2026-97313.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/16191cc29d01d60a67849a754c3bbc27a0df448e
> 
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/bind/bind.hash b/package/bind/bind.hash
> index 8129fa2d2b..2d6aa2fde4 100644
> --- a/package/bind/bind.hash
> +++ b/package/bind/bind.hash
> @@ -1,4 +1,4 @@
> -# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
> +# Verified from https://ftp.isc.org/isc/bind9/9.20.30/bind-9.20.30.tar.xz.asc
>  # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
> -sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
> +sha256  9e1443a40a72a30272cbc3196d020a6b2e26937111c83e59e101e82e1e3b4fef  bind-9.20.30.tar.xz
>  sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
> diff --git a/package/bind/bind.mk b/package/bind/bind.mk
> index a05ef6c362..7fb07fc83c 100644
> --- a/package/bind/bind.mk
> +++ b/package/bind/bind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BIND_VERSION = 9.20.29
> +BIND_VERSION = 9.20.30
>  BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
>  BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
>  BIND_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
