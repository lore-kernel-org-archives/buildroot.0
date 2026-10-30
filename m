Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2B606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ktf9R35u
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C67060AA2;
	Fri, 30 Oct 2026 15:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0i27vBCiF3e; Fri, 30 Oct 2026 15:26:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B685660AB2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373966;
	b=J4yRWDFKFHVr0MNcCxbsqbHVXyjhXOuLQZL2yFNAzc+r0BGKm24PeQL+wKpNJywBU/sk
	 Fc/HpXaPpx5Vj+gMTOs8tDc+qs7Eonc9DwY7ngD1osN7HEy7s2PDkoKEMhypNMZiBYzHJ
	 7BoU+BpniRSVh73qW0EzKpXeqHaMdTVLDk5WmwuFTo7W2DSQXXcFfUxT3AScUXIgL4NCx
	 JAIkBH05WR2lubR8+EKHr8zivYzaeD6Wf6BAr7rKONmBlg1nvGMV3HYfjmOPyMPZrUigX
	 8IctnRBIVTGLOdwQebuBTZv+sTQmDpjf+WxJ7qN+9a2M3aWfdDPz0d6+jxhNfBeRHHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t+c5/L8fgmLpAXtWm0po4k7xpj4aiNQ+hghNqkO/gO8=;
	b=aXf1wjY0+0NTetJjwscUaotQ0uAafnmatimOAejzrU9kNHjHDof+ntluW+KiUJkASKxk
	 OcXG7N/MXry5pS3QHKzf7FMd05azWG800cc1bx9+yVPahCS1/6fftadD9nHZ4T78zpgtF
	 FD83WKaEHtTWN9EbNS7rkOTNk0/cWsDwwgk21eOcN47nQ2+AQFP7R0q2wcn2RoHK9WwCm
	 nQtddqb5SpHYCJBlzLNsEUkSFHfMjKrKVeL8+nwh6WcG44+2gytg2J0Q1oQs6e+trIYRL
	 3CmdOwSSC6Jic9e1XIKX2KfaF92JHeRpp2LQwGK7Ok6iskrN/vvdDFQQHgtU698v34w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373966;
	bh=t+c5/L8fgmLpAXtWm0po4k7xpj4aiNQ+hghNqkO/gO8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ktf9R35uFv5TgpsnAER/9zzoW0R1EmzFKdCxPxMVvDP/pgDxTAJoiMGNc4GBe4zxw
	 JytU9GNH5vjUP+CE4XugdW7WBAHysLIX8cSlTrMC9KZZx5z/I+/KfB6Q+Be9WPqgun
	 8W7tjTEg9LmI83bvfz5WR0MuPZIuXwgsfPihLx3pnW6pT2Y3t/ypeWsquri43ZScSt
	 wg8ng4xwQnMv4FJ89yQQawNSfpwzJJElWynUEjgEAXgW6hVwFnd3POETUkrd/7sinP
	 lrS9a2vGg4Yyu+KKswhpUKsRMdKkxdl5h5yPrSDeSX6hDl9oKeFXCIT+YKPf4VoxPd
	 2krcJhezwluPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B685660AB2;
	Fri, 30 Oct 2026 15:26:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54817D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45EC460AAC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QHBzc7btSTc for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:25:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB0D360AA4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373959;
 b=cRu8U4+WBZInrn6lCcug/RoMXWc0sH1T81eUEEtBYIWYfisn19qClPzc7B2vTaphAmXf
 Efe8qaMinGv03QO2RT6QpIT3l27zk9Ht/HcWk+ku23m9srwDu58mNjux+xNMf9px6INtn
 oP3605lZmNdBwIKsi7WIrknfDGEqWqXUS2H95UgyYwppRl+ravAZquV/B5zIuDcco7IFY
 uqwIsogyVbxWBurNcd7m+dVLYAv29Dby1klafjnbfNNonTS4jNNjAnN/yM9vCNdf0u1B2
 Hv8jl6tjxygLxqqSyySlqmIywH6iEL44O8hJWo8vmPHtxlswZhs0oDBlwwlWa14oIWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373959;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=50ANljs9cZQKANvfwo2NQPdxzeW9tv5Rm97lieSiWpk=;
 b=mATxERRAe/cQVwhNEMfnWH/B2GoGDr+ilaUa2VYB65hEKjBvw1HVTqQkxUtEH+yXXMDB
 QMTxX/fDfHT3yj+9Guu5VY+mOWRcF7SRe56IqPIynSJuUfaqESeEqlP9vkHt3paOT2FVb
 /jMyYuUaWKRpRT5Te+1YLmjNePuRP7Xiq390yvUw1OuXv/Uh9pPiei8FQiELEtcOVSlYA
 NQU2zv7wsOEJTtI/blEpNsuUIAbCMGCODCVjJdojaaVhLqjmyNlGUV9jv1zCs9J5OxX8y
 OAyMpeCPGMbG8lD/szyIzkP9MLKoTolpAsnBhJ235RxfAC312l+wNw1d8ClmpeRYk0A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Snc1TXWY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB0D360AA4
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:25:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a215e64962so8204365e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373956; x=1793978756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=50ANljs9cZQKANvfwo2NQPdxzeW9tv5Rm97lieSiWpk=;
 b=wpPer7+SbQg5qhaM40plp8rVUb8fSxproN8LVgrtjJv4UHcc0ulqN3tkfXxX7qf+Vp
 uQiOvKhJLdWocPPYV6rBLoiApOHq5aSFKrVlZS2DRSlzX6tjeZXalRkztBxaVsvd0Zhb
 9Df6/YqZue+CiytCy1z3hf6I//BslV7SBDYK5UxOgo/OztbNgG9jJmRfeczgpBbm68VW
 oURaAK1YuZTKQKAwcOo5OtXgSAH5En+Iyz5y2FtSCKZTyEZ5+uo2mu3ic+4wQNphZGbq
 T0WzI5pRk6y0BMowgQS0AqPGCQ/2hcyxRvYhqGsOiNQbujj0l3zqd2eZVTLHKlbwIf9b
 oYcQ==
X-Gm-Message-State: AFq9FYIHBxd4XAYWFjACluUjkJukHisdss094d9MsTvkLmvBN12B7fvJ
 uVgtoDeAXrLcKwdlWoXjLWkVozU8jKJ9TP/ti+1MNm1p4Qmh2kjLeJMTpwgyu6KXva4HBO5DE31
 tsuRtL4Q=
X-Gm-Gg: AYBFou28sTNfBthVCjY+VkMfhDkdHQIU9+O1L8v2aVSu3It+NFEDewAUVVIr9l0wAvG
 7YIG0Sx+0DJdCj2ajUo9+aXQkiv9n5QJgnAv2hd2yI0ZyOhTWEXO0gd7hF7RAbF3FjBdbIcE6WR
 Cux6VhZrraRN8sFolJf1YY3PDwQW6ZZjSW0tQpatikZHMv9EyCuiZSiKNIbrJgg9Dh1bk8ynkRB
 PGF3BErjC1RRiH1708Fz11eXK3tI6pm3X0dfpIRRUXoyFtQjXRUGLvNvdzva0AUa+bl6fqAsgd7
 MtCtJnp9fPDcd3h99nW/NSUUGd/9pKAYVsLcIdTVbPEbsaoDdghnlax+b1aIN8CpbAJCIGAsTau
 lRXgN7QEQIHmysRL+gSw+l0whp9Yi51OJSU1u1gr+QwgkWQeCwPqZzfrpnDPvnhbyIRcy6XIBSm
 9bsqikUWR51954Ph2hFAVOe1tM5TBu6cOsLeuo7WvYdFHXmVIL7i7nPGSIBPeV2QvEHLXXfCfM3
 oSZbOMqeZet8QV8wrobwfjm0KmquVWoKgr8XaKHGaZkS7N59tfAZ1OfUBllL1qj0YG7i/+Q/vNZ
 dLzhT4x4NgxOQNXbroDMMvlFoSKk0/zWEEjmOJd10k7B5/yzeISVnksAIxi2He3o12WLPs14
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id
 5b1f17b1804b1-4ac182dca99mr62965275e9.15.1793373956225; 
 Fri, 30 Oct 2026 08:25:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf6c76507sm70234365e9.10.2026.10.30.08.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:25:55 -0700 (PDT)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:25:53 +0100
Message-ID: <20261030152555.1905831-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912202448.1673161-2-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libressl: security bump version
 to 4.3.2
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
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.0.0-relnotes.txt
> "- The mips32 platform is no longer actively supported."
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.0.1-relnotes.txt
> Fixes CVE-2025-9230.
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.0-relnotes.txt
> "- Fixed compilation for mips32 and reenable CI."
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.1-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.2-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.2.0-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.0-relnotes.txt
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.1-relnotes.txt
> 
> https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.2-relnotes.txt
> "This is the first stable release of the 4.3.x branch"
> 
> Rebased patch 0001.
> Removed patch 0002 which is included in this release.
> 
> Updated license hash due to upstream commit
> https://github.com/libressl/portable/commit/30598098a5df3059332327fa0c2bb5877740ac5d
> 
> Force OpenSSL for sscep due to the usage of NCONF_default()[1] which
> was removed from LibreSSL 4.0.0:
> https://github.com/libressl/openbsd/commit/646547a8a28c7b6931751a2ab064fd70d5d8cf92
> 
> and will cause build errors with this bump.
> 
> [1] https://github.com/certnanny/sscep/blob/v0.10.0/src/configuration.c#L37
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Series passed Gitlab pipelines:
> https://gitlab.com/bkuhls/buildroot/-/commits/834ad4accb3fc6eaef48724509c893431e9d0c67
> 
> with the exception of bootlin-aarch64-glibc-old:
> https://gitlab.com/bkuhls/buildroot/-/jobs/16464936859
> 
>   ./.libs/libfreeswitch.so: undefined reference to `getentropy'
> 
> Freeswitch added the usage of getentropy in version 1.11.0:
> https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b
> 
> getentropy was added in glibc 2.25
> https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116
> 
> causing a build error with bootlin-aarch64-glibc-old which is based on
> glibc 2.24. I found no way to disable freeswitch for this toolchain.
> 
>  ...0001-always-expose-SSL_OP_NO_TLSv1_3.patch |  4 ++-
>  ...ists-txt-Fix-HOST-variable-for-ppc64.patch | 26 -------------------
>  package/libressl/libressl.hash                |  4 +--
>  package/libressl/libressl.mk                  |  2 +-
>  package/sscep/Config.in                       |  5 ++--
>  5 files changed, 9 insertions(+), 32 deletions(-)
>  delete mode 100644 package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
> 
> diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> index 48f3fa16e0..1efb25f1fa 100644
> --- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> +++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
> @@ -12,6 +12,8 @@ ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this function);
>  
>  Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>  Fetched from: https://github.com/libressl-portable/openbsd/pull/124
> +[Bernd: rebased for 4.2.1]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   include/openssl/ssl.h | 4 ----
>   1 file changed, 4 deletions(-)
> @@ -20,7 +22,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
>  index 46f24b2ea..4048a6e63 100644
>  --- a/include/openssl/ssl.h
>  +++ b/include/openssl/ssl.h
> -@@ -412,11 +412,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
> +@@ -402,11 +402,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
>   #define SSL_OP_NO_TLSv1					0x04000000L
>   #define SSL_OP_NO_TLSv1_2				0x08000000L
>   #define SSL_OP_NO_TLSv1_1				0x10000000L
> diff --git a/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch b/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
> deleted file mode 100644
> index 8da8fedae2..0000000000
> --- a/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -From e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d Mon Sep 17 00:00:00 2001
> -From: OPNA2608 <opna2608@protonmail.com>
> -Date: Fri, 19 Jul 2024 11:41:46 +0200
> -Subject: [PATCH] CMakeLists.txt: Fix HOST variable for ppc64
> -
> -The code here defined HOST_PPC64, but the rest of the build system expects HOST_POWERPC64.
> -
> -Upstream: https://github.com/libressl/portable/commit/e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - CMakeLists.txt | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index c496ad97b5..670aa9a1a0 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -373,7 +373,7 @@ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
> - elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
> - 	set(HOST_POWERPC true)
> - elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
> --	set(HOST_PPC64 true)
> -+	set(HOST_POWERPC64 true)
> - elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "riscv64")
> - 	set(HOST_RISCV64 true)
> - elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "sparc64")
> diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
> index 692dce28e3..70fe19dce9 100644
> --- a/package/libressl/libressl.hash
> +++ b/package/libressl/libressl.hash
> @@ -1,4 +1,4 @@
>  # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
> -sha256  7b031dac64a59eb6ee3304f7ffb75dad33ab8c9d279c847f92c89fb846068f97  libressl-3.9.2.tar.gz
> +sha256  edf01aee24c65d69e6a9efcb9d44bcda682ff9d4f3bbbd95e794e1dfa90847b5  libressl-4.3.2.tar.gz
>  # Locally computed
> -sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
> +sha256  9853507b8821c3f277aa60bf554eade41441ef06b2df538d247183ad28789b7f  COPYING
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index 7e92ea3a11..2b4e97abf3 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBRESSL_VERSION = 3.9.2
> +LIBRESSL_VERSION = 4.3.2
>  LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
>  LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
>  LIBRESSL_LICENSE_FILES = COPYING
> diff --git a/package/sscep/Config.in b/package/sscep/Config.in
> index 549c65274b..2e85ea7709 100644
> --- a/package/sscep/Config.in
> +++ b/package/sscep/Config.in
> @@ -1,8 +1,9 @@
>  config BR2_PACKAGE_SSCEP
>  	bool "sscep"
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
> -	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	help
>  	  SSCEP is a client-only implementation of the SCEP
>  	  (Cisco System's Simple Certificate Enrollment Protocol).
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
