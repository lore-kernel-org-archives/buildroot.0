Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F796CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AF0060F20;
	Sat, 10 Oct 2026 09:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVR8HNgIHKU5; Sat, 10 Oct 2026 09:33:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 293E760AA7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624836;
	b=hihMqDrhpUPtMFDL2hkeUcPV39V0IUiA62be2w5g9gqQ1/lC7KQMG1py0ROMu5KBFdsx
	 y0vlO/sLdzAJ9q00BqvnICLUeaKMxwMXdPk+X1nm4fTgdMMUCOaMMNIlYO4G2Lzwb/E4s
	 J1mlJMnQAnGYAOVzDLFLluBktY7sL/C5V63RuIY5xhBT9kD/GfFYoq7Ta1+Ikqep1WVwe
	 2Z5JvTqTbU61rwJ6z6+Qz4dq+b7JSlbGY+nO3okh4u3OHJ7F/b2sK86ck6pnBS/+gk58J
	 +HO02dyTbwgLdgqTiXUR60oI4VpPxqWooHYrVXkE+g6iF5BKxP9zEGDdnW+0obN6mmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+qBHIKbe0cPnSraD6k875bkNYP9nRv6IzBYIQT5ssBU=;
	b=EgbfOdVTt9nIBwZrHM3vChvoPtT+HGdI+PFRum3Rxj9xizTK4tzLLSI2OXR0P/7mSqZY
	 RGgOeIkcndlUs2Gg9AdV5z8EgQAdLgoU5o/UO2fV9TRuLyFZHIT+90Qd4mueeiWni9TKg
	 SRYb1r2GpiCTyHBgUAHDCa5TXN3tJOoBn4NC8aa5FlgEll16h/8QD+ivvJqrdTsymN3AF
	 fS53Kzin7o5MIufqPYtj0gqbj0mPTjLUoUVSCuERWvLY3vWEtfj/1VErSYV3ZDaUl3fOY
	 ywCxI+UdTyv5vPebsdNQV6tIsXLdBMfzyPH4poyjoBl+jx7AsRd9X6nbV3+nWMBxHNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624836;
	bh=+qBHIKbe0cPnSraD6k875bkNYP9nRv6IzBYIQT5ssBU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YRJ4PwHB+vMezFNELUSdu4+f6IkZ91cDpulxAu9nqC6L/J7rL0ruhSO1GDjE/bF/c
	 oCT3eAOFV98feGFQWzQ2/ek5sDd37V/CLZS/J1RvhMx/MnnzsV2kRwAPA4ZKeGZvs0
	 99SKqV7CuQ6rYHjhsrJc2bk1onnGCJr0RMn7NB7SVLa3iStZ+Ij+dYFXA9hl/YykDM
	 IUNKMSACh2CbeFFE9SQCU6LD4SL+otUrtJNubg6DqTCbeEz9hvuTTvq8Wy3HUyFzJ9
	 w+sKdW0TH0j7ZXYcpRtFZWqyDZisv2oTSk0vrT9zL4eSIyK9RBp09uhLq9aLnHEB6Y
	 duxwsOEcjXyEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 293E760AA7;
	Sat, 10 Oct 2026 09:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D287A75
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B915D400CC
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSueAz27Sobz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:33:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CD72740004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624833;
 b=b6H6lb2o+1SBsA3B/1hPplXjA75mBU7dJz4umjkJbpWSUd3sZHnveQhmxtIqQO0+YWOx
 7QI+UvwN4RzuG88IMEPq9X+iiYJiAEUX3HFw+NgqptzpQKLRyC4YvH4DHs3W/yFJ+Zd2I
 VopzpDATBkEvQabOQI8Omnd2dqi1jgH/J8FvHXDcLPYSCwhKI57shnDoqJUJCqLRs9rfl
 7XKRtJf8Ku4T6fivdAzsBBOCUlbUW3BW18n/v16CKmkI2qPQItuvh+p5IrfdERy/8yTcN
 z2T6fGb6GbLWW8JjxIJz5mm35VJPLnedS8r28xobPbYpJVR19Fajq4to8XW+P9aREFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624833;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fiju5MU/JEOosUE5/s+TfCaiksgRhB4PHi6nrssrIBg=;
 b=OdqwJA4wdiwhDj7w0nFNwi8BGPmF9knHL2CUFpQlyxqGEMpUgWVeo1b/Yr7OqWYzLp2x
 FS5EIoneja6mlix+nkhSO2JNfreKQFBpjgBzQ/QfbmB52rI6tBwEiLEzTJ8+41hmy3ts9
 1//SlaGJT7j14ih9u43fWKtr8l3BzfizI/+IN2kjp2ojjrDa5j0e/kRss79vhqU/nOzd3
 GBVwBZ2Q4Ti1kIuyHHcpE06ro8q9OqZ3pr48BmN273Cv5nQXZYdV+dJP2NJ2HZhNT8ZjS
 Y8vZHTiKqXya0HOqpzO3TVV3WHwWjTOG5DhLlbYEZLSHXeY5ALPKsXMPDTfuSF/iu0g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD72740004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:33:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B3F9B8F7C8; Sat, 10 Oct 2026 09:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:29:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 803518cba90c4660c4f947bbc83e9f0b316d9c34
X-Git-Newrev: 543cba029e9f6e548eb8e9e14e2e7043eaf4ef64
X-Patchwork-Hint: ignore
Message-Id: <20261010093235.B3F9B8F7C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qpid-proton: fix build with
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/543cba029e9f6e548eb8e9e14e2e7043eaf4ef64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch  | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
