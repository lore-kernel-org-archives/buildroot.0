Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3156ECA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0668E60842;
	Tue,  6 Oct 2026 16:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9o6qGZoZdlJ; Tue,  6 Oct 2026 16:38:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E50216087A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304718;
	b=RAXBCqGcae/YPTICJiDRdMga8Iv83j+GJ4/NgdATjGYnlW+UhRn2Q63+TbBVrV5iy8k1
	 U9++pqo+YXnbv6hSoxZwR47ygvj0/ZYNhkeTQVlsFyvZCRlOXe65dQH/9oxrQ67ofSGLF
	 /UZUbNqpNRk8qtRnKFseR0d7py3IUs6//ZCJjfGzIMkenRkU0QAqibOs2PZ3Kluii0AR3
	 JFQ8qwV0j92zgbgfNdXBrCilWjzE1QppgChfez3bllVIvXfm22jD5zsWuyfg4G8zbwB+m
	 DVjf44ZxEXl6mOpicEQ5CXUyY1vwwf9OQvbntKK91y8GfTXY/pQsRCzu4KdcKkBtDmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304718;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CGp/okkKI4sjL+7RR0M9Jj3vE/DtrlezIeGU/hU+VYw=;
	b=dzGIsZwoL32eO5ZtzvzlfB9rHEE5sKXw515I3fe0EYOvuPsSMWO7I5MSNnMt5qF6p5im
	 z+IbncLn2K/98U5uhy4U2nbfAxM3D6GGNlQLKgnlljluDgJ2oomldpXpny02jLI62iwLc
	 iikDB2pvVI6+CYVPUaaWpC9fSPl8PpkdVllqY7zuOjbB3f3FF6S9wR9UprcYf2FDb4YZt
	 3RAmel+cDRSgcAHDL6X/2MhBq3tTfAOxHnj98B4fNsmqGcW2FoFHzusc+Rdqdc9pQnK+3
	 EkX/d+9iida6rHDsVPUiNdushdyMwQpsIPEKqrUSxN5x0m99vtvzC2zSo0ijoE1RZOQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304718;
	bh=CGp/okkKI4sjL+7RR0M9Jj3vE/DtrlezIeGU/hU+VYw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i5EPUQhx9HS9zuQNG9MVmWjTp3MpfPQGDZjownimCdM7ZbvdYioTIyCHnAUkolVn9
	 o3D0/Ftp9CgXGk43sxENJY0oy2b5ZtGaEmZ5/QWid/1lqzfuQV+JEXoEgVkXPrFMVy
	 2++Sf0+wa6sD+1SBSp1nmtJyPOiqXenaWA9dNFo++ZkQu5S3zS4Wx1F7rjHATP47dw
	 EMQUXFO6AMT52QxRTKo9BrMoNAnG0KzOEwNMsW/ZnHfxsfC9suHLiG1Hq/7wGmaFBj
	 vP/ge/9oGDSd012s8iuTS4Yc+rmiTgUaMJMGr9ZerfCp9tlBaLZre+NQf7D8DwX6E5
	 Tu08gRUwkRelw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E50216087A;
	Tue,  6 Oct 2026 16:38:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E714F317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4B49402B9
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRtHIfBWlsoc for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:34:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 822D3402AF
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304490;
 b=iLBJczMPm9aBu5qpEM9Fg4i7z3TqNlU+Zbv3qR9MUQvrcyu0C+0d9UgXqKuONzmqAEb5
 9xo55+Z51EWAb68WGpL8m5p996EDK3Zwh21XVCChU6vBEkK/diQpZAzKBCfcMf2fJ4yUK
 EuNXIUHPV9ry2oOq16iODZtdaUleB2OANh2fWWjJQRuk7bkLne1k3iBODy+jmV0gvv9qQ
 GJp+EkhQRKpgpunqMIDso2/JhrHEyVgkBZUNADMVl+H2WwtMwE9m4BZ/tFze3435nkw+W
 /xsw7tZnshVtsmZRPdnX3P2K5LBOTWQn0N5nfcF0rsGdayAdmqb+Y+X+nbXw1SGqdHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304490;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=VvnSkSBk/LrOs6fACWr0yBwJxYAjiavrxs0Q9b8kAfo=;
 b=W5eT2mrVQE3AaTDo1pW892XQrZB5+ejDLrNQ+eHEcElPrh/5rKcJXjuURf0zwdGC/ZVD
 ZwRPOYemks/hVo/QkNjJdZVYHLsum6eDQXiIW8Yk6kZKx7B/JnPnwlccH8vWkS10F2f2Q
 h0P3V50MMIy1v2dcYm2EJPBQR61Rllj7sTqMoLk3jo7vLOHF8U22FaCt07TFL3NSa1qq+
 p57ALHyuevMxVbohDLzdwkaPqxfuSn6SaDLSNJg3HkHE1kL14dsL/4A0thlDIdQSU5gOV
 7i7rNbwdxpbWFoNs0FrEx+PnfRZm+V2Lv7oPnucZjAHfkS9knhnRg+w3SEiuf0303zA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=NT+bWXd5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=NT+bWXd5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 822D3402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303711;
 bh=VvnSkSBk/LrOs6fACWr0yBwJxYAjiavrxs0Q9b8kAfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NT+bWXd5ZaAHLvTXe90LMMhLttGHB0KDbNuVrjbaQRDBvR8dx3ZH9UgkaCEobenj1
 IlkQ1YsoxcD4r+sfTKXG29+uTXWSaOkRucosFu+g2392jcUNNLBI36QNUv5K4cGOe2
 LWSuWnlREjGKegdy+2HBs7siuX1hDzrv+BdbatHO0Mpmoy4DPY8HesTar/6TszQw00
 WRV4xVA2ors4L47UlKnibbkOLnqlEDCmcilp+n310FnUHxy5fIhCjD3Un/WAoUP0ad
 ta6qIpSJk8NjLa+dHIyKkPVXpePfzBCAuJ5mTFJdcFtutVaZGcNdoJRmd6C0kI46O9
 2lMPbZlTospPg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 U/tScxKmQq8SDo4fNnRT5qZKtQ1uhPAmQVr3FOpt0/wRM47ixGO9OC7nB1i1Kz+3lSk1IjI8gs3
 N98l5g3L3L0aPOu8OgGofF4oId1djpkO5GX2uBSLWvDyauhSrhPmauA1iEM2U9vA5xSfnV0SE0w
 91X6MYSeL+7GLB6iHo+KOSpg47E8b15i2dgGoGnfap+tw8Y/aXez0zIRmfI+RHJHTOsHYeET5Pp
 E1nOIgkJJp9uTsyt5Ptag1EZElh3JVl/tLyGjkL09nLeJGoNsYklMsFt2n1LT2ffUoWqETa6U1U
 ed5KiUeksJMfR4vyxd8YSUWHAod4V2wRbszqc8JRg8PKNB2mRZzRc2PPhetAoHlK/mcMv4nKZkJ
 8lZOXbddA5nDXoOx5AZe3MfZONS3F+F9Y3eGyBMDyQdKCCqtYRiZ+IqS/kjSs99LtQJe4owbpwG
 x3CCE0mcse3++SeBiilXs4P7nl166Rj/79yrBn/BkzQqz87CJsbRoMv2eDyF6LZ3lyImXZhth+9
 d81Zwi6oaaNyVJOxPRKHiwKkYomDDMj5dik8gQ5qyz77vfLayHQDmFZNS4j93znkcY4vlHFPWoF
 0IphZOom5cOy921a7yOEDd7eQUpqkt7rr9E3KsXMTp1A3hDgIQ==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 787C2A4C5541;
 Tue,  6 Oct 2026 18:21:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7um-000000000ir-0a3v;
 Tue, 06 Oct 2026 16:21:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue,  6 Oct 2026 18:20:23 +0200
Message-ID: <20261006162106.3439373-43-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 42/84] package/qpid-proton: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 ...1-PROTON-2937-Add-OpenSSL-4.x-compat.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch

diff --git a/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
new file mode 100644
index 0000000000..96ae892716
--- /dev/null
+++ b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
@@ -0,0 +1,80 @@
+From 7be093d8d96104caab3fa858ab9886f23d62ee04 Mon Sep 17 00:00:00 2001
+From: Thomas Goirand <zigo@debian.org>
+Date: Wed, 17 Jun 2026 15:31:31 +0200
+Subject: [PATCH] PROTON-2937: Add OpenSSL 4.x compat
+
+Fixes this Debian bug: https://bugs.debian.org/1138394
+
+It retains compatibility with OpenSSL 3
+
+Closes #447
+
+Upstream: https://github.com/apache/qpid-proton/commit/7be093d8d96104caab3fa858ab9886f23d62ee04
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c/src/ssl/openssl.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/c/src/ssl/openssl.c b/c/src/ssl/openssl.c
+index 62d4b40a..4c3a76c5 100644
+--- a/c/src/ssl/openssl.c
++++ b/c/src/ssl/openssl.c
+@@ -339,7 +339,7 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+       GENERAL_NAME *name = sk_GENERAL_NAME_value( sans, i );
+       if (name->type == GEN_DNS) {
+         ASN1_STRING *asn1 = name->d.dNSName;
+-        if (asn1 && asn1->data && asn1->length) {
++        if (asn1 && ASN1_STRING_get0_data(asn1) && ASN1_STRING_length(asn1) > 0){
+           unsigned char *str;
+           int len = ASN1_STRING_to_UTF8( &str, asn1 );
+           if (len >= 0) {
+@@ -354,11 +354,11 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+   }
+ 
+   /* if no general names match, try the CommonName from the subject */
+-  X509_NAME *name = X509_get_subject_name(cert);
++  const X509_NAME *name = X509_get_subject_name(cert);
+   int i = -1;
+   while (!matched && (i = X509_NAME_get_index_by_NID(name, NID_commonName, i)) >= 0) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
+-    ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
++    const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+     if (name_asn1) {
+       unsigned char *str;
+       int len = ASN1_STRING_to_UTF8( &str, name_asn1);
+@@ -1558,7 +1558,7 @@ const char* pn_ssl_get_remote_subject(pn_ssl_t *ssl0)
+   if (!ssl->subject) {
+     X509 *cert = get_peer_certificate(ssl);
+     if (!cert) return NULL;
+-    X509_NAME *subject = X509_get_subject_name(cert);
++    const X509_NAME *subject = X509_get_subject_name(cert);
+     if (!subject) return NULL;
+ 
+     BIO *out = BIO_new(BIO_s_mem());
+@@ -1677,17 +1677,17 @@ const char* pn_ssl_get_remote_subject_subfield(pn_ssl_t *ssl0, pn_ssl_cert_subje
+   X509 *cert = get_peer_certificate(ssl);
+   if (!cert) return NULL;
+ 
+-  X509_NAME *subject_name = X509_get_subject_name(cert);
++  const X509_NAME *subject_name = X509_get_subject_name(cert);
+ 
+   // TODO (gmurthy) - A server side cert subject field can have more than one common name like this - Subject: CN=www.domain1.com, CN=www.domain2.com, see https://bugzilla.mozilla.org/show_bug.cgi?id=380656
+   // For now, we will only return the first common name if there is more than one common name in the cert
+   int index = X509_NAME_get_index_by_NID(subject_name, openssl_field, -1);
+ 
+   if (index > -1) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
+     if(ne) {
+-      ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+-      return (char *) name_asn1->data;
++      const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++      return (const char *)ASN1_STRING_get0_data(name_asn1);
+     }
+   }
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
