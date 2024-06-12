Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8340C27C77
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 13:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 150DE81123;
	Wed, 12 Jun 2024 13:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aw6dYIO6C89Y; Wed, 12 Jun 2024 13:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 085FE81196
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 085FE81196;
	Wed, 12 Jun 2024 13:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1153A1BF371
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3087812EC
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0XGBPgGjscx5 for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 13:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6B38A81097
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B38A81097
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B38A81097
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 13:57:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.77]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1sdLDM3nLE-00yEtH; Wed, 12
 Jun 2024 15:57:28 +0200
To: buildroot@busybox.net
Date: Wed, 12 Jun 2024 15:57:27 +0200
Message-ID: <20240612135727.11811-5-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612135727.11811-1-ps.report@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CzNhRIV+LEGRiALN0N24Z9Qdh14A3KGjr4jo6etEIK5jmcys2oC
 vwpqH4Su7MOqgEapsHtF3IvB/Ekud5Ut7DGoy+zUB5K8KXM4H0gOcQNl0r+YoFJfAS0IhhC
 OzjCP4ZAGh+b16Ulg3PU68kmUSZzS+x7X6efmiYmgsk5Mg+IjfI9BeaWCsPstoLFv8E+VlF
 8BiZBsJuOM4pN795KP5Yw==
UI-OutboundReport: notjunk:1;M01:P0:/g4aE+LjVRg=;TS1yJ+dm+TDtrtNS/Sr1ymqOEP7
 G2zwz8QHmcx4PtH20SyXRHAeWgmAQgHR+7LO6j2dXn2UzEOuSgt9BnmSzvBg7FGZcLR6cXFtb
 dFcpD0kEGftltjrTHQ/PruTBhCe+6Kf2nTOFhuchmTVXbWO1/dYJiwTOW1JyS04Gd85EtaA5K
 V77kUKeli62Pgu2RLDWve/XQgFsYWjildZqYmQeRoS0Xn/a20Ngpc3OCxtEirl3reIgblIh8f
 Xuu5H0TqeiQZu6BUikeVGIzQEmZ0xfQERoVJRY4fIS6aEzjPki9WNaaeIBlmWgRt/3giqr2AM
 OCXG8WK6m3WHxon8+ghDAYhBvZNwF75iiqA255c49ATMuD1pg7BPGyRc52xhcCZA1t4/GhNju
 Wxoj4aLMcYNA2hhgerIpliluPmGjmKMPomAGBVBaIE80dQLo2H7XsPqn7Kt4fnRLVO6Hattun
 ARSlP5p9CHEnolp4YWkRve0dgfEMJuwv8rLtV3eP0T5gkTrFFKvVnSzpbre8N+Nr8t6U6bXDx
 VHHOtk6q5T1QFhf4DDV+5cbRsqZQ41IXWa8Ui3UrshqfTu5LcQEyFLZo4aQAkMYPuABE0Isf6
 73UloZkSmozB9cUIQCZLpPoo1WRrf2WWtlzQ2vKIiQAVi+FivC/Jm2S6TgNJ5LA9kF+lQ0mUW
 BppujBN5ytpUsp9R1U+C6Z0k7OXO7aFOzOmCZehEk91GC4jq6IS2S1oN+kYKI6PfWFW0Yellr
 o+eUm01tqkw1aa0E3Wn7Q8/oZxweDZRiSHAXKRtqpbTQBARLyw86XKhhbq5ZMGeNv6Hgsn4Bt
 1gBFBc5VjRN8FQ9djnQ3nJBzGS1lmXFZ601hgY/ZdekMo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1718200649; x=1718805449; i=ps.report@gmx.net;
 bh=oL3TlouHbkxV+9nf9b9oyD0ba3UQ5v6LtRF4cSlgn8w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tBdA/y1vayAFIsVWFBDjR04fTN8FKklWXN2TI4aluOUzXqMmxDoij+4hI1quMlIY
 cO7tZkRr7yLk8Ks4GJB6ToEBrdtJ7YNbgCQ+YUDzt5sF9MSTHel/3Nde4YnP/wRlw
 18RtyjJGkLflWFqDm5yjkIH78lYvOTBN9vP2rF9PZHiz6tlfO68lma3eGhWWggBI9
 +NPe6/SjaO2X2OVBKvZU32BwF/Qi1f9ZS/XnsUt/D6MuYJ6lq16HLxlCciewy6FFx
 O3Lpxgy3AqxgT63SDSMOSKP8ip9e9HXmfiUDA/ucN7gQONqUrJpTINlcDcvTTRXHX
 ZnZTBU2CID32C90W3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=tBdA/y1v
Subject: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
  1732     target_compile_definitions(xz PRIVATE ASSUME_RAM=128)

- '--enable-scripts' (see [1]: 'CMake: xzdiff, xzgrep, xzless, xzmore, and
  their symlinks are now installed')

- '--enable-symbol-versions': hard coded in the CMakeLists.txt file
  1297     target_compile_definitions(liblzma PRIVATE HAVE_SYMBOL_VERSIONS_LINUX=1)

- '--enable-rpath'

- '--enable-largefile': see CMakeLists.txt
  245 # Check for large file support. It's required on some 32-bit platforms and
  246 # even on 64-bit MinGW-w64 to get 64-bit off_t. This can be forced off on
  247 # the CMake command line if needed: -DLARGE_FILE_SUPPORT=OFF
  248 tuklib_large_file_support(ALL)

- '--enable-unaligned-access=auto': see CMakeLists.txt and cmake/tuklib_integer.cmake
   250 # This is needed by liblzma and xz.
   251 tuklib_integer(ALL)

- '--disable-unsafe-type-punning' see CMakeLists.txt and cmake/tuklib_integer.cmake
   250 # This is needed by liblzma and xz.
   251 tuklib_integer(ALL)

- '--disable-werror'

- '--enable-year2038'

[1] https://github.com/tukaani-project/xz/releases/tag/v5.6.0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
 - remove '-DUSE_ATTR_IFUNC=ON' (upstream removed)
 - adjust CMakeLists.txt reference line numbers
---
 package/xz/xz.mk | 57 +++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 35 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index d81d0cf4ce..6f8a564887 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -8,54 +8,41 @@ XZ_VERSION = 5.6.2
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
@@ -63,5 +50,5 @@ HOST_XZ_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
 	CXX="$(HOSTCXX_NOCCACHE)"
 
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
