Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40BFC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC2B840F50;
	Sun, 20 Sep 2026 17:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsfBurOAB_sI; Sun, 20 Sep 2026 17:16:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C55E140F79
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924615;
	b=cH/F4JbN8MbFsMMm3OFVNpDepbXgTtXyCXTLf84L6bJBXQDGcksmzY0vrC+4sZvm3Ibs
	 XzzGKufsVDAhArbM8FUqW/9FgY/NRKNc+iplvHJwRr3M3vyqjnFh/1yAL2ZLxDqRW09CP
	 UaOy8Pf7vKfeprCezZPyTTWcbyVihxxE8299+3umy5Trr7I8JJ8iwe6GfGFRtKK8kMKy2
	 89lhzlWshmj+JtAJZsOVz5PiWkuYH/4/kbx14hjYwo9rzrXnPeml7L2JDG6gjcBqs4zTY
	 3JY4uxe5oWf8Bvkm4S++XZW4fHy4pbZw+fW3WdyMue5qaNOTw7UQyusOjZ6PlTsXpFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924615;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	b=Y+ujuMPoJqRWeGiq+bsUQut59YywuE7FQgRsOCi6gxwtmZ4V0UxYty/WcXDbdeg9iXIJ
	 eOFFJwqaA+GFmKY9ipTUmVm4sauJ2fA3A6pBpA/fLfLO9A0+yVBucBIhgSuPqapScL+ND
	 GepnomOj1GZPY3cNfdYHxb3hQNDmIieJzE/nir9Fl5wPJKgC9QGyWXqozJ7k4L4UzFQVh
	 Gfm8QGB40FbyfIXRvd6msYBc2GpXdL2JuhVQogMdwprVAKy0x0yT4ZC6lJs4QUVc0NpaN
	 2YRH2S1L8KKz7gaTClCBkCD62cplB2nRz5ZtizBZ8bE2iIAn/vM3BlDklJ5TWbGOnFw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924615;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cfdEwVBMJhVfztD+N27r+n9OgF99op0rtmT6GlU69CSsn4IUn1YMRdQxQH8po0nQK
	 XJi/1R2tQr4DYpznxv14jQ7Bj6RYedgt9GBxBxQMd7udKP6h1QiaXPi+ez0RkYnPQH
	 Ct48xxwhV2obWsTijfO3kcY02vsRocL2+Aaasu6k9Uf5kshfYbl/oogzEo9zcJAuAZ
	 SZAYEDvBkBwYe1oE12YOzrf23M7gP2OMiq0SKcH6hsXoeGJKhigqt6DBGkNYPtxGY+
	 vN3tVDCHqjus51YFUfExgJQI6JluYL22bPUs3YqHTOxey6IAfgcqT6+6smsX5ihTq+
	 sKTkGQnVMWO6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C55E140F79;
	Sun, 20 Sep 2026 17:16:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E873FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE1F40099
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dsxf300krtQ for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:16:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B60AE4007E
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924613;
 b=SnzdpIh50hS5CnS0NWXGDxq2Abi7C3tXN8LdiQFnem8d/byzzggOjwt1PKZnrO2U9fgH
 DXcdb4ZMSvE5JPmc92tVsqm4ppaXOgQkjx9e79LSq2igSpAqEJsIr267MPgTG4XeDmSHt
 kFsuo8UH8XUbISopPWpeZOC15IFEx0dP7fHBA27Vru58UPg/du8wEsQsHD66BbsaeD7HF
 WkgZscMQIZO9UjwvRYCDHImKGxziFt0RUf9dxPUgAx+QrdXJABupSf1haW8FS6mD3oE09
 yFFN+1ssiAON0cOlKn7ElKRNYR8mhz7c6tmeesqYwvhCcUvmG/VdUUMnj8ejE2pPcUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924613;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 b=M/hS9pfkMnVcdN3xJY0mczkjXrGdGNaD+kqC9DJ6gxbt6X4yxwwW/7nYtDr9k02iGARm
 auQ1YqS4BXkCw7aKtzDV/QUkGDAIVg2L5zB4lpB1CS9X8H5cF1ZIB+oDu6HLUcehitIQs
 U10+mQJbGVmpdB1Y3BCFyiWNmjTWkhK7zxXS5gGrOkyOhH+fQVVrLGefHVJ3aR2cKvGOE
 n6CoNTCuxuLlXYadupuakxatXWLGc1rPESV+8Flvt6EyioN7QK7MNP75BVT+U6UrYJM56
 dTGvzLeEg5ebBvpu+Z0bRJpf64yp7jiOLHVbDKSxlql/QNaW23ADpjJMBPTn74t3+gg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=iif4aA5S; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=iif4aA5S
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B60AE4007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924156;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iif4aA5S52T6C7L/noLc0LxMdFYEeWsmMYRBG8SCjR3Gpg0Bdbx5Gb/Gxn2lMK/yn
 63B784utbiRz5ou+xtht+F3hR2Np821Zjy6GzLII6F0oTmpJeUg5qoSE8x/Zz3JKxd
 UA+g4t6VyCera0UTsayULe0q9tsjfhSh0H4b33xhSk6SEvalJ0/KUGElpklNTCipOI
 faTs2XEhwYYGgTvhn4zivVrshpy90ZjgZfb0BCTkbG8EcnrBOnKChixPfLhrxzhpQR
 sBk0AuewRQtkRMIpCgTdPI4JktpwCPRG9h5oAGGAaaYHDO3UP81S+60OhIPYUcj/4a
 8cpxLtewMgcWA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:GfhvhwKWsCsPNSbrvDgoarip8imU0p/pnpD39jIjxUD9ax9pxEITDdfuZzjuMoimPc/h0OLUmwjQDoR18QHU/WvftPKtNgJWYgUdHt0uEXFPrdhRrz+o26IiPnTE59kN/iO5Z9JPxI7XgDdFvepnJRxUuNdAbDP/i76+emzwiu8A5knv6VpGYMYNSP5TpeNTe/t92gFPE1pFb/2Zg2/54+5g7R1cyP5l6Jtfq/k5RVAUW4V1ZfvFP1SAJybvwP010OuEZWy0in1xiQ4EWn5BsIwLr+c8r1Itcp5cClqTyuz3KCC+rlzNPzP7fdu0dd8t6/8o5IHoTatqisjjIpJA+BVkuyN72QF8PczIpTCDutvNHp77SJppl5Fgcvl1I1rsUohPy4S+vAxwIpSpMKiO2xEhDBUDlbpIm7xI6/gmS/Pun9yrMmLrzIZXfULuGoIyrec0f9gtB+Sbha47bNtiaVOFcnmqF+IlCyVYsRvqotg6iFFkokTNs6EiOOP1PWC+B5UOhv0syrizZ6vjzT0FIKMoSCl+229CL/fe0MqrowQMvTA642uOWDHo5oW5VjVHsUlLYNHpvFJF3QMdlqqaaPWzWMCQ8t5w+rinO68JOLfP+5
 AGO9hWKsEYAl0uup1b/LkydHr2xMh9jZWgrFqsAUhVlWwIiF5ANLadf+JpuiLb1zA5r5KQ54Q=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6BC8A4C488D;
 Sun, 20 Sep 2026 19:09:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1a-000000000o7-1lSe;
 Sun, 20 Sep 2026 17:08:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:36 +0200
Message-ID: <20260920170815.240247-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 29/67] package/freeradius-server: Add support
 for OpenSSL 4.0.0
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
 ...ING-functions-for-OpenSSL-4.0-compat.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch

diff --git a/package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch b/package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
new file mode 100644
index 0000000000..78d332ef1f
--- /dev/null
+++ b/package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
@@ -0,0 +1,80 @@
+From 6658c9e375637ce0bd14bed733270d863224431e Mon Sep 17 00:00:00 2001
+From: Antonio Torres <antorres@redhat.com>
+Date: Tue, 5 May 2026 14:42:27 +0200
+Subject: [PATCH] Use ASN1_STRING functions for OpenSSL 4.0 compat
+
+Use ASN1_STRING accessor functions instead of direct field access
+for ASN1_IA5STRING, ASN1_INTEGER, and ASN1_TIME structures.
+
+This fixes compatibility with OpenSSL 4.0.
+
+Signed-off-by: Antonio Torres <antorres@redhat.com>
+
+Upstream: https://github.com/FreeRADIUS/freeradius-server/commit/6658c9e375637ce0bd14bed733270d863224431e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/main/tls.c | 26 ++++++++++++++++----------
+ 1 file changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index 4f4cd0c28022..27b69a06229f 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -2584,7 +2584,7 @@ static int ocsp_parse_cert_url(X509 *cert, char **host_out, char **port_out,
+ 		if (OBJ_obj2nid(ad->method) != NID_ad_OCSP) continue;
+ 		if (ad->location->type != GEN_URI) continue;
+ 
+-		if (OCSP_parse_url((char *) ad->location->d.ia5->data, host_out,
++		if (OCSP_parse_url((const char *) ASN1_STRING_get0_data(ad->location->d.ia5), host_out,
+ 				   port_out, path_out, is_https)) {
+ 			ret = 1;
+ 			break;
+@@ -3066,12 +3066,14 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	 *	we're at the client or issuing certificate.
+ 	 */
+ 	if (certs &&
+-	    (lookup <= 1) && sn && ((size_t) sn->length < (sizeof(buf) / 2))) {
++	    (lookup <= 1) && sn && ((size_t) ASN1_STRING_length(sn) < (sizeof(buf) / 2))) {
+ 		char *p = buf;
+ 		int i;
++		int sn_len = ASN1_STRING_length(sn);
++		const unsigned char *sn_data = ASN1_STRING_get0_data(sn);
+ 
+-		for (i = 0; i < sn->length; i++) {
+-			sprintf(p, "%02x", (unsigned int)sn->data[i]);
++		for (i = 0; i < sn_len; i++) {
++			sprintf(p, "%02x", (unsigned int)sn_data[i]);
+ 			p += 2;
+ 		}
+ 		vp = fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_SERIAL][lookup], buf, T_OP_SET);
+@@ -3084,9 +3086,11 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	buf[0] = '\0';
+ 	asn_time = X509_get_notAfter(client_cert);
+ 	if (certs && (lookup <= 1) && asn_time &&
+-	    (asn_time->length < (int) sizeof(buf))) {
+-		memcpy(buf, (char*) asn_time->data, asn_time->length);
+-		buf[asn_time->length] = '\0';
++	    (ASN1_STRING_length(asn_time) < (int) sizeof(buf))) {
++		int time_len = ASN1_STRING_length(asn_time);
++		const unsigned char *time_data = ASN1_STRING_get0_data(asn_time);
++		memcpy(buf, time_data, time_len);
++		buf[time_len] = '\0';
+ 		vp = fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_EXPIRATION][lookup], buf, T_OP_SET);
+ 		rdebug_pair(L_DBG_LVL_2, request, vp, NULL);
+ 	}
+@@ -3097,9 +3101,11 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	buf[0] = '\0';
+ 	asn_time = X509_get_notBefore(client_cert);
+ 	if (certs && (lookup <= 1) && asn_time &&
+-	    (asn_time->length < (int) sizeof(buf))) {
+-		memcpy(buf, (char*) asn_time->data, asn_time->length);
+-		buf[asn_time->length] = '\0';
++	    (ASN1_STRING_length(asn_time) < (int) sizeof(buf))) {
++		int time_len = ASN1_STRING_length(asn_time);
++		const unsigned char *time_data = ASN1_STRING_get0_data(asn_time);
++		memcpy(buf, time_data, time_len);
++		buf[time_len] = '\0';
+ 		vp = fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_VALID_SINCE][lookup], buf, T_OP_SET);
+ 		rdebug_pair(L_DBG_LVL_2, request, vp, NULL);
+ 	}
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
