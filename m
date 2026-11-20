Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBFD606A336
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eIjUJZZ3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E00D581464;
	Fri, 20 Nov 2026 10:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWNS4LPurGmt; Fri, 20 Nov 2026 10:00:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F0B2E813F2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168811;
	b=bpk1mXTx+ZpfxpLsThUBdwTsn+0d/3Ol6IFVoaI9xU3JEVm9dQkySsojkcGAz4lFTqor
	 vR6RYnTJGn/eFp15B866fZNF4psWCkA+5iK1GCqdo86a7P1y7eVkXq2eJwz1+it2si7TA
	 RyhhDECetqBWoHkAixiI4SJraIBqkKptq0BglSqK2JGvQk7iM+wprEkNkDB4xmCuaoO2q
	 E72gDnbzFex5k/ZEKpbDX5UXnyf12st6y1IzfpOQ+b+iYTPvOSKhB6/8PTyMddruaw9UF
	 PuL3frB2J2/I+lFQdeA5kPBk34AX9FkLgTN/zxBtnO/pZ+2wV+Y75Cr3cLqmTYnXUsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168811;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pJAJJ+3kz+JAQLeXjDjU6fY54JwIZHv9lFqCURNsPIY=;
	b=ef+V23jX/0932q3SHML8QseAtpMwgCxkBr6KaEgy/WI2MW2dl5ept5nwwL/DX6KNoMUf
	 UeX4OVF4FK3XlIJQ4P0FE8y5ng7GJmBEaSyUDvWoS7aoTQL8eQmOiPdCHiHar0lHyrdTB
	 tDEYMmS1GTUPZDKurN2ypXqBZHbS44RqwvbwOcm3cV+tfV2P0E0/FlV/ck/NMGYPUdayA
	 vkuVM3z4BEOoX/RKCHx+LvIugtvShfI/gM1ysAlCm2NQdyryzKsmMe773F/cZPSpEjaIP
	 khbZBYIByxrYr5SHck3QhQ9VccD4Pxeifq6mJjY3ZUPxM0KYutUQFiBUHIGCE3IcvtA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168811;
	bh=pJAJJ+3kz+JAQLeXjDjU6fY54JwIZHv9lFqCURNsPIY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eIjUJZZ3zDxUSn5W8rYZq3IKgK62GwZYb4k+bHUyKdsbIb6mJN2fTY1cP5suAG/JS
	 oZly4BiMYHzc1fYpskcY2wSZ9ytqK+0jhFNU/84LE4SpSIbVd7XxyF0QQeQuGfWpo2
	 VIWLmSVgOtubrTQiDpZyWaX88iUBzb1dZdHVHJjTzEmWc8mNkS1dUKLTwjFl5Wdcmx
	 GDKVqZuahSKGTeyJTFg1ysMQT6JV0NJH11Ol2c+7/Zx1pRl+i+T6CZ1yNz6V3UMCVI
	 MwuusbIlnELxCC34xBTIeXRma63EHonmWEzmBWGjgQqXyaUHlHOdaEH9DWTfFDsYYz
	 blz/mfgTLMsHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0B2E813F2;
	Fri, 20 Nov 2026 10:00:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FDDBE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26B6D60E3E
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nthlyeotz_cR for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 349AB606A8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 349AB606A8
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso5156345e9.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168806; x=1795773606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TVRZJ/NQwaEQZ2slj5VFcU6+ZNG/ZGHi1a8ZBPI7c04=;
 b=EHwOXXikQw56vbqulRHjaF9tOY6ZkjaIJ8UAxtzNeZx+hQn/MeV9uecBkOu+CyhAFd
 36KcUjyS/vsT1Su/ufKwZBykH/afW8+GCaVKms6mQjSvFNlQA/Z3uWgnZMWQIucIcUT0
 cC80Tm4u5Xwxiq6RaWS9F1rRKL/T1Zz6K3x09KcyrF1rZdl9e15YXDd93/AfFc7gsv8F
 44W0XjvUgQjNpcxB7VmQeTxvvBHZsGf3xFKHo24GuburinFuPoqnG+D2AppNz2zmpjSt
 ZDWVqM3QXNK9qM2H6DSYYKvs5sCfkTsmOXt+r7VJyrk5c70wKGDV+w5LurmnPcsseqDg
 8CaQ==
X-Gm-Message-State: APuU4Z/gTrD8CUbX/80gm9nHVuo1GY1j4kyZwEY/yqI2awVDDX4me9ca
 NQT9AKS1jESQPazOfOjtjMXABzD16MrMG6iP5BWv9JhbshPBHTS1m7ooJacKLsmcL6Y1xUTHyVK
 NENVgu8HuCA==
X-Gm-Gg: AYBFou0wOCd/QyzdmfEFc9ACiGuuyzWKeXoXS1dCmnEBf5zTYi+gxGvQcYJKkk8lMpc
 xiFZRYrw1BK7bI43biiiin1LQ7ZBHMfh6wcGAyluJlVETW2udnp4GGfKvjBYH61TQfhCo+SBxhS
 LoHEaj6aFH09icqb2o3vdxwEIuVQZOAo2EU6wqPAYN3O9xRWyjXkm8FJwFE3GRGUhFKVYEKJeiP
 F60mhsoEq0EijxS3fLXNnniS7oMLQnJNbtKzSzSIT8czTPREifsHI//9Cjuh2PR5qGubfdduSZF
 HjMGefD0UGWZgTFT0nBV0ft7mDFAdiMc7svOWlYRZsBsIzxx2YRwY4HRjmjMc4JoF9aDsJwfjur
 53YC2kMzOf1UAXfRexWunecGKFxYXKVJR1LNiVMCDh1D/GaGryrEvCT3KDCcXa4R0dRY6PImgML
 RcTWunRqa9EVzAL7RrBjd+rnZ32EsgWANWlV28Q9uuSAoYBFe6R4sBVPsyKPu3GLZnpBGoX0+ep
 pekkbdP4muKCzL1E/SNx39IZvzSRCJ8GR0CUENMyO4DUm6an6ys5Vh2ijyRcBAVgYJhiCCthUsH
 4sMktTtM7sygdBG9bMd/6Z4IBi78UGWSvdmKdrdCLTAq
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id
 5b1f17b1804b1-4bb888169d0mr54397285e9.20.1795168806341; 
 Fri, 20 Nov 2026 02:00:06 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb895ea0bbsm33613405e9.1.2026.11.20.02.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:05 -0800 (PST)
To: buildroot@buildroot.org,
	Marcus Hoffmann <buildroot@bubu1.eu>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:00 +0100
Message-ID: <20261120100004.541117-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113131321.1408652-1-buildroot@bubu1.eu>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/systemd: remove stale libgcrypt
 reference
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
> BR2_PACKAGE_LIBGCRYPT is not a systemd crypto backend anymore since
> systemd 258 (commit c38d7326e093), so the test deciding
> -Ddefault-dnssec= is stale. Test BR2_PACKAGE_LIBOPENSSL only and fold the
> option into the block that already enables/disables openssl.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2026.08.x. Thanks

> ---
>  package/systemd/systemd.mk | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 2d41df7bc3..f5fa0920ef 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -347,12 +347,6 @@ else
>  SYSTEMD_CONF_OPTS += -Dselinux=disabled
>  endif
>  
> -ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade
> -else
> -SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no
> -endif
> -
>  ifeq ($(BR2_PACKAGE_SYSTEMD_HWDB),y)
>  SYSTEMD_CONF_OPTS += -Dhwdb=true
>  define SYSTEMD_BUILD_HWDB
> @@ -604,13 +598,15 @@ ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  SYSTEMD_CONF_OPTS += \
>  	-Dopenssl=enabled \
>  	-Ddns-over-tls=openssl \
> -	-Ddefault-dns-over-tls=opportunistic
> +	-Ddefault-dns-over-tls=opportunistic \
> +	-Ddefault-dnssec=allow-downgrade
>  SYSTEMD_DEPENDENCIES += openssl
>  else
>  SYSTEMD_CONF_OPTS += \
>  	-Dopenssl=disabled \
>  	-Ddns-over-tls=false \
> -	-Ddefault-dns-over-tls=no
> +	-Ddefault-dns-over-tls=no \
> +	-Ddefault-dnssec=no
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
