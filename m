Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6945C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F15481029;
	Sun, 20 Sep 2026 14:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQ_dnAObwpEu; Sun, 20 Sep 2026 14:55:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9CA6A80FF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916128;
	b=fgxTc7QLhJlv9BQeNqFL8Il8gYzfFuVJt9qOohkE8R3T3UdLqkqZx3WcgoTzyHNoNzM0
	 7m06BydOo4tf+OHWMd/nPQUUogpAHrCxpoLBIQPCc+ZxyEiGmOj0+LlrYhFhPn2FTnrQN
	 nvnUaoTjtNDZVrD7l/5g6iQ7LuuwZU4+lxfleqrZiT7f+20H4IYpXWru+1ins165ePR2+
	 HTUuMn2aqVAaVgST+VSOvNQIkUM0KKAO7j2+jHwLTWfMXbhmC0EdZ4gIyixNrhZYanBoj
	 yyT9SyfLlncrEvoxYkfeItEY7jHxxmNZLfGrSIpaMcN4jJeLrdgHDkSQOr3gmaydBjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916128;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	b=LUjFOl+E4/DPE+y6L2IEMdbDd8bXPl+gp5QwbERPQd56KMrVozgICYTRjyQL+25Gmgah
	 AEDaKNjc0Ds8TBw6HJodkVqbKQxLmfc5rOpgR/ITC0hYsRFn6woScbMULLJ9b9oGMQQLW
	 P9Zzf2pjxMrjmNEpeGl/D51EwI8ctTrXiXN5VaQAEFU44Ou3fHnh5HPR3R0vAAMjwU0J2
	 pfpRfPYOkWpHfybQeXMrkIU8j7Y7PnaTH3WMIBrfKMLLEDuEAlGyrwcRtJjaL2VqUMbYj
	 4QS0HGVwSWg/1K9BcL43d4y8piilE78M7MDWPWdGqzv4RXWKdkEpb7Ej7JT/8CFcxJg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916128;
	bh=K38UEPTcjs+JlrSehlorOrOxRp9FvTYe2IN4WgIup0U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESidCL06QpH48FBm+qsxGbCPit3KKdJBehAamYBDyECED0nH2thvY3ilTacyLAukR
	 iyN5T0qUz1plnwCVC08SnfDemIohKgwufGSDHmu1rZg8299AgtawTxwHFJ/2iaiF1u
	 fQ3vDncfPnOZaXP2W2TCnMTS2+SE0/YRNcdE5loFiHErRLg/4MB1/QgliTZBj0Nbim
	 b/86KP2mqBknukEPOPtLk1BD/PNbWvSOzbnQ2PMxr6oKWsAEHea+RhPnngjTPOG/Mu
	 XJyjZYgCYcTzsqfoLQXbzoOHsTzw56tcdAk6/hsr1pHrLxa3P1zXPJVVpRZW6uD6yQ
	 9amq8p9+HEbAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA6A80FF3;
	Sun, 20 Sep 2026 14:55:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD04924D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE83A40E6D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UTd-dj7zoMX for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:55:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C209540E60
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916126;
 b=Zldu749wrDt5Xw0hM4O5vctqrh+PTiq/7qB/28PLhl3iYnlHMs3f98QsSIMsP3Hx7LT9
 hH7gd4AgaoDoli+uCIOxp6nwlIVO0WIe49PfPMokpsS8Tx9Ps34pqjiL3JEIgeLgezzlR
 tLtsH3jAgUz26A1KHvjUzIX6R/5k8P6niIMczu967gDEpotcUADnIzJmO4vbl1gbREdht
 vqZ6w47lUWwPpCAbPZzLebVs4WeujQZ8QnfiMnIc3lJ36vGYKmonXrQOZU191qwFDjAx9
 0yEggKX1tz67C66/rHqIbGOW3oumLF1ygpxkkPEvdH5Wvm0yJ1XqxSgUjRPiQkoxC2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916126;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 b=DbWyEVL1AkG+4KbEm2oXh9DvKGO4Jo8eKUFgQIYZpidLF/wV3Eg0crfWSL6IHsWKqX1A
 3FpK0lF0/uHrNJYQxcj0/YXYk7LMRRt4rW8hnpDAfuBFE3ByqnHULYHzn0EKlx8ZUGS6o
 F2FCKLFvfSOTy2tgUmHEidr/77Jo/nOhRUILx3dj2wIXBU4ljFfnlCADtfMaTQEyo2jKn
 fbA3FDr2XNA0e5HT2+jTeSAU/wpLTfqnOJWLUgWrw3lBYOsziPIrHyzyy+wTBmIHG4cch
 GHBZodgEeep6u62Rq9HmBo7AWxsKPR/WvFLSUQpsifDkFMCX1wTjBC5dcd4HEa+b+eQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Y/U4W00r"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Y/U4W00r
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C209540E60
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=5K82jIiPOAAxOVMXOUMEDuHnm5P3+HqOjNR0zVeDofk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Y/U4W00rOQI7pCJwo0r4l5x23FwCDg90tF5Ip8rXoc5GGHdmujk++ItIKO3grqgb7
 nMaOMenxrGDdiwpa61s/Txgia6a6oMWFvs/N0AisO12PrNL0U3qqgKkCBu5CxPohvi
 UcllnPHyz0y1xNKhLGM/lwoZSTauOmAYch/KdriNIZwn3sEis37H2nHLey6csxRGPx
 p6mIn/wEwVDf3RScQAWMcr9/jm844wPM5+Mo4BJHKJ2BditZY/YQtAsVGsDBJMMtZJ
 +ATWq7SgK9Ko3wJr/0BrFLKEaSo6l+i57/zu+1NF7ZiQGX7ZbDPG7V/UehNNMLEVVC
 CRO0xDCW4KPjQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:kgzjT7d0k58G6E7Wo+UPsK+hGaWoYLTjkS96rgvwD23VKxx2gZxgQhjG90v70MiN7v9R/I2dxresKQzdhFLazccVSIG0NoUocJpBEf2tOEfUZuiaBmXw1jt+1avdaT2cjDBl1pP/d1iNCwVxdC0KSDE2Vf8zecppENFcvZn4z0aWmEO+a9hOLy6hQDvSfwBduZDO4IVu58Ga8ZC7UaaA5WUn/ftpf7wEHSZS8YzbrQmSlmf5N5/hsSfPfJn6T7/Xp/jtycaiTlo0fu1pKsUvcemNW1rLdg66seB7bshzaTuAkdupE9O9dN/kIZw7F7oWJapQCepnEXOPaSjj7px1KB1G0DzVZJfg8BH99ojz/cFaewNvbMdGbGmZH3z3U6ajx0ZVGCHL6jyKVXIzEjm+DxdEyPCZvjsGDvFGYLd8a4ptI+1Y8pYeMBEHyXH63OR6vwl6oYCw0FGwsO9wzhVacc6nVjjEAFBN+rld4R4mDKrlbPeoohCFQJ98CqI8+d71MRsmxi/8fEUS/aLaGdPSFFxQOaOi2fKnAMM3F1yAUT407JDJwNcRl/K3SeNfWlgjkQWqVBGoTAOGDTekBG6GWUtnNxkDQI4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6891AA4C48AA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imm-000000000hB-3Kkn
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:16 +0200
Message-ID: <20260920144428.3009612-56-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 55/66] package/softhsm2: Fix build with
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
