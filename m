Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1A9606A329
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lrcqBU6U
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DAB180E42;
	Tue,  3 Nov 2026 08:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWjwRluZ7puU; Tue,  3 Nov 2026 08:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC46580E45
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793695973;
	b=sP/hI9xr7Dy+o8cswH2DWwaMoCa0D6nXx2z86Zq3Fxs0I3MgT9m+iPbHulXwSWYzOOod
	 rV9FG2UbPtmRZavPc8zq9HSW9KZSFAju+i0vCvhjYlXAtePdrdkOPnh4xHpiV0TJl5HUA
	 BVa7uKt6y6inlCoSlOy2tdEa4d9ZwBfzD5lpe0K5DjwdfP2DHd7fCTZYIQ941e1/KUFiD
	 1AmdcoeMzoGLmPo+UBee7N8NmD8XZw5m9k4bP9qbvj6wvhd2TID0aqM2/NssFh+biZgCf
	 BFZbSZrPk6WjskZzEoR+Cc5kjkmENuwkP/L08/qPk0Q0oCM8kSSAxET6ZKv5TXJz8ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793695973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jnYr+BIUmBIVOrShRqqUawEp/lmVJHaEgyNqttfNE7M=;
	b=HQqEm5Y5mURHTtmwSEA9bJ3VUwgzvTPXvOxAyDZopBVPmvMA0CRXTnlQFiDUvzdPrHHr
	 IPjG4fZrH/y2fiKoSW3DR3393cNbDi/gbXlBGBQ4XStD+6OOaVmrTFtcTK3YrqFn9qxct
	 rbeO9Hd30fuWlOGa2ftLaCYTO/D2pVhV5VigTKHv0qIo6BKmIVi2SJKiSCeuomSnbESBG
	 jMXjqORmQ9BZyPmwOWGfHT3frCBI/6X59mPTZtPflRuUnoWfSICzpZL/xgA+NBb9PLPTx
	 g2CULlegj+GZtgmV0ieh5pzYPY6Cl2Qf7zce+Mrn6L7rj54pTg9ysf73z/jaoJxfHWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793695973;
	bh=jnYr+BIUmBIVOrShRqqUawEp/lmVJHaEgyNqttfNE7M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=lrcqBU6UfuZ9NrqoGJAOI65BT2H2LeabyUtSN3miLMunNuUSdU6iqxJPFeQkJKgCA
	 kIiksQYFYr9HcCtd0IWtFIdQEN+LE4FHef9G91y8XakSkt7TppaW5RZKYz6ydeg1SB
	 0MVaE8eF69GLdq6T0SKtx911Z0m5SaCig1PN/5YTubtLh1ZB0/FA6sWCilW9zbCXwr
	 mgBskYdBMQTx/tt6gPzumLKaMwxiFZp67/mmCVEKMUWt01N0segM1S0K943NBUAF0o
	 w1bB9LjqibztkPuaBTl7zSUFHHqk4pCf+wVjxCfW5oBxhv8DYt/mhM6zwtIKugtLc0
	 dXwnr7zYjR8zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC46580E45;
	Tue,  3 Nov 2026 08:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B976411
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C77C401DB
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgvwNM_QcakI for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 08:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1130C40080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793695971;
 b=JLG49S94R5mSpBJvHS587u8D55I2hVvCJtff46exXlGcNR7ok6xxNwIcEy4WDE77tNkb
 MKPmGsMFIH/DvqVEqWv4TOjDT3iFIRdTvXVARxkzLJEz7kEETzMlfcvFBv1srzXAqPnQg
 /HwFv4yolBTRKi5byUuTy6cmW2Dx+odNRvwOGSnUOuiFkcJfLjZUcsKJSCr7Y1ITwY3Wr
 BSe53vnXKlbRjGA2FUf5IKFfDwzvzZM9Y7YVLMlFtIHxBUSHXuuHMhYdGio1o0Mjtcpve
 M/Uhq0yq0AXetzCxxrvT6J+/KRmUphMFLQ4Zm1+J8sGJOe2A8c3ID5v0S++ZCSNhNkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793695971;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=4XwEhOtbHjgFNjSmvtutscp7xN3cVhs4RxQAnR8wkZg=;
 b=QeS/0knKrEwJLXfv9k8ulfzxzbdKzC5uCqbKXK+ufJtT4j7JhsfbrbMUXH/TqKj7Ty/y
 KVhc/a4LpdLRnRLtoLFYIdb12KHzjx067NgiJbEmMBdl9elzC16fiGC/tr2jdOJItN4kS
 OJs3IDue+uL+4sehzhy+N1oiWVQ8AhEmG6Aookk5wsdUiI28kI89GY2DI7CSm+JZLT61b
 9aDM8bDTfN4yd4ydGc0yrulQn7gqgEnDLgf5s3/qZISezc45oXLufxZh/R3gsSV9Misb6
 xgour1oNYlJ0P2O9MPvpXtYR5O27t6I8IbHdJPGMyakZZHYizhIii+171zjCKbVN2KA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=Ujd2VTNJ; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1130C40080
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:52:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ygO-1xUEnJ0bQs-00BG1K; Tue, 03
 Nov 2026 09:52:47 +0100
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  3 Nov 2026 09:52:45 +0100
Message-ID: <20261103085245.57062-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:em/2Wb/PVQElQ3fd3uPEjOCxSrhuuoK0Go0Y1HvP38tyvEYTDS7
 /jWA5O3N7u/vNs2EO4w8qMsFZia/e00DnBbqxmnYwP0fni2K360aC8Wl4wVyB97b4tndiJB
 AEw4k9Chv/YTHpaD0GqbdYu65GgwNYtWXi/gi4RFeO0uMpgFujSQw2W8163ypdwwlA2sib7
 A5wvN1FrTDqvwdt3Ykyyg==
UI-OutboundReport: notjunk:1;M01:P0:wmn5xNQyZkA=;TRX04GIubVYCaTwCG+opqqhm8ql
 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
Subject: [Buildroot] [PATCH v4] package/libressl: bump version to 4.4.0
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

- add stack protector 'ENABLE_HARDENING=OFF' flag, fixes
  "undefined reference to `__stack_chk_fail_local'"

[1] https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.4.0-relnotes.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v3 -> v4:
 - add 'ENABLE_HARDENING=OFF' flag unconditionaly
  (suggested by Thomas Petazzoni)

Changes v2 -> v3:
 - fix 'ENABLE_ASM=OFF' comment formating

Changes v1 -> v2:
 - enable 'ENABLE_ASM=OFF' for aarch64
 - handle stack protector/ENABLE_HARDENING flag
---
 package/libressl/libressl.hash |  2 +-
 package/libressl/libressl.mk   | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

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
index 6d6de78213..44a28de674 100644
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
@@ -13,11 +13,15 @@ LIBRESSL_INSTALL_STAGING = YES
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
+LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=OFF
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
