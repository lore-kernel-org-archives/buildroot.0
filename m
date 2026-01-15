Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDC7CCF2D5
	for <buildroot@archiver.kernel.org>; Mon, 19 Jan 2026 10:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2214D81E88;
	Mon, 19 Jan 2026 10:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWLqMqSqGGv2; Mon, 19 Jan 2026 10:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D03B481E51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768816869;
	bh=BjiEfFmttWwGyOdhes6h3OTAp1fQkDz930425ibb2D4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FjwsY9Pk8UVkUyfGO2/ePRJENzcZ3dclHvE3FY5cUdAbZ6J+5JObYOOSjYPb5F6R2
	 rRq0HBTUoJLAUq9dXTFcYQr4lhR4B/8YsUEYGH5f11UErapknMkCuwVcwCbe2pGNDN
	 94FCEY+dZekvGEcfzgqbIV6/bzHNz+qZXybFE08/5FB6pddddtPLGbzlHSjR+h7+oU
	 ISafX+6suJY+SzFnQ49XzomSeB9TW41Ln61BmKRyzMHAoHYwjxNbVzubXFa+XqTnEI
	 bm80pLJgl5ZIvQR9N8TX1uLgcchxB/WDKVSOdkTaRqEG2iBVhR/HRmQCxoaw6Mep9G
	 1l+ydb8YbJdQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D03B481E51;
	Mon, 19 Jan 2026 10:01:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BE52347
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7C4B406D9
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id djKbKwWtTJRI for <buildroot@buildroot.org>;
 Mon, 19 Jan 2026 10:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AC81406DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AC81406DE
 for <buildroot@buildroot.org>; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19F3588587; Mon, 19 Jan 2026 10:00:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 09:34:28 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 29d7905db43f1a0cf86c6e1f321047b767be7dcf
X-Git-Newrev: 143770fbdc426ff6eed1e09b0570789d6295ef93
X-Patchwork-Hint: ignore
Message-Id: <20260119100041.19F3588587@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libcoap: security
 bump to v4.3.5a
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=143770fbdc426ff6eed1e09b0570789d6295ef93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

For more info on the release, see:

- https://github.com/obgm/libcoap/compare/v4.3.5...v4.3.5a
- https://github.com/obgm/libcoap/blob/release-4.3.5-patches/ChangeLog

Fixes the following vulnerabilities:

- CVE-2025-59391:
    A memory disclosure vulnerability exists in libcoap's OSCORE
    configuration parser in libcoap before release-4.3.5-patches. An out-
    of-bounds read may occur when parsing certain configuration values,
    allowing an attacker to infer or read memory beyond string boundaries
    in the .rodata section. This could potentially lead to information
    disclosure or denial of service.

    https://www.cve.org/CVERecord?id=CVE-2025-59391

- CVE-2025-65493:
    NULL pointer dereference in src/coap_openssl.c in OISM libcoap 4.3.5
    allows remote attackers to cause a denial of service via a crafted
    DTLS/TLS connection that triggers BIO_get_data() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65493

- CVE-2025-65494:
    NULL pointer dereference in get_san_or_cn_from_cert() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted X.509 certificate that causes
    sk_GENERAL_NAME_value() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65494

- CVE-2025-65495:
    Integer signedness error in tls_verify_call_back() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted TLS certificate that causes
    i2d_X509() to return -1 and be misused as a malloc() size parameter.

    https://www.cve.org/CVERecord?id=CVE-2025-65495

- CVE-2025-65496:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65496

- CVE-2025-65497:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65497

- CVE-2025-65498:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65498

- CVE-2025-65499:
    Array index error in tls_verify_call_back() in src/coap_openssl.c in
    OISM libcoap 4.3.5 allows remote attackers to cause a denial of
    service via a crafted DTLS handshake that triggers
    SSL_get_ex_data_X509_STORE_CTX_idx() to return -1.

    https://www.cve.org/CVERecord?id=CVE-2025-65499

- CVE-2025-65500:
    NULL pointer dereference in coap_dtls_generate_cookie() in
    src/coap_openssl.c in OISM libcoap 4.3.5 allows remote attackers to
    cause a denial of service via a crafted DTLS handshake that triggers
    SSL_get_SSL_CTX() to return NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65500

- CVE-2025-65501:
    Null pointer dereference in coap_dtls_info_callback() in OISM libcoap
    4.3.5 allows remote attackers to cause a denial of service via a DTLS
    handshake where SSL_get_app_data() returns NULL.

    https://www.cve.org/CVERecord?id=CVE-2025-65501

LICENSE Year updated see [1].

[1] https://github.com/obgm/libcoap/commit/c9135b6b26b978295a3e1312ff59cb7cb9b32251

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d3ebc63ce7a7f69a45bb9dc810ecdc27add02c15)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcoap/libcoap.hash | 4 ++--
 package/libcoap/libcoap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index fc618fef52..17fce990fa 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a417ed26ec6c95c041b42353b5b6fad1602e2bf42a6e26c09863450e227b7b5f  libcoap-4.3.5.tar.gz
+sha256  bca78a2076ebb02179f93ab6cf2363b1256d878b540f810c238ea231ad5948ab  libcoap-4.3.5a.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  ecff7aa3af994b008dbb57c180753bd2a6c53fa6f8265a2486740f4cfd45280c  LICENSE
+sha256  1ba383ac337111d18334b2e230d02831b60913d137c3b653585d8e8675824111  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index d7c2a78944..bb1321f194 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.5
+LIBCOAP_VERSION = 4.3.5a
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
