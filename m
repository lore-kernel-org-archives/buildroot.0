Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4B606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P413hrnl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87CEB4055A;
	Fri, 30 Oct 2026 15:08:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JuUP9gTjwHSc; Fri, 30 Oct 2026 15:08:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 454204057B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793372912;
	b=TFJ++65e6x7kBehApMEgXrEdzQ7lhsXBC5sIoy4FDNSf63TiMOm4ISJ9N2PKeRkk755p
	 HB6QTWIsEpR9eriGOWRf0h7hAjG712t3WeAdXvZNvh9n2P8GUOcRRzLOuHhzj2u3eVm9+
	 eDIxHDquj1ePWJl5nkM3ehtxVwI36OPQnnBC3Zs32Bktby8JDc5t/a31H+W1OVQR1NG/o
	 ijNm/FwI36seOXGWoqk5oE9WF6THmOVavuxjh2lbvqs+hnnHTulJnMhivoCrtiKN0Rw7s
	 wKpCgH0EmTvOVcc1qB69l8vZatcdXEJvuP7ZqgGSLTuCZRztGB2CLmQxEbnJ0haZaCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793372912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5zoZTVhgIpj1jDBDQCNwd2ohmPBEWJRnAKhJ6JN9/gs=;
	b=pLaK6Bb+E7aYz3V9oAIegukHgQF7U5vmIIR3foV2a8WozLYZkuiYwaUdZzSHqUnqsMqq
	 5hRAcQLyRIIUvVg87l3PdsDxa/+pSQJVoSPt3Aqcoj3cOr/cZZ12AAVGmaizSr+9K59Kp
	 Zk9paY+6rqK7GoeIlZNfMB5UcrM5FlxlFDzlNX5VeQ4fLx4+r45SUqO0ssl+18EU8lYZV
	 5sS/oq28ACqvNXnk3Ex+Mici7sKtUVO49rlJYk82HKNy/iS4ao4IOklhVIp8WK10oAw5M
	 YzuCrXrQKgYXeSqeAzmm3GviAbNyrQrN5L7SwIqDXY5+1A4T6evluBDR509DJ3RSPNQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793372912;
	bh=5zoZTVhgIpj1jDBDQCNwd2ohmPBEWJRnAKhJ6JN9/gs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=P413hrnlnaSuhzIGF2Ktv1t8EsDVIL2VRbOX2o3dWx8K/iocLeS2RY5rjkQ9XoJCm
	 AWEE3gIldVQMEnhW08lfbzOI1DMxsR40WGGpPFM/Vrl8ePkFB/wD7R6lI3e8eoE1j7
	 33jthrx8iwPWrnghB6M2Nqxjyj0wzlHYzSHilWrhtE+uNdJaZrrDFIIkUpj7kydGPw
	 y1GXnX13aPE+XANKlzHXGELgpirxGyJqF6KEsoiaj4x9oAhbEicA4MThdsUPVKZfWb
	 mCXhM6sK4qKFQyvu2lm3DQqvlCfxgm+UnOKmVIfferrg9f80H7fc/iVNSPKgE+0CQe
	 XEUJlahrq6wIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454204057B;
	Fri, 30 Oct 2026 15:08:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB3A2712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD12A40535
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j4kI9VOI-aCu for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:08:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9994540211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793372909;
 b=BL8rkX4RJq/6gu52x9HEjQQTW8pXKQWNYoP3BUp2zi+9Tr/APZjJ7YS9zsHQMbSdpNAU
 eKv+ELx1KdrPduUtwLEAjdmi9PkfJy6xDBsgVTCNk/Y6sQhZTJl8PFquPchHvdGJ/LDLp
 67avrWqIYabbhz2C22Xl7pWiTWwRBVLfV57bezSzM1P36sIKtzqagoCjahn2TjoGsQ7PV
 9XgYQ7GB7MvXSbrTrHbJzReo0m/4FgSyvfjMwJYxyDacLkfJeQ7FhZd23t5apd7XNuY+m
 bgq3/DWO1+tQlNBWbDwF0Dn2fNRsBpZRzNnXFz/LxD7p+OKMchatgsQEhShe1/0400g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793372909;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=vXgA4TRYujY3bCqSD9hW+SqV8L2ovChPWPKterTtDXM=;
 b=g1AG86V/Yw8JtrgSJ46X5qSR+EjTlOP30D4jJWmbfA+sp2RBjEwuKUKZu0QhCo++GxzR
 Xvmk3afM4oTvGVTglJ6bqm01dL2Z7iiU0E6tFzgDm1twrXTMVfk4qirbN4TVt4MNR8guH
 vubBUyXD+o44VQMhfB01eAyURj1QY/gPctPUT8XLdZNIFbEMEmpCp676JDaYUDJHzyf50
 bDYrSCQc1nTBE7o5F8wL0enHB0pF/pl6xsaVXu7L/+QYN1OU0SEI+Se+5vTozbQYRL95Y
 ikX0gudJURqd5A8KeSOgHj8/fO3UzGFESFgfhbkIyvgBwDYMJlEx9Qyhw5YTiXQlYyQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=PTVHe9LV; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9994540211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:08:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOKc-1wXbTL2C2o-011SQo; Fri, 30
 Oct 2026 16:08:25 +0100
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Peter Seiderer <ps.report@gmx.net>
Date: Fri, 30 Oct 2026 16:08:21 +0100
Message-ID: <20261030150821.1464847-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:xcvdQO47kUthxevCx8cg068qy1G27K5BE0jPq+W3ffVPwqOPEVN
 t7vzzFQv0yS+EWLP2mjpHGpeEFfg0du/EONXlel7fRfVbvDISSEZqSLrKyShfxZnqwxnnrx
 3rwCDbzvDHei91CNWNwS0iTY7AQCFi0IFWqeABejlq65f5m0KupiETvr2/HILJKOdJXYKqe
 FA5tvU+++GKtMjGEaJf0g==
UI-OutboundReport: notjunk:1;M01:P0:riu/zwmgFno=;bcC1tGw3pq0MFF2PZBix/PwFcXl
 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
 +xt3dt1rv/uypP6FvYY64Y2kjtQRaQdh
Subject: [Buildroot] [PATCH v2] package/libressl: bump version to 4.4.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
index 6d6de78213..391c2ef19b 100644
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
+with # "Error: unknown architectural extension `sha2'
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
