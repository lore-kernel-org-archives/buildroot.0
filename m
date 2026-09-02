Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF41CC61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 20:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F58C6081F;
	Wed,  2 Sep 2026 20:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbRXpJ1_VN1f; Wed,  2 Sep 2026 20:33:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8EE7760834
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788381202;
	b=La4pnPVRU/p0czUtD/XKYzOH/inIk2J8lIl61uUVny6ayGuuun+lcsu3/yrfLcTerDPc
	 A82K+iEIrp+c9I3+3sJ8gINaGner6CeUah1HiKblEKFsteyaJrXRfGihXCnPBDsa2xCGS
	 i3EP4fIJciLXtqcyokv28ORbwZHrJPBLtW8lK9UzBQClkoGR24wzBDy0Nzc1Tq0blMkl1
	 shdQUvYuzZ6GfR8RGrMasRfKn+I2O5wYydaOfiUF4GzIybT8xPca78M22aeNph3G8iNXa
	 /a8ML2A29ZmicyvL5whpzm7Jz+qAiCk5rpy9PZwSbrKS8ZilPWzU74tjDVYRDOMTDrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788381202;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=hcGJOCUflKjRzfcwlMgcxbkUVdEOwHfnqXPIs+kJgb4=;
	b=CJ4ZXAjIMnyhfP5P74JNeXlCF8jssd2rXwNshCgw5vh3GnB6Em+i+6+wH06hizWPfNdH
	 3UpMTgfzvQUx9hB0KMq1hOQMN5MwuOBDKXzkb0etdy5i/LOJ5FJo1cehiCUsUuDrt/RwA
	 fpY3YT36vcEakRCEDqOJkCN3c3YuhiCpwGptp3IHuqocGGSYPAwxF+sdXeiGuLlA7dhSO
	 pPXEMpF66DX9/RcJJb2pduFYQ/TSN0LW3bhlPRzO75J4q2ct4Zk/xnzpBiSI24bBcgQQU
	 cXawIXFtRRNgwibhUwz4dIYbnQnRmzyP0xhbF+W2o5+Y+jSOrR82xIRXHtHgrx1EJqw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788381202;
	bh=hcGJOCUflKjRzfcwlMgcxbkUVdEOwHfnqXPIs+kJgb4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZQ7NzLuTB8lLnm84Eas07APECXCXIMiLxIDJ3XUxvIt6LcKrSbs8IMPP+rO5aGrzQ
	 GG28IVzpQjUUIg26yPn4dM++mqr2mRnwPtlgQwu2mteEiC51soU+4h+BaO1R8slZ6X
	 z6Ih7hSmIL+1/2VOBuRhzZeJIzE3Z/t63+0LQ8KoGFaARcMnnAgq9beIEOuZGZ85HU
	 oMc6XLV/9gdO4Bi2xJbWxyVAtgpIMfMtrJy/bQ9wW3FGZlOFA7vSvR/fqjBWRNacBx
	 fCpuXaxV2E0w8F2bP164QZMNOCT8evlUihYJdjBvjksqbLUaXZHocHwRXU39oWJlrL
	 pDAYb7RFRn8eA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE7760834;
	Wed,  2 Sep 2026 20:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB9A2B2
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCA9440191
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_pSjjJ-29HE for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 20:33:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A438240158
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788381201;
 b=EmZr9KVumT81BS2V6ag/unbzM1KbrMUkXfApxxqD7c4IRqWiQPjJYYoNbG9xlku1IHez
 358MpUjcIQxwUhdFxVIBEJFa9JT4K+9PVQ17Ou8A0rtGfNToxn9ltAj2aeCyXQ9JIvLgk
 7xveX3MzaUOxzGSfeWLlNLFGHA+Lt0xyTZ5ZhHiry6B3PbHRMfu3GCL6tWemK+2hPn/U2
 GbSSckeWNsB4iIBcjTKoMXeUjUVJmmlA3imdgEiwLi2rBx4BFU4HLqAaCKXiYZ3YKcija
 ZmYJ41Rd/3BMOYEFv8Eca+HrO5DVjy67nJxGtFvMvZsWLor2KVLlB3LR3+8CjNo1OlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788381201;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=xJIvA5oT9GjTiokdPGSOFV7nyERcSlLJip3Mc7eJ8/Y=;
 b=g+ktA3/O1Z1iOvVZ/0wagnNpOp88Si+U59wepTaOPB6JgvC/6058mqduB4bV16Ft8+x8
 Ya4WKGltiTFoNuG6OhNtOp8TgG0MDq7USCA3Lq2mnyO12KCe9OiO8NPiE3M3dIMivVheJ
 3KHcmG0Q2NpbLKor3zalg/NN9CYOFlj79bGF3Ei3lxxeM+X+hmD9xNum1QQxq+VKC7rbr
 la27871+iWwDXdpr/J8nO1Rnp6xCAxPom6XsCh8FGV4g109GAW7wS49LxePcRCmuX7vY9
 Jt7BcnJUValAjWHYyrlI/bbxx75EEElq4vhZ4JAbS5WeSMHAJGRgoknSnALndJM6ANA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YBlS3i3z; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YBlS3i3z
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A438240158
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 20:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788381197;
 bh=xJIvA5oT9GjTiokdPGSOFV7nyERcSlLJip3Mc7eJ8/Y=;
 h=From:To:Cc:Subject:Date:From;
 b=YBlS3i3zfjpGijHXkG7CXtTnZJSsPm/r3zk0Vx3JQygwyg5dAL4Ts8EAOuFuKOdJ1
 TxLhezqS5hSDefSgJiwV9aMJnxAvnDl3PMu+27bZOqkNhEqzzHSYVB7NeQAUSKdEB6
 umV1cA3OQDGezMpiBfYyJQSzRod5aTYdKuRYM1bT7jojjFW9WOLd7w5rjLwipjA+U4
 ygnuX6Gp87jNjuHchvhWZVKJUmDwscorRciY7Hj4ucWe1iOkGlTqFA3+rSAEZA0f14
 I1wneoRRJjHoDQVa8BkVK0guccTTsL8/bXHAFuFLjnOS/j6N5LZ4oue2CVVvdriWqf
 WBVWCFWe7VYZA==
Received: from fli4l.lan.fli4l (p54a1b089.dip0.t-ipconnect.de [84.161.176.137])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F4BBA4C0F4C;
 Wed,  2 Sep 2026 22:33:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47194)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x1re1-000000007IW-0RNa;
 Wed, 02 Sep 2026 20:33:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  2 Sep 2026 22:33:15 +0200
Message-ID: <20260902203317.2400170-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 1/2] package/libopenssl: disable atomic
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
