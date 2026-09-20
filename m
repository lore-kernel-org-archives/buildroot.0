Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0231FC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C210240DFC;
	Sun, 20 Sep 2026 17:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03t7i3FU71jA; Sun, 20 Sep 2026 17:18:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D2E9F40D90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924704;
	b=MLPyO6HPDPncsD5etqeJD3WEwUQVvSFcMAiXQigRs3Lw+vJFPpkPAmiumEtgczX44lz7
	 aoPT3eTUQq2Rkria25KXCwuYwjFtTFLiwUl2qGW6rS1cZjM4uV8oIJ8o09UpHJEJ6Zr6F
	 vRFjiZN1G1aP9oQUqzwI+my3+X1gbArn2UqyebeCILGICQz3V+sTksX5McRe7KEjn8wo3
	 6DmJsh+x2x2Rg+jkg1Woi2uFua8/akQaNdn7rUmJgb0dBTGtwiM+7lWlf8pjKZx/kQ4B+
	 KWoBLjoNL7kUAUMbusj5v45BoLcbbwhbeMT6KYjAas59AfOMUT/x0f4Ch6cVwgjqH1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	b=ZUACTOWlquKl/VNVS4AVVr9XE27a0H4xSsvg8e0Bwfsem3EDiUT5FrmL2r3kKwsKC6OJ
	 NiI81sNfMIA3jgmJKNOHPOIkYjXPf4BRCFkPCQCV7U330UI6uFzRe1HC9T+SQ7gR9KXAx
	 r4LyyJNr7E+RHTimwC75wUG8k52leMU89lxHY2cbwBTPWZQUPDA5Q3bv2rvVdqqkqhZHB
	 3WTJDP6ySqAnxm9ZuJ39NZiEF4DZE+JTpnSAnRYJUPpM3eVxRNF3owIYpWygivBU8JoHG
	 1Pm/DQOxVyp59M0/VBSAMMLLA96HdVokf3VnyHpRR7tv1fN0H3jFTlspejq41HZ2QSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924703;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MlDxE4F9uJauHYhhCaVLZUvjv37Lrswx1XkSX5l0mzMEEbOvBSHLIDzv0pgVYG4f4
	 /NSd7YPrSVMgCHujWOrOs7EmBGdnKCz+IuIkGBD4vTLbB5LObvhXYOkCTQ35OnY8yr
	 KfLlTFtC2+RjIPTEPVVBmZbT2uCf5y2vpE4YYA90eqTaPn5+oM3KndnZE7jc8GFxcs
	 fbghtG7lCI/CSsFLGTnsCOXs0VPr1hMabwLFwtHEPDEIY2Nd8KGKi78tJNbNa0AEu3
	 1Ak7CkiTwCm3J1CkoX33zIKyd+RaGvG/26ZLwB2F/96wpxFj9a39rRxnLJhGjYDBec
	 IC8DhU/3YxEDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2E9F40D90;
	Sun, 20 Sep 2026 17:18:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 17FD837A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F168A606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWiRcqmxc5jz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:18:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0D92F60601
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924701;
 b=LEyx6JA7Ldj/DByj9A1xxreA5VU2pqjoj1YxVIL19sJzt4ZQeNgeSAgFsKuaCUW3NuVF
 RmCxAjIxakCs5hd/qbGhLixBb6MXuIrgI/KxDGKuFoIiCAvQIG4D1N05/DIHwYI1iu33p
 HfQB621Lbh88eoFbx8iuw9tyUz3TkbTdHwKI3t8vddniBw9Bh57eEvR0rWOp1JJwKp6mf
 gh2hlH9R65r4HEh5BV5WGu+cYzoMdbuz0p38lHkc9k3xEbbot4JAV0hcWuFF47R58EVaS
 6wsXxURIILVjgVd2qx5mzJnCkJv7tfSnjodVf6IomsjVSzvDVafDtqFOxgfynVE3byA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924701;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 b=ctOICvsIMdvVq0bF3S3EIVbzQ7Aiu+avC6pv/l6ASI7iJNBAcJS2Q2nbUfK7C4Mkfju9
 k0ixagEHmjShBm6TL3CnJosARlZelZkYyW4ujvrm6WTnNHD/LPBCj1qfze7fcknrUMQGy
 YpKp79dCKJoL0g3yyJdYYKbXxdCBdKRf1dxftYGtFTHIHuNE1F6DxBZKGD9unU2U2KTNJ
 h3/v2Vmo2ApHvfbjyFqrqUWldX+NBYjcrcZAsuyxi23zAYlDk6PtsLT5yN8MNuslenUna
 Xbnl4C5fWjOpEKZ7KfqOnLScOfTNzQYazi/nvIl+cpjHDUZ0hwoDXXXN9X73RIEth+Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tVlyad7M; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tVlyad7M
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D92F60601
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924159;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tVlyad7M882PocAsQGISdm0nWm+moWMKSUxXdJsucw0g4YIjJFvGWqbAyf/NeS/Qc
 AGwO1qDR3iCO8xqtflZXkfzokt2YUdNIhHCVecFToeCq+KkmdaDI1mRgVKQx3V0/br
 Xne/5yrIRHeUZ8ClCUksENcg0AUTNoLLNNTFNvlqPe2LI4uX0T21T7/9RA3eJZMxGT
 nOV2UXhPVxAzABY5zAnm0cnAPPrWJlPZBbdiF85cUfNbws+BWC8z9ZUSpIjbQMvNas
 js2MHyiy2X7wHfCgt+Nnznok1DkD68+T6xIqv1jb0/qN7Hz6yZUR7OFVWMPDdkZOdx
 r2eGTGWpGBIUg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:eXTQ+zi1u8HLTWJRFiyBsWuNqqYjRgU6kcrKGHR1ldPdn08A//sgn+jWVVmFiBEVZ7Ma219yVTpNbpQDqA50jRbpMYOSjzWQgihSGANGCZaeiXZXKVjhKGkA3Qn5bhUt9Xg9J1vGAKtr5JExMVj4JR1G80/W14WwoFcBZjqF1ZfaA/HlD1538erej5FARld0gF94Nnv3NGTzI0cyJgZtcn4dwXBtMosF7mdagCe4j0aQflkNOcgQYcWs99uPaI4sF2lR9DJ+AGAxbPGhWoAZPQ1WXOe7c20h6y5BQUW9V99nS+82o+pvtPIY481StTKuvpENffl04pK4lCI6RaKLEVwj2Ix35Z/vT5Dgn0jGX7a8K2ghTrklSK1o0ILd0/MTvuNiU00twBDTb5nYfMgTl3KZCe/Bk9be7WvaMrOEHiuJ27BKNI5jslM+YoIM+ZegESXhzOX9zePtxaBp0CPZEAgpBFCTmGY7Q79LyglmolEMGABBxcDgKQtXu3XObP9AVAlgG8t+jK25BsAMBjsE6o9/ElT59z3ihOsDl6JEvwUkabidPX6GaoEtmB7gV3t5a8nLxMnHk0veLml9tDvawadZzp7XiwOSf/RbmqVNnsSjqF
 z11+njeEnw4BW2drdBoTHRgjxQ7CuaO76deMT8ztV+8Yspfn95hP60B2/csRNASubwP2gyBtw=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 88A67A4C4893;
 Sun, 20 Sep 2026 19:09:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1b-000000000o7-0ott;
 Sun, 20 Sep 2026 17:08:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:42 +0200
Message-ID: <20260920170815.240247-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 35/67] package/lftp: Add support for OpenSSL
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
 .../0002-allow-build-with-OpenSSL-4.x.patch   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/lftp/0002-allow-build-with-OpenSSL-4.x.patch

diff --git a/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..258d08fb2d
--- /dev/null
+++ b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,56 @@
+From e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 21 Mar 2026 03:56:46 +0000
+Subject: [PATCH] allow build with OpenSSL 4.x
+
+Upstream: https://github.com/lavv17/lftp/commit/e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lftp_ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index f53edf24..49328f74 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -1022,8 +1022,8 @@ const char *lftp_ssl_openssl::strerror()
+ int lftp_ssl_openssl::verify_crl(X509_STORE_CTX *ctx)
+ {
+     X509_OBJECT *obj=0;
+-    X509_NAME *subject=0;
+-    X509_NAME *issuer=0;
++    const X509_NAME *subject=0;
++    const X509_NAME *issuer=0;
+     X509 *xs=0;
+     X509_CRL *crl=0;
+     X509_REVOKED *revoked=0;
+@@ -1436,7 +1436,7 @@ void lftp_ssl_openssl::check_certificate()
+     unsigned char *nulstr = (unsigned char *)"";
+     unsigned char *peer_CN = nulstr;
+ 
+-    X509_NAME *name = X509_get_subject_name(server_cert) ;
++    const X509_NAME *name = X509_get_subject_name(server_cert) ;
+     if(name)
+       while((j = X509_NAME_get_index_by_NID(name, NID_commonName, i))>=0)
+         i=j;
+@@ -1446,7 +1446,7 @@ void lftp_ssl_openssl::check_certificate()
+        UTF8 etc. */
+ 
+     if(i>=0) {
+-      ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
++      const ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
+ 
+       /* In OpenSSL 0.9.7d and earlier, ASN1_STRING_to_UTF8 fails if the input
+          is already UTF-8 encoded. We check for this case and copy the raw
+@@ -1522,8 +1522,8 @@ int lftp_ssl_openssl::verify_callback(int ok,X509_STORE_CTX *ctx)
+    if(cert!=prev_cert)
+    {
+       int depth          = X509_STORE_CTX_get_error_depth(ctx);
+-      X509_NAME *subject = X509_get_subject_name(cert);
+-      X509_NAME *issuer  = X509_get_issuer_name(cert);
++      const X509_NAME *subject = X509_get_subject_name(cert);
++      const X509_NAME *issuer  = X509_get_issuer_name(cert);
+       char *subject_line = X509_NAME_oneline(subject, NULL, 0);
+       char *issuer_line  = X509_NAME_oneline(issuer, NULL, 0);
+       Log::global->Format(3,"Certificate depth: %d; subject: %s; issuer: %s\n",
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
