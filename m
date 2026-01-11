Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F2AD2502F
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 11:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61D0B40420;
	Sun, 11 Jan 2026 11:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QcorEb0PnZ53; Sun, 11 Jan 2026 11:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF23440417
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768131095;
	bh=ibQHZ7ajwMsln4Edy3ZdSdx3rVexFAHXmLyrY2cGrXc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rF8SK9eIX50pcehpdsoLG04GlpDf2aMaQ18udPBsYtGZuxz2+fPy9M/enpEMbOJC5
	 W+5nn4huLRUdUwTHc9vt0WCNdkl5bgFGt6ZtnHdApEQphg5e5Cdese/Rd+EmErDpLW
	 WetfV71xe+9xrfZ/e5Dnm60VNUKS0+1yQWPbkWR9MsxyVx4NDOskZ6QM2SUfXnk+4c
	 pNbGSHjof3D6EMNPUo1CFy7azCz3kzIRuuSinlAKpSjAk8YahmfmA1XD3yCKO/x1al
	 dOW6sN295pEj0lM3Y7trxGIOPlAw/NIb/Qzb74Sia127DI6l/Tm/sTPSC8hP1KAwtn
	 FEl4d95NGWkrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF23440417;
	Sun, 11 Jan 2026 11:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0B218D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A536580D78
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyXpNGleH2m2 for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 11:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A968380D64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A968380D64
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A968380D64
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 11:31:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E6B525FFAA;
 Sun, 11 Jan 2026 12:31:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 11 Jan 2026 12:31:26 +0100
MIME-Version: 1.0
Date: Sun, 11 Jan 2026 12:31:26 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Joris Lijssens <joris.lijssens@gmail.com>
In-Reply-To: <20260111100551.34348-1-thomas.perale@mind.be>
References: <20260111100551.34348-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.12
Message-ID: <2ecb8a82d03d6ee924b63a842e13410d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768131089;
 bh=kQuqfDQsuPMmKDJ1xR2YZA9rZYWZzDbjE2ynQEGGnjQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FAkVYkcN+2cOx4kvB8FkgCW8gIhlPD8/JomdiljB02wlcZ522pUO+XBP19xAYVLTA
 IRwva5SJQ7EsR5nB3G1t2L0cW6puQIsVAA8PIiM/NSjk3Tnm44UJ6Dmh9fo2U5R4+N
 ePdNhPZ3W/V5RcJ7/uymvhFtbsjaQ3H207xwkqOfmXAektInSyKqawCO/dNgZj96Yl
 l6XIeC27KoQQiqA5US5dfB/pbAfStB+LvksD6VWm7ewIRdRWVQnSZUphByGVEybjaP
 x8e/jGtOb1P7yRoKYAi5YkPklB6j5K43o7Y5qFJilhGPfQmyDEABptNQc1xBxMxVPz
 r6i7DwIwS86/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FAkVYkcN
Subject: Re: [Buildroot] [PATCH 1/1] package/libcoap: security bump to
 v4.3.5a
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2026 11:05, Thomas Perale via buildroot wrote:
> For more info on the release, see:
> 
> - https://github.com/obgm/libcoap/compare/v4.3.5...v4.3.5a
> - https://github.com/obgm/libcoap/blob/release-4.3.5-patches/ChangeLog
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-59391:
>     A memory disclosure vulnerability exists in libcoap's OSCORE
>     configuration parser in libcoap before release-4.3.5-patches. An 
> out-
>     of-bounds read may occur when parsing certain configuration values,
>     allowing an attacker to infer or read memory beyond string 
> boundaries
>     in the .rodata section. This could potentially lead to information
>     disclosure or denial of service.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-59391
> 
> - CVE-2025-65493:
>     NULL pointer dereference in src/coap_openssl.c in OISM libcoap 
> 4.3.5
>     allows remote attackers to cause a denial of service via a crafted
>     DTLS/TLS connection that triggers BIO_get_data() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65493
> 
> - CVE-2025-65494:
>     NULL pointer dereference in get_san_or_cn_from_cert() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted X.509 certificate that 
> causes
>     sk_GENERAL_NAME_value() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65494
> 
> - CVE-2025-65495:
>     Integer signedness error in tls_verify_call_back() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted TLS certificate that causes
>     i2d_X509() to return -1 and be misused as a malloc() size 
> parameter.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65495
> 
> - CVE-2025-65496:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that 
> triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65496
> 
> - CVE-2025-65497:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that 
> triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65497
> 
> - CVE-2025-65498:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that 
> triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65498
> 
> - CVE-2025-65499:
>     Array index error in tls_verify_call_back() in src/coap_openssl.c 
> in
>     OISM libcoap 4.3.5 allows remote attackers to cause a denial of
>     service via a crafted DTLS handshake that triggers
>     SSL_get_ex_data_X509_STORE_CTX_idx() to return -1.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65499
> 
> - CVE-2025-65500:
>     NULL pointer dereference in coap_dtls_generate_cookie() in
>     src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
>     cause a denial of service via a crafted DTLS handshake that 
> triggers
>     SSL_get_SSL_CTX() to return NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65500
> 
> - CVE-2025-65501:
>     Null pointer dereference in coap_dtls_info_callback() in OISM 
> libcoap
>     4.3.5 allows remote attackers to cause a denial of service via a 
> DTLS
>     handshake where SSL_get_app_data() returns NULL.
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-65501
> 
> LICENSE Year updated see [1].
> 
> [1] 
> https://github.com/obgm/libcoap/commit/c9135b6b26b978295a3e1312ff59cb7cb9b32251
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
