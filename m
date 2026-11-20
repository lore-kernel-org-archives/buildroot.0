Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79660606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=msN+O1yS
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 386A040E0A;
	Fri, 20 Nov 2026 09:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ho_UUBJwPOy6; Fri, 20 Nov 2026 09:59:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 356D640D07
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168788;
	b=M00aK9BdpfGbUFgGKpd6/pKqkg/nEoQhs7tet0dzc9x7nVljdd1XznXfNVpHUM2AxuJ1
	 bfCb+gELcxmtp3OCj9tB7v7Tg3bdOou5+i+BHT79LKNK/MBMsIjbxkbRytHotqu5IUCYM
	 zQym6NUJ1+YWuQVzI2mtqwOuybMBK0yPOUEuES/y5FyNE1OKEpO2KECgpEYDoF9/V1RtK
	 O6Z6B+VpBO2whSUXxavKRUiVTbWQc8VpZShFKkBg73CGH6H3Ffgu67Tf+fHYfavy7wzkb
	 heEOjY7EzdwxA3oqZksUwmscY0+KfUVoQ00XKUgydxb0sVIz8py4Q9YmEQNt4Tb2a+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168788;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XdgIPUF3hBJ8aceawWlhVCGULiHVQU+yy+KUwDZqRzY=;
	b=O+Db1R788Kf+oUJDhYZkC8Sv3bf+uShMLDl/33mQl+NI2BYNk5XMRmzfFM+iPmOuSt0l
	 ptsNupuz+mLsoc5ZpevYRy99IgfCCZxad3Hu9BTRAYbIATAs+xnqTNml5RKhXHilUOlpU
	 otkzfp/8gCbNvbMJ3aXAqlAmGORowGyfMW95EKJ3zVv+AGuZ+VinRDp6162dzvaqecWAN
	 xDeRrjT3R0obu5Hf4pQ08SeaMKEn74t5Nzv6UlBU3polPzs1myxd1VUGErUtoZbpSxN+S
	 8jhwMBwq/ZqbF7hyyxS75pHEhME7bVYgUbOSh3bNSxUxnGOuV/ByUos154yswuooTHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168788;
	bh=XdgIPUF3hBJ8aceawWlhVCGULiHVQU+yy+KUwDZqRzY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=msN+O1ySOTaRBiDBljlQ93GvTrKWBDa8/K4EetDKV5lV0KMmA8NAhH27f0kNbislI
	 XiW8i0eqQ4VdsoA9fe6uu5f4uA8ylqUrcgqewC+TtDWNf9n1GMhwWZ/UZCQyTsh3yN
	 wTm2h9scbe2pDSF6iCjezDUAsOSXOl3PEaBSaLjdE1C4oBnWhM5zrBsr1+VDIcMF1l
	 LO/4Hny2mjZDkceI705PrPcdNFmsOoudSSWixaLvQIfjiYfkMyx+mh03Csa15ZVQu7
	 cykp+t5SU1QI5nDq5eVP8+yEMVfPrT5bFPrrB93lY4LDi7gQPKYkUjBu5qC4lTinVV
	 0tUeK7k17za7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356D640D07;
	Fri, 20 Nov 2026 09:59:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC5AAE22
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1D6C813F2
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9mLy-1kR59p for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AA02780E6F
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA02780E6F
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4ad6219f7d8so92820f8f.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168783; x=1795773583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=h59/fAQOUndaegHzvwdGofpxrblfxDCsTONIHK/MULg=;
 b=r/JavzmIcwwNPf0IWRqwk7V6CGua7utBYJp0qTOKEi2481A7iwj+LrVCOnQaGdFsDS
 fymQLtqYaSxh75YWM298CBytZ5v0ft0cSSrAvebVZuTc1Y0pjsUdO1bIP4JywJnnBw4r
 QTsnCHCEfj/o+Zm2UpsmCnIklamSAPbFRqU1lriis/RJvh3gcWgQiQKsVLQge/OU5zM3
 m5nArvsj6C4Ahwr737cNvlYLa3uaK49BUb/f6jF/AVnF1EqDwUWu+iHUtleeOFX7SYg+
 W/2CS/OLPkjOgbuj4ag5RIiUjqARbhXOp9aEdehehrut4+HKbqRW6Fyw+vMEYsHZmgVF
 ugwQ==
X-Gm-Message-State: APuU4Z/qJkM5QGvogroGC0+lzzKKJVpNR8jrxYfbp+YqF5w/T50OwOWn
 8jQDGLx+Mzqg07emYZ1QSgEKBQnO8EvoMqjX6Ur08Yb7yREVs3J5qRlRSog6gCw9Nv4YNzL5P9b
 /Dak3noDA1w==
X-Gm-Gg: AZFdTZfCCxytfzyD3UCDDxBaH0tHj2bmLITyHo9fOoNiolerGrM1j1KGQVnxPOr4Qq4
 EvlPIRndvyI8+2wNOhAUBckPdRrOpFJign95eG4xCtJwJCTImnwyufV4pSYCp2uPDz/ZjFCEpck
 3IvX/lKPaBwLwkYs6/jVCi3Sez+aAbGl/2/5yukrrWeD8V+T5pPSmikuLqbbljMiuZqO75gBcmr
 FbYmZaKMM3MjOqQBDNWzgk7O8TPfAqA0NVf3O1c3mwzEAnytLFAwbJNHJ6u0bGbO44FAqvW28qP
 JwZv3PBU/fN2A1v5jpbspPiS6Wj0WGoDLJfelKZep+jQez6v1O2QPUAbG5ldtDXIfKzgE67zFQi
 76gtcUHTZiHvZ9MXE2/fcf8RwQRyeopPWTyWhb1TkMrD55OdD4C2OY6YC/+SwG56HyXM7Vjl5/U
 SzCKU+PivY1TdSfITza/wCbXZ+CNkZZEEanG4cRtBDXJbGWZiri02v7GV7jGKOURH5WRPLU4uC/
 j9X0G4UCGZ6b0F4siXtixnSeX7bflQUTLZA23ccU6hsDXPeeog22j0Wh3aunfHnytqAg5Pz578j
 Ij6gJOHZ3G7zpIbLby3NQdEcLrpdAZwegMX6nDWqNjpz7g==
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id
 ffacd0b85a97d-4abb86ed79amr4535630f8f.43.1795168783548; 
 Fri, 20 Nov 2026 01:59:43 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6bb989b3sm4820263f8f.51.2026.11.20.01.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:43 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:38 +0100
Message-ID: <20261120095942.540364-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112173719.4063790-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/systemd: fix build with libressl
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
> Since systemd 258, the target build no longer passes -Dopenssl=, so
> meson auto-detects OpenSSL. systemd requires openssl >= 3.0.0, which
> the openssl.pc from LibreSSL (version 4.x) satisfies, so when libressl
> happens to be built before systemd, openssl support gets enabled and
> the build fails on OpenSSL 3 only headers:
> 
>   Run-time dependency openssl found: YES 4.3.4
>   ...
>   ../src/shared/crypto-util.h:39:12: fatal error: openssl/core_names.h: No such file or directory
> 
> Explicitly enable openssl support only when libopenssl is the selected
> provider and disable it otherwise, as is already done for the
> dns-over-tls option. As systemd-importd requires openssl support, make
> it select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL like homed, repart and
> sysupdate already do.
> 
> This issue has been present since commit c38d7326e093 ("package/systemd:
> bump to 258.3"), which dropped -Dopenssl=enabled/disabled from the
> target configure options together with the gnutls support, and also
> switched importd from libgcrypt to openssl without forcing libopenssl.
> It therefore affects 2026.02 and later, including 2026.02.x.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a37f44f3df16d4f49297b2a24bad20b0ad603ef1
> 
> Fixes: c38d7326e093f45252c01e241d0faf6b04023e02 ("package/systemd: bump to 258.3")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  package/systemd/Config.in  | 1 +
>  package/systemd/systemd.mk | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index 7fd05be41b..59257bbb41 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -286,6 +286,7 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
>  	bool "enable import daemon"
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	select BR2_PACKAGE_XZ
>  	select BR2_PACKAGE_ZLIB
>  	help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b162b1f948..2d41df7bc3 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -602,11 +602,13 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  SYSTEMD_CONF_OPTS += \
> +	-Dopenssl=enabled \
>  	-Ddns-over-tls=openssl \
>  	-Ddefault-dns-over-tls=opportunistic
>  SYSTEMD_DEPENDENCIES += openssl
>  else
>  SYSTEMD_CONF_OPTS += \
> +	-Dopenssl=disabled \
>  	-Ddns-over-tls=false \
>  	-Ddefault-dns-over-tls=no
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
