Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EE8C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8926065F;
	Sat, 19 Sep 2026 16:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uywukJw5O_Cy; Sat, 19 Sep 2026 16:11:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 09A38606CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834299;
	b=dROkHs4G47E3wG18isy+4BM9PowgSg2SPQUNzYOSIle+TfKrjJ9kRP2XH6DRZyIax59L
	 GoElwodKxT/GDLH6aw8lWrZuNT/rPbNXA+2prBMdOON0AQBzSeNc/ALaAxLaMU/4sgajo
	 x7NL7/3hjno6ktoKrIxgpyEH9iQ8fl57KMroSWPQxaINF7ibIzOmeL8Ph+vumhPn09msC
	 YXk09SGO3UwfJnrjry1/syOSDdrV3TWKrnb5J1x7CQzYXkbpIhoQyYd3FVBCDNjbh/V3w
	 IVGXiIcp59baO0QydagHIkMU792H/TyA/OYmNG2EPyDiBaSrleCdlFVtj04xQJ58jDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	b=rvkBHggfwJ8jtFdnOkYLxqG8ST3/xboRBOmiErcNIgy0s2ZClSc8XWcKFL89S8BYhytd
	 0OA0dtK+2WukHEH38OStrPEQG08o9jugvl8RZL4UQvcI+0ZxCZ3shSS25y2KjaefjQlpD
	 gaDGyKBMTNEXSNwAWoj7gGbmUlYKqyl1FP5Ds/P7/uBveb8MJQZXkSBCBUsW6jScR9OwO
	 AXstwtB6yHD1b0087KgRuwUpF9/Hsz+cWxbTFAWslLHiTmMC5YQyPVtZQVP5dulk3cqqU
	 HA3RHEo+4/DIj7hxy8waqrp2RB9zlk8OCsL8zcozsCQ8/ITg1dOivpVSBXFWJJG+Yqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834299;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NUQU3t5ByrnmAsB3FffbxusFeEA2CvSofF5VX3XqIGvrVrTftVSbRmhux3O60/gti
	 6tyv3P157PjFYjU+fkr+fJfZ/U75hrvh2fXxTn2AaRKnDamU6jUH9xLVj/WxOXLYEF
	 WFudM2iXDSj7pZJYl9daRSIoZqxyfr8VqS9Jgd4rGns463pyOC5zO2noq5XNJ8UfLo
	 TQVd0hFyRZ1mKTfwYH1WT3AUrUnc7U+M66gHBsVBx2B1g/u3TCXrCeoRrvmndtP8+l
	 ZOSi7DWRo2j8VhbIMEnVlwskRhlLgICbkX82w0oYwig9pB5ZjD0Xt1hdtNTAl40ZiW
	 A1YdFQLIF+Hsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09A38606CC;
	Sat, 19 Sep 2026 16:11:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8883333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F0CD400A2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ut92-LaDCBg for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:11:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 59B0C40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834296;
 b=VRawABfploH1C5R2mVIuMFS5RO9AXrmp6gBWJASKGYS3fIcUZRnrNK8Laeiy9P/HRji1
 /aQ+bwT7MCB0ORsqmLEOHmB2lVT8Tz4y4+6NJJpyp1hIngPD5dl0HCvgKXm3+C1cDT5A8
 tDPDf2tw37UCn4AekBNpvZumhSkShU5YRU4IzfOB32J0FKoRb4jM+Fz36urPFtftNhTUx
 d5t1xGHm2ZE/ulFWs0ykK3oC6CjGfP+G+t51Z27y0Kiouh7yB3qVdUUJr8YehTLmbiy4c
 7m1Id8oOJKOIvWYMDioyYEXOkiTaaJrN6+Tpw4WSXFjq1HfzmwFUAlOIJjzV76Y9ciA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834296;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 b=DMZfchptVCJ0JW89arBDJ7VFLlVQ1SIa4fa9OyyG6C0erJQEbs37UC4PAXJ+1D7C3awM
 z4AqDHkETVDpri3ltWlcjPFkBEdFAMD9lEWMjx5XR4BvqD3m5UPty6ofwFr6l9zMRJ5Z/
 J9Y/ZQsVIyKDig/dHEO3pqvoi2TW8kkGcbNcKZUD9EPnhmkGuhJPc22C8pBHm0OEftyp9
 M8LyCOtM9o5mPuF+CGi6ZdJWT2Mj3kPXBhg0tm5TaOW4eSRQKl340O0jrGov8EAXoTHPu
 2h8jbNKuJeF23R498aQShaVtu/o3O75ahn/UgGNXqdRwMs89SaYgCSbIDlHCClTOVaw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mYiNF4WQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mYiNF4WQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59B0C40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833555;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mYiNF4WQvtg/Q/1gCr6Wn4OnOgpgS33K7vkxjGrxePV1ECXcoZr7MGP7Zreik6TTQ
 wvma+zPavn8hbykieIP9+Bu/UatWGecBPVURdqaSDAhKXDnpH/2/A872QTZmmpiW4B
 luQ0K/+DvJezyU4e/v4CrKqzbPAW3VUmgMCVXb8HCVT1XVvS3msoHaIGBvyxJSxx1z
 b9KL4xBGkq4yHTYpDErHfz1Qb9xNpyzX0hceRe3hv2Km7P5jaVLlcYE4FYQzoBYICw
 oYTOHUHlHVJDBAcOLInvCEwlKw7teOFRB1yTZOBzxe3zPYH6BA7+Sgra5Ft0PLljCs
 p0wl551HucQeA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:UobGRUAm/CMBX02p19ZDEpLayDChkYw28qmfOpB8UyqOtS6x0AUC6bWN/OSJ/MevLR+qrtQbJ3CWWalSvV9vL6a/G7+YrRU8mqr5xoBIurSRAvRMSQpaTmScWpKw41IvFp2jNwA5w6NpVt7IJgdKhMU5MJQIGe2zJPn2KKPW9IkGazCZe/s2M2oQgzOlFLUpuy4h3FXWTWexLv6NQRUbSGqh9D4VNKkitS/dGVe1kXemKcW8n3OQ6u8owV9WjbeiJGhxZ+KllEnSKp0w6AgyX12nqQcqMKpO9UTCtp5kOPEnDBHdM3OSmxAQH+X8khNXkP9XKuVzlKaXMTiflOwuC6GAUfgvS4A3w384rKv1RCdlEOC51MO88Ow3xEzSrSPBfURIXiaIcxXw1Ptb7juOaguYTDf84wckixgYqhK4r8WQGe+UnngD2EiC2QLhiJF03L+PAjROY5MKKvrn6Wlqm6Y8lAMfj3ddVfO+Me6EwOxNSwNg2j03O1pKeJn0JxciLHNObYxiPCzmxnvNdT7OOx0eqFVeX6eZaSvUmaHdRp/Y/itJv4I7A7LOeFz1Ywx6nfB56XOsluwq7j5P192egK724z5PPammrEt5Fw9wowlTyj
 NNMeFRc7z4YRIZQPj+JUxrmBV/y3LmvzvrDVmThn+3Pf1CmjgIjAyc+g6MaKqj1/85KdmiHOwwEJYSo0AyvttYmtgG9Z7SoL7EtRMsxkZ17she9Q==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4869A4C4853;
 Sat, 19 Sep 2026 17:59:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSu-000000005Jx-3HNG;
 Sat, 19 Sep 2026 15:59:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:24 +0200
Message-ID: <20260919155845.5776-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 59/77] package/qpid-proton: Fix build with
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
