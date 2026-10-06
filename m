Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DF3CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F1EF407C3;
	Tue,  6 Oct 2026 16:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hz1Q_JRZFRFL; Tue,  6 Oct 2026 16:40:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AAE14407C6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304814;
	b=WQs6Yx6PGqhEk99r0lQxe9d2qtFVfA3kW2/4oQxlb6JRdkIixEsXs+iplg5DUevKRWXv
	 ghvHZ52RdfuOUe+wqANSZrBsGHGzWYHkTTAzI9rhH+fJfh5++8z4cgraBs8A+iq1wvYsS
	 I1e9WHQgnRdpD0x7D0TBZjOocZIO/QI+x7qj7csuyfZT+QtQnYEvHMXRBFvdbFqNxZ8C2
	 G19m7dxSVzFqsQXUO3qqbrVMy0tA0KPGe1yQArADXLTTWidFMuQ8gpn5ReO1SNFvjlNYW
	 5YDb8NnwKABSndeVt5XIy7wJyZTCWZQW12wWicRSi+xaz8WYCDWHzXxPScSR0wFeDzQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9vCVTr6Y+8KLXmKKdtm67CfPaucSeFKupDXFTl9krhI=;
	b=HTWAIZ7tuTuxVGmOXvWuEzCB+XQ4f/4CPYiC/L6fjY3C5EhroT8zyOjQmJB8QkW+QieO
	 eLhpR2ObeYAP3t2kZR8qZOBU1HSJ43CURQonlHM9Fart9s9I6ARFm6jRAlgwOjGIsAj1F
	 +YspaTAlSsQ0Ypd8oSFhSvsilaSbpbVvedDw9qJ1ZXQpHJY8B3ejtmIAnlDiqOjuwokqj
	 Bu4dvzY8jZgBcXYCzkzt8X74DttkiADeVrtSQiZaSRBLI+yrPoyrMkE5YuQzejKcpryEw
	 5y5cWGCIcEWwgRNmpE5ivfbjUcqqS6tF8IORWXF3WsrqJUMn6yOl68kbi02vpCEt4eg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304814;
	bh=9vCVTr6Y+8KLXmKKdtm67CfPaucSeFKupDXFTl9krhI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qiOMeLsgbFX7SbKYG6e+YEX8cVf/pP9jEMOBOyJ5oUGUBFVqGdmWvYuuPprhtL8s5
	 9U+JY4d95vgIcd211o28Q1/atf3rNz1dnjKMDqs2OmIHkPMqQgFU8CGqT2taKcyLrG
	 nBET7NFIvAIzFg+K8KL+LbpF0FcIGObYWE4AVd8I/VVo91Na5p1fpl0AIfnZeDZexl
	 jLbIq+JP3EKUeFDXmgFGG/2xICdfwVK3Fa83Db7j77yVQ13jTs2Bd7eAHBU5dfP7gc
	 Yo3wBmVZFfmEhYPdkoc23FMGsDXVrecs59J1mcSpUgfMud+LXS29WQpbC5Q4cKcnga
	 CvuD6mrSTirJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE14407C6;
	Tue,  6 Oct 2026 16:40:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4889F317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A0F2402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iKtzHGzadET for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7D842402B9
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304575;
 b=Md9PpyuV5MQoKhw8Bwd9QkPXWLAM01c24HY9JxkKi9RGgOWOMB+SbgLXcAiZWGp82pcn
 wMjgFc9/S+zeKrmjUGRamhpK8C2qHcg5vs0dTW4fS6ANUMylMYEl65txurFrVURhUOEmc
 AzTRZX+9Me/XrIGuPPSXmCLblRgJ69mQ2P8evsub8KOw5eE6/Qt2iMSdInVeD55HVp5+4
 UosEBk38KMyk/wvsgDHyW4r7rUFznDBqB6LCMuoKrkPqOXZNvFtvXChVPusMAZdg3QMbl
 hTKowqEANn8w1ap/wGRZrKEcBv989Ti6usS5CCGKNpQLKAFrV5xGEShAqgWi83lXM+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304575;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=PCtbm3FJ46i6rp0Xss2kAzyOlsPxv6LaYo+6ODHRp7E=;
 b=SGl8JiAgPPWgvyuNwe4TRdMv78OH35sBOAGgKdlyBJNoBsIg5c8If9F6F5ji19T9N7ix
 nW1aaK2loRLBjo0W7euMqIddL2iwJb7nkhIuM3uxcILP+VjHCebaELoR6LsY9aEmjGi9s
 DkLtGlXGHeQ9d60aCA0hIUuNvFxG66JoPyJ93+5wf3Lw0eLj/1ACjNvqcIAVx7P/gNrkx
 FE0kNjEIUSIcKDnqFHiN2QkUwhtO0OU8/YnuBTVSs9B9zKkBzt+q/Z3/Vp0LP8DIIicU3
 E7L8p3dDzGMXmyjIb8bQYQOhrjno1qYOLqRGo5uZhkgVz6j75DUh4O18o36VYAkoJWw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JDtEbFnZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JDtEbFnZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D842402B9
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303712;
 bh=PCtbm3FJ46i6rp0Xss2kAzyOlsPxv6LaYo+6ODHRp7E=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=JDtEbFnZS8zL7SkgLtj+O2TAQaz+J8c0PxEeXr40/hmeAiWMgVICXel9vmjZhjM6p
 bIRWYnfpM1/KqDU6b7ifdPy8c6ZYRcivYFK5wDrazAs1QAfcIs892LdHx6pBhSumBk
 UMXG1v1YHQaYfXLVtEdTh3F9sY4MQjxKCmt0ZlQnZPkJ9YvWdgOSO+Edf43fn9bz4W
 czipr5pnJ9WDZyGEh+VZLuXtv4Cc3mZoWZ366PtLAORkDqBsQ6vV7o4s8/d2HpUCvX
 RKkShq7E+4A5h2kfxB3o+Qdl6LYSLzrqRrf1MMurYLKUEfRICfvU6E4dYxhPWda3nQ
 AoRpdkNJI07eg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 FFEn5/YpMEk/8UkA4t+vWX9g+heMs+EjpJIxc5LksU3cnVEQfpxdWoXhcMXvKnZ0V/Fdk5dy/xA
 lYjKOhqZSdsr7AMUJJEHMLEUzCjn5oCOtTFJ84CGoHrWlCSqIkmDFAvAuQnJEs/c/ikygBDfrgu
 C4BhwaMp90XxLicewDfMvvDUMVujndPdZ51Xi0kLFpgk8PJlMZGG2dxLzqVgbfgFJzTRiXxCvf/
 HJ2ihoHapnapO2VpDmTlYjAddHRGC6NZ7bjXxYH5hheXkaiWGeTjz3wviYqTgBou6NSs2qAFqwI
 Ys7qNfyxkEPQh+7ykqdXsaLqf8OHP8y05HJukiUq1QcXyNJXxISc2L3QkCYKoFM+ioZSdfb29xP
 s0tEmTvr9k+Y03yLBQIhrWb9ZYHwoZ8llvUYRrRVp5bKKVGnEkvpOkb26dvcAuV9b9keEek8e2o
 xch+ArxLQGd18W3dEIpNMWPHP+2rSvq+U1L1IN04q47E/ehmSP4X5o3nxPnntGHrl31evUXzH7P
 m+gmQbPc2jDdG4+3IBDZAfI5t+UV4ZVgaZrutF9ZY15eqNhVWRoXo5d/XAkWWilyrXF4N5lhCN3
 IO7h0ARoGcXEFKnnKAoTindlqL5/ybCZmYyh8bvDCrkEwU36wDbZz+4VrjLLV0pkcBHacq7yVNx
 eftn8UZ+x3gWgdsg=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 986E9A4C5555
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7un-000000000ir-04oA
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:30 +0200
Message-ID: <20261006162106.3439373-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 49/84] package/squid: Fix build with OpenSSL
 4.0.0
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
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  | 368 ++++++++++++++++++
 1 file changed, 368 insertions(+)
 create mode 100644 package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch

diff --git a/package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch b/package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
new file mode 100644
index 0000000000..a0c3abff4f
--- /dev/null
+++ b/package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
@@ -0,0 +1,368 @@
+From 144a59fec3d7a4bd7f0c3e71934156e1a56ebabc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pavol=20=C5=BD=C3=A1=C4=8Dik?= <pzacik@redhat.com>
+Date: Wed, 6 May 2026 17:18:58 +0200
+Subject: [PATCH] Fix OpenSSL 4.0 compatibility
+
+Replace direct ASN1 structure field access with accessor functions.
+and use ASN1_STRING_set() instead of direct field assignment.
+
+Fix issues caused by X509* API constness changes; in some cases,
+casting the const away is necessary to keep compatibility with
+OpenSSL 3.
+
+Downloaded from Fedora:
+https://src.fedoraproject.org/rpms/squid/blob/rawhide/f/squid-7.5-openssl4.patch
+
+Upstream: https://github.com/squid-cache/squid/pull/2501
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../cert_generators/file/certificate_db.cc    |  2 +-
+ src/ssl/gadgets.cc                            | 92 +++++++++++--------
+ src/ssl/gadgets.h                             |  4 +-
+ src/ssl/support.cc                            | 18 ++--
+ 4 files changed, 66 insertions(+), 50 deletions(-)
+
+diff --git a/src/security/cert_generators/file/certificate_db.cc b/src/security/cert_generators/file/certificate_db.cc
+index 4b729b316..35849aa63 100644
+--- a/src/security/cert_generators/file/certificate_db.cc
++++ b/src/security/cert_generators/file/certificate_db.cc
+@@ -335,7 +335,7 @@ Ssl::CertificateDb::addCertAndPrivateKey(std::string const &useKey, const Securi
+     }
+ 
+     const auto tm = X509_getm_notAfter(cert.get());
+-    row.setValue(cnlExp_date, std::string(reinterpret_cast<char *>(tm->data), tm->length).c_str());
++    row.setValue(cnlExp_date, std::string(reinterpret_cast<const char *>(ASN1_STRING_get0_data(tm)), ASN1_STRING_length(tm)).c_str());
+     const auto subject = OneLineSummary(*X509_get_subject_name(cert.get()));
+     row.setValue(cnlName, subject.get());
+     row.setValue(cnlKey, useKey.c_str());
+diff --git a/src/ssl/gadgets.cc b/src/ssl/gadgets.cc
+index 06b8b79dd..100ee6a46 100644
+--- a/src/ssl/gadgets.cc
++++ b/src/ssl/gadgets.cc
+@@ -259,20 +259,31 @@ static bool replaceCommonName(Security::CertPointer & cert, std::string const &r
+     if (cn.length() > 2 && *cn.begin() == '[' && *cn.rbegin() == ']')
+         cn = cn.substr(1, cn.size()-2);
+ 
+-    X509_NAME *name = X509_get_subject_name(cert.get());
++    const X509_NAME *subject = X509_get_subject_name(cert.get());
++    if (!subject)
++        return false;
++
++    X509_NAME *name = X509_NAME_dup(subject);
+     if (!name)
+         return false;
++
+     // Remove the CN part:
+     int loc = X509_NAME_get_index_by_NID(name, NID_commonName, -1);
+-    if (loc >=0) {
+-        X509_NAME_ENTRY *tmp = X509_NAME_get_entry(name, loc);
+-        X509_NAME_delete_entry(name, loc);
++    if (loc >= 0) {
++        X509_NAME_ENTRY *tmp = X509_NAME_delete_entry(name, loc);
+         X509_NAME_ENTRY_free(tmp);
+     }
+ 
+     // Add a new CN
+-    return X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC,
+-                                      (unsigned char *)(cn.c_str()), -1, -1, 0);
++    if (!X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC,
++                                     (unsigned char *)(cn.c_str()), -1, -1, 0)) {
++        X509_NAME_free(name);
++        return false;
++    }
++
++    int ret = X509_set_subject_name(cert.get(), name);
++    X509_NAME_free(name);
++    return ret;
+ }
+ 
+ const char *Ssl::CertSignAlgorithmStr[] = {
+@@ -301,9 +312,9 @@ static void
+ printX509Signature(const Security::CertPointer &cert, std::string &out)
+ {
+     const ASN1_BIT_STRING *sig = Ssl::X509_get_signature(cert);
+-    if (sig && sig->data) {
+-        const unsigned char *s = sig->data;
+-        for (int i = 0; i < sig->length; ++i) {
++    if (sig && ASN1_STRING_get0_data(sig)) {
++        const unsigned char *s = ASN1_STRING_get0_data(sig);
++        for (int i = 0; i < ASN1_STRING_length(sig); ++i) {
+             char hex[3];
+             snprintf(hex, sizeof(hex), "%02x", s[i]);
+             out.append(hex);
+@@ -377,7 +388,7 @@ mimicAuthorityKeyId(Security::CertPointer &cert, Security::CertPointer const &mi
+         X509_EXTENSION *ext;
+         // Check if the issuer has the Subject Key Identifier extension
+         const int indx = X509_get_ext_by_NID(issuerCert.get(), NID_subject_key_identifier, -1);
+-        if (indx >= 0 && (ext = X509_get_ext(issuerCert.get(), indx))) {
++        if (indx >= 0 && (ext = const_cast<X509_EXTENSION *>(X509_get_ext(issuerCert.get(), indx)))) {
+             issuerKeyId.reset((ASN1_OCTET_STRING *)X509V3_EXT_d2i(ext));
+         }
+     }
+@@ -418,8 +429,7 @@ mimicAuthorityKeyId(Security::CertPointer &cert, Security::CertPointer const &mi
+     unsigned char *ext_der = nullptr;
+     int ext_len = ASN1_item_i2d((ASN1_VALUE *)theAuthKeyId.get(), &ext_der, ASN1_ITEM_ptr(method->it));
+     Ssl::ASN1_OCTET_STRING_Pointer extOct(ASN1_OCTET_STRING_new());
+-    extOct.get()->data = ext_der;
+-    extOct.get()->length = ext_len;
++    ASN1_STRING_set(extOct.get(), ext_der, ext_len);
+     Ssl::X509_EXTENSION_Pointer extAuthKeyId(X509_EXTENSION_create_by_NID(nullptr, NID_authority_key_identifier, 0, extOct.get()));
+     if (!extAuthKeyId.get())
+         return false;
+@@ -471,7 +481,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+     int nid;
+     for (int i = 0; (nid = extensions[i]) != 0; ++i) {
+         const int pos = X509_get_ext_by_NID(mimicCert.get(), nid, -1);
+-        if (X509_EXTENSION *ext = X509_get_ext(mimicCert.get(), pos)) {
++        if (X509_EXTENSION *ext = const_cast<X509_EXTENSION *>(X509_get_ext(mimicCert.get(), pos))) {
+             // Mimic extension exactly.
+             if (X509_add_ext(cert.get(), ext, -1))
+                 ++added;
+@@ -482,7 +492,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+                 // that the more stringent requirements are met.
+ 
+                 const int p = X509_get_ext_by_NID(cert.get(), NID_key_usage, -1);
+-                if ((ext = X509_get_ext(cert.get(), p)) != nullptr) {
++                if ((ext = const_cast<X509_EXTENSION *>(X509_get_ext(cert.get(), p))) != nullptr) {
+                     ASN1_BIT_STRING *keyusage = (ASN1_BIT_STRING *)X509V3_EXT_d2i(ext);
+                     ASN1_BIT_STRING_set_bit(keyusage, KeyEncipherment, 1);
+ 
+@@ -495,8 +505,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+                                                 (const ASN1_ITEM *)ASN1_ITEM_ptr(method->it));
+ 
+                     ASN1_OCTET_STRING *ext_oct = ASN1_OCTET_STRING_new();
+-                    ext_oct->data = ext_der;
+-                    ext_oct->length = ext_len;
++                    ASN1_STRING_set(ext_oct, ext_der, ext_len);
+                     X509_EXTENSION_set_data(ext, ext_oct);
+ 
+                     ASN1_OCTET_STRING_free(ext_oct);
+@@ -518,7 +527,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+ SBuf
+ Ssl::AsnToSBuf(const ASN1_STRING &buffer)
+ {
+-    return SBuf(reinterpret_cast<const char *>(buffer.data), buffer.length);
++    return SBuf(reinterpret_cast<const char *>(ASN1_STRING_get0_data(&buffer)), ASN1_STRING_length(&buffer));
+ }
+ 
+ /// OpenSSL ASN1_STRING_to_UTF8() wrapper
+@@ -547,7 +556,7 @@ Ssl::ParseAsSimpleDomainNameOrIp(const SBuf &text)
+ }
+ 
+ std::optional<AnyP::Host>
+-Ssl::ParseCommonNameAt(X509_NAME &name, const int cnIndex)
++Ssl::ParseCommonNameAt(const X509_NAME &name, const int cnIndex)
+ {
+     const auto cn = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(&name, cnIndex));
+     if (!cn) {
+@@ -576,7 +585,7 @@ Ssl::ParseCommonNameAt(X509_NAME &name, const int cnIndex)
+ static bool
+ addAltNameWithSubjectCn(Security::CertPointer &cert)
+ {
+-    X509_NAME *name = X509_get_subject_name(cert.get());
++    const X509_NAME *name = X509_get_subject_name(cert.get());
+     if (!name)
+         return false;
+ 
+@@ -610,7 +619,7 @@ static bool buildCertificate(Security::CertPointer & cert, Ssl::CertificatePrope
+     // returns a pointer to the existing subject name. Nothing to clean here.
+     if (properties.mimicCert.get()) {
+         // Leave subject empty if we cannot extract it from true cert.
+-        if (X509_NAME *name = X509_get_subject_name(properties.mimicCert.get())) {
++        if (const X509_NAME *name = X509_get_subject_name(properties.mimicCert.get())) {
+             // X509_set_subject_name will call X509_dup for name
+             X509_set_subject_name(cert.get(), name);
+         }
+@@ -656,7 +665,7 @@ static bool buildCertificate(Security::CertPointer & cert, Ssl::CertificatePrope
+     bool useCommonNameAsAltName = true;
+     // mimic the alias and possibly subjectAltName
+     if (properties.mimicCert.get()) {
+-        unsigned char *alStr;
++        const unsigned char *alStr;
+         int alLen;
+         alStr = X509_alias_get0(properties.mimicCert.get(), &alLen);
+         if (alStr) {
+@@ -667,7 +676,7 @@ static bool buildCertificate(Security::CertPointer & cert, Ssl::CertificatePrope
+         // certificates with CN unrelated to subjectAltNames.
+         if (!properties.setCommonName) {
+             int pos = X509_get_ext_by_NID(properties.mimicCert.get(), NID_subject_alt_name, -1);
+-            X509_EXTENSION *ext=X509_get_ext(properties.mimicCert.get(), pos);
++            X509_EXTENSION *ext = const_cast<X509_EXTENSION *>(X509_get_ext(properties.mimicCert.get(), pos));
+             if (ext) {
+                 if (X509_add_ext(cert.get(), ext, -1))
+                     ++addedExtensions;
+@@ -922,20 +931,23 @@ Ssl::WritePrivateKey(Ssl::BIO_Pointer &bio, const Security::PrivateKeyPointer &p
+ }
+ 
+ Ssl::UniqueCString
+-Ssl::OneLineSummary(X509_NAME &name)
++Ssl::OneLineSummary(const X509_NAME &name)
+ {
+     return Ssl::UniqueCString(X509_NAME_oneline(&name, nullptr, 0));
+ }
+ 
+ bool Ssl::sslDateIsInTheFuture(char const * date)
+ {
+-    ASN1_UTCTIME tm;
+-    tm.flags = 0;
+-    tm.type = 23;
+-    tm.data = (unsigned char *)date;
+-    tm.length = strlen(date);
+-
+-    return (X509_cmp_current_time(&tm) > 0);
++    ASN1_UTCTIME *tm = ASN1_UTCTIME_new();
++    if (!tm)
++        return false;
++    if (!ASN1_UTCTIME_set_string(tm, date)) {
++        ASN1_UTCTIME_free(tm);
++        return false;
++    }
++    int result = X509_cmp_current_time(tm);
++    ASN1_UTCTIME_free(tm);
++    return (result > 0);
+ }
+ 
+ /// Print the time represented by a ASN1_TIME struct to a string using GeneralizedTime format
+@@ -945,14 +957,18 @@ static bool asn1timeToGeneralizedTimeStr(ASN1_TIME *aTime, char *buf, int bufLen
+     // UTCTime has the form YYMMDDHHMMSS[Z | [+|-]offset]
+     // GeneralizedTime has the form YYYYMMDDHHMMSS[Z | [+|-] offset]
+ 
++    const unsigned char *data = ASN1_STRING_get0_data(aTime);
++    int length = ASN1_STRING_length(aTime);
++    int type = ASN1_STRING_type(aTime);
++
+     // length should have space for data plus 2 extra bytes for the two extra year fields
+     // plus the '\0' char.
+-    if ((aTime->length + 3) > bufLen)
++    if ((length + 3) > bufLen)
+         return false;
+ 
+     char *str;
+-    if (aTime->type == V_ASN1_UTCTIME) {
+-        if (aTime->data[0] > '5') { // RFC 2459, section 4.1.2.5.1
++    if (type == V_ASN1_UTCTIME) {
++        if (data[0] > '5') { // RFC 2459, section 4.1.2.5.1
+             buf[0] = '1';
+             buf[1] = '9';
+         } else {
+@@ -960,11 +976,11 @@ static bool asn1timeToGeneralizedTimeStr(ASN1_TIME *aTime, char *buf, int bufLen
+             buf[1] = '0';
+         }
+         str = buf +2;
+-    } else // if (aTime->type == V_ASN1_GENERALIZEDTIME)
++    } else // if (type == V_ASN1_GENERALIZEDTIME)
+         str = buf;
+ 
+-    memcpy(str, aTime->data, aTime->length);
+-    str[aTime->length] = '\0';
++    memcpy(str, data, length);
++    str[length] = '\0';
+     return true;
+ }
+ 
+@@ -996,8 +1012,8 @@ bool Ssl::certificateMatchesProperties(X509 *cert, CertificateProperties const &
+         return true;
+ 
+     if (!properties.setCommonName) {
+-        X509_NAME *cert1_name = X509_get_subject_name(cert);
+-        X509_NAME *cert2_name = X509_get_subject_name(cert2);
++        const X509_NAME *cert1_name = X509_get_subject_name(cert);
++        const X509_NAME *cert2_name = X509_get_subject_name(cert2);
+         if (X509_NAME_cmp(cert1_name, cert2_name) != 0)
+             return false;
+     } else if (properties.commonName != CommonHostName(cert))
+diff --git a/src/ssl/gadgets.h b/src/ssl/gadgets.h
+index e0c60c3a3..4c487596b 100644
+--- a/src/ssl/gadgets.h
++++ b/src/ssl/gadgets.h
+@@ -160,7 +160,7 @@ bool WriteX509Certificate(BIO_Pointer &bio, const Security::CertPointer & cert);
+ bool WritePrivateKey(BIO_Pointer &bio, const Security::PrivateKeyPointer &pkey);
+ 
+ /// a RAII wrapper for the memory-allocating flavor of X509_NAME_oneline()
+-UniqueCString OneLineSummary(X509_NAME &);
++UniqueCString OneLineSummary(const X509_NAME &);
+ 
+ /**
+   \ingroup SslCrtdSslAPI
+@@ -285,7 +285,7 @@ const char *CommonHostName(X509 *x509);
+ SBuf AsnToSBuf(const ASN1_STRING &);
+ 
+ /// interprets X.509 Subject or Issuer name entry (at the given position) as CN
+-std::optional<AnyP::Host> ParseCommonNameAt(X509_NAME &, int);
++std::optional<AnyP::Host> ParseCommonNameAt(const X509_NAME &, int);
+ 
+ /// interprets the given buffer as either a textual representation of an IP
+ /// address (if possible) or a domain name without wildcard support (otherwise)
+diff --git a/src/ssl/support.cc b/src/ssl/support.cc
+index e7872035c..09f268a7e 100644
+--- a/src/ssl/support.cc
++++ b/src/ssl/support.cc
+@@ -272,23 +272,23 @@ ParseSubjectAltName(const GENERAL_NAME &san)
+ 
+         // RFC 5280 section 4.2.1.6 signals IPv4/IPv6 address family using data length
+ 
+-        if (san.d.iPAddress->length == 4) {
++        if (ASN1_STRING_length(san.d.iPAddress) == 4) {
+             struct in_addr addr;
+             static_assert(sizeof(addr.s_addr) == 4);
+-            memcpy(&addr.s_addr, san.d.iPAddress->data, sizeof(addr.s_addr));
++            memcpy(&addr.s_addr, ASN1_STRING_get0_data(san.d.iPAddress), sizeof(addr.s_addr));
+             const Ip::Address ip(addr);
+             return AnyP::Host::ParseIp(ip);
+         }
+ 
+-        if (san.d.iPAddress->length == 16) {
++        if (ASN1_STRING_length(san.d.iPAddress) == 16) {
+             struct in6_addr addr;
+             static_assert(sizeof(addr.s6_addr) == 16);
+-            memcpy(&addr.s6_addr, san.d.iPAddress->data, sizeof(addr.s6_addr));
++            memcpy(&addr.s6_addr, ASN1_STRING_get0_data(san.d.iPAddress), sizeof(addr.s6_addr));
+             const Ip::Address ip(addr);
+             return AnyP::Host::ParseIp(ip);
+         }
+ 
+-        debugs(83, 3, "unexpected length of an IP address SAN: " << san.d.iPAddress->length);
++        debugs(83, 3, "unexpected length of an IP address SAN: " << ASN1_STRING_length(san.d.iPAddress));
+         return std::nullopt;
+     }
+ 
+@@ -856,7 +856,7 @@ Ssl::InitClientContext(Security::ContextPointer &ctx, Security::PeerOptions &pee
+ 
+ /// \ingroup ServerProtocolSSLInternal
+ static const char *
+-ssl_get_attribute(X509_NAME * name, const char *attribute_name)
++ssl_get_attribute(const X509_NAME * name, const char *attribute_name)
+ {
+     static char buffer[1024];
+     buffer[0] = '\0';
+@@ -879,7 +879,7 @@ ssl_get_attribute(X509_NAME * name, const char *attribute_name)
+ const char *
+ Ssl::GetX509UserAttribute(X509 * cert, const char *attribute_name)
+ {
+-    X509_NAME *name;
++    const X509_NAME *name;
+     const char *ret;
+ 
+     if (!cert)
+@@ -933,7 +933,7 @@ const char *
+ Ssl::GetX509CAAttribute(X509 * cert, const char *attribute_name)
+ {
+ 
+-    X509_NAME *name;
++    const X509_NAME *name;
+     const char *ret;
+ 
+     if (!cert)
+@@ -1484,7 +1484,7 @@ void Ssl::InRamCertificateDbKey(const Ssl::CertificateProperties &certProperties
+     if (certProperties.mimicCert) {
+         if (auto *sig = Ssl::X509_get_signature(certProperties.mimicCert)) {
+             origSignatureAsKey = true;
+-            key.append((const char *)sig->data, sig->length);
++            key.append((const char *)ASN1_STRING_get0_data(sig), ASN1_STRING_length(sig));
+         }
+     }
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
