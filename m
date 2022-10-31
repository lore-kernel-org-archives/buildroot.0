Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC9FFA3741
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 19:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC4FE408ED;
	Mon, 31 Oct 2022 19:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC4FE408ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D69v3kwKmk8u; Mon, 31 Oct 2022 19:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C747408D8;
	Mon, 31 Oct 2022 19:52:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C747408D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B40BF1BF3CD
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 19:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B9E940129
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 19:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B9E940129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2Hqe0IcMzur for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 19:52:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FA0B404D0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FA0B404D0
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 19:52:19 +0000 (UTC)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout11.t-online.de (Postfix) with SMTP id 65C2818172;
 Mon, 31 Oct 2022 20:52:17 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd89.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opapJ-1cw3290; Mon, 31 Oct 2022 20:52:05 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44498)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opapJ-00025N-1f;
 Mon, 31 Oct 2022 20:52:05 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 20:52:05 +0100
Message-Id: <20221031195205.429257-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031195205.429257-1-bernd.kuhls@t-online.de>
References: <20221031195205.429257-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667245925-FA45C742-3131A806/0/0 CLEAN NORMAL
X-TOI-MSGID: 3448dfd5-4ed5-4fe6-a396-867afb4337a0
Subject: [Buildroot] [PATCH v2 3/3] package/p2pool: new package
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
v2: disabled support for BR2_aarch64_be, not supported upstream:
    https://github.com/tevador/RandomX/pull/257

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/p2pool/Config.in   | 27 +++++++++++++++++++++++++++
 package/p2pool/p2pool.hash |  3 +++
 package/p2pool/p2pool.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
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
diff --git a/package/p2pool/Config.in b/package/p2pool/Config.in
new file mode 100644
index 0000000000..53f894e309
--- /dev/null
+++ b/package/p2pool/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_P2POOL
+	bool "p2pool"
+	depends on BR2_ARCH_IS_64
+	depends on !BR2_aarch64_be
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
+	depends on !BR2_aarch64_be
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
