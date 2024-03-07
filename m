Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BDEC54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 16:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7C5A41944;
	Thu,  7 Mar 2024 16:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkFV4MbyHO3p; Thu,  7 Mar 2024 16:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A346841B67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A346841B67;
	Thu,  7 Mar 2024 16:52:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7D41BF5AA
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DFF882969
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 16:52:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i5bE-GDs5Hy4 for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 16:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B727F82951
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B727F82951
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B727F82951
 for <buildroot@busybox.net>; Thu,  7 Mar 2024 16:52:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.100]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MMGRA-1rSGGI0Oak-00JKkw; Thu, 07 Mar 2024 17:52:20 +0100
To: buildroot@busybox.net
Date: Thu,  7 Mar 2024 17:52:18 +0100
Message-ID: <20240307165218.10027-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307165218.10027-1-ps.report@gmx.net>
References: <20240307165218.10027-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:i6QEvhKxOtmH2OUjoGq+xmgRQ8W2TbLR4kO8TVQbhSevmuUuW8r
 8SjamR+6EElpQ/18J40yNoxWdHSwb5D7gPqxFbOlhUHHmp1JLPirh0a36pxDZHOG3dovWjG
 ULaWXNGJ+bLCkBf+WoFzkCSyv0QOGZZIEZX2xLb2XQ2XLuXXjIGoQXVTJs9YWfHQqQBkNnU
 cbYQhwVVMJA8CojYnTwSQ==
UI-OutboundReport: notjunk:1;M01:P0:+iXzbcedzy0=;lsqL8rOk8yKyyb+xMjPwKXKrRTX
 kgmVYjeLHR+JSV6A3WVngtJJ+yNsKjb9EY2XCx3rTakpr8kgK8BfxqxtCZB6paah6OY259GW4
 0GXmQYLD1P3Sb/OkmC6ym1JbnEC14+wzonccHhtXXO8a94x6l/P/ZyugLZkVEwb7pHo5iiNmd
 TlxGKjmQeqFBF2PHKrcENCk+mWq2y9s9PVzCGXcxfU7TxPx5I4Ynw385EZFvmU1CYSh6EU76z
 e6NiUyKUyKwMlfzHcv2qK8dkDSUFO0hZobPOqMnOQESrJQpOabKE2gs8X4GWGINqNyFM46OlU
 LxRaN+C7QrcBKfmGIUl7xQuKYD9L4SgMYMn3FQc8nMGqrPgPOY/hOVMgcezJfeBeb/MceIHUn
 eQVXTx2pxD+QNPjtOQjUPzYXVAHpTi6YSqIl4Fx2040NWrpstvC2mWLTzcIEFMMudvBHUXvMi
 guPum18n/AESMDyjAzsfjtCnOY1lEr4r46PjlY177M6gOTKqNWfhePn1mnhfsYR3hamd2FAtq
 jcHmgc21ME5A6zc2BC7xNgY6e9ISVUJUGdKoeZ/PVcOJKtNzY0wdCfZx0+gsE+UR/rzQGRdoe
 WowMxMxM2+2oc65tiFnhgbO04tZa4VNGF73Si+YZupAwmLKKu7X6O5gk+/RlqTvy1PA9ghtcp
 h0krtgD3cF8ce+W3/oaEdm8Kqh1s2cgdX8AORxuSzVana96ERbN7w4v1YjOxW6o5hqeXikW2O
 qshnZMJo7rPr0zcCmUcvfUt9Om8AQ4tUDH8pWyHH38u5vLSbcIwb7B2VhMlffv5ceVchtedHz
 5UuE3nQHbHAMQa3bBoKyXho1mVvkHoQ+dMPgvo9XdlsGw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1709830340; x=1710435140; i=ps.report@gmx.net;
 bh=vsTzfj+gf2CelyQ5tQ4H7kv80ovQRUcbbJiBt7v4pcc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=lJGBRoyyj2WPkRdA/7KkR4u9lu+loFMMpN5CB8ayZVT/ngKK6dI+Gn9XECC84h89
 FJIDEE7xa1qVtNv+lxhgiL9a55xYGYmRDSqPPlWYIqii3Z1O+JScHi6QUZJNsjfNp
 y9OMTUt8qBnzWsoi/95+Kui21CpTvvvnOnVU8ZjqpaUMD/OkCzl4essBOWghnZrbj
 APBPtLQKQOdsN8zhX75NW36yss+VhCi+K7P/ztrKh1JCrh62CdUlLhpRS20CoxEVC
 cEJVVOxtzvsbgCRds0EucG5nGL0FEqo/ruKRtN92P2vyFkEpBuGPyAmrJ0eJWRHOw
 ttBduPbT7Ky8MJl5zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=lJGBRoyy
Subject: [Buildroot] [RFC v1 4/4] package/xz: convert to cmake build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Convert to cmake build with the following autoconf options without
direct equivalent cmake option:

- '--disable-external-sha256'

- '--enable-assembler'

- '--enable-assume-ram=128': hard coded in the CMakeLists.txt file
  1685     target_compile_definitions(xz PRIVATE ASSUME_RAM=128)

- '--enable-scripts' (see [1]: 'CMake: xzdiff, xzgrep, xzless, xzmore, and
  their symlinks are now installed')

- '--enable-symbol-versions': hard coded in the CMakeLists.txt file
  1247     target_compile_definitions(liblzma PRIVATE HAVE_SYMBOL_VERSIONS_LINUX=1)

- '--enable-rpath'

- '--enable-largefile': see CMakeLists.txt
  233 # Check for large file support. It's required on some 32-bit platforms and
  234 # even on 64-bit MinGW-w64 to get 64-bit off_t. This can be forced off on
  235 # the CMake command line if needed: -DLARGE_FILE_SUPPORT=OFF
  236 tuklib_large_file_support(ALL)

- '--enable-unaligned-access=auto': see CMakeLists.txt and cmake/tuklib_integer.cmake
   238 # This is needed by liblzma and xz.
   239 tuklib_integer(ALL)

- '--disable-unsafe-type-punning' see CMakeLists.txt and cmake/tuklib_integer.cmake
   238 # This is needed by liblzma and xz.
   239 tuklib_integer(ALL)

- '--disable-werror'

- '--enable-year2038'

[1] https://github.com/tukaani-project/xz/releases/tag/v5.6.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/xz/xz.mk | 59 +++++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index 64dbec8b2e..1064d6a586 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -8,55 +8,42 @@ XZ_VERSION = 5.6.0
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
-XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
 XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 XZ_CONF_OPTS = \
-	--enable-encoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-	--enable-decoders=lzma1,lzma2,delta,x86,powerpc,ia64,arm,armthumb,arm64,sparc,riscv \
-	--enable-match-finders=hc3,hc4,bt2,bt3,bt4 \
-	--enable-checks=crc32,crc64,sha256 \
-	--disable-external-sha256 \
-	--enable-microlzma \
-	--enable-lzip-decoder \
-	--enable-assembler \
-	--enable-clmul-crc \
-	--enable-arm64-crc32 \
-	--disable-small \
-	--enable-assume-ram=128 \
-	--enable-xz \
-	--enable-xzdec \
-	--enable-lzmadec \
-	--enable-lzmainfo \
-	--enable-lzma-links \
-	--enable-scripts \
-	--enable-sandbox=auto \
-	--enable-symbol-versions \
-	--enable-rpath \
-	--enable-largfile \
-	--enable-ifunc \
-	--enable-unaligned-access=auto \
-	--disable-unsafe-type-punning \
-	--disable-werror \
-	--enable-year2038
+	-DENCODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
+	-DDECODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
+	-DMATCH_FINDERS="hc3;hc4;bt2;bt3;bt4" \
+	-DADDITIONAL_CHECK_TYPES="crc64;sha256" \
+	-DMICROLZMA_ENCODER=ON \
+	-DMICROLZMA_DECODER=ON \
+	-DLZIP_DECODER=ON \
+	-DALLOW_CLMUL_CRC=ON \
+	-DALLOW_ARM64_CRC32=ON \
+	-DENABLE_SMALL=OFF \
+	-DENABLE_SANDBOX=ON \
+	-DUSE_ATTR_IFUNC=ON \
+	-DCREATE_XZ_SYMLINKS=ON \
+	-DCREATE_LZMA_SYMLINKS=ON \
+	-DBUILD_SHARED_LIBS=OFF
 
 HOST_XZ_CONF_OPTS = \
 	$(XZ_CONF_OPTS) \
-	--enable-nls \
-	--enable-threads
+	-DENABLE_NLS=ON \
+	-DENABLE_THREADS=ON
 
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
-XZ_CONF_OPTS += --enable-nls
+XZ_CONF_OPTS += -DENABLE_NLS=ON
 else
-Z_CONF_OPTS += --disable-nls
+XZ_CONF_OPTS += -DENABLE_NLS=OFF
 endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-XZ_CONF_OPTS += --enable-threads
+XZ_CONF_OPTS += -DENABLE_THREADS=ON
 else
-XZ_CONF_OPTS += --disable-threads
+XZ_CONF_OPTS += -DENABLE_THREADS=OFF
 endif
 
 # we are built before ccache
@@ -64,5 +51,5 @@ HOST_XZ_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
 	CXX="$(HOSTCXX_NOCCACHE)"
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
