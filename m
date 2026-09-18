Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75114C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4525960E60;
	Fri, 18 Sep 2026 18:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aTDao9z6wQXN; Fri, 18 Sep 2026 18:57:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2B1D560EA2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757827;
	b=KbjmuBJeqTzvI8d1FQrPjgRQZcImuFeBpoYx/2XTuxeXQOy5DV9u9eH0moKdRWXtplE9
	 Jr1u+/HbDx8F4pH3gqPJ4KU4ZuJd5pHjqOXosPS5pQqdXQVeai0GPeBUjCYz/eIM92y4z
	 X9W/rtO4uvlKEbTfwDGAdFT2SgIK2Hrld9B5uCLogIJUIEziX9KauGyB4Mrftv/9ufK5i
	 h7Zq/6lp5L5JeiRO6WJIGUJ4mgl1TVsAttJ3CvqzJtlPBBHhXeazU93FqOlgjx6uc/erW
	 a3y9MYm4iJBGgXMi65d5/4VkppUo548ldRq0w2WMIKULlOkADprhtxxhlyqYRIMW0pA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757827;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	b=supHiSltYC4us+7VsNj32Hw7iDSCutYLUetSTjZSbkOM07OV+8LEiJSRtaVXsmRa7Ih+
	 aCcEDj22RwhfyBvJ7Z1oUrZrew1PEhfJFAyKesQKrqLbAoz2FeuzzJ9eGhSehcMX1c5G4
	 TgFH5NE9liITS++s03/N/KDL0jdXdEWKcrDd5j2nUYy1N1gMu8dZ74/GYuWIkTkAnBaDh
	 AjXlNr6GCXxDgnM766VzCn/t9hK4LR7+VGseTSNDiyR/hv7OAYklaKolAA6jR4yQhADec
	 scFKV8sIONHlP34geIB49eu0hAhY0fFIbXzmXgyEW9WxM5nky2eT1FhfAlu/tl5m5Pg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757827;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ayEI/NlXyS0t2QpNsTFI6DV/Rdhtja109UceHghqVbnQcX9iVc3TVmWSwmqxR9gWk
	 gpF1eDnSiwdAQPPvQpVXvzs4IWCA+FpTGtw3b258f/ntOJP/jrxviGOKijH2Uln17V
	 mzcH8H9I+iBFXsazSBkA6M56OOXJ+n27Jk2dyf8jgWcn6bBjRBrSKBPVOVmqZ2lTNQ
	 1B3yH3PCPMc81kVogrE2CwI2tPe1qmQmbZFpc2fyK4mw2Wz0bZjnUiJgHp4ocXbVmy
	 Qs/u4zPSXL7v+lzsYqg0vcGxtoaGcrkwR01AKvLWLQZjoLZcMFbWjaomiqz7Wa4Vbu
	 YgV2U67jPlGIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B1D560EA2;
	Fri, 18 Sep 2026 18:57:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 020BE237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 001A54006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vB1v3ftEJF_z for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DAEC5400AB
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757825;
 b=svbrr7gDAqgRWA+EaONdpCs+zLfdoBmvwt6svf6FjVuFyVD1Q5T1om6X6tNYcu1XeUpN
 PH08bc6TJUdspJgxgM1T7kiYgPBYlHYMCizZZOp9iPsQlwIMz75BxjjVdT1MgqqN66Ngy
 IaTOT+W3Sj700E4Ill6d+K2mK3u5hBw4vjwcDkchA6llA2FZ2ZOe9FIjGyh4S+OUDf+XP
 EG/3e1/voCfO4M2rE0hnJQt4SQCQSrFKoLlbMOHFwrQCn9lr+OF9twGM0dEoD29ZkcNMp
 raXTpb3nMNwOTujOf6PZ6//mjQ89ix0jzYAkSxUrcJqUahAttOd2/nfn4If2XUPRCBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757825;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 b=XqTnoVUA90rYvEGnQjmW0/oGwCmEtUXYqqHgZUgLyRuNXHNK7SB3gpDGHJSq9tI90afe
 8pdL4w1MkmE0c+vOU6SXyoL34jdvhsBPp701dQ9Cwszxo8hZSfGuQq8aJUVgn8riLOrGZ
 wgHZhUNzLuzl7WCS4EkdhytZ7leq5CYwPSLGcW10hGNONvasGKFLPDV1A93WfuF88x9sA
 aCWt474SdheIbXVkm3qTZD3eYjB4mEqRHB5+fp6Fls3BkhlfNQ2WWgDB+L7o+YSwwJ+3A
 v0LY4eLEPMGdFtelBt2rOsexppa/crTSyR9dKZSj+ZAaHJKIyWwB/ySvBhStKZEWzSQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=oc4PaYK4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=oc4PaYK4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAEC5400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756951;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=oc4PaYK400EDe2O8NRutfNhGuQ1Lg/AmagnNLz4gKQoAxfVOwID2BWcHomVpPfWmJ
 8ofLmLb7yVDsDgLS6c5BM/uUi4x3LcfN0gzYYb1mbR1+DZG2NPILe4gjGWlkVJBrt0
 k8jBH1SmJZ9Zh3C79z1jnBJwASxI0PKr/Z9kt2tEe8Ux8eLsoB46eRp6HrP1YgIQWP
 RT1HmQbO9wiWA1l+sOhDOFhwQMRDH75bIjmu6DZQ8A051yZ4AG3NipCT78mS6sI5t9
 WYZsEBHJuUzkakKpEMzI8V1yav+xRL2IRyvDz63qiDsdW1J+4GyNOo3uIcbbBanVoj
 xrXTWQZL5SWGQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:D5vOgm+01W2ACqIkQP88mmMNEmDN+/DNt+NfcQGS5S+TH7JupK9ByB/Hbo5x2uqDdmrFsN/fX/rJeRB/wBsseE9DkiH/RyzDI3yGwUvUigngH7efelXdz8yCfQbTRaDpvVOAgh2VwxbCotogEPl0x44uL3JPGXFKqqhxFxt2QfSs/9k/7phcCZUo6EDi1shdQ01soJvRtNQtCX4zZvNF9DGwOhHOhkmIpYPZwBmCJjYbx5hc2VjkjLfq9X9qaC2cYcnaw9YsLJLWhbvAd7HYZnRBL9S+2tzNyi5my0a3WfhPEfKJZKCINVPUbmob+kSx/gk0QHC1fErbmMRyKz8mcblqY1ofnDAT9NpgYG8KMAGKOk6bvRdP2p50Wvqq+KUOj1PV0AzopoFCZkjmvuvXygbXGwGwDhVGDH1sS/5Nb2bUGzCx/Q4Qaf5Kfpeufovn4EesDApg5a+eyqo7/5wLED1Z3w9MIrPL2RIy9HuPPPHmOcSQzAF4KvhX5WcwtKG/UGg8ixKk5KQ+/CTYtLmsM6mfnoADQRs95ZKmpO0Oyl5Bo2el/kFah8coMbD9Zhg4uxC+RDCmvpDpdj3p2HMAfbFjCOG+aBBp7YJmbpofaY6wbB
 xh+b8HoG99P/JU6/EVUX7ynLsZARlAlGdzQ+hAyrr9C19u+OUOQgseKdkwhfKbzfvguz4mcwW1
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DE1F5A4C4757;
 Fri, 18 Sep 2026 20:42:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX1-000000007cB-12S6;
 Fri, 18 Sep 2026 18:41:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:27 +0200
Message-ID: <20260918184140.3631274-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 65/77] package/softhsm2: Fix build with OpenSSL
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
 ...mory-leak-in-OSSL-byteString2oid-863.patch | 49 ++++++++++
 ...in-EdDSA-PrintableString-handling-85.patch | 98 +++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
 create mode 100644 package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch

diff --git a/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch b/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
new file mode 100644
index 0000000000..2defeda775
--- /dev/null
+++ b/package/softhsm2/0001-Fix-the-memory-leak-in-OSSL-byteString2oid-863.patch
@@ -0,0 +1,49 @@
+From 1b72640ceccaa8fdd775f224c26a53fdaf189da6 Mon Sep 17 00:00:00 2001
+From: Shawn C <citypw@hardenedlinux.org>
+Date: Sat, 25 Apr 2026 20:05:34 +0800
+Subject: [PATCH] Fix the memory leak in OSSL::byteString2oid (#863)
+
+The function `OSSL::byteString2oid` in `SoftHSM2` (OpenSSL backend)
+leaks memory when decoding PKCS#11 attribute values as ASN.1 objects
+or strings. It calls `d2i_ASN1_OBJECT` and `d2i_ASN1_PRINTABLESTRING`
+which allocate new OpenSSL objects, but these objects are never
+freed after their NIDs are extracted.
+
+Signed-off-by: Shawn C <citypw@hardenedlinux.org>
+
+Upstream: https://github.com/softhsm/SoftHSMv2/commit/57e10cbbe75069be92c7e9720c180a05833481fc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypto/OSSLUtil.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/crypto/OSSLUtil.cpp b/src/lib/crypto/OSSLUtil.cpp
+index 794f80e..d238eca 100644
+--- a/src/lib/crypto/OSSLUtil.cpp
++++ b/src/lib/crypto/OSSLUtil.cpp
+@@ -177,8 +177,10 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return NID_undef;
+ 		}
+-
+-		return OBJ_obj2nid(oid);
++		
++		int nid = OBJ_obj2nid(oid);
++		ASN1_OBJECT_free(oid);
++		return nid;
+ 	}
+ 	else if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_PRINTABLESTRING)
+ 	{
+@@ -204,6 +206,8 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return EVP_PKEY_X448;
+ 		}
++
++		ASN1_STRING_free(curve_name);
+ 	}
+ 
+ 	return NID_undef;
+-- 
+2.47.3
+
diff --git a/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch b/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
new file mode 100644
index 0000000000..f6b9000b13
--- /dev/null
+++ b/package/softhsm2/0002-Fix-memory-leak-in-EdDSA-PrintableString-handling-85.patch
@@ -0,0 +1,98 @@
+From c7e930156054e901e27149117494d53e9945f734 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ma=C5=82gorzata=20Olsz=C3=B3wka?=
+ <Malgorzata.Olszowka@stunnel.org>
+Date: Sun, 3 May 2026 13:00:07 +0200
+Subject: [PATCH] Fix memory leak in EdDSA PrintableString handling (#858)
+
+Upstream: https://github.com/softhsm/SoftHSMv2/commit/d23ea09d318c03c033420d065f1c64b019cc94ed
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypto/OSSLUtil.cpp | 37 +++++++++++++++++++++++++------------
+ 1 file changed, 25 insertions(+), 12 deletions(-)
+
+diff --git a/src/lib/crypto/OSSLUtil.cpp b/src/lib/crypto/OSSLUtil.cpp
+index d238eca..7763799 100644
+--- a/src/lib/crypto/OSSLUtil.cpp
++++ b/src/lib/crypto/OSSLUtil.cpp
+@@ -160,12 +160,14 @@ ByteString OSSL::oid2ByteString(int nid)
+ // Convert a ByteString to an OpenSSL EVP_PKEY id
+ int OSSL::byteString2oid(const ByteString& byteString)
+ {
+-	ASN1_OBJECT *oid = NULL;
+-	ASN1_PRINTABLESTRING *curve_name = NULL;
++	ASN1_OBJECT *oid;
++	ASN1_PRINTABLESTRING *curve_name;
+ 	const unsigned char *p = byteString.const_byte_str();
+ 	const unsigned char *pp = p;
++	const unsigned char *data;
+ 	long length;
+-	int tag, pclass;
++	int tag, pclass, data_len;
++	int nid = NID_undef;
+ 
+ 	ASN1_get_object(&pp, &length, &tag, &pclass, byteString.size());
+ 	if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_OBJECT)
+@@ -177,39 +179,50 @@ int OSSL::byteString2oid(const ByteString& byteString)
+ 		{
+ 			return NID_undef;
+ 		}
+-		
+-		int nid = OBJ_obj2nid(oid);
++
++		nid = OBJ_obj2nid(oid);
+ 		ASN1_OBJECT_free(oid);
+-		return nid;
+ 	}
+ 	else if (pclass == V_ASN1_UNIVERSAL && tag == V_ASN1_PRINTABLESTRING)
+ 	{
+ 		/* The final PKCS#11 3.0 expects curve name encoded as PrintableString */
+ 		curve_name = d2i_ASN1_PRINTABLESTRING(NULL, &p, byteString.size());
+ 
+-		if (strcmp((char *)curve_name->data, "edwards25519") == 0)
++		if (curve_name == NULL)
++		{
++			return NID_undef;
++		}
++
++		data = ASN1_STRING_get0_data(curve_name);
++		data_len = ASN1_STRING_length(curve_name);
++
++		if (data_len == 12 && memcmp(data, "edwards25519", data_len) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve25519") == 0)
++		if (data_len == 10 && memcmp(data, "curve25519", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X25519;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "edwards448") == 0)
++		if (data_len == 10 && memcmp(data, "edwards448", 10) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_ED448;
+ 		}
+ 
+-		if (strcmp((char *)curve_name->data, "curve448") == 0)
++		if (data_len == 8 && memcmp(data, "curve448", 8) == 0)
+ 		{
++			ASN1_PRINTABLESTRING_free(curve_name);
+ 			return EVP_PKEY_X448;
+ 		}
+ 
+-		ASN1_STRING_free(curve_name);
++		ASN1_PRINTABLESTRING_free(curve_name);
+ 	}
+ 
+-	return NID_undef;
++	return nid;
+ }
+ #endif
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
