Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72AAC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1DE81094;
	Sun, 20 Sep 2026 14:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWEitdTmFGb8; Sun, 20 Sep 2026 14:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D6AA98101F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916206;
	b=lD+WnqJ772br3h6vtoPGja0NDH1v2sYh9iadkjYrcN9G4LUa/3vSpnt0wJM0xP9WvT5M
	 HXQYCCGyCEZ29YQWgn/eBr+gjVSzXpvLLEVAiVeLfBHCpZLYWlwuASIELf9ipx39d7AzX
	 FmSaIFmcv8hEDW1fXEAWepZtPGIdjsKRl+4Ocf0/HAfN5j+CKq6FJCSK5zAzAu2zXN25Q
	 vZjNL2tG5Sb1rTSQiz/pmjmiOvXTtOFDtoeWc4b0NacJ82dhZkSdh1KWjzKlsFxbvhqd0
	 lILwGdCBiyWMVNsKhxozMZigaWBOGpLam7+SEnY8HzLuPDx/dJpIn9WuurY5FGLPlUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916206;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	b=s7ksaiVzajQbiufKHhnsEKfIDJg7cB53oXLIq+WeYgxCa4AHrCcCVL9X/XzzeIPFfoiq
	 QEhS3gRbhT5lUFUjJnPb1C29mtHXuuVF2b9Dd5Cg3+gfAtfPnkKLnoUMo6fT0kHyAytUD
	 wQb2M3kNh9g5scceWE0dCD/iW7fMfkZxkofgdnifu67apd80TA6X21SEfiw3QksoOlw8P
	 vfxhFHCH+eMcZoqgrsCcV9E4KvGaOiOfYO37rTP4u1M13pQquDIBBSpwWrHnLQnVXVaGb
	 se8oKROt5LwSEGU011kR5M0JCNdFDsFuznC1Gy/CwJ9XV4Q2ToMavLPmdYA+0AgA7qw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916205;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLGJ2VnJt105Q8P0lp14Mgi1+C8twxWRxEdn3mqOj87clnIgx6N16c57QV2EWqLGO
	 q/KdYSe8/LOjLsDDCfarSmIJVS36+BoX0X6sUKr4OMFuiUXKoaczZPDip/1+ETUEdq
	 yNxaQI6LlWoI895cyA8PEOwv9Pj4y0gXiiguueVrebmb4LN1cIpPTZwBCVIbmUdotA
	 vLQibY3pHZU39o8GM+2EolzlL5ubozjaGVgYBoennDZ7+BdzBET+iI8d4nl2J8z3GW
	 S1HO4u+HHp0cGOtLxHYsXxH+Kwkou6pWDP07jmzj+Cl+ImoFqnlj7gZYB19LCWC0HK
	 ukiAnop6osadw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6AA98101F;
	Sun, 20 Sep 2026 14:56:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8E5424D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF40E60BC8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5v009p13AtO for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C294260767
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916204;
 b=Js8oCiYPyDQuINo315vYD9XWhJ2IPpg1cy6MMt8nmdoU0AY3J1t6Xu92ACjGelH/FgRJ
 20hH+n7SMwX+XXUojCM0cqYaSS7ZEz421WTYC+5COvVTGtvDh4LRlsYuz5AQxGdyKmmY0
 +qXVc/9UnMfOpBg6nzXoBN2YoxM1SjM+Evm0VkUo9JiQOiBBzL2aMb3Z22dWVq7AszrQc
 4+xR30jkyNGb2DKHFsFw7yAHfJGR+1eePGjURF1mffcrBH8p32osnLHwtpRj1dLF4+QO3
 6hdDnl4DRZ7UYiLbtBFINQIaeO/BbarEQ9rHEYFmxWJhuuKuwB1DAX+4llS1fcOpeew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916204;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 b=iYrsSxmIgP9OSz3AlDct20ahxmHkD576xVeD6tj/C2QdHdKSjp4uJZBo4Tzf3oMPu9fV
 p+0p6ZDWc6JDkEVCEeKAD3RmZl4mv/Ad+gPKj/8HAb/nTwqNwBxCW0GolBooto5bLEGFF
 jaAiZG2vi5FpT2TPkCNw+XZ+Y6LhHlKjJeymeWRLQQxPNBYV6b9LfOqz2sZ1iDOWvXXVL
 dxtfemT9ZL4J80Yjk2/TrD6oFm4KNRyOvTmTzxy/DPUjN1ReBj9I9JqaZbE31gUx3snqx
 1WmYunq2JA9xneVIbRzca3hhBkolX1UY56+Qx9aYGOQ4iQditqrTGPtHR50hJdu/nPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SjUSQZFR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SjUSQZFR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C294260767
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915506;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=SjUSQZFR++ACZZO9Z6vgpOPDUd8Yt4H74ZFbVQ7RHnfv5zhvGzLWT0gC0CkZP7WyY
 1NEb1WpF+FqK2hWlCgYv7VPjZnZaqhbor/IUfE6PCj6GRqrdGj70ZI9ITvwZDFukJ1
 fkXvObjO7fYYzofUD8+sYHgKitkER65XMhVZhE/seDyYkFD4aig9SOBtW7qOhn3KI0
 VkrzX2Iccyvao20rL/CVPEaZa2mQrcxSDBu3PKKyUlvxyeZn3arQHH5BOno2y1Ss5b
 xHtez8z8TNIj3ofJc5BQBuTeC6L1ZZqGEC2UOMkIITLtC6XgMmDGoU387P27a114MD
 MBwvMJRaA78fQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:qZh7ilHpTovUonVtJuH6C+8uMajw7ghbQ38PbLMbheZVH25HUEmjgqNkfrPCiZFdobRNctGzHcAtQIhHBVE4By4HFHHqoD0Vv6VmtInUCGG5rHY1lzdHwKDgLiazZIjqwnO/5k/P5xsEJjkHebnexLU6n38RAtQbgZP2W9c/KCfpzfKfb1Lva4TqXLA1VaPoH/UUukQy/KMcNgBYtYXiyl5iVBmiLZbqIK+CQRpTrLxf/Fjzxtir5yQ3UrgDPqWMU9TVJKiCz7K6RF+arEsw3lsFfaE51lnNlDbQ6oLV4dcHUau7bnLL2Kd5n9vkmzoyAPjYTx1mO6tZhUCxMJsBNvqXPPgJWIVpqf3g1bsVmedJdvxA9GyB9aMwsqgdtUKgkzWmOOv0ifME5DmxXfo5DBQsFsH1nMOLJp5tIVwRpnauJmTaakF0ODp9ETSTtNEiyNTbX5h39Cj+QrYkk/alqDK81O7nbRsrGcrzIL487Uot58zz97qj5pe+44lzLsxktaTrLCShzmpcr6t9pkmIleqHwP5JOpOLBrTvGmIE3B1IkTaQq5PDxU/MRht0Mr77GImZvasZnIZdaxw4e6uH3XVDru3kzPw=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F413DA4C48B0
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imn-000000000hB-2kY3
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:22 +0200
Message-ID: <20260920144428.3009612-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 61/66] package/tpm2-openssl: Fix build with
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
 ...TRING-and-X509_NAME-access-for-OpenS.patch | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch

diff --git a/package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch b/package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
new file mode 100644
index 0000000000..85393734f0
--- /dev/null
+++ b/package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
@@ -0,0 +1,87 @@
+From 6dcc3b2984e3f4dc1849c79d89c6ce736a8435b3 Mon Sep 17 00:00:00 2001
+From: Petr Gotthard <petr.gotthard@advantech.cz>
+Date: Sat, 7 Mar 2026 15:51:12 +0100
+Subject: [PATCH] Fix ASN1_OCTET_STRING and X509_NAME access for OpenSSL 4.0
+ compatibility
+
+Fixes: #166
+
+Upstream: https://github.com/tpm2-software/tpm2-openssl/commit/6dcc3b2984e3f4dc1849c79d89c6ce736a8435b3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tpm2-provider-pkey.c    |  8 ++++----
+ test/ec_genpkey_x509_csr.c  | 10 ++++++----
+ test/rsa_pki/etc/email.conf |  2 +-
+ 3 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/src/tpm2-provider-pkey.c b/src/tpm2-provider-pkey.c
+index 38f748e..80213af 100644
+--- a/src/tpm2-provider-pkey.c
++++ b/src/tpm2-provider-pkey.c
+@@ -149,13 +149,13 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+             strcmp(type_oid, OID_loadableKey))
+         goto error;
+ 
+-    if (Tss2_MU_TPM2B_PRIVATE_Unmarshal(tpk->privkey->data,
+-                                        tpk->privkey->length, NULL,
++    if (Tss2_MU_TPM2B_PRIVATE_Unmarshal(ASN1_STRING_get0_data(tpk->privkey),
++                                        ASN1_STRING_length(tpk->privkey), NULL,
+                                         &keydata->priv))
+         goto error;
+ 
+-    if (Tss2_MU_TPM2B_PUBLIC_Unmarshal(tpk->pubkey->data,
+-                                       tpk->pubkey->length, NULL,
++    if (Tss2_MU_TPM2B_PUBLIC_Unmarshal(ASN1_STRING_get0_data(tpk->pubkey),
++                                       ASN1_STRING_length(tpk->pubkey), NULL,
+                                        &keydata->pub))
+         goto error;
+ 
+diff --git a/test/ec_genpkey_x509_csr.c b/test/ec_genpkey_x509_csr.c
+index e3523ec..5c9790a 100644
+--- a/test/ec_genpkey_x509_csr.c
++++ b/test/ec_genpkey_x509_csr.c
+@@ -15,7 +15,7 @@ int generate_csr(const char *password, const char *filename)
+     EVP_PKEY_CTX *pctx = NULL;
+     EVP_PKEY *pkey = NULL;
+     X509_REQ *x509 = NULL;
+-    X509_NAME *name;
++    X509_NAME *name = NULL;
+     STACK_OF(X509_EXTENSION) *exts = NULL;
+     X509_EXTENSION *ex;
+     FILE *csr_file = NULL;
+@@ -40,9 +40,10 @@ int generate_csr(const char *password, const char *filename)
+             || X509_REQ_set_pubkey(x509, pkey) != 1)
+         goto error1;
+ 
+-    name = X509_REQ_get_subject_name(x509);
+-    if (!X509_NAME_add_entry_by_NID(name, NID_countryName, MBSTRING_ASC, (unsigned char *)"CZ", -1, -1, 0)
+-            || !X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC, (const unsigned char *)"www.example.com", -1, -1, 0))
++    if (!(name = X509_NAME_new())
++            || !X509_NAME_add_entry_by_NID(name, NID_countryName, MBSTRING_ASC, (unsigned char *)"CZ", -1, -1, 0)
++            || !X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC, (const unsigned char *)"www.example.com", -1, -1, 0)
++            || X509_REQ_set_subject_name(x509, name) != 1)
+         goto error1;
+ 
+     // set requested extensions
+@@ -75,6 +76,7 @@ error2:
+     fclose(csr_file);
+ error1:
+     sk_X509_EXTENSION_pop_free(exts, X509_EXTENSION_free);
++    X509_NAME_free(name);
+     X509_REQ_free(x509);
+     EVP_PKEY_free(pkey);
+     EVP_PKEY_CTX_free(pctx);
+diff --git a/test/rsa_pki/etc/email.conf b/test/rsa_pki/etc/email.conf
+index 7606c38..73c06d2 100644
+--- a/test/rsa_pki/etc/email.conf
++++ b/test/rsa_pki/etc/email.conf
+@@ -24,4 +24,4 @@ emailAddress            = "fred@simple.org"
+ keyUsage                = critical,digitalSignature,keyEncipherment
+ extendedKeyUsage        = emailProtection,clientAuth
+ subjectKeyIdentifier    = hash
+-subjectAltName          = email:move
++subjectAltName          = email:copy
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
