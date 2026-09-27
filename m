Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AE4C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36064407F4;
	Sun, 27 Sep 2026 10:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ci-icVBAytgy; Sun, 27 Sep 2026 10:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 576D7407FE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790505911;
	b=saNf2VVAJsMsbFZd8zKORmbUf3eGtQK0Mi+QZvXKRbN6mJiAWusx5Zia35rnj7tSYizO
	 4boH7xHiyztfgeuG968BZUHb1219+Ya+pLQv3i/sSggn8eS/VfgGnJP35Ji+pygWBiRq1
	 t0ORAcU1r/7pTA6md/6F/Gr5WMyWe8rmiH3smF2Smu/Ome3krJPA7/9sqis7yypHDWlis
	 nvzsp3eSp0nfgO29otePKLFjXknXOs82O4iTqYn2oPbg73rVGrQ/SpYRVmfrdrzEASXLq
	 jlrvyvayoc1VX6ats14goDOF3hHjzyJPJ50C/GK9IwXWFzJ40zpFQNQBBhHcm7j40rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790505911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	b=nGHZnZFnT6l9qEm4VfCySKU6yXc398NdrXYqcumEeJcPERGF1rlNGPd3lvhbHW1FBf45
	 KaFXDgbO4y/cLJH6M6ssB3eqG1MPLxflYUZZsKN1BxxEpfTqDvGou93RsdOwJWz7j1bhc
	 nqqflCF/7EnNpQkaqUHUjZrrzKxeo25qopfUVQSrsbpXs+rDSauV6oIoHremR3sp+s/0d
	 nraxAKiJ4ToQNy71oviH+PvX/UBAnwPw1GRbOVLRgYHE0P1qGgYcFq414opL9oovUg+q1
	 Hm7WN+sN+Px+b65TjJs4IaP57Ec7RppUc9VAv122ieyrr6U4dmhUDunQTS8ov85qB5w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790505911;
	bh=GGs7uWKUh9Hdz4fO48uKpdxJ/E0UJInPHgwzFM549Y8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=T/HYo7QudUONByDdj4+dP6BUY5kIJGfA29T+MwGCT2oqTpzE73Px1e043GmVKkT07
	 VdAivG7ekDpSGiE727+4HINrekpycipo9QmxkdeGqQf4RNe9ggZItRDrS6oXIkI3fn
	 tjLngD4fU8d5LDQNjTs+3TclavOzJrXyYdi7ioyvkkkwsJ98Zsx/ZHT2b5OJoIXUAZ
	 LXObq02tKvnqcA1wLTfPgwUdna6/k7Qg+gK8xUf8tNmlAr1KFlkWV/zecTf1fU1mZ1
	 Kd+LsMVmwxeNySnZBPKI5eYVtKE10o3XMJVtWu5AKz24/RT64hvbAFRT+3Grqx0pLe
	 /RoK06rMhSEIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576D7407FE;
	Sun, 27 Sep 2026 10:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 993D9334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B1F740059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWkS3fccr4QV for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7CD5B40068
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790505909;
 b=BJ3F/XvoP7YV+3rSS/gQz55gPYSQar9XW4jh2xzpOmytNCpFsAC23XTLQuZci/FK0inA
 mGqFZyOoClTmijLqRvAdz81wVAbGvEkwLp3UFdlos584fDtQD5fODV63oVO/t7fiVKPoy
 QAWm2luy2MVmkKraJS9u9J96wescMi3cKBzgfsaGtsaS4C7GZ2a477DBuPYC13BzoPnOo
 8QPmrqdC5PSX08OFEXo/RDj+Lj+LgPDyHUh9/xwT5E8mBAbTPZ0aL3r/X0yg5Pwljrc4L
 cnBbdclF8Wuen4dizbrGsn7en7gNuOqZfqhe6c2/vZk/iJwRJH5xtRcotQH3GONB6Tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790505909;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 b=L/pTurXuDnxnTt0GqPs6p9aLevpJuBtD9pBu0QFglphRP5tANL0Ob7yKOBscV+LCrCRQ
 y3oDC9eL7ngJNmlEwhM0wbXEp7LkTb3M2XEijNfn1kkv2wY2kMjhlmFND6+PojSSCjd+D
 a8ZXecEew5BPvmfl5I+WljPvm4xa5V6UiTpEHdoWDrVe3RqieNEE5CukF7lFzyeytTGVS
 NcjOBp/fwv5lIm3vQ3s+YMODuMT8+qkRQocfzvS5rTFzrvZkTLqIEHhxo04lPJLN3gcDn
 7ijs4TGQNmSNtNgJHk1H+CkBn/pfZMcwqNmZ723VNsKxqlmJ2/dh6DGvDLaoevLV7wQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fsOoTMXJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fsOoTMXJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CD5B40068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505820;
 bh=zPioJdvjd31rVP7sd+skVXwbvZlHA6REaKrk0GWe//Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fsOoTMXJFRQKrmyn3aZRD3BTWZjk8HD991h9ru1av4exFdrJocxXHeWvihBBQoSet
 OsSYojSczpwD9ar+wUs5+0kLK7yY1psgaKGiGN7xPAPrJTzY+1dmIUjVF4tTiU3h5u
 DcL6BbQIci9pJyPyndXpM08aWvyv5E5PMKgz565kMNdTuMmUEwiza/8OsyWFiweljm
 8q1zM9/lx2gSv2a0pUFO2nyCnYPrs5HObZqA/m/d0kY0G3OC6ywoW9VY1uS1jD9urn
 hF6/BNBxYoDkK2hR6mq3q3q73r3AErWKOfZGbhyW2bV9bVSlUX9GXhe0UqnS4mQ/1k
 7K84xt2m3paUw==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 1w7sw/NvQ4vQ3tE3pMKC5/gvBMlzEiwQAOmuJnloFdU5lwaqKgCP6Kh7NHTd0UvMTaMb2+8Y/vU
 Ozb9+25Y1A1iwdzawM9X3L3ZHf35F58Bo5dyiE6LJBgyteR75uWVqBzcixgcrkUCPIsUzjWWFLs
 LhaPDS+T4flIeZh401nv9GC66YAZ7zwYxWuDY0g/38G0RRK2MR2cHQ6anWSgoNs8ki4YUzZeJEQ
 DGpNvlZ0h/FjIuz9DPGfc1vcJRg1iVDSKnv2JzM/yqrke3V8wCNZiyhC18hNkzP2NZT/o4lRJfh
 pmqCiIWZBdJ2Fmy4mVY8dRZxanRS2FYAYCYpWN78Wr4gl1c3KEtHmDv4LOdVAuS8B4dwfH6B8hz
 H4jG55uIe/qA4RdkAKyfg+0RFjAm05ozdreVD7GgfaZC16aboPlz9p4tJY/ZnS10PtOmCXbP5ri
 NccZElnfN9QNRpSA+UDPF0pAs61tJuACKl/Hsg3NSHrWC+gapbySxPzP6TZUyBPp6h16bK8t7kr
 ZDbL6Mywlcj+1JgdsADium+ub035+1bpGX2s17bNUyjrI9CqBo029XuezkEDPfod43gCZFzpcWC
 lewEgIaPrLCCzSZoZEQvliZ/77yYFrBGezMm/yocnUOZ+LHinRx1Pz864Y6Tx/MaqV8LY/RfMzI
 MltaoYkhWApNMOntts9Yi
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FC4BA4C4801;
 Sun, 27 Sep 2026 12:43:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLf-0000000007a-2inw;
 Sun, 27 Sep 2026 10:43:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:36 +0200
Message-ID: <20260927104301.1801638-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 58/82] package/netsnmp: Fix build with
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
 .../0002-libsnmp-Fix-OpenSSL-4-build.patch    | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch

diff --git a/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
new file mode 100644
index 0000000000..e92dffff02
--- /dev/null
+++ b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
@@ -0,0 +1,99 @@
+From 1c70efc4334629ba278ea75a071d4dbabc198df8 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 12 Jun 2026 13:52:20 +0200
+Subject: [PATCH] libsnmp: Fix OpenSSL 4 build
+
+[ bvanassche: edited patch description and fixed OS/X build ]
+Fixes: https://github.com/net-snmp/net-snmp/pull/1101
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/66736ece08dc2b4050acaf234e6959d21c89cb02
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ snmplib/snmp_openssl.c | 39 ++++++++++++++++++++++-----------------
+ 1 file changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/snmplib/snmp_openssl.c b/snmplib/snmp_openssl.c
+index 4471a7a9d3..0bd1a65882 100644
+--- a/snmplib/snmp_openssl.c
++++ b/snmplib/snmp_openssl.c
+@@ -234,6 +234,7 @@ void
+ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ {
+     int              i, onid;
++    int              oname_value_type;
+     X509_NAME_ENTRY *oname_entry;
+     ASN1_STRING     *oname_value;
+     X509_NAME       *osubj_name;
+@@ -252,8 +253,9 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+         oname_entry = X509_NAME_get_entry(osubj_name, i);
+         netsnmp_assert(NULL != oname_entry);
+         oname_value = X509_NAME_ENTRY_get_data(oname_entry);
++        oname_value_type = ASN1_STRING_type(oname_value);
+ 
+-        if (oname_value->type != V_ASN1_PRINTABLESTRING)
++        if (oname_value_type != V_ASN1_PRINTABLESTRING)
+             continue;
+ 
+         /** get NID */
+@@ -268,7 +270,7 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ 
+         DEBUGMSGT(("9:cert:dump:names",
+                    "[%02d] NID type %d, ASN type %d\n", i, onid,
+-                   oname_value->type));
++                   oname_value_type));
+         DEBUGMSGT(("9:cert:dump:names", "%s/%s: '%s'\n", prefix_long,
+                    prefix_short, ASN1_STRING_get0_data(oname_value)));
+     }
+@@ -433,30 +435,33 @@ _extract_oname(const GENERAL_NAME *oname)
+                 rtn = strdup(buf);
+             break;
+ 
+-        case GEN_IPADD:
+-            if (oname->d.iPAddress->length == 4) {
+-                sprintf(ipbuf, "%d.%d.%d.%d", oname->d.iPAddress->data[0],
+-                        oname->d.iPAddress->data[1],
+-                        oname->d.iPAddress->data[2],
+-                        oname->d.iPAddress->data[3]);
++        case GEN_IPADD: {
++            const int iplen = ASN1_STRING_length(oname->d.iPAddress);
++            const unsigned char *const ipdata =
++                ASN1_STRING_get0_data(oname->d.iPAddress);
++
++            if (iplen == 4) {
++                sprintf(ipbuf, "%d.%d.%d.%d", ipdata[0],
++                        ipdata[1],
++                        ipdata[2],
++                        ipdata[3]);
+                 rtn = strdup(ipbuf);
+-            }
+-            else if ((oname->d.iPAddress->length == 16) ||
+-                     (oname->d.iPAddress->length == 20)) {
++            } else if (iplen == 16 || iplen == 20) {
+                 char *pos = ipbuf;
+                 int   j;
+-                for(j = 0; j < oname->d.iPAddress->length; ++j) {
+-                    *pos++ = VAL2HEX(oname->d.iPAddress->data[j]);
++
++                for (j = 0; j < iplen; ++j) {
++                    *pos++ = VAL2HEX(ipdata[j]);
+                     *pos++ = ':';
+                 }
+                 *pos = '\0';
+                 rtn = strdup(ipbuf);
+-            }
+-            else
++            } else {
+                 NETSNMP_LOGONCE((LOG_WARNING, "unexpected ip addr length %d\n",
+-                       oname->d.iPAddress->length));
+-
++                       iplen));
++            }
+             break;
++        }
+         default:
+             DEBUGMSGT(("openssl:cert:san", "unknown/unsupported type %d\n",
+                        oname->type));
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
