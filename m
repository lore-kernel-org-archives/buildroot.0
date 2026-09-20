Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74273C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F16C40D90;
	Sun, 20 Sep 2026 17:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 883X0Mj8ELFx; Sun, 20 Sep 2026 17:21:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 47CDF41001
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924862;
	b=XeZ7p5vgYCE8iPsx1sXR0fULKFMWt2z6cbueLO1fMRrTXXJCrmNvwmcL1aX/oLVpkBO5
	 rQnJjbGthrpKGoo0m1GHNitn5dX22VG6B/QknZmJYVvnsQtLDKUaASRo0ejwtLwJ665xV
	 UgBJ74S6WpIeteVH+kMsUIkKLe1wMeCf4EjsMjLQduiIa68oug2eKYxmLzT4UqOub5GYp
	 6Gcse3vRF31xccIXXVry0ztpbPasRrjqqdDYyupA6DwfIde3j9YY8zBAN4MDb1pDevrVr
	 8Pe4uzAg+cYIkHkwaADoM3QdbDU+WcBjxze7lt+3Mk3v8zX7KkXxx6KzNXw8zSHTyNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924862;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	b=W0U5FFayMmiMAN1gIy3o47SfgvaDTBwToGmeIb+J6HRujgAY6tKIDZZ0vxIAzF6EKO0r
	 b84brWWNn1eB5VsYp2IfEWgeGXmZGmxtwYm+9bchUda+kwF5bcIHNXBalOy2EGC9/aSqX
	 2L7wS8ExLsOxTgmfUjhaYaTx7E6n4uP7J7kEPDKkWDLBn5LIgUPofRm341fUXI+dkupm4
	 UYmhT9RjX6nHOCzri9x8y6RTckA5ywX9AUxpYMct1E19u//E7/U1nCWr7vICX8ud/FiEh
	 EkTAgmXWxHyNFMJhah0YFHe1bMnIXjaynG3zKWdlX9CeZ/73man8wUI6n1mxiqSFjew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924862;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iMzR9ddkOMStXBCOTOlJ8ZLArRGxtjwzrO0JSFnwu1jprEZ/03Fq5aZRz23fnulFV
	 pw0koSC8wp2LP1VztxflyZ8pSAJtahgwrIvUgEZMaLq6vN7UMs6ujc2TALqXjWLE8n
	 Ngp/K343N962wBRVlYqd8ZqsEdFYD9utZY4QGa9oz+A6D5B/zMAlh1a5pbTVMprtQS
	 finXxtN84fou80hMySeWEPf7pWONa8Fc46ldjbNVfRn8gIfuk/jdtrVSfbw8N7u8So
	 o1QVaAK/e9ToHET6zC9xg+MGALwNhsLjcLSGY6kppVGy9xf3W0wOg/SHTdCPzSYgX2
	 KcC4ObNy8VvUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47CDF41001;
	Sun, 20 Sep 2026 17:21:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E5DA225B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D742C80DC5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acWlD29ACE0F for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:21:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DDF2780DC2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924860;
 b=kEgW1k5tHb/tkrLgyl4LbSk3eE5xyHEGrOaApwT5S0Gin1s+vsmgkNj+f28P7mW5KiXP
 uy+i0Y8DM4RZWJNm+t5qK9a9KhzLxe5+rsC2Rnj8X1WSa4MsLiDXOFufdYULk3IZdmASl
 ODsOapZ4J9X8V+wvEhlqiMowoZzM12hMNzrODCewTRl3HH+x/DjOuiLIrr5jjaEFrYwG7
 eOAEQfOweAWg62KmVZTR1olFp+3cLYjNEsHXxL2/nHHqaXnKWqLL1/fmmn9JWYXPrZF82
 9stjeBLOC/N4MPCCDcS2Od7GiS4BVRCgrJVeSPQ3dGeVN/+zjxi9mXVlmfBkpevrvmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924860;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 b=j4tVQf4cLXNI4WVwGNPOwMdoqIJQOZ2MO+57KlTyj3yASi0LXqq0OsJRlXdnRTQBw8Nw
 yjMZ4LoUVrLUHp/ALzpjLfPgjW02RXzMbLjHM2PmAVgiyLVitCiDHkKXVBPcnGFlJzs2a
 MJfcc6n27e7n5ylGaNlB48KrseWmVSOLXIN+h+NphjBQODVe6rSsUspj71Yy2hvHt0KYX
 vOPBSpwhWat3I4o2eSh2VSiygw0VetiraUe3dgYdWMeSC+sH60acv/k4nPGEgACKNrtXS
 U8VqLNPE01WQYvYAw+v8ljZHLGzSve4n0EU/iRXja+V3zIXVmPggyKzOmpFuTQ7PVVQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Vc2wMA2r; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Vc2wMA2r
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDF2780DC2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924166;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Vc2wMA2rGEVoRwBLE4pYGLtiIRvXCuL2jmYeLsGbUyx0ct8c1mFrHwAikzpo5dCV6
 UKX01+mmg6fSHD4++5IXgUa49cuAprwVhU/BYwcmWAQo6MRba+SUxqIDADPfIA1p3z
 TvKY2p+cwMSDV7Ivv72INKGlmV8OqSEI5M7E2NnqKkfw0lXWOkK/E5LVtw3Hm/CJoE
 tgQ7Cs0IRF4yVeLArwcSsm90Chbj9GDqpJQCS4l1Rcy3XUjUiouf783ZA+vc8VtMl+
 oY8+io4HLd7CaDMI2Qf/sMnOwCq9+mAVbjLarTGZKVXbfDjNnVbXhnNqXZsOriYiob
 mcsjj+fvDI4Jg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:WeGS4wBc3WIhS0ENY8MMqATwNaiBV1oIW5VuzltExvkogC47WYcBPgpwrC6G7/4CWLIl2Kyunu5WxPKlEN01oNKQrXzuCON4aEAXeVAGBs4ZurZlKio/qzXoolblH3GfpaxY8Xd2bSXTMpgNtccIGDOGvi98PCcy/xj9Hg3J3oBKudyLRoGhjuOjN3Izy/mXtr4tsAHhymh06osOD0eonjQldPJNesBd8EhTfsaeRQldaqGusIZWbkSn/YVVm4Mohc+nVreHdM1ttcQP7Zk406MpxQCiB5FpBr0yxMTSJKZk1lnqLgeu2hab54bmw9Ry6M3wMARN/wg5K3Wtd0q98kygw4vnlR4TtbQ5P9hd20pJbxxpdpUzxdUhBlOvQC7gwc8ZNNQN6y9M5OYs7zlLpApsYqr8rMfrJG0gUkcQsZAVQgxznVlzamzaVfD90/w02tH2PYGbryh88bblNl76/jg/2NfkHGJ5oScSbecytzs0W6RLv63xpXHtidP4DpmWVP4AlVmMI4ldtfE5eqlHx+dc2tS9jBSX8V+EN9WQH1/8D9low9ccdgayJvfL8rbXoEwFjvrm1MDfU9edemkkCj0AlrYjFpAvazH4vkYbXjic9m
 cmY83Jg0TyBVvJkhZxhIV+Sk0ODQ+CUEKVz+1dThgAgf2xMc/yYDYTIud57nde9CuxOh0yz5SZBeMyPKy4sVPtvULGy3YKiohJn3DyZ0v3ZypCUk1Y
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E35FA4C48A4;
 Sun, 20 Sep 2026 19:09:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1e-000000000o7-3Rzz;
 Sun, 20 Sep 2026 17:08:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:57 +0200
Message-ID: <20260920170815.240247-51-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 50/67] package/qpid-proton: Fix build with
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
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
