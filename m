Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02763C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1A1B40656;
	Sun, 27 Sep 2026 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5cwnXePo_03; Sun, 27 Sep 2026 10:57:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C608940635
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506654;
	b=ihBhHhSpRNs5gpJrZl/AYrG39yS7vnDDariH6ZNuFMRisLEYqGUtAThwC9FYWycYlzem
	 sK9QBZyaKWDUj19oBZ6dzvgmph74lqR56Owo5TClD1MXIcdFBPEU5+tU7Giqv0wtYxf0p
	 Y2Oq+udFtvAiT8/pzOiN3pH+SX1rN8pYGQz6b1q1H/JWo858uP31mJw51Fy6klniYySB7
	 /TDp6c22Fo+ZOViXTMzzClwaFr7Inc7dEr+TtWt6XLKa1UM/rvttL3OswzdUwxzQ5zwoj
	 caZ7NlD4wC+wiUegJeCfvfajjhlBub4reARoop/dto77U5SCjSpzyHtG7ZeeCF0WkQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506654;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	b=YPM9RdbUdJfETS680HIQtw7lU1cDzTHoa2Z0E+KKLQSv3A7zw8tJgusBZuOUAH8dY8WH
	 ixkR5s+ywg55qG4Hd3tP1MXZyC0oDF3jM8pMM0IMFG5c1oSis3Z6ZoSqMFocWGACZIc2I
	 hHWzOMvW71fRIf88ROEhNEPKLr6bcKtWyRphQwB/pYt6fSn+jAnNr2h5NeInyQJY33Pgf
	 nXhlQoMjL6gmOQyuVtqDmqH/hKW/nU/oMQyUq/qUZQ+MrIzonZbsbm/wI8w9Peb/G/fUD
	 ZtK9fueTT6VRq5n3gK4OrNp+WqZMzJ0PUihdDOKzHlg9eatGtgTYBULLWp0gWX3G2BA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506654;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TrUOTBabfTEkQbTDg58UgyzulEBof6zb2cyr1aZfwYC5ms7CZsEwYJZtli+5owMC1
	 gSoeQZcuwqkedGGtfuFWkeR58D78uMz8nbL/POW3qOmULAMwcept+dq3INb6w9+O5O
	 8WpSpQnt92MOqCdTcCzinyToQYBTl5OjH3WvCt8+TPyO7AY/08RTM+Wo9eNbkK8A3z
	 AC63ENVKJc1e3f/EsvyHDLYQ4qbTLphQkDgJOGwn6vpUQWkZSMaHBWemfw97Sg80C4
	 f6ZBB6DiT/+AwsS5W1vwRxbmTlsFEuHd5MLgYIL4O/F+mARK8GEcw6O3bQfalN5CKj
	 779999G0CFznA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C608940635;
	Sun, 27 Sep 2026 10:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBA0A335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E90CC80D3E
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0IFLqeIVtFy for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:57:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D596580CFE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506652;
 b=s+JfrUq4pJP2B1B+G5tOIXN+oKnhFdOpeBNV2W6bY560/xJ+DtPR5R9S+EDMaoT8gdE9
 nSYlBJylRnchNyPfDLUUFIw+4Ep/w27+JFbqRJO9YDG3byd0MOdvQCC2XX4Tn+z8fFn/q
 Aj16H+0Sz61gE7uC4g+Z9hwQi1ohtrsNrXG3VVA6C0qD3po64nntqQPirxoJd5yClaeZ+
 bchx7flPWFWTFUARMYbGM66uxN2OAW+wKMmZnNrGQbuPxlC3lYxkIUoEidENsipZFUO6R
 J8p9ZvKSIO6sI4e7M5BPMCn07UVyO1c/aqzQvrprhMSz8d5uX+nGGMGKs3IUeWO9oMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506652;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 b=kO6qbKI8UozjgHyMCV8JSLfAGM/I0Gc23UKtA4HQ45G9mFNiBv7EY2aGJqJYLMjTXC4o
 13lM+VM3OmgMCkmqlwvFqDBzCjDgrPXCSEdAC18La1Li7ucVJAnHSmw5UL0EVglQ34yz5
 oghBkvzmvfrKIOslj/cU70/Wdautmgai/1DuHoCYyUdaRHSLiNiLN24wNO4pM9I52747P
 taC49fJFm+pwJYoYjYQ0DkdzlC1qw1TAgRCbrPl0DPCKt/gtTLAbfADrvSeiDrrM+23uK
 dJHd9rHkKgkT6VeM3thhtyGBdmuqMYQQ+5LTSQb9GUvF23uVh46K1mS+Lse1TIgYgnQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pd57nhM9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pd57nhM9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D596580CFE
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505865;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pd57nhM93V/u9ZSKv3lUaXO87B64gn4Pn7jHtP7WezKhc2RbJyZZdysMy8HruEyWC
 n8SjFn/VEpC9iY1gowtTHUS22n8xBAQoigV6FHvKfg/NG4HlKycDgKfNHFIvu+KoDX
 zAscxZ27i/xUJTsIeUK4kJQZX8blyPpLz63kCtcjJz9snZGkd5/PO9iaBbsCcqLuPm
 glYtpOy7DT4jIfqlBnf2aKTGdvz/2mPB5P9BECHpDnQ0B5iKrVweg6pduhUJAYrQI4
 C4KXfJZYBDdIIhLFoxv8FQID2gCYcMLVhLjOdVvGtfcNqKKV4bbtbJijKl2ApllWby
 kwzvfHWxCWe1w==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 p6EW7x3T4/nQJEGDbqgZ8Bif/5X20SVXGTa2LvvsGoZtlD0m9/Y2uMC/SS6zVC+XR6Ld1mIIe70
 Hcab2M6axW34ksDfmqZf+sC9EYqEDk+N1SWLrr8TpFre8BiRJdUMdekvdgwa4NF7rKfRN8tTMrG
 PpOmd+PAkL5uIcxpQh5KXrzhhh7nqUQRJcGWhgM9F+LMRAtE7HSaB/IgO8p/U6UywRleLrtDVjR
 YljSpmCztD7cb6TIZeyZcL5x7XmMaNhh3A/Zft4A41HNUstFbhZPYjdUR40HoA5ufMXpJoii4oF
 j3hWglize2LdJa13Y69+CG+/w0O0tTj0gffMAVb/vSQvIGIRtMFVJ0ZAYutNpt7LJVaeDgjqVsn
 tKYyUcqB2rQhk6yR+nt0TtWv89d+Ax4X0fmWsEY/VRt8K2OMqlp+FTplJPB66AO+ucV+3nGqFNd
 x9yDlGH61FugHBL2AmFjuOlffrHyMelzUZ/RbPoVE7LMuNfLyJVDDZ/KlFN5m4v+0dnWpJXZwrh
 BbI/9bhJzyodFkDZijXYYEtWKbAXgv+NdxmhekSOsWw+debyKISYIbefvfzv/GgYY0X3watRTqU
 9htzw/6Kem4L9GsyXswpXe0plbwTePH7v+EARTzNtd/AFGhxp6abLAjE2YvmT57LRMeZ+QxFAUj
 nle9R/RD38AeVYnRQ1tXW
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 38F6AA4C507A;
 Sun, 27 Sep 2026 12:44:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLd-0000000007a-0TSm;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:21 +0200
Message-ID: <20260927104301.1801638-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 43/82] package/freeradius-server: Add support
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
