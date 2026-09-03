Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA4AC624D4
	for <buildroot@archiver.kernel.org>; Thu,  3 Sep 2026 06:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE14281028;
	Thu,  3 Sep 2026 06:39:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXgkKajf82iv; Thu,  3 Sep 2026 06:39:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D691C8102F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788417574;
	b=bAZNLYFXzib782v5CvIdQJUo9+VL4MF+8Zu4jBQyt8VtW/P7n9jwvwHI6w0j35rUTvVS
	 ypxFmTS13hFRKJi3I96XZPDK9SLUnzJ0i6NmB9FDzo4dmSpNrccDvZAN9yp80+uZEUMF4
	 /GOhu8dYYSOHGqLMG/3UASXa3r/Wqpz5Apx21BADrmVHFivZid7aFVafLns/Z6h/Sup6l
	 Xk8P2DtMt94KXrSp6TI9O4GPxzMdqI47C7fbFdllpUA8wlb4kgl4sUBJJRfvXp/y0DM4x
	 p9L84GO/NNEFwZ6bUGZCKGOVqcDbqdhJpPDFaIMy9kMA9HfzRTtxUZ7VfzxSFq60KBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788417574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=xaVgLRCvko6bXj9a+bs9q7/THlx0+HyxeJQawvHHDVo=;
	b=eVVh2HPMd4bKxn+mamvnmo+8J6KWT2dfZTMtpOfYy4taaHlRivzQcU4thbnpGvtDGt1R
	 lSM5h1ebGQtEq8ck3fO6F8DjzkCIS8DUbM0enOANtOTiLIzMtbceSVvmdeSIKFA0kS/su
	 QStXt+hrHrvLWeNcSwPzgjK4A52abOTcamS5wFT9jF0SXpM3wTTVR1YgKE04xtXhqN5mk
	 KYCnH/HS5fC+Ziz6SuOW6n3gIK8U10JrzjYADZbq9+DGS0I1339IM5sU0Cva7U7s5Osyj
	 LvYCnVzMV0BBRY017ZsmcQSesQdxaPOYoNw6yb+LWFqwdUzSrl5F3GIh6pl40Ygk9fQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788417573;
	bh=xaVgLRCvko6bXj9a+bs9q7/THlx0+HyxeJQawvHHDVo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F7WWd1CvRBjcRI/Pwvq42Pdjd19YKekhWuPHxTvux8meqmAeynwJLeF44lGV/9wLH
	 T+R0/MydQnZyyMl6CCuVEp+9ftvsKK2X2HPMBnkycdT9nWTswvD1wlZLVRDakH2sgT
	 VAVTcv/iIWBc+pc+uNDgrmNjGlNKRlCfhoAxatksqP6DRPBi8mKFOFKyONJC3Lb03n
	 Rk2zHQj4mCtwrQU07X0DSNz9Bw64bqc+xGSKSw37cmLARBBa2zTQEP9buFTLTZiC/Q
	 IZPh99996+PbGLLc3kfT8aY+cviUU912KHMcyD05HwhW/Nf8XPM7nBEKbu9RBqFOqQ
	 RWws2q2PxKwHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D691C8102F;
	Thu,  3 Sep 2026 06:39:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3631265
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 06:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A55F44011D
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 06:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAWEvNVNr8TL for <buildroot@buildroot.org>;
 Thu,  3 Sep 2026 06:39:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 71A0D4002B
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788417571;
 b=cVBS8NshjDscKYeM3Gx12tHGZA1U8ELJyrou6ya2W3gvCFRZKh1O+1dpqL0pdit+NYgp
 Z3yXa7iccvaHvGRMx2VX+jDJqMxAZvIPn0l3aPUOgHpXS3p58vO9itODvbpr970oJUoAw
 TLvLjbMUXJDw/3i2rKoCpGUhFu6mhGDZDvBVFUht1Dyscs+sA4rcJdE9ABszhBF711hUd
 u7J9XfUxhh3JdMOqQmqSYX35gCjIq/RK1bslzQ+N2i5rGaB3DiMAQMm7K2t9r3rxUlrZh
 UqFaUX3QlzYqwU6rtreRPHwJkB41rATKuux0Mu7vUTTId6ZxjFiiU9e4OYBWF05fq1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788417571;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=DqeadUSnOSGc9/Q2DGeks8pDjlQvKQonRM80Ca8Mdfw=;
 b=tCdBwBOy2cdB3o3+EF6949WbeN3NTOTkcM2DlNz5/UfqB8GF1CmBSxTqvdetbgiZ5uzs
 xrggIbKrW2h2zo38FmOStBgE4bTyjSooNbI6sOC7OaFmiPKOB2Xtfcg/nxrrseHhVHzps
 idFr+QvspkyQYyTPOu/37M1nIIRNn0YWB+5K1ZOm5NJiYI31KVo6H79jU9H26kH7LVSZr
 ui4FRXniVXIW+jrHkVsXtIRhFG7I/9kU2/JUTSjrx7ba3rxFYP+BV1hQH/9+mvjuxPzIB
 mQifND4WC7Is/NY7zOJrISbK+RfQDM+GMUI71IDsHzQROIhmKpQJ6KF1IWa/T8QaLug==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=keAWQbnf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=keAWQbnf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71A0D4002B
 for <buildroot@buildroot.org>; Thu,  3 Sep 2026 06:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788417554;
 bh=DqeadUSnOSGc9/Q2DGeks8pDjlQvKQonRM80Ca8Mdfw=;
 h=From:To:Cc:Subject:Date:From;
 b=keAWQbnfTbvaX+FKML3SuHEOQKCfwx5TEeyxHemE+mM1lMqkjBj4GItSZKZhLBOkl
 RDZfP/LbaEKh8N/Vjhx4bAwwyoMJThYqnpvbXll8Ou69zIkoser/TmC+z4yei1Fanr
 d06+xF85Vm7BuSmdEwS1XMaO/Da4+N/k6Hp2WmEeE15Ec07YSIBX3XTA9KqrGa4bfw
 K7cLklrIoczd8FiOAC5Na/RflqEuQFui1ydJDgdfLPJweqeulIhBzCcyb6AlMZrCpF
 KF7MJND63mMl/Ax5g/5H8qnRn7yo66pjcu+kiCXQaqKhGDmMG2q4hTWaUmCxdMHOm4
 YRhW6gpPVLtxg==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5FCE3A4C10A4;
 Thu,  3 Sep 2026 08:39:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54144)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x216P-000000005VA-3Bjf;
 Thu, 03 Sep 2026 06:39:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  3 Sep 2026 08:39:12 +0200
Message-ID: <20260903063913.73831-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 1/2] package/libopenssl: disable atomic
 operations for m68k Coldfire
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

This patch fixes a build error with OpenSSL-enabled libcurl which was
detected by the Gitlab pipelines:

checking for openssl options with pkg-config... found
configure: pkg-config: SSL_LIBS: "-lssl -lcrypto -pthread"
configure: pkg-config: SSL_LDFLAGS: "-L/builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib"
configure: pkg-config: SSL_CPPFLAGS: ""
checking for HMAC_Update in -lcrypto... no
checking for HMAC_Init_ex in -lcrypto... no
checking OpenSSL linking with -ldl... no
checking OpenSSL linking with -ldl and -lpthread... no
checking for SSL_set_quic_use_legacy_codepoint... no
checking for SSL_set_quic_tls_cbs... no
configure: OpenSSL version does not speak any known QUIC API
configure: OPT_OPENSSL: /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/host/m68k-buildroot-uclinux-uclibc/sysroot/usr
configure: OPENSSL_ENABLED:
configure: error: --with-openssl was given but OpenSSL could not be detected
make[1]: *** [package/pkg-generic.mk:263: /builds/bkuhls/buildroot/br-test-pkg/bootlin-m68k-5208-uclibc/build/libcurl-8.21.0/.stamp_configured] Error 1

Although OpenSSL was found using pkg-config the build tests fail.

A local build shows the concrete error in config.log, for example:

configure:27577: checking for HMAC_Update in -lcrypto
configure:27599: /home/bernd/buildroot/output/host/bin/m68k-linux-gcc
 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 -D_FILE_OFFSET_BITS=64 -O2 -g0 -fno-dwarf2-cfi-asm -Wl,-elf2flt=-r
 -static -Werror-implicit-function-declaration -Wno-system-headers
 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 -D_GNU_SOURCE     -Wl,-elf2flt=-r -static
 -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
 -L/home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib
 conftest.c -lcrypto  -lssl -lcrypto -lz -pthread -lz  >&5
/home/bernd/buildroot/output/host/opt/ext-toolchain/m68k-buildroot-uclinux-uclibc/bin/ld.real:
 /home/bernd/buildroot/output/host/bin/../m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libcrypto.a(libcrypto-lib-threads_pthread.o):
 in function `ossl_rcu_read_lock':
threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'

This error occurs many times for various atomic operations:

$ grep "undefined reference to \`__atomic" output/build/libcurl-8.20.0/config.log | sort -u | grep -v real
threads_pthread.c:(.text+0x28a): undefined reference to `__atomic_fetch_sub_8'
threads_pthread.c:(.text+0x3b4): undefined reference to `__atomic_fetch_add_8'
threads_pthread.c:(.text+0x9c8): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'
threads_pthread.c:(.text+0xa9c): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xb66): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xc30): undefined reference to `__atomic_is_lock_free'
threads_pthread.c:(.text+0xcdc): undefined reference to `__atomic_is_lock_free'

The build error can be reproduced with the current buildroot tree using
this defconfig:

BR2_m68k=y
BR2_m68k_cf5208=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_M68K_COLDFIRE_UCLIBC_STABLE=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBCURL=y

Although the toolchain lacks atomics support

$ grep ATOMIC .config
$

it emits atomic-related defines, for example:

$ echo | output/host/bin/m68k-linux-gcc -dM -E - | grep __ATOMIC_ACQ_REL
#define __ATOMIC_ACQ_REL 4
$

This specific define __ATOMIC_ACQ_REL is used in OpenSSL to enable
atomic support at various places:
https://github.com/openssl/openssl/blob/openssl-3.6.3/crypto/threads_pthread.c

causing the build errors we see with the mentioned defconfig.

To fix the problem we use an OpenSSL-provided define to forcefully
disable the usage of atomic intrinsics.

The misdetection of atomic intrinsics for m68k coldfire is not a new
problem:
https://lists.buildroot.org/pipermail/buildroot/2017-May/180841.html
https://lists.buildroot.org/pipermail/buildroot/2026-May/803110.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed patch description (Baruch)

 package/libopenssl/libopenssl.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 9ddc85c197..9b3eec4baa 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_m68k_cf),y)
 LIBOPENSSL_CFLAGS += -mxgot
 # resolves an assembler "out of range error" with blake2 and sha512 algorithms
 LIBOPENSSL_CFLAGS += -DOPENSSL_SMALL_FOOTPRINT
+# disable atomic operations
+ifeq ($(BR2_TOOLCHAIN_HAS_ATOMIC),)
+LIBOPENSSL_CFLAGS += -DBROKEN_CLANG_ATOMICS
+endif
 endif
 
 ifeq ($(BR2_USE_MMU),)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
