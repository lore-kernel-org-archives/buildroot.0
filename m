Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1891F606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n94/bYc1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Ru80/kvD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4853405FB;
	Sun, 25 Oct 2026 19:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5j-H6gzEY2SF; Sun, 25 Oct 2026 19:32:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 34963405F6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792956721;
	b=gOP2wITL882VvGCepJJ0Rdzp9++hLp3kcaE9rgIgPqYfaspSoblDoidzl8+xCduEB2vk
	 g6hnTg0CkGQciyaJD+n8FzxQIf/zeFgRS0VtY6tW6KAqsR17563tnibASRDOspTn6BD3C
	 nri8X/YTUvAq/OONMWfRfBEXOK+kHe8Ah1U5W6xNiPlvbRpJBuPtCRZIzh0Ko8GJ4ldcf
	 5NXSh0vNsE1tFFeUSkizZ+54m5DCgMhfIaoAgOY57lcj4AOrvyMC/K592sNbn5oymLpZC
	 e7dwyoNFF0CojHZcjEXLc0g1O9sNkTkSFC7UgONVg4JPKWzYyf+jF+Ez9GOKnC3V9iA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792956721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O55h2pElfQ2sOF05Whf8MU04RvLC08CLh4YX0MO1yHQ=;
	b=RQ8+sWHC9M2E8Ao9lUGGGfiWyB3XHBOEG21/vSsrjNM5TgPA/fqhk+9j8KPcP3gEooLq
	 5yVi+VORWTxAeqPJDadxo+BwpW8sF8rxP8nQ3qGWvOya+rMXzwSD8JN9bTT1mbrIFV4WI
	 +g8wYjRzKT0AckMLnQNnrmtTPiK1ZtLnGidrs2NJ8r0BbgTmewqmwGMf/UooW1Na9VAc/
	 PxF7CSfEmHfhc2QsxRxiDlk4c5Cj9ynknId88jHajGy8mVNsdRLCP1i336mx19IQk40hp
	 Q4wZF6F16y3s/IoLnusSyE0kSWKCCqJrLQsuNdFYrb+1kkx+Oabz/V18RnCwbeJ1uHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792956721;
	bh=O55h2pElfQ2sOF05Whf8MU04RvLC08CLh4YX0MO1yHQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n94/bYc1RY8j+qzR1oKEuEEXDt0TZ8NhfJUUX6nLKuudPKhiKK+Y+HxjIUyikYlMM
	 2iYmRRR9DfYrs+O9G973P58V8slTkS5oCzqR5kk5W+brsyu/dU31IMIj9IOYh4eoAG
	 woptqkflyHcJWe2gM/s5kjjG170b2vJjVJo3pm/A/fjx9+vAo7cUmNwWFOM7GSRlqv
	 x3f3Y3sqX/vTRndHNCHSCh8ZwxBhCHPc/FZ66dfDeZjpIjEMQbc9INKyLr4r0W3Hp/
	 ASBOss6hkp51ubhUgwPd0eUO5QlpW5AYFDs1SXjBr/3SSTL9qK29jzutCag/LlXWdZ
	 Daba9bv+CbpQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34963405F6;
	Sun, 25 Oct 2026 19:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DF4079F
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 19:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 445F360600
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 19:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUaqLbLLo13j for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 19:31:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C6BBE605F7
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792956718;
 b=TTdD29ohFjsbrfTZfrykez9FfYY/aEKwxiw4jYz34DgtTwYjC2kfJh9In3R8tX5JAY+z
 IdSO2sUZ9fl7RBxP7WTOHYzow/25E4iGGyRPtksP23rJu8cufR6QOeb9pliGDAMmIPFpP
 mNJjFKEDAKy05pIrAt8R/D5drGWgRc17khcCt7HeodAUv3UfGrxOq4htC8lyMCyzIgGAx
 rt/Q5xKbFES6pQTCtJVCFTuoS3ZA3lhaZDS/PHFioxJ05TNZVuwVAyoc6vz2XhIxW/tUw
 zqHNeNEaqQHG2aifLXQc2S70Z44plJRQmzS9f2gyztyeUXnI1nDzV4dB0wDnKKewAlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792956718;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dyLRW33j5yGGL4kJgxiHySCtFxv0XRQJJHC6NmLurcE=;
 b=pVPGZtIxjziPtwGg7t9lHkyaO0+mutasbr3KJSZ5VyQAf3xkai/xZSGg1DuM/XMiG5L+
 1N4tdBtz+kQbcDo5K/oYVYDjtCSS2bJcP22x92/NucRaVDF+TnW+Oqlv8u6+l27bj2BkT
 WukJdnOKWirE9cSlsaNFJmW+HrMO5wiHfWbEe5I6isKrsAkoAYgN9941RRLnMI461Dmlj
 uYxsYHVlde8L3AlMriEjDpJhRdwpO8g8QC2WvxQDvYH3CVmC+ssVIJImuPMEsrOgLSet0
 pD0Cz85DPCHBwmZj7D568EOqmRfBVMyeY2KXMOPPF9cvGmWkFSyPxiMlUm3FzXDT0QQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="Ru80/kvD"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ru80/kvD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6BBE605F7
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 19:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792956713;
 bh=dyLRW33j5yGGL4kJgxiHySCtFxv0XRQJJHC6NmLurcE=;
 h=From:To:Cc:Subject:Date:From;
 b=Ru80/kvDGAO4evjsEa4gTTXT8g9Hnw5hBH1Rv+z010rfaPAaLIhuvylYpF4NM4mLw
 AGJWyAe/xWwW/xoY6dKR+dJv/WXk17XpdIpsJcZaPcZcylOeFVPYuS28Fr2hrSc7mQ
 rrNEIJnKwy1b6KEav7B23dt4aDosfcxFs5hzrTuWKVpTO37dNwfFQ0MpE9gQA8EKSr
 xwkEGT9btCahfbABjL4/23l5LNJxbNM28g1hbj4T+1tP17rh3NYmaiFE48y0Ejcsie
 S67jeM5VNwFQkS9ViBr2pZoQnLos8MoDl81N71560A1/BHrHGMvtO3H64XAGmouiX1
 I8IPEcNvPMrjQ==
X-KAS-Sym: v3:f51bdf72230551df:DL2RQHxfVLusE+QyG/rfy1DViW48zdpOJkDF07Semighb
 2hk//8/qDNrZ8lpUVPUwROXHy5hhDCEFwm8D1DiEyIhwNMdiERYY9CJP4DIzwX1jWk1DQyKjjJ7
 1z1aS1D8iMGuaSZSZyQfMgWXD7wkLboMlmrzAGJbkGyfuQtSrDlPEbRAHUQiXLoc8kMIRjAsUL8
 EU4mouN+ndrgtjpnvymtUUE/aUE3KjyOAF0qjmUqHNOLqSvHIfM48UIbOi0UnESAr3b83qMLA7b
 GJ/HyLvtSo6sDkHxyG3ZXij3bWmr74s722KXip1opaOhQ3AGS0e1zmkRAh1qoey8XlhtNDew==:
 ZtUMbUERFUMvPYgmPsKcgNmCLumwlhtT7Jfxvmuhbl+ME8rz4QeacSInYW+Ek7clIVJdfhMIm2a
 sJMIUMKHmRq4EPHLdcuirgcnKFS4FJsiUSDJLOvERqta+MQ4YrbpdULVhcLvNIcLX5qsS2maId3
 lEv+gOqRVGrmnWMPwZJ9PlUtqUrpwtKvHvKoNWi+TnDrd0VZOOk8HNz98th4cudQyYEbxFQZiRK
 BfCvcnX1TOzslJp8w+TIuR0RHoCMEWpERnpn+/SvkA0PlGhupvvEFBRB7TxuPZBXkjMe1+emSYS
 YNZdwC2I6nLz7psceOUtw2UagroYT0bp/j5Hh9O2RoHuTx0+OadPQPDL7oCfTORNsMfHP2VqIQa
 W2htY31n0AboBerxW5kP7/mjLpW0XrNyomsRImYvZqnUqihh21eVL2PIEUzRPCR5TJEzNT9wTn1
 RgQDSaru2N41K3tv+2rX95sbJJaXP3KTY3gJGnXWwbtYBMI446TYgERm+o/WO+Etsftvl83Za7K
 fXPbNKf3UZDaeY6vanjhwQQALK2Bvvi6/HMlC3ovF1NQZD1yqJFnDLwzci0qkq7SOZCx0tqWHok
 ErLOUqUEHkt8qaKKt3VhfrUCqiay5y6g5p0OxKG7m2dgnS3Ywu0pg5lMovMY
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D4144A4C693D;
 Sun, 25 Oct 2026 20:31:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38034)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL3we-0000000084A-2ldM;
 Sun, 25 Oct 2026 19:31:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Oct 2026 20:31:52 +0100
Message-ID: <20261025193152.2632299-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/tpm2-openssl: Fix build with
 OpenSSL 4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 0003 fixes the build error and needs patch 0002 to be applied
cleanly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/5f1418b2096b88dc0340d0478eb677b84e16d90c

 ...g-of-parent-handles-in-TPM-TSS2-keys.patch | 118 ++++++++++++++++++
 ...key-fix-compilation-with-OpenSSL-4.1.patch |  88 +++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 package/tpm2-openssl/0002-fix-loading-of-parent-handles-in-TPM-TSS2-keys.patch
 create mode 100644 package/tpm2-openssl/0003-pkey-fix-compilation-with-OpenSSL-4.1.patch

diff --git a/package/tpm2-openssl/0002-fix-loading-of-parent-handles-in-TPM-TSS2-keys.patch b/package/tpm2-openssl/0002-fix-loading-of-parent-handles-in-TPM-TSS2-keys.patch
new file mode 100644
index 0000000000..4997fecc9e
--- /dev/null
+++ b/package/tpm2-openssl/0002-fix-loading-of-parent-handles-in-TPM-TSS2-keys.patch
@@ -0,0 +1,118 @@
+From ec1d2d1380521e9718552c2d0191d6aa26481ed5 Mon Sep 17 00:00:00 2001
+From: Petr Gotthard <petr.gotthard@advantech.cz>
+Date: Sat, 25 Apr 2026 20:06:16 +0200
+Subject: [PATCH] fix loading of parent handles in TPM TSS2 keys
+
+Fixes: #152
+
+Upstream: https://github.com/tpm2-software/tpm2-openssl/commit/ec1d2d1380521e9718552c2d0191d6aa26481ed5
+
+[backported without new tests]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.am                           |  2 ++
+ src/tpm2-provider-pkey.c              | 38 ++++++++++++++++++---------
+ test/rsa_encodeobject_check.sh        | 27 +++++++++++++++++++
+ test/rsa_encodeobject_check_parent.sh | 29 ++++++++++++++++++++
+ 4 files changed, 84 insertions(+), 12 deletions(-)
+ create mode 100755 test/rsa_encodeobject_check.sh
+ create mode 100755 test/rsa_encodeobject_check_parent.sh
+
+diff --git a/src/tpm2-provider-pkey.c b/src/tpm2-provider-pkey.c
+index f739c17..97fb4dd 100644
+--- a/src/tpm2-provider-pkey.c
++++ b/src/tpm2-provider-pkey.c
+@@ -53,6 +53,8 @@ int
+ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT format)
+ {
+     TSSPRIVKEY *tpk = NULL;
++    BIGNUM *bn_parent = NULL;
++    int res = 0;
+ 
+     uint8_t privbuf[sizeof(keydata->priv)];
+     uint8_t pubbuf[sizeof(keydata->pub)];
+@@ -74,13 +76,18 @@ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT form
+     if (!tpk->type)
+         goto error;
+ 
+-    // note the ASN1_INTEGER_set is not reliable for uin32_t on 32-bit machines
+     tpk->emptyAuth = ! !keydata->emptyAuth;
++
++    // note the ASN1_INTEGER_set is not reliable for uin32_t on 32-bit machines
++    if (!(bn_parent = BN_new()))
++        goto error;
++
+     if (keydata->parent != 0)
+-        ASN1_INTEGER_set_uint64(tpk->parent, keydata->parent);
++        BN_set_word(bn_parent, keydata->parent);
+     else
+-        ASN1_INTEGER_set_uint64(tpk->parent, TPM2_RH_OWNER);
++        BN_set_word(bn_parent, TPM2_RH_OWNER);
+ 
++    BN_to_ASN1_INTEGER(bn_parent, tpk->parent);
+     ASN1_STRING_set(tpk->privkey, &privbuf[0], privbuf_len);
+     ASN1_STRING_set(tpk->pubkey, &pubbuf[0], pubbuf_len);
+ 
+@@ -95,11 +102,11 @@ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT form
+         goto error;
+     }
+ 
+-    TSSPRIVKEY_free(tpk);
+-    return 1;
++    res = 1;
+ error:
++    BN_free(bn_parent);
+     TSSPRIVKEY_free(tpk);
+-    return 0;
++    return res;
+ }
+ 
+ /** Deserialize TPM2_KEYDATA from disk
+@@ -114,9 +121,11 @@ error:
+ int
+ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+ {
+-    uint64_t parent;
++    BIGNUM *bn_parent = NULL;
++    TPM2_HANDLE parent;
+     TSSPRIVKEY *tpk = NULL;
+     char type_oid[64];
++    int res = 0;
+ 
+     switch (format) {
+     case KEY_FORMAT_PEM:
+@@ -135,9 +144,14 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+     keydata->emptyAuth = (tpk->emptyAuth != V_ASN1_UNDEF && tpk->emptyAuth);
+ 
+     // the ASN1_INTEGER_get on a 32-bit machine will fail for numbers of UINT32_MAX
+-    if (!ASN1_INTEGER_get_uint64(&parent, tpk->parent))
++    if (!(bn_parent = ASN1_INTEGER_to_BN(tpk->parent, NULL)))
+         goto error;
+ 
++    if (BN_is_negative(bn_parent))
++        parent = ASN1_INTEGER_get(tpk->parent);
++    else
++        parent = BN_get_word(bn_parent);
++
+     if (parent == 0)
+         keydata->parent = TPM2_RH_OWNER;
+     else if (parent <= UINT32_MAX)
+@@ -159,11 +173,11 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+                                        &keydata->pub))
+         goto error;
+ 
++    res = 1;
++error:
++    BN_free(bn_parent);
+     TSSPRIVKEY_free(tpk);
+-    return 1;
+- error:
+-    TSSPRIVKEY_free(tpk);
+-    return 0;
++    return res;
+ }
+ 
+ static const TPM2B_PUBLIC primaryRsaTemplate = {
+-- 
+2.47.3
+
diff --git a/package/tpm2-openssl/0003-pkey-fix-compilation-with-OpenSSL-4.1.patch b/package/tpm2-openssl/0003-pkey-fix-compilation-with-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..5fb34ddfac
--- /dev/null
+++ b/package/tpm2-openssl/0003-pkey-fix-compilation-with-OpenSSL-4.1.patch
@@ -0,0 +1,88 @@
+From 9cc4cbe25702fc95c536dfb6723ae454e0039faf Mon Sep 17 00:00:00 2001
+From: Moritz Buhl <moritz.buhl@infineon.com>
+Date: Tue, 1 Sep 2026 09:58:28 +0200
+Subject: [PATCH] pkey: fix compilation with OpenSSL 4.1
+
+Avoid deprecated OpenSSL functions, add fallback defines for older
+versions:
+src/tpm2-provider-pkey.c:91:5: error: 'ASN1_STRING_set' is deprecated:
+Since OpenSSL 4.1; use ASN1_STRING_set1_data() or ASN1_STRING_set1_string()
+[-Werror,-Wdeprecated-declarations]
+src/tpm2-provider-pkey.c:165:41: error: 'ASN1_STRING_length' is deprecated:
+Since OpenSSL 4.1; use ASN1_STRING_get_length()
+[-Werror,-Wdeprecated-declarations]
+
+Add missing header:
+src/tpm2-provider-pkey.c:32:1: error: call to undeclared function 'ERR_raise';
+ISO C99 and later do not support implicit function declarations
+[-Wimplicit-function-declaration]
+
+Signed-off-by: Moritz Buhl <moritz.buhl@infineon.com>
+
+Upstream: https://github.com/tpm2-software/tpm2-openssl/commit/9cc4cbe25702fc95c536dfb6723ae454e0039faf
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tpm2-provider-pkey.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/tpm2-provider-pkey.c b/src/tpm2-provider-pkey.c
+index 84a5532..0d1d3f9 100644
+--- a/src/tpm2-provider-pkey.c
++++ b/src/tpm2-provider-pkey.c
+@@ -2,6 +2,8 @@
+ 
+ #include <string.h>
+ 
++#include <openssl/err.h>
++#include <openssl/opensslv.h>
+ #include <openssl/pem.h>
+ #include <openssl/rand.h>
+ 
+@@ -9,6 +11,14 @@
+ 
+ #include "tpm2-provider-pkey.h"
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x40100000
++#define TPM2_ASN1_STRING_get_length(x)		ASN1_STRING_get_length(x)
++#define TPM2_ASN1_STRING_set1_data(s, d, l)	ASN1_STRING_set1_data(s, d, l)
++#else
++#define TPM2_ASN1_STRING_get_length(x)		ASN1_STRING_length(x)
++#define TPM2_ASN1_STRING_set1_data(s, d, l)	ASN1_STRING_set(s, d, l)
++#endif
++
+ typedef struct {
+     ASN1_OBJECT *type;
+     ASN1_BOOLEAN emptyAuth;
+@@ -88,8 +98,8 @@ tpm2_keydata_write(const TPM2_KEYDATA *keydata, BIO *bout, TPM2_PKEY_FORMAT form
+         BN_set_word(bn_parent, TPM2_RH_OWNER);
+ 
+     BN_to_ASN1_INTEGER(bn_parent, tpk->parent);
+-    ASN1_STRING_set(tpk->privkey, &privbuf[0], privbuf_len);
+-    ASN1_STRING_set(tpk->pubkey, &pubbuf[0], pubbuf_len);
++    TPM2_ASN1_STRING_set1_data(tpk->privkey, &privbuf[0], privbuf_len);
++    TPM2_ASN1_STRING_set1_data(tpk->pubkey, &pubbuf[0], pubbuf_len);
+ 
+     switch (format) {
+     case KEY_FORMAT_PEM:
+@@ -162,13 +172,13 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+         goto error;
+ 
+     if (Tss2_MU_TPM2B_PRIVATE_Unmarshal(ASN1_STRING_get0_data(tpk->privkey),
+-                                        ASN1_STRING_length(tpk->privkey), NULL,
+-                                        &keydata->priv))
++                                        TPM2_ASN1_STRING_get_length(tpk->privkey),
++                                        NULL, &keydata->priv))
+         goto error;
+ 
+     if (Tss2_MU_TPM2B_PUBLIC_Unmarshal(ASN1_STRING_get0_data(tpk->pubkey),
+-                                       ASN1_STRING_length(tpk->pubkey), NULL,
+-                                       &keydata->pub))
++                                       TPM2_ASN1_STRING_get_length(tpk->pubkey),
++                                       NULL, &keydata->pub))
+         goto error;
+ 
+     res = 1;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
