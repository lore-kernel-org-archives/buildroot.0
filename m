Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24853C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E099040D92;
	Sun, 20 Sep 2026 14:54:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq9p5NNS_iUr; Sun, 20 Sep 2026 14:54:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EE31C40E05
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916065;
	b=Rm3FSwrGctPFoLCwBqD8Z4YtTxRQubxLqMrNg4XRX2D8h2yfJ/V1X8BzaBqaLwr/tSjB
	 SbnD8T43raMJQo6VECU2i1ZXverShUgtxn4VVpzp8UwcI3hbUnTt3W0pfYxHpgD80E3z9
	 dBfzp3WwLi0lalB1PGDwyzjMQUOlMlTbrnjImCwb7UhTmC7kTKYLLVxewObCbsyWGmgVS
	 UiJNfZ5+dTWL2DeMMvR7MlOYjLDuiG/b/cfeKtR2c3nljMxIQg9QKwi2ZvHQhwfUCQWwR
	 uZdcGAxObvnMmuX1rMvCkgAJfVyw8NiF/QGMNMeIPxs5AL29NsbZnpsy41aix13L8Ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	b=UjWhNXk+t+HB04awGLAowmJ4v1RsgnDCV6oYifaXiTZ6hV31dDUIMdy0cH5suC5bbnoZ
	 Q+xTzdhiS4hSOPTYA+2EE858OMJTs722hCGh0X5NUFF2i6DBffhqAjVB/4Aue03LT32yN
	 OWR729UO2zzAHk87fgbiDLy69D9z64WO26w+6Mj54M/jsvQrQDy9FIPqaleVN7OeqdCMA
	 oMj7efCfDxCNJf+clgaWNQPUS9VYsMvYYYrdnW095B1SEYKHc61uVTWxDHArySMvs/rke
	 Ol2D7tEVRRVFEs/pBk2UHSZtD5ET6A2kbTNuFXGxtANMXa0DR6FWwP9JlTdvasDzoWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916065;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1eXtAX0lVI7uQe5i4zeee4XVvhuYL85jLeb27N+UV9K+RZbcm4rNHDEUXeS8bpgL
	 yyrLYwnW+y9tLKgVEcCWSgR69hGccv8l8hkn+PknOYv5Ak2hY9vbU8wOBEwEd9N9Ym
	 NE8QAVu1HyBEirrngfZNg1ugXbR7Xn6iMbEK1BDH2UlhCbBkrHEoB78kVCCeLd02sR
	 eP8NxpN62BPHgwz5dxWNWc9aRInWREhugBJWCycYS79bv3VLDnpM2Rgyt6BssvCa34
	 lWnNz7Ys8cvxRHkKSB2mx6S0flW7w8uFTHFSm1OzFJaOUUqXIUs04TFT0roDYakacl
	 saMJnv8w1RvyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE31C40E05;
	Sun, 20 Sep 2026 14:54:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3BC924D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D094002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yI5H2E1HdeNB for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:54:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DB48040022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916063;
 b=FFSxHtXU30DCuNC7vuPLFhH3zdA+6uGMBqh0M33eMISX8QX9lP76U1pQvxmKjaf1bmOw
 cn9NPBuc4vfSFBrbYgioB96KzVjHCsEj0uLeJnvVc931r4XyQvck/olx2UgbA/95+X1cN
 tMROUVH3ZPsD2sqD1LMKj4QnJMlqObf5BFgeLX4PnhB5xt4vAiFB+Ha8z/HVJtdEHXIup
 CaA2u4iQ0FQKQ1K7wE40L5ZbMZNwsKMKKkJvzKlmrFn84ceWYjhq9zlZroY3sz48zJ63Q
 lSLQ5bpzanigwFGsudAcn5/B7/7d3Kh8QS1R7/ULOIfw/WphgiUHfodYi5MKKArAjYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916063;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 b=o2GNK5pOnM2kvP2zl3fkg6dXeMisWvHoNoEd837+T40Rdu2bW7pDCOKmDFx3DeOdOl3y
 P6Mh+dR+ilWFeXeHF8PSXod92Ulrbzrb0yA0e+MaWECvWAopyEtRVWDnrDeSUAgxyruAw
 4ft7/xoVPVnLri2/25YXLLWvOvDZTAWniAsEJ2UVKMijAWTJ4J1a5xyU94G9ijk+X1SZJ
 6g2dfwwTbCc3FNt5xE490CEeWftOK5h44T7H7zCm2QtWkYbgtzlhIapQUBXFKnZhODRX+
 yQhShfRX0I4+Sthp4SegaRj59xT0zWwFTuI5iEjdo9/p48Ktg6fCkvgnPFmRUgNngaQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="m56G/onG"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=m56G/onG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB48040022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915504;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=m56G/onGDQcljBPBsSJL49qVZOanU+3Qbtrt8KrDplVA03r8+Ye4z1JG69GnFbg0H
 nC+BBsDDsyYcNgss7f7OTmq0xt8nsaW0aYryvFtsj8PCBvyoemxU6PW4BrcpNiMSG6
 uW8/g3D2p/zx58ofqMuEZso4M0AeEiR1s+4ZGmSqe+tcP47FFa0KcOj+qjIzfZrdez
 2dw80a3PXC51oEidJ/lWNfSV0nju9iz8Ajr4y50qDueiy0wtuZQO2uqr49BkUqg3Va
 wzbFctyriBEmNLhmxB3wzJ5EOfQoRkYGdmsnTzHWEy6X7ZAzBI555+2WAodqWd5pT2
 c58M38sdVz8PA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:4+MAFX5RFJHzfvkO2CVPBc4rb6PcjjaqleLXQF/pOHc1NwkizvvNyg3nnNU9c7Y8i0oanCVpx+/YMCvY/r7+0Oew+sN9xNfVm6Qbk/w6uKUXdzi6B5MMY0B84AUWZ+j4FyAEEk9kgWXqG2bc/8BMv4oNpi9IzBu+srLsZ5MGbP8XAXR69u5CoQ3htFIK50CmlmWl2La9krrnRXvT5VlGSEWCe8gjwYQuSx3AC9UVhccVN8A4S+Xg2XglrqWtrRA3IfIAqFcNEmENKDISe1fMe5Ha5WpgoKUPHWvU1XCe52Cv7fC2BXDLSdx1Q4ufNCRi9TK4VhelOJrnupJ44qQ197+8ZB1HEErVIcE2iRlfNYpbu+iJyxLXjPeONQHoRm4+K/rPNudWiXsicmVCZLdLfYwpVN28K1pE+iAU9qMVYPbSIfGZrFAJt0j8Nm1N2B5Piryig8uaoNLmmi3ghOR/yRYZo7vUd4AXy/SQgXyrKEMKt1Il468AaQd+DMKwdDxc/JyklIiIO/8Sfqb7r3mqbRXLj0+AANq/CniLiAYw5U32Uu+Mn7ojbeqwfO3pb1q35fh3AxVR/G9ZYxc8cyZREBXK4VWvPFgNKdYtYK42+iAYTQ
 m6iEAyCjicQ58dfI5P5cvknm2k6w==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFA46A4C48A5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imm-000000000hB-0UBW
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:10 +0200
Message-ID: <20260920144428.3009612-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 49/66] package/qpid-proton: Fix build with
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
