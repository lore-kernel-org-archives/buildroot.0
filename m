Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D76E606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hSBYKgT0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52B5240AD1;
	Fri, 30 Oct 2026 15:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zFepHNZnnXJY; Fri, 30 Oct 2026 15:20:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 56DC340AE1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793373604;
	b=M4NeuXGGDdnRsnXqBziQYLgpFKwViFpYJvGf2tb4vaY2HQZuYfpIHvGEQnYIqFCZ0LyI
	 Js/s8lfrJWfnOX8yiec3slhkXWas3aRI5HC2xDJ1WMuzj0hGzXRCIbF222TkRSB3zGnS+
	 XNnheBZYjsV5jG2ooNjiHGp8RHZPRN9I/k1Mb+aHHjsgGwVNrN1C2wc3yPTXCLtxcUtla
	 qzyG0ywOUJSAKjMVWaT/oKZMmun1ker2scVNj/9+7blVpuyeKR4T9S2mjs7XliNZD6R/J
	 qEXPkXIn9ktEeC81lA8/BO07V2FKJFKCCSOx5Gj6hEL1hDLgYXXyhZ5vxgbadKkYvcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BuBwSY6cHPzs2NtCJqnZfCR9wdDddnWiIuBUqqvERwM=;
	b=j4yUtrblNlsiMq1DvvBgDtpF4prkocLaKouR8avUzqP2WMZGgpu28h7E0xPDKHagatu0
	 qk25V40N5PlUAxkJVXU0jf+fcOGHH17wlVBA9k2UvrWiv23aGZt/VatvYMpsDhTcLSMBs
	 lur4E6OWoNzvVsGHl63y6OiRONApWk+IYopMa2zPbAsszooEMNe02sfRaxYtFCx3LTciy
	 iwCt1j24MQTMikgYHNbZBB5rK+PowCovgA+/4M2mGdafvrEcYjIBx3E7pVbtQ2nxIzwYL
	 +WO3TTGBEFEvHM9HpaYa2Hvc1aZLVc+hsTzWAXV6oRhj1IQso1Pi6vi3hCNYEWsrE5A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793373604;
	bh=BuBwSY6cHPzs2NtCJqnZfCR9wdDddnWiIuBUqqvERwM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hSBYKgT0zvaswBnISB9voC7Q/X4KzRLB1BMh7W1A4BpZ32g/G1mz7oy1d1K1wp0Zb
	 sAZdMvfTH0dwaPgfIMH5X3GJc3E8b8fQF6cOcMllk46b7Lg1Isv2+lbrLp8XAABo1y
	 /Q5FpqrculYWSaDevaBKVXoDTOrIk4uNElw6RdpmP3ATF+cUNYpwMSwxzPhZNOX8uE
	 1iWe9ocNqQRNg4cEb/HRizKHduIgvJw8qgw+fGhk6Ai4rR9FCpzcMzZwBRGmwkw5/z
	 DXqfn5qkVOCqUBKr6rmzPym20ZElX+9onnZex01ankC978yTdBQCJtYncAfMuuIllg
	 vEXqWVNzvSgaw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56DC340AE1;
	Fri, 30 Oct 2026 15:20:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B4FD362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62B514053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nU3wNScOHqA for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 14C3640530
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373595;
 b=DO/EQ0rtBcurNN7KeA27j2j6I1oc4KyUnurIoFfQl22OW7YVqctCx/LRy4waIHspyGoe
 NLVSdkNJmy61dmZkHqfus7mg8fcDzpgz5OjIsg+3dxx2Kwu+dMGCDIXpR+mfEmXSJQBdq
 Cy+dflBm+UTTOZIFu24RUvAdbM7fGz+HTsiO1Z+VZST+7RKZPq1RzD1ao/IiFQ00ZRkHZ
 lsfm+XHsIytm6dyk5Eaf3GznZyQXeYjKOo509JGplTA0RAXXBMg4cDlou2V6mPUwO3Ycz
 gM+kncLiRSeWvYwSBdifpfcjCl6xYbmFH3A5JcD6p3PWv2Ckb6bfRI3+G/Fzileq1sg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373595;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=xzxcD1e7HlAhAa/fN8t1xPc8h4yNNpUwDISQHDerMtk=;
 b=iXM1F3DhD6x/ucqsNSsxPmZLmTx2x/2vYkV7FDC7FUoyxg8N79KS97uZ69B5FH8GqdfA
 vpSdGb3uOKrTs0bBG1Kwetbfp3uTpHLpgCNkPeJj3zcT5r7yyN1yGdMqEfLltoNOfCQJV
 vHPp794+COIU0HRF2HTDzeHxwALJauYDmTx2yO8dgmj9Q4rlz4quCkx+kS3l/Ww2988mZ
 POZgcZnaB4LqkqGul0w20zxO0WIHTdsu1P0CwSA3LSB0dKYAYR3ERFg6+5h/q1pPX9n7p
 y44UVDHO8K4j8tUn3wyuNt+BBdlfVIlKodAxPf6kylJdAaV7Pg0LwIzS6j0sRwuCAHg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=IRvT0IM7; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14C3640530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:19:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1xCQPS2BTu-00VQuY; Fri, 30
 Oct 2026 16:19:52 +0100
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Peter Seiderer <ps.report@gmx.net>
Date: Fri, 30 Oct 2026 16:19:50 +0100
Message-ID: <20261030151950.1475253-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EI8vVf6mS5j6WLFuzI70/OsfrHsgdSjK0JE/sdHnuVFMLBJItn4
 qXmx8SEbboguXVojhpySQav2cASyTpxEhO35s6QNhECHz/TJ5S/NKjaPv/lcoFH5yAlN6pE
 icIRbt+SumnigbTtAQ2Lu0s8hatAIgZhnpgKdv5XtSQ6AIGoJ5laFPg3RaOqJmRLUBquE/l
 9/4plw2uSh0ieAkh99+Yg==
UI-OutboundReport: notjunk:1;M01:P0:ly/ehhSP4yA=;TA6IB1ZMYoSR6zPxiy5nevFECk6
 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
 vgsx9/nBYTSMh7LWNR864=
Subject: [Buildroot] [PATCH v3] package/libressl: bump version to 4.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

- bump version to 4.4.0 (for details see [1])

- enable 'ENABLE_ASM=OFF' for aarch64, fixes (for some combinations of
  gcc/binutils/target-cpu):
  bootlin-aarch64-glibc-old/build/libressl-4.4.0/crypto/sha/sha1_aarch64_ce.S:105: Error: unknown architectural extension `sha2'
  bootlin-aarch64-glibc-old/build/libressl-4.4.0/crypto/sha/sha1_aarch64_ce.S:156: Error: selected processor does not support `sha1c q18,s19,v28.4s'

- handle stack protector/ENABLE_HARDENING flag, fixes
  "undefined reference to `__stack_chk_fail_local'"

[1] https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.4.0-relnotes.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v2 -> v3:
 - fix 'ENABLE_ASM=OFF' comment formating

Changes v1 -> v2:
 - enable 'ENABLE_ASM=OFF' for aarch64
 - handle stack protector/ENABLE_HARDENING flag
---
 package/libressl/libressl.hash |  2 +-
 package/libressl/libressl.mk   | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index b64df284fc..e3978baa63 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  57c8b2f8c6f9505587abaeddab003ea243d615edb7ed71957968121fc6316bd6  libressl-4.3.4.tar.gz
+sha256  7d02522ad5070b9adb32eb253ecabce181184a3750cf65abac0675ee908687c1  libressl-4.4.0.tar.gz
 # Locally computed
 sha256  9853507b8821c3f277aa60bf554eade41441ef06b2df538d247183ad28789b7f  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 6d6de78213..a618079ea9 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 4.3.4
+LIBRESSL_VERSION = 4.4.0
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
@@ -13,11 +13,19 @@ LIBRESSL_INSTALL_STAGING = YES
 LIBRESSL_CONF_OPTS = -DLIBRESSL_TESTS=OFF -DOPENSSLDIR="/etc/ssl"
 
 # Otherwise fails to build with undefined reference to
-# `bn_mul_add_words'
-ifeq ($(BR2_powerpc)$(BR2_mips64)$(BR2_mips64el),y)
+# `bn_mul_add_words' or for some aarch64 combinations (gcc/binutils/target-cpu)
+# with "Error: unknown architectural extension `sha2'
+ifeq ($(BR2_aarch64)$(BR2_powerpc)$(BR2_mips64)$(BR2_mips64el),y)
 LIBRESSL_CONF_OPTS += -DENABLE_ASM=OFF
 endif
 
+# Avoid linking problem: "undefined reference to `__stack_chk_fail_local'"
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=ON
+else
+LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
 define LIBRESSL_REMOVE_BIN
 	$(RM) -f $(TARGET_DIR)/usr/bin/openssl
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
