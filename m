Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCB3FA3743
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 18:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 128028135F;
	Mon, 31 Oct 2022 18:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 128028135F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuCUtwuZZl7N; Mon, 31 Oct 2022 18:25:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 198B7812B6;
	Mon, 31 Oct 2022 18:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 198B7812B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 863131BF29D
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61FFB80F05
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 18:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61FFB80F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1GS1IFmiNwLq for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 18:25:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A23680EE0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A23680EE0
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 18:25:48 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout11.t-online.de (Postfix) with SMTP id 5BF281478B;
 Mon, 31 Oct 2022 19:25:18 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opZTJ-3lecXR0; Mon, 31 Oct 2022 19:25:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:59890)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opZTJ-0003iQ-1d;
 Mon, 31 Oct 2022 19:25:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 19:25:17 +0100
Message-Id: <20221031182517.263500-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031182517.263500-1-bernd.kuhls@t-online.de>
References: <20221031182517.263500-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667240718-01604ECF-13DDB630/0/0 CLEAN NORMAL
X-TOI-MSGID: e3a06f73-f07e-4d34-979d-b894b0f5b220
Subject: [Buildroot] [PATCH 3/3] package/p2pool: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...lation-and-JIT-support-on-aarch64_be.patch | 28 +++++++++++++++++++
 package/p2pool/Config.in                      | 25 +++++++++++++++++
 package/p2pool/p2pool.hash                    |  3 ++
 package/p2pool/p2pool.mk                      | 27 ++++++++++++++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/p2pool/0001-Fix-compilation-and-JIT-support-on-aarch64_be.patch
 create mode 100644 package/p2pool/Config.in
 create mode 100644 package/p2pool/p2pool.hash
 create mode 100644 package/p2pool/p2pool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7db7954871..3a2a15216e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -409,6 +409,7 @@ F:	package/minidlna/
 F:	package/mjpg-streamer/
 F:	package/monero/
 F:	package/nut/
+F:	package/p2pool/
 F:	package/perl-crypt-openssl-guess/
 F:	package/perl-crypt-openssl-random/
 F:	package/perl-crypt-openssl-rsa/
diff --git a/package/Config.in b/package/Config.in
index ac811bf2e4..d14e7473b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2181,6 +2181,7 @@ menu "Miscellaneous"
 	source "package/mobile-broadband-provider-info/Config.in"
 	source "package/monero/Config.in"
 	source "package/netdata/Config.in"
+	source "package/p2pool/Config.in"
 	source "package/proj/Config.in"
 	source "package/qemu/Config.in"
 	source "package/qpdf/Config.in"
diff --git a/package/p2pool/0001-Fix-compilation-and-JIT-support-on-aarch64_be.patch b/package/p2pool/0001-Fix-compilation-and-JIT-support-on-aarch64_be.patch
new file mode 100644
index 0000000000..4109856234
--- /dev/null
+++ b/package/p2pool/0001-Fix-compilation-and-JIT-support-on-aarch64_be.patch
@@ -0,0 +1,28 @@
+From 1e5f48aa9dcb8c17b645fa09544da08c7c9be432 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Mon, 31 Oct 2022 19:11:37 +0100
+Subject: [PATCH] Fix compilation and JIT support on aarch64_be
+
+Patch sent upstream: https://github.com/tevador/RandomX/pull/257
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ external/src/RandomX/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4b6ba9e..2812449 100644
+--- a/external/src/RandomX/CMakeLists.txt
++++ b/external/src/RandomX/CMakeLists.txt
+@@ -150,7 +150,7 @@ if(ARCH_ID STREQUAL "ppc64" OR ARCH_ID STREQUAL "ppc64le")
+ endif()
+ 
+ # ARMv8
+-if(ARM_ID STREQUAL "aarch64" OR ARM_ID STREQUAL "arm64" OR ARM_ID STREQUAL "armv8-a")
++if(ARM_ID STREQUAL "aarch64" OR ARM_ID STREQUAL "aarch64_be" OR ARM_ID STREQUAL "arm64" OR ARM_ID STREQUAL "armv8-a")
+   list(APPEND randomx_sources
+     src/jit_compiler_a64_static.S
+     src/jit_compiler_a64.cpp)
+-- 
+2.34.1
+
diff --git a/package/p2pool/Config.in b/package/p2pool/Config.in
new file mode 100644
index 0000000000..5717033748
--- /dev/null
+++ b/package/p2pool/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_P2POOL
+	bool "p2pool"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	# p2pool needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_MMU # libuv
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_ZEROMQ
+	help
+	  Decentralized pool for Monero mining
+
+	  https://p2pool.io/
+
+comment "monero needs a glibc or musl toolchain w/ C++, NPTL, dynamic library"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/p2pool/p2pool.hash b/package/p2pool/p2pool.hash
new file mode 100644
index 0000000000..b2d2ebd195
--- /dev/null
+++ b/package/p2pool/p2pool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ba00735eb0b6bd357c041492d2c8b76e9b39d397123611c4f32412e65d8aafca  p2pool-v2.4-br1.tar.gz
+sha256  605e9047a563c5c8396ffb18232aa4304ec56586aee537c45064c6fb425e44ad  LICENSE
diff --git a/package/p2pool/p2pool.mk b/package/p2pool/p2pool.mk
new file mode 100644
index 0000000000..75b3409b19
--- /dev/null
+++ b/package/p2pool/p2pool.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# p2pool
+#
+################################################################################
+
+P2POOL_VERSION = v2.4
+P2POOL_SITE_METHOD = git
+P2POOL_SITE = https://github.com/SChernykh/p2pool.git
+P2POOL_GIT_SUBMODULES = YES
+P2POOL_LICENSE = GPL-3.0+
+P2POOL_LICENSE_FILES = LICENSE
+P2POOL_DEPENDENCIES = libcurl libuv zeromq
+
+# prevent compiler warnings being treated as errors
+define P2POOL_REMOVE_WARNING_FLAGS
+	$(SED) '/set(WARNING_FLAGS/d' $(@D)/cmake/flags.cmake
+endef
+P2POOL_POST_PATCH_HOOKS += P2POOL_REMOVE_WARNING_FLAGS
+
+# Upstream provides no installation rule:
+#   *** No rule to make target 'install/fast'.  Stop.
+define P2POOL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/p2pool $(TARGET_DIR)/usr/bin/p2pool
+endef
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
