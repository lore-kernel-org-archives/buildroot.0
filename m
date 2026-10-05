Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C9CA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 14:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7C948087E;
	Mon,  5 Oct 2026 14:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzS-z4bZ6ZhN; Mon,  5 Oct 2026 14:07:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A639980880
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791209257;
	b=OMMLlN+DPxVF0RXVi0SHjS4xBZSTHcAzmLap23y4d4sy49o3zzHD3lzVGrfZN6Xg7F8s
	 TLokypLLnre4rPGAC04VUNTVMwV/H4VKAc6i0246wEjUAmoF7VO2/nfNMB7SmNDN8QNEP
	 zPiftVidI4C27rCnmuHzthgoqQqktd1uoWBSkWktDMApvOiFlBHMPYyN+wX13Rdf2csB+
	 yz4p4aw8daKBMTW4diAQu5p4jH3Fr95Kh9tL4HOY+vxNOwyp+3loL5Z4SrhdcO9DbEXZp
	 m2dETK+XgDC5B9wUsM5wLeZ36BLhCmduFdIikKHU8g2CMlRJtx1qUZaFxgBY52GZq6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791209257;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=9X9UI9hY1TXMqWAics2Osxdm4qxpgZLJznvMSrOx5gE=;
	b=iqkDGS19JALHqUoy66bVKH9/cnf7w83XFRgIZwJcyhEkjY3Gf+1JQU+tNAlTjgPwrD/U
	 pjJgUT5r4cxYaB0S/pyTR0LErgvbsrfMcTZSLsEKh3erSZYeTK3IbSvl9cX65ZaLdGrVx
	 08msdyJqwzIlAkeL9eh5zURBFUueUhHGErgSYC+rm5huO8f7hHZGsV0YYtVqWO1WNDofQ
	 xjpUWiUq9rkvp4gvYMyXDoJmfxwaOnYqzPMeOE+TyqdPesLFcaczwxIWElyixQSVoKiLB
	 86os3boxUmlCfXFsVEL1xq0IM816LjXOhgHJAfl1V2QqM/VFbb6dW5j8uLUaH23FurA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791209257;
	bh=9X9UI9hY1TXMqWAics2Osxdm4qxpgZLJznvMSrOx5gE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=rg3eJmShu4gVOqUUv3ymRkD4K4xAHdcpy+MaP8wPAd8IY4ybSXPWkD14++vfwo88M
	 c1NbxZPxM7k4b+JlVvWRcBlpxY9jCNGlh4geA4fGsjHRf9qJDSbxw7Mjp+quziY5Kg
	 +PPU7deJuytq0PXNS+aekloPRU832GSWS4BerkIFx4ZKsRdzBtXrFDfHLQoYKttR42
	 HEbMPh8g9ytv9gjwYq0RsFQed0+quNva4YJz51cPJYbJyYyLQhxwEKjlXwB3JbArVI
	 ZMomi0bekupLg97JmGosMBApRBn2GUHleHQkfBJzUP+5UkVs0kIJ7njp2vdqOvEf0t
	 elbpvDIacLwtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A639980880;
	Mon,  5 Oct 2026 14:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E576338
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E88994066E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7F3bcRu-JM4S for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 13:57:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A40164065E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791208626;
 b=Hl6VoHNux53xaGHbL2IQLKuA8ibREdzEvmZS2B/G10eGcNeMa490wvs+lpKQ7hHalH8S
 a/sYyf/j3DN+WRmplEjAPkT3txN7MMG10qzTedqL4fWI/6BfrxALRdH2sFG8+bV8N3Utl
 a+tQj+bbm7veVvXn8Qbyk+EF+ZI6ep15YMpeI4+7D/3t2wh35Ha3XgnMN9cdsnbMY7BTO
 EKiaOviUyvDkaO+OaH/cdbSEmV81GW0e1D1sme+jTobsHU5J39c/Qq9muLMbeNxqA6RTm
 AwCdyWt1OTer9RqsXQ+kacbsXbcZ8lfCsosnNTNR41KNTyyvrdqAhIjaSU/lcGcyQZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791208626;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=YdlSldcX4ng8FfECYOCpYKUCsBiU5bv7piFNlfL3lnI=;
 b=OqYrIQG6e9DSg/d4itOc//yhPRCVbUC5fgAT6zKJroSyBUgbXGSfpsOG6qdM0Oyi6RVl
 JHLdceT359vEH50GKBml7a6zrIyHSv1Yc72rCSzK6Gg4gMx13AuykxmrFVp+juuiFAExO
 S7wjaXyVsi3Jx6qSABQ7hMSObfMcvWZNjynGFSQDwjmRNadsRVCottClHCjiTBqqMqHmY
 Jv5XjMR75SYORPKJygtOndnOPa2f9Yx+hcvuhtSB5rBC85FaEKAMVuRamRcgQ3YFkloLl
 d1YVKkamOoevcX8Ucc2GzgYi+CnnJpHI5TOpxtRPOQWSK7YN82wsF4ZLm47DgiZERjw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=EITdSAoc; 
 arc=none smtp.remote-ip="2a00:1450:4864:34::d"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:34::d;
 helo=mail-ej2-x0d.google.com; envelope-from=yegorslists@googlemail.com;
 receiver=<UNKNOWN> 
Received: from mail-ej2-x0d.google.com (mail-ej2-x0d.google.com
 [IPv6:2a00:1450:4864:34::d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A40164065E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 13:57:04 +0000 (UTC)
Received: by mail-ej2-x0d.google.com with SMTP id
 a640c23a62f3a-c2e3dcfe205so253802366b.0
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 06:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791208623; x=1791813423;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YdlSldcX4ng8FfECYOCpYKUCsBiU5bv7piFNlfL3lnI=;
 b=SKhYHtoNfl0xeiyFW2sgtKSEulF8pUScTgs9MRPhd+hP8WdqiNaFs62fInwwALpPKd
 a51wufBGWe+foyTflUQoyhMEuYnuOUYdVoNP+LaR4C1/kfoRY+QbeEku6U/hMGwXxUoT
 Md7Y6aVHozCx3QNqCz27AJg9s10X+D4tz0WpTHAl++JSgXLbRRBm9sDZ7HpJYnJSm2jm
 OgvxIAFsBAHd6I4DoRT8OsDypD5boCX9QZPfV2HlvOziCugnXf82poxw0A4pfvo2qrQH
 9k2bNIBmMGnV56xX4dGXFDraL5Ivgfte8r2FIqOsEyZO3+cj5f4nqCLRJPBwBdsUdzEp
 cFYA==
X-Gm-Message-State: AFuF++mYW1CqalMTYg4vMxUV/DKcsYNAVg0RzfdDEDeke2nLjB3hnQo3
 ggtjLTGKD0/ATMGiG9Z6klWJre6UyjNsXTItFeevUyjB63kc6ILeE4cu5uMC+A==
X-Gm-Gg: AYBFou2R4g1GybxbxNtJuq8weLGRRusMhbncmssS07ZYkUq4OpURS1/ObZfg+mERUO8
 6jQLEIRHKQgAI/WimseTAeZn/321zrWWPEilWuFBaFYJb50gq+z8ZTyZv7vVBmygds+YeM0spP2
 iYpBeI0M4rHPLLT6MNbn9Ao9kWakMoXh7g5GXof5HGZxaddiHUTgsxRQfaQo3DbjObuAbqNb4Ab
 DhbCwQg4kHdMJnRiLYcrlnrB4oRImSolF3k6sQDhbaGzx7LOVSOM89as9VjEiAIC2EJg5f7ENLx
 LmximvyyTSJ/b5tg1NFISdcSlCQUut5tmnfF/wchxNxW4sjvMCkwXB/mBYKc6XBkUqSbWBMDfY3
 k6RvY6F2J4D9q73X7dABZhfFhL5TvvjQQk0UkRWR44M1n77zszDpWn89Iw95GTaItwLgfswe7GP
 DtmnQERSqNNMvBpqIZW6c6EiG6Qip+EdDA/j9GeRL7C1wNrkVYOEqLp0ZITD0rdXQocFa7sLjy8
 bVf2z6XPmn6VCVe9BO6U7S6SUDUp+qQDohJgaU7ewd/LFU=
X-Received: by 2002:a17:907:3fa4:b0:c2a:cf73:63fe with SMTP id
 a640c23a62f3a-c2e4a8fd096mr1006682566b.6.1791208622565; 
 Mon, 05 Oct 2026 06:57:02 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3156360832sm84556966b.75.2026.10.05.06.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 06:57:02 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 15:56:59 +0200
Message-Id: <20261005135659.758139-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mbedtls: security bump to v3.6.7
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For more information about the release, see:

- https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7
- https://github.com/Mbed-TLS/mbedtls/compare/mbedtls-3.6.6..mbedtls-3.6.7

Fixes the following vulnerabilities:

- CVE-2026-50587:
    Timing side-channel in RSA PKCS#1 v1.5 decryption

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50587
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-rsa-pkcs1-v15-decryption-timing-side-channel/

- CVE-2026-50581:
    Extended master secret calculation failure ignored

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50581
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-extended-master-secret-calculation-failure-ignored/

- CVE-2026-50640:
    Ignored TLS 1.3 resumption secret derivation error

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50640
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ignored-tls13-resumption-secret-derivation-error/

- CVE-2026-50713:
    Heap corruption with early renegotiation after corrupted record
    in DTLS

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50713
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-heap-corruption-early-renegotiation-corrupted-dtls-record/

- CVE-2026-50584:
    ChaCha20 counter overflow can reuse keystream

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50584
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-chacha20-counter-overflow-keystream-reuse/

- CVE-2026-73096:
    TLS 1.3 early data integrity failure due to buffered plaintext
    across key change

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-73096
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls13-early-data-integrity-failure-key-change/

- CVE-2026-35336:
    Possible buffer overflow in mbedtls_ecdh_calc_secret()

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-35336
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-possible-buffer-overflow-ecdh-calc-secret/

- CVE-2026-50580:
    Remote buffer overflow in TLS 1.2 ECDHE-PSK client handshake

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50580
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-ecdhe-psk-client-buffer-overflow/

- CVE-2026-54435:
    Side channel leak in ECC optimized modp

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-54435
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ecc-optimized-modp-side-channel/

- CVE-2026-50586:
    Information disclosure in TLS 1.2 NewSessionTicket

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50586
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-newsessionticket-information-disclosure/

- CVE-2026-50583:
    Out-of-bounds read when parsing a zero-length ECC public key

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50583
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-zero-length-ecc-public-key-oob-read/

- CVE-2026-50588:
    Out-of-bounds read in TLS 1.2 EC J-PAKE ServerKeyExchange
    parsing

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50588
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls12-ecjpake-serverkeyexchange-oob-read/

- CVE-2026-50579:
    Use-after-free in mbedtls_pkcs7_free() when reusing a PKCS7
    context

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50579
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-use-after-free-pkcs7-free-reused-context/

- CVE-2026-54441:
    Signature algorithm restrictions not enforced on certificate
    chain

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-54441
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-signature-algorithm-restrictions-certificate-chain/

- CVE-2026-50585:
    Incomplete context reset in mbedtls_ssl_session_reset()

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-50585
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-ssl-session-reset-incomplete-context-reset/

- CVE-2026-73064:
    A random generator fault can compromise TLS data integrity

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-73064
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-random-generator-fault-tls-integrity/

- CVE-2026-25832:
    TLS 1.3 client accepts HelloRetryRequest selecting an
    unadvertised group

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-25832
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-tls13-hrr-unadvertised-group/

- CVE-2026-49300:
    X.509 CA bit forgery via invalid basicConstraints extension

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-49300
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-x509-ca-bit-forgery-invalid-basicconstraints/

It also fixes the following issue, which has no CVE identifier:

- PKCS7 signed data verification accepts weak hash algorithms

For more information, see:
 - https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2026-07-pkcs7-weak-hash-algorithms-accepted/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index f1be074e08..71c5612b48 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6:
-sha256  8fb65fae8dcae5840f793c0a334860a411f884cc537ea290ce1c52bb64ca007a  mbedtls-3.6.6.tar.bz2
+# From https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.7:
+sha256  a7e8bcbec0e6f761b4af24f25677626b35f762f68eef79c08677a363212d11f6  mbedtls-3.6.7.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 9def876808..3545c42ad0 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 3.6.6
+MBEDTLS_VERSION = 3.6.7
 MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
