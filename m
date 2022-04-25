Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53046C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 08:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E5260A92;
	Mon, 25 Apr 2022 08:16:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGmmI6KUXbut; Mon, 25 Apr 2022 08:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0809260A89;
	Mon, 25 Apr 2022 08:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B2751BF3D7
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3981580C2C
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 08:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=heine.tech
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbNVoh2pxXe8 for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 08:16:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3285F80BF3
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 08:16:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6C4D1814B9; Mon, 25 Apr 2022 10:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heine.tech; s=dkim;
 t=1650873982; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=b/1+XQ+J+GXOBfQSmPAag596QWd9wA8+tmAcN1lXrCE=;
 b=YBg2xPJ+lHJJp6UMTbWHixFmzQBuoRaNh0fOBUh0SsH5GTuBxxxz9qt9A7y92i6qR9XJ5a
 BydsxVheFRrv+UJKUm1CZ/cOKTB+k3Sl95YmJphjl442CgUF1w9d8U2fRKrZjgcIaewiPJ
 GsYt867LJc2d2Hhq6Bh70O4S67+lL6A=
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 10:05:44 +0200
Message-Id: <20220425080544.770047-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/1] package/grpc: bump to version 1.45.2
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

grpc now requires gcc >= 5.1
see https://groups.google.com/g/grpc-io/c/Plvp29818BE

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/grpc/Config.in |  6 +++---
 package/grpc/grpc.hash |  2 +-
 package/grpc/grpc.mk   | 10 +---------
 3 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index ad3ddbcf19..adba1cea52 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # protobuf, re2, libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5_1
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -19,9 +19,9 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.9"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 5.1"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5_1
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 6db2acd759..9e3a225a51 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8c05641b9f91cbc92f51cc4a5b3a226788d7a63f20af4ca7aaca50d92cc94a0d  grpc-1.44.0.tar.gz
+sha256  e18b16f7976aab9a36c14c38180f042bb0fd196b75c9fd6a20a2b5f934876ad6  grpc-1.45.2.tar.gz
 sha256  277adcc1dcef8359b1efb48e628635f88b40be8fbd64e82fd0169930d135d7a5  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 9138b4ea59..2f037b5d59 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.44.0
+GRPC_VERSION = 1.45.2
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0, BSD-3-Clause (third_party code), MPL-2.0 (etc/roots.pem)
 GRPC_LICENSE_FILES = LICENSE
@@ -63,14 +63,6 @@ GRPC_CFLAGS += -O0
 GRPC_CXXFLAGS += -O0
 endif
 
-# Toolchains older than gcc5 will fail to compile with -0s due to:
-# error: failure memory model cannot be stronger than success memory model for
-# '__atomic_compare_exchange', so we use -O2 in these cases
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5):$(BR2_OPTIMIZE_S),:y)
-GRPC_CFLAGS += -O2
-GRPC_CXXFLAGS += -O2
-endif
-
 GRPC_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
