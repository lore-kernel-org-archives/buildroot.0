Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921E2CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FB8C407B9;
	Tue,  6 Oct 2026 16:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iTqjy6q5FLZ; Tue,  6 Oct 2026 16:39:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E5A324073F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304761;
	b=EO/Lcynxyt5yBLNY9LcYZkZAP5r3RJMXzRlo6mv2FhtBT5X0RCdTTg2d/n4Ru/JNjc4N
	 pI2BEwLUnhIej03SIY0tnudkTzmAT97S0XtST1Sm/C5tcb6cqmUPBFcb0vnKnIzDFeHYI
	 x/DvEJAZfTXrw3kWS6LLTLuaxFvBTrwY1bVqs+IIUgLjPLbVbZ6OQ9wt/ILgCSJ7yM8Eu
	 GtCzpqwPJ5LwbGbkuLYdFV/bo15DkAC7/oaCABysjkhdeVcS3dlZactJo4GCwWIHlymqj
	 0AshRSS8NKhjbnM5oek6Lq1zV2NAB1rEnfFCRZEEJ0MyxmedgPPnZ29b1ldYXV7zMmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7coOgQvJaTvIQaVKcv+9s1FecU2Tziurp5fdy2N6kXs=;
	b=Y+ZyQtVCr0seVxZ1tDjNA/f3cWDN03FDR5qoxKWTvYWhWj770U9aUYTav9f58ufPtQDX
	 Dl+TTEp2l5iiOqmaDUaM1OPLYz82TpxLkjozgnUf5gFHiTQbYwjXqWQlzqjmoFjHEQ76f
	 VDj/gcamK1BCEXTRMJO76Sy7HgjYHhgvFwaKOv+N2dD3d4ulcK7rvDxtTt2CrWRdFDtdE
	 mNnmdw0GziW2TPlk7jOB3MBIQc9IoUZrw3F4iK1We360STqMqA5g/yk/b7jWaIo1giT0N
	 US9TR8DzuaU7aqykuExSkrMrY+tTzhHA0vbc3nqsrCKjnWg3E/imMXKyBswV8RwNeug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304761;
	bh=7coOgQvJaTvIQaVKcv+9s1FecU2Tziurp5fdy2N6kXs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYxmZ06s11ipNYauGptbEG0or7OWG9kWXi+jyUWCNCQtS7Te6nQQF4rZs1u6nRRVX
	 f0srZdS7LcspPLkegV+JmrqIexpLFK2eW6e1c9ASB69x3rKFoJxYiu6aZSWAfL+OHh
	 TJ7Ee57eWIEiMKF+mhES0KuUI5z2v4bJXa3HThzq/5dRHYU+skK9ep52F8w9Tvn2uX
	 PwsyT0JyCWHn76XzTlJFr0YnCLKAKJtXQIrb3ch1HWss+Y19kC1WFhJWtsojvij/ja
	 Ewnq2IVlhXefrmaczBGfDhQ0YgCl9ota3TVo7LX6+vG6GkPy1dmawPgTEdSARUynKo
	 9SPXUYJfkfcww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5A324073F;
	Tue,  6 Oct 2026 16:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E492317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FFA560809
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofkLdTG70s19 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:35:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AD5BA608A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304503;
 b=gmNS06UosifDz8rTEPP7rXAPiukNa1giVD9yVVk04rX7r9LFEXi7nuXUBJvueSXs+fw6
 zr0IcY3BwKzwwe3qYCJZs+ipVA/hPMlkB9+Zgq8EHbGnGwo6eT5p2P/U7rB0XfomwUn6d
 My3q8vqvCEToCBK78oK1BGqbiqmYbzwuQLOcB5mk5w/IuK5qN59d9O+9IdO7newNlrfaX
 ld1vsiTNl8muMJEMZynsTLAGeY+I+O/UcDcOM9d0E4Eyf6W9zZ5tDEP+iHvzHwxzxLfg0
 687KLpa3Nk3QwlMUGtAqp5cN/5oCILVb+NfRlBfiDRYHjinQ1/+25ER3O6SjAQMlDng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304503;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xrVfEvroJBMVV4A4040yMXHYaLaTbW5a2iXuh7bvPgs=;
 b=dC730diAGv90om2QUXri7vvf3zVm+dl5pKRvyxvwYyd565wh5ZajreYtoQiG8+PnFA2f
 HgANMa1Hh8L5mYe78yG0tgw8+UNC0Ry+JFTusYZHL6njEu6AUyqSBFCEudStxCeKoVX+L
 cPgpMYhcROSAuDD29CT7eqRKymam+b+4hEBbX7VSZ/1TYdD13FAw2zKYGPPUJxAY7gdYX
 C/whUfRzqg/POYyhG7VOTu2YUZCij8pkES3kQz02tTfUtFA+xLeL48yfQMIft4jRlYsKY
 EgrJCEErb4hWCMjfGOPx0UtbFrmEKqOV63Wx12kwj6O7K1dCnh64XCSPM4GSzYHkD0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ROrWuJgk; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ROrWuJgk
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD5BA608A3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303711;
 bh=xrVfEvroJBMVV4A4040yMXHYaLaTbW5a2iXuh7bvPgs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ROrWuJgkC+xXCwArGaKPFeh7whXQpcH2KO4bvI/Ubyxc0Z3eBHRyfatxQe0VgRu4J
 XX9wukvy8FLV1+3Tw61AT7N/A0op62cyT/FxoL65VJrUb5RMm3q7SPqi+J6WGV13+D
 rLz4NxCXa9yRxOf5PYIurU02zF5UHUU7aKcU50Mn559afvS83+HuT9h2vBYcTdpK7I
 rSVkzCHe6VJFOz+e0Iqm5TD6FOJxIxv067OyxZ88qNysVOsUSdT54Q2HrtErlk4Xfw
 uApoS+monvW+7H/IW0028hV2J+xYSZWb9Cij0dFTd98cHokJJTggemOD1MPKVDc7Yg
 kJdpG3DxvLRxA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 fe05z4U3SQnu1C1tvstD0JERtTYmazj7wdNppwzcPuutEamFVp8g076+zn5sDif/ahYBe5KF2A5
 zhjdkOFZ1x6i6Pdspb0Bkgm4ILLnF7A5w7jihq03CIDdGS3OgnoTbjv6kACsQ42jVP3baD3Nw/Q
 sJzIpWxfhsMsJumNnxYl7tGZvF58EfqN1Fk/UkckGp7fezRL02eEIA4AtLLW8+vd2DQqZTxwIbU
 WO69w7f9nJ03vOAVU37VVCRr2AOrMGEOgdP8lxMZwNEolRY8yy4T2dXr57NhBRJrIAOg1ydH/Tp
 YJ9Tz1upfnVWcckY06aofhXVJSG//3ZBMqehoRJ9zKgVZvMXI+RO0VHwWZ1xb4Aw2RnLDlzbLKL
 pvcq2kGBy2TFhzS5FsBMJtQGb7XSEReecasqLdVeOB+ItAscv5uUtidAPiY6E0h4isx7593qMCx
 6rtcjGpiMFukw/pr5Xx6v3/hG1tlyqR2vD3blOx3h1mrNsGkq2Pxrp7e6OTP8Q7XN8ycpS2O1JK
 2/f4LvGz1NDVP3mR2QlX6uXMJHvQQazni6ZZ4gb5MRqMhXHsvyN4e98ULY60dvCGI3FYejdnYBE
 tAC2FJ9kc1xo0XoGBi+ikzoq5ctBRMVOU85i8ZC9cl/a9kRB
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A14CAA4C5543;
 Tue,  6 Oct 2026 18:21:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7um-000000000ir-145Z;
 Tue, 06 Oct 2026 16:21:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  6 Oct 2026 18:20:24 +0200
Message-ID: <20261006162106.3439373-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 43/84] package/qt5/qt5base: Add support for
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

Support for OpenSSL 4 was added to the Qt 6.x OpenSSL plugin by commit
https://invent.kde.org/qt/qt/qtbase/-/commit/e806630e694d89f567cffa9c982d1f471089ecd8
contained in the 6.12 branch.

OpenSSL support in Qt 5.x is not plugin-based, the move occured in
version 6.2.0:
https://invent.kde.org/qt/qt/qtbase/-/commit/d385158d5213ef568b7629e2aa4a818016bbffac

The upstream repo is not updated anymore:
https://community.kde.org/Qt5PatchCollection
https://mail.kde.org/pipermail/distributions/2026-May/001690.html

To enable support for OpenSSL 4 in qt5base we add a patch set mentioned
in the OpenSSL issue https://github.com/openssl/openssl/issues/29117

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/qt5/qt5base/0009-openssl4.patch |  52 +++++++++
 package/qt5/qt5base/0010-openssl4.patch | 139 ++++++++++++++++++++++++
 package/qt5/qt5base/0011-openssl4.patch |  89 +++++++++++++++
 3 files changed, 280 insertions(+)
 create mode 100644 package/qt5/qt5base/0009-openssl4.patch
 create mode 100644 package/qt5/qt5base/0010-openssl4.patch
 create mode 100644 package/qt5/qt5base/0011-openssl4.patch

diff --git a/package/qt5/qt5base/0009-openssl4.patch b/package/qt5/qt5base/0009-openssl4.patch
new file mode 100644
index 0000000000..19e70e876b
--- /dev/null
+++ b/package/qt5/qt5base/0009-openssl4.patch
@@ -0,0 +1,52 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: src/network/ssl/qsslcertificate_openssl.cpp
+--- a/src/network/ssl/qsslcertificate_openssl.cpp.orig
++++ b/src/network/ssl/qsslcertificate_openssl.cpp
+@@ -123,11 +123,11 @@ QByteArray QSslCertificate::serialNumber() const
+     QMutexLocker lock(QMutexPool::globalInstanceGet(d.data()));
+ #endif
+     if (d->serialNumberString.isEmpty() && d->x509) {
+-        ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
++        const ASN1_INTEGER *serialNumber = q_X509_get_serialNumber(d->x509);
+         QByteArray hexString;
+-        hexString.reserve(serialNumber->length * 3);
+-        for (int a = 0; a < serialNumber->length; ++a) {
+-            hexString += QByteArray::number(serialNumber->data[a], 16).rightJustified(2, '0');
++        hexString.reserve(q_ASN1_STRING_length(serialNumber) * 3);
++        for (int a = 0; a < q_ASN1_STRING_length(serialNumber); ++a) {
++            hexString += QByteArray::number(q_ASN1_STRING_get0_data(serialNumber)[a], 16).rightJustified(2, '0');
+             hexString += ':';
+         }
+         hexString.chop(1);
+@@ -251,10 +251,10 @@ QMultiMap<QSsl::AlternativeNameEntryType, QString> QSs
+                 QHostAddress ipAddress;
+                 switch (len) {
+                 case 4: // IPv4
+-                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<quint32 *>(genName->d.iPAddress->data)));
++                    ipAddress = QHostAddress(qFromBigEndian(*reinterpret_cast<const quint32 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress))));
+                     break;
+                 case 16: // IPv6
+-                    ipAddress = QHostAddress(reinterpret_cast<quint8 *>(genName->d.iPAddress->data));
++                    ipAddress = QHostAddress(reinterpret_cast<const quint8 *>(q_ASN1_STRING_get0_data(genName->d.iPAddress)));
+                     break;
+                 default: // Unknown IP address format
+                     break;
+@@ -511,8 +511,8 @@ static QVariant x509ExtensionToValue(X509_EXTENSION *e
+ 
+             // keyid
+             if (auth_key->keyid) {
+-                QByteArray keyid(reinterpret_cast<const char *>(auth_key->keyid->data),
+-                                 auth_key->keyid->length);
++                QByteArray keyid(reinterpret_cast<const char *>(q_ASN1_STRING_get0_data(auth_key->keyid)),
++                                 q_ASN1_STRING_length(auth_key->keyid));
+                 result[QLatin1String("keyid")] = keyid.toHex();
+             }
+ 
diff --git a/package/qt5/qt5base/0010-openssl4.patch b/package/qt5/qt5base/0010-openssl4.patch
new file mode 100644
index 0000000000..8bcd5b1664
--- /dev/null
+++ b/package/qt5/qt5base/0010-openssl4.patch
@@ -0,0 +1,139 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+disable EVP_PKEY_param_check(),
+use the old versions of sk_new(), ..., sk_value()
+disable SSL_CONF_CTX
+
+Index: src/network/ssl/qsslsocket_openssl_symbols.cpp
+--- a/src/network/ssl/qsslsocket_openssl_symbols.cpp.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols.cpp
+@@ -146,16 +146,27 @@ DEFINEFUNC2(int, BN_is_word, BIGNUM *a, a, BN_ULONG w,
+ DEFINEFUNC(int, EVP_CIPHER_CTX_reset, EVP_CIPHER_CTX *c, c, return 0, return)
+ DEFINEFUNC(int, EVP_PKEY_up_ref, EVP_PKEY *a, a, return 0, return)
+ DEFINEFUNC2(EVP_PKEY_CTX *, EVP_PKEY_CTX_new, EVP_PKEY *pkey, pkey, ENGINE *e, e, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, EVP_PKEY_param_check, EVP_PKEY_CTX *ctx, ctx, return 0, return)
++#endif
+ DEFINEFUNC(void, EVP_PKEY_CTX_free, EVP_PKEY_CTX *ctx, ctx, return, return)
+ DEFINEFUNC(int, RSA_bits, RSA *a, a, return 0, return)
+ DEFINEFUNC(int, DSA_bits, DSA *a, a, return 0, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, OPENSSL_sk_num, OPENSSL_STACK *a, a, return -1, return)
+ DEFINEFUNC2(void, OPENSSL_sk_pop_free, OPENSSL_STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
+ DEFINEFUNC(OPENSSL_STACK *, OPENSSL_sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
+ DEFINEFUNC2(void, OPENSSL_sk_push, OPENSSL_STACK *a, a, void *b, b, return, DUMMYARG)
+ DEFINEFUNC(void, OPENSSL_sk_free, OPENSSL_STACK *a, a, return, DUMMYARG)
+ DEFINEFUNC2(void *, OPENSSL_sk_value, OPENSSL_STACK *a, a, int b, b, return nullptr, return)
++#else
++DEFINEFUNC(int, sk_num, STACK *a, a, return -1, return)
++DEFINEFUNC2(void, sk_pop_free, STACK *a, a, void (*b)(void*), b, return, DUMMYARG)
++DEFINEFUNC(_STACK *, sk_new_null, DUMMYARG, DUMMYARG, return nullptr, return)
++DEFINEFUNC2(void, sk_push, _STACK *a, a, void *b, b, return, DUMMYARG)
++DEFINEFUNC(void, sk_free, _STACK *a, a, return, DUMMYARG)
++DEFINEFUNC2(void *, sk_value, STACK *a, a, int b, b, return nullptr, return)
++#endif // LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(int, SSL_session_reused, SSL *a, a, return 0, return)
+ DEFINEFUNC2(qssloptions, SSL_CTX_set_options, SSL_CTX *ctx, ctx, qssloptions op, op, return 0, return)
+ DEFINEFUNC(int, SSL_CTX_get_security_level, const SSL_CTX *ctx, ctx, return -1, return)
+@@ -244,7 +255,8 @@ DEFINEFUNC2(void, BIO_set_shutdown, BIO *a, a, int shu
+ 
+ DEFINEFUNC(long, ASN1_INTEGER_get, ASN1_INTEGER *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_INTEGER_cmp, const ASN1_INTEGER *a, a, const ASN1_INTEGER *b, b, return 1, return)
+-DEFINEFUNC(int, ASN1_STRING_length, ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_length, const ASN1_STRING *a, a, return 0, return)
++DEFINEFUNC(int, ASN1_STRING_type, const ASN1_STRING *a, a, return 0, return)
+ DEFINEFUNC2(int, ASN1_STRING_to_UTF8, unsigned char **a, a, ASN1_STRING *b, b, return 0, return)
+ DEFINEFUNC4(long, BIO_ctrl, BIO *a, a, int b, b, long c, c, void *d, d, return -1, return)
+ DEFINEFUNC(int, BIO_free, BIO *a, a, return 0, return)
+@@ -358,12 +370,14 @@ DEFINEFUNC2(int, SSL_CTX_use_PrivateKey, SSL_CTX *a, a
+ DEFINEFUNC2(int, SSL_CTX_use_RSAPrivateKey, SSL_CTX *a, a, RSA *b, b, return -1, return)
+ DEFINEFUNC3(int, SSL_CTX_use_PrivateKey_file, SSL_CTX *a, a, const char *b, b, int c, c, return -1, return)
+ DEFINEFUNC(X509_STORE *, SSL_CTX_get_cert_store, const SSL_CTX *a, a, return nullptr, return)
++#ifndef LIBRESSL_VERSION_NUMBER
+ DEFINEFUNC(SSL_CONF_CTX *, SSL_CONF_CTX_new, DUMMYARG, DUMMYARG, return nullptr, return);
+ DEFINEFUNC(void, SSL_CONF_CTX_free, SSL_CONF_CTX *a, a, return ,return);
+ DEFINEFUNC2(void, SSL_CONF_CTX_set_ssl_ctx, SSL_CONF_CTX *a, a, SSL_CTX *b, b, return, return);
+ DEFINEFUNC2(unsigned int, SSL_CONF_CTX_set_flags, SSL_CONF_CTX *a, a, unsigned int b, b, return 0, return);
+ DEFINEFUNC(int, SSL_CONF_CTX_finish, SSL_CONF_CTX *a, a, return 0, return);
+ DEFINEFUNC3(int, SSL_CONF_cmd, SSL_CONF_CTX *a, a, const char *b, b, const char *c, c, return 0, return);
++#endif
+ DEFINEFUNC(void, SSL_free, SSL *a, a, return, DUMMYARG)
+ DEFINEFUNC(STACK_OF(SSL_CIPHER) *, SSL_get_ciphers, const SSL *a, a, return nullptr, return)
+ DEFINEFUNC(const SSL_CIPHER *, SSL_get_current_cipher, SSL *a, a, return nullptr, return)
+@@ -871,15 +885,20 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(AUTHORITY_INFO_ACCESS_free)
+     RESOLVEFUNC(EVP_PKEY_up_ref)
+     RESOLVEFUNC(EVP_PKEY_CTX_new)
++#ifdef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(EVP_PKEY_param_check)
++#endif
+     RESOLVEFUNC(EVP_PKEY_CTX_free)
+     RESOLVEFUNC(RSA_bits)
++
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(OPENSSL_sk_new_null)
+     RESOLVEFUNC(OPENSSL_sk_push)
+     RESOLVEFUNC(OPENSSL_sk_free)
+     RESOLVEFUNC(OPENSSL_sk_num)
+     RESOLVEFUNC(OPENSSL_sk_pop_free)
+     RESOLVEFUNC(OPENSSL_sk_value)
++#endif
+     RESOLVEFUNC(DH_get0_pqg)
+     RESOLVEFUNC(SSL_CTX_set_options)
+     RESOLVEFUNC(SSL_CTX_get_security_level)
+@@ -985,6 +1004,7 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(ASN1_INTEGER_get)
+     RESOLVEFUNC(ASN1_INTEGER_cmp)
+     RESOLVEFUNC(ASN1_STRING_length)
++    RESOLVEFUNC(ASN1_STRING_type)
+     RESOLVEFUNC(ASN1_STRING_to_UTF8)
+     RESOLVEFUNC(BIO_ctrl)
+     RESOLVEFUNC(BIO_free)
+@@ -1096,12 +1116,14 @@ bool q_resolveOpenSslSymbols()
+     RESOLVEFUNC(SSL_CTX_use_RSAPrivateKey)
+     RESOLVEFUNC(SSL_CTX_use_PrivateKey_file)
+     RESOLVEFUNC(SSL_CTX_get_cert_store);
++#ifndef LIBRESSL_VERSION_NUMBER
+     RESOLVEFUNC(SSL_CONF_CTX_new);
+     RESOLVEFUNC(SSL_CONF_CTX_free);
+     RESOLVEFUNC(SSL_CONF_CTX_set_ssl_ctx);
+     RESOLVEFUNC(SSL_CONF_CTX_set_flags);
+     RESOLVEFUNC(SSL_CONF_CTX_finish);
+     RESOLVEFUNC(SSL_CONF_cmd);
++#endif
+     RESOLVEFUNC(SSL_accept)
+     RESOLVEFUNC(SSL_clear)
+     RESOLVEFUNC(SSL_connect)
+@@ -1254,13 +1276,13 @@ bool q_resolveOpenSslSymbols()
+ //==============================================================================
+ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+ {
+-    size_t lTimeLength = aTime->length;
+-    char *pString = (char *) aTime->data;
++    size_t lTimeLength = q_ASN1_STRING_length(aTime);
++    const char *pString = (const char *) q_ASN1_STRING_get0_data(aTime);
+     auto isValidPointer = [pString, lTimeLength](const char *const probe){
+         return size_t(probe - pString) < lTimeLength;
+     };
+ 
+-    if (aTime->type == V_ASN1_UTCTIME) {
++    if (q_ASN1_STRING_type(aTime) == V_ASN1_UTCTIME) {
+ 
+         char lBuffer[24];
+         char *pBuffer = lBuffer;
+@@ -1333,7 +1355,7 @@ QDateTime q_getTimeFromASN1(const ASN1_TIME *aTime)
+         result = result.addSecs(lSecondsFromUCT);
+         return result;
+ 
+-    } else if (aTime->type == V_ASN1_GENERALIZEDTIME) {
++    } else if (q_ASN1_STRING_type(aTime) == V_ASN1_GENERALIZEDTIME) {
+ 
+         if (lTimeLength < 15)
+             return QDateTime(); // hopefully never triggered
diff --git a/package/qt5/qt5base/0011-openssl4.patch b/package/qt5/qt5base/0011-openssl4.patch
new file mode 100644
index 0000000000..23451b2912
--- /dev/null
+++ b/package/qt5/qt5base/0011-openssl4.patch
@@ -0,0 +1,89 @@
+Fix build with OpenSSL 4.x
+
+Downloaded from
+https://github.com/botovq/ports/commit/bb50119f0a15fdda547ffbf1e8d947d92470ed4e
+
+Upstream: n/a (QT 5.x is not updated anymore)
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+use compat defines for STACK and INIT_SETTINGS
+disable EVP_PKEY_param_check
+map q_OPENSSL_sk_*() to q_sk_*()
+disable SSL_CONF_CTX
+use old signature of CRYPTO_free()
+
+Index: src/network/ssl/qsslsocket_openssl_symbols_p.h
+--- a/src/network/ssl/qsslsocket_openssl_symbols_p.h.orig
++++ b/src/network/ssl/qsslsocket_openssl_symbols_p.h
+@@ -80,6 +80,13 @@ QT_BEGIN_NAMESPACE
+ 
+ #define DUMMYARG
+ 
++#ifdef LIBRESSL_VERSION_NUMBER
++typedef _STACK STACK;
++typedef STACK OPENSSL_STACK;
++typedef void OPENSSL_INIT_SETTINGS; 
++#endif
++
++
+ #if !defined QT_LINKED_OPENSSL
+ // **************** Shared declarations ******************
+ // ret func(arg)
+@@ -236,14 +243,31 @@ int q_EVP_CIPHER_CTX_reset(EVP_CIPHER_CTX *c);
+ Q_AUTOTEST_EXPORT int q_EVP_PKEY_up_ref(EVP_PKEY *a);
+ EVP_PKEY_CTX *q_EVP_PKEY_CTX_new(EVP_PKEY *pkey, ENGINE *e);
+ void q_EVP_PKEY_CTX_free(EVP_PKEY_CTX *ctx);
++#ifndef LIBRESSL_VERSION_NUMBER
+ int q_EVP_PKEY_param_check(EVP_PKEY_CTX *ctx);
++#endif
+ int q_RSA_bits(RSA *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ Q_AUTOTEST_EXPORT int q_OPENSSL_sk_num(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
+ Q_AUTOTEST_EXPORT OPENSSL_STACK *q_OPENSSL_sk_new_null();
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
+ Q_AUTOTEST_EXPORT void q_OPENSSL_sk_free(OPENSSL_STACK *a);
+ Q_AUTOTEST_EXPORT void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
++#else // LIBRESSL_VERSION_NUMBER
++int q_sk_num(STACK *a);
++#define q_OPENSSL_sk_num(a) q_sk_num(a)
++void q_sk_pop_free(STACK *a, void (*b)(void *));
++#define q_OPENSSL_sk_pop_free(a, b) q_sk_pop_free(a, b)
++STACK *q_sk_new_null();
++#define q_OPENSSL_sk_new_null() q_sk_new_null()
++void q_sk_push(STACK *st, void *data);
++#define q_OPENSSL_sk_push(st, data) q_sk_push(st, data)
++void q_sk_free(STACK *a);
++#define q_OPENSSL_sk_free q_sk_free
++void *q_sk_value(STACK *a, int b);
++#define q_OPENSSL_sk_value(a, b) q_sk_value(a, b)
++#endif // LIBRESSL_VERSION_NUMBER
+ int q_SSL_session_reused(SSL *a);
+ 
+ #if OPENSSL_VERSION_MAJOR < 3
+@@ -373,7 +397,8 @@ void q_SSL_set_psk_use_session_callback(SSL *s, q_SSL_
+ bool q_resolveOpenSslSymbols();
+ long q_ASN1_INTEGER_get(ASN1_INTEGER *a);
+ int q_ASN1_INTEGER_cmp(const ASN1_INTEGER *x, const ASN1_INTEGER *y);
+-int q_ASN1_STRING_length(ASN1_STRING *a);
++int q_ASN1_STRING_length(const ASN1_STRING *a);
++int q_ASN1_STRING_type(const ASN1_STRING *a);
+ int q_ASN1_STRING_to_UTF8(unsigned char **a, ASN1_STRING *b);
+ long q_BIO_ctrl(BIO *a, int b, long c, void *d);
+ Q_AUTOTEST_EXPORT int q_BIO_free(BIO *a);
+@@ -515,12 +540,14 @@ int q_SSL_CTX_use_PrivateKey(SSL_CTX *a, EVP_PKEY *b);
+ int q_SSL_CTX_use_RSAPrivateKey(SSL_CTX *a, RSA *b);
+ int q_SSL_CTX_use_PrivateKey_file(SSL_CTX *a, const char *b, int c);
+ X509_STORE *q_SSL_CTX_get_cert_store(const SSL_CTX *a);
++#ifndef LIBRESSL_VERSION_NUMBER
+ SSL_CONF_CTX *q_SSL_CONF_CTX_new();
+ void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
+ void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
+ unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
+ int q_SSL_CONF_CTX_finish(SSL_CONF_CTX *a);
+ int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
++#endif
+ void q_SSL_free(SSL *a);
+ STACK_OF(SSL_CIPHER) *q_SSL_get_ciphers(const SSL *a);
+ const SSL_CIPHER *q_SSL_get_current_cipher(SSL *a);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
