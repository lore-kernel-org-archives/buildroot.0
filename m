Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A9A606D80A
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cx4erEQj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED9B607BE;
	Tue,  3 Nov 2026 14:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIUDlxR5m3x9; Tue,  3 Nov 2026 14:46:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 46818607C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793717179;
	b=mDTEgetst8THNfmcdKkdGRhKuqp/R5f377F85NYbQyUk8PecTKjnm0p13fNa+21OOtpv
	 zVNArNnNj+2uXGKSFu1oQsAkED7XXosLYav0MRU90tsMbMnfF/HLk0vrbDLjKncFHZsGc
	 ImJFuQ2kpyDXQf/5zohkFXTkmYrEsMsJK57A411vq4b8Zm/3On8jpjRHF1sdkdH9I6pJC
	 9UykMbFlULt2QutycYAcp1wu5OuBsiWbeg8QcunnULDUOOstU+gTp/kobUbxrntEvYRrJ
	 4AfflkXr8iTKnn9uxVcrLS3A2EjKU5r6vZIwK+CiOd4fBvR+fX06QY3n5Be87IcBCUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793717179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+bmBVxJKAtjf0eA+5zs1bklimDF9Ga0M1mcOGcmCW1s=;
	b=mz74GsBQIjyqbwq0wVZgt984G1cVw1PgtgN01aq6dqIi7pjamBrTKGOdXv3gibp1ekjV
	 kxFwrIygYp17RJFSXJH/ZZvDqypx+/NwbgAZ8p67MKSjiDNG4RQIayv/Jx0wrkaB4TDw0
	 WTV03sGCxUyKQsYML/8mhkua+7zwX25Ko7aXlyuQpmptbYDSfKS2qV5U4c9A/9zdYbACZ
	 d8vZVMAJYF4fyOmL/o64PoFeoJYTOL3YGXUnO1hIyUYg8sitLtdk61gr5T88GXXiCXj+L
	 Eh0lwimdJ32DZWssE2osQ0n6pFxVG72kR/vQjNew13K8VU2gK5etUZdtg0+EjQHCk0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793717179;
	bh=+bmBVxJKAtjf0eA+5zs1bklimDF9Ga0M1mcOGcmCW1s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=cx4erEQjMm9G/W32L2R2uvd2u4PG38O/ajnPAhFfEw238V5KjtYPTNpXhA87yCc2O
	 wWZkVhpTFaF6/qSEHyN8oJWvdia0b+li1wVxeIUIk3fHsJx5DFTchEWzzsyjXBM28h
	 opoPVOqM36AZc0JKHHH5MNKgZ7afDsGhf1l3SM+2HQJguaismg8kykdFQt8SNOinHf
	 sqqWq/JelMO0LjsnliWT4pUybj1dDevTDjIbUoZoNp4Libx2ptonkFea4EsAdPdaoi
	 B2aUb4YJMaikbhwOZ85fQSHSF1ffKFHwmg1+IC2d5fPqLf2LrCiR22Sqnyq5XgUiq5
	 lSXky+YrcQzdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46818607C4;
	Tue,  3 Nov 2026 14:46:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71B94D3A
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5748B810D6
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jilSq76lLy0z for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 14:46:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5213080F1C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793717176;
 b=qkCdX18nqcj2OjLcO8CsdnU1sqhwPhdcyVrNPD4CiWMc2tyo3N/Zjr/roaTIiZWRkto8
 b2JeD1msappMSgYDxsvZwnTLPpDjLMQ2eD1ABC9yRbm2n/s9ZFGTd2g/x4joeVu5zJ3Em
 lnyPjfP9UEt8qAGStb010a+u7AJAoL7XNhx2wB5YH+PgUNekVKfldckwVPv3pNu+0xBfR
 9r5RYIsQSKrQhTsFUYGWF2TLpFjJQYHE2xAtVXIE4I1S87O9qShE7aCLXMclaecBjrWR/
 4RMKustHfwIRJdKjRG+boy1vJXKY5YPTA9CAqgYGw9o9uBIAf1ulx9Flaf+pXdSDT3w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793717176;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=8IZVayqoGGL/lUz6QteKhA+z+hY7H2vvcnVfL+/kqAw=;
 b=ldAHWXaHByOmTmif4rqrfoMFBTuREH1lSHuu53KrzhmwFxmE9PhiskR2Ltoi4i2HLkr8
 GvzGTlk6GgYWPu+5q/2ndRXftz2TGgMN13jSyn5YV/yDzFWxgQEgHRbm5y2dvKhTGwwUd
 n6VpTTJkvGriHHhj5nmURJQYCwRrH0Mr8mip+5VzMliPGy75IHclQxYyPOzOZfKuMUIAf
 TWgYKRm0wh9Wd7lUTDJUfyVG2gBJrccAJkAiEa2icqTmBys9vTyZhCXzoGUW1OFI1YfGH
 ZH3ytFVHlAXUkuFt4Zmeg4HA5JlBMD+lQEm/fTlqu23J+/S+gvV0QQbpY7iEyfY5hTw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=qbee.io;
 dkim=pass header.d=qbee.io header.i=@qbee.io header.a=rsa-sha256
 header.s=google header.b=gd0Js9jr; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=jonhenrik@qbee.io; receiver=<UNKNOWN> 
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5213080F1C
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 14:46:15 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3ab4891fc73so40909471fa.0
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 06:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793717173; x=1794321973;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8IZVayqoGGL/lUz6QteKhA+z+hY7H2vvcnVfL+/kqAw=;
 b=BRCQlLkr511rpHVPIp7FzK/O1pYh5ANYN8NNASakhI64C8rxJmYp2T7t9gkb+uaLF7
 HkCn0ZePyEFncL3aYHZhWKW2ofEzW7qn9TAzk+4NU9gAGGQttbC8HevF0KwjbasbnltR
 dpZt3c3aJVjNiuHBnbJIm+ovu7RDwAdRFE42sVSUFljkMkhHbPth1AvGNapgPvrMz96X
 HtgdM8Hm1UWoRtEYV24rkVPhX2J7rBvlFh9wuUhRZQ4Lx5JeCvDzbnmJvcurp1P3vf99
 6pPQ6E/BZ15EX8Lp8dhOvjKhQw7rK/65Zi8vCu2rG1sCMZuLYafITE/oHovPLVgmH0ax
 ii5A==
X-Gm-Message-State: APuU4Z8WObtYhGbPlbgw1hq65KYruMYVLm6sNUr+wTw3LUR1KPj/yzFr
 XQqk3IAjsNUfashpJqTPl3/F9ed+N4CGktD4unnFpSU3qQlcZN9YJz0oeP0+8WG4/DvQYxVoT/r
 rDEyku24=
X-Gm-Gg: AYBFou1zR+pJk3HzrWl7znX+1Qapig3wcbhPUyPHoG5RjRTliqLoM8ZBeQEfnFYDuvk
 74llUbNu7RW79YarFljP/gFQR5/F30PR4+e+HGzGDemBegWAtPxoqBkANFoFVpAAQCRyhu/e5CJ
 HY+db0lW/dDL1zKDE20uzaZVju9ofu4ILQF4Ec5Tx/rGhfTJtZGD7E34IIuDsquODLQh5gN9SOS
 fsE77NxvhsxUYY2NG14YsRqH0kOjyoJqXThwoXp3vW3SKn5cOYUt8gWM3bP/wGsEcfvYBdFsoqk
 hS8HoRhc+ncMJyzqPYe0KvA8XHRaWAAEY3uMkDA+6Wv+VH2BN7DZd8dPZjrZxM2bly5HCi5653/
 wm2DQAjK5BYpjK5S7rLaWegpfHg7HSvhQl188BLp41CYfbXi/O4PjZ7wTvWM5jDQnMgZAEpPkx0
 NaX1UFkQ6Gy2wtUwXvMMrcWOGtkl+bKEPtCVnX0LFnoUWiuxGt8hrSiZ8CZMAx6JsUQcXgzr1cY
 G/nncaoWW73ocSIL6aF2yB51+0CETUh19y6HwtfZfVF8sYprrLf4YOaKNVJI8FnChtI1b5Jib65
 Z09I/disBX3KuCBNoI3z5F8tk+aBx/T1g/r9lPE0etpG1Xxa
X-Received: by 2002:a05:651c:b0e:b0:3ac:42be:7e50 with SMTP id
 38308e7fff4ca-3acb7a5902bmr35160371fa.14.1793717173252; 
 Tue, 03 Nov 2026 06:46:13 -0800 (PST)
Received: from nola.home (c6EC700C3.dhcp.as2116.net. [195.0.199.110])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3acd5c26542sm5369001fa.12.2026.11.03.06.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 06:46:12 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Date: Tue,  3 Nov 2026 15:46:08 +0100
Message-ID: <20261103144608.388596-1-jonhenrik@qbee.io>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qbee-agent: bump version to 2026.41
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Jon=20Henrik=20Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2lnbmVkLW9mZi1ieTogSm9uIEhlbnJpayBCasO4cm5zdGFkIDxqb25oZW5yaWtAcWJlZS5pbz4K
LS0tCiBwYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5oYXNoIHwgMiArLQogcGFja2FnZS9x
YmVlLWFnZW50L3FiZWUtYWdlbnQubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaCBiL3BhY2thZ2UvcWJlZS1hZ2VudC9xYmVlLWFnZW50Lmhhc2gK
aW5kZXggMDIxMDlmMjc0YS4uMzgwMzgwZTMzZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9xYmVlLWFn
ZW50L3FiZWUtYWdlbnQuaGFzaAorKysgYi9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5o
YXNoCkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgYWRlNTVk
NTgwMTE1Y2IxYzgxYjBlMzU3NjZjYmJhMmIzNzE4ZjQ1ZTliNDI2MmRkNzk1ZjVjOTY0YmIyY2Ey
YiAgcWJlZS1hZ2VudC0yMDI2LjI3LWdvMi50YXIuZ3oKK3NoYTI1NiAgNDBmMzM0YTMzZTgyYmI5
ZDIwZTQ2NDNiZjQyYTc1ZGI5ZTdlNzNlYjUwNGQ3MTYzMDczY2VkYTQ4MWJhNDQ2NCAgcWJlZS1h
Z2VudC0yMDI2LjQxLWdvMi50YXIuZ3oKIHNoYTI1NiAgMDJkMDdkOTZiZTk5ZWIwNDJiMDFiYTY1
MDA3OWE0NDBjZTI2YTc4YzVlMGUxZTgwNjBjMzNhOGM5ZTIwMDQwNCAgTElDRU5TRQpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9xYmVlLWFnZW50L3FiZWUtYWdlbnQubWsgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawppbmRleCA5M2M2ZjUwMWE0Li44YjRjM2RkMzA4IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FiZWUtYWdlbnQvcWJlZS1hZ2VudC5taworKysgYi9wYWNrYWdlL3FiZWUtYWdl
bnQvcWJlZS1hZ2VudC5tawpAQCAtNSwxMiArNSwxMiBAQAogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAogIyBrZWVwIFFCRUVfQUdFTlRfQ09NTUlUX0lEIGluIHN5bmMgd2hlbiB1cGRhdGluZwot
UUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNi4yNworUUJFRV9BR0VOVF9WRVJTSU9OID0gMjAyNi40
MQogUUJFRV9BR0VOVF9TSVRFID0gJChjYWxsIGdpdGh1YixxYmVlLWlvLHFiZWUtYWdlbnQsJChR
QkVFX0FHRU5UX1ZFUlNJT04pKQogUUJFRV9BR0VOVF9MSUNFTlNFID0gQXBhY2hlLTIuMAogUUJF
RV9BR0VOVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRQogCi1RQkVFX0FHRU5UX0NPTU1JVF9JRCA9
IDY3MTBhYmQ0OTkwNmQwMGJhNmM0ZTQ0NmY2NDM2ZmFhYjE0ZmI1ZDkKK1FCRUVfQUdFTlRfQ09N
TUlUX0lEID0gYmI4NTJkOGZkNTdiYTA4NzExNjhkYmY2ZjExMTYyMWJmN2YwNGMxZAogCiBRQkVF
X0FHRU5UX0dPTU9EID0gZ28ucWJlZS5pby9hZ2VudAogCi0tIAoyLjQzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
