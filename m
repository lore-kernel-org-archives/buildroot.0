Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DED2C4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 07:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CC21400DD;
	Fri, 19 Jan 2024 07:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CC21400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xVbdqFKAIp2; Fri, 19 Jan 2024 07:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B2EA400E4;
	Fri, 19 Jan 2024 07:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B2EA400E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8961BF842
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 07:29:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7A8242883
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 07:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A8242883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZWxepZBt_M4i for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 07:29:46 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DB8541E19
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 07:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DB8541E19
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F115C1814B9; Fri, 19 Jan 2024 08:29:42 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 19 Jan 2024 08:29:27 +0100
Message-Id: <20240119072933.25453-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1705649383; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=TIXSE1xHP5Cw1WpUg5xbqGUc/8PiLMrxT465qmwe0YI=;
 b=S/XwB65wcz1KQxNoLoLjIp8rvVeXRZw/tnidau1lz+lXi41ewQvFiXD1bZnUcBIuTJry3G
 gv5hvABwXE1JaR21H0p3/up9UCv7L2SD+m5OYQmpaeyNIWI8Rx35wRTxILFOpVsTwhXkhZ
 qQprdbLmxi9nDESKKo7frX+2K6Cf/HE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=S/XwB65w
Subject: [Buildroot] [PATCH v2] package/protobuf-c: bump to version 1.5.0
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- drops support for proto2
- fixes compatibility with protobuf >= 22.0 (which we did not yet bump)
- to be compatible with new protobuf versions c++17 is now required
  when building with protoc (which we only do for the host package) [0]
  hence require host gcc >= 7 for c++17 support, propagate to depending packets

[0] https://github.com/protobuf-c/protobuf-c/pull/673

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---

v2:
- update the different Config.in comments according to review
- rephrase the requirement of C++17 for the host package
---
 package/collectd/Config.in         | 2 ++
 package/criu/Config.in             | 1 +
 package/kismet/Config.in           | 6 ++++--
 package/protobuf-c/Config.in       | 5 +++--
 package/protobuf-c/protobuf-c.hash | 4 ++--
 package/protobuf-c/protobuf-c.mk   | 6 +++---
 package/riemann-c-client/Config.in | 6 ++++--
 7 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index d3b686771d..145b9a2a3a 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -738,6 +738,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	# riemann-c-client -> protobuf-c
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
@@ -772,6 +773,7 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 	bool "write_prometheus"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF_C
 	help
diff --git a/package/criu/Config.in b/package/criu/Config.in
index 4c295acf4f..d223524eee 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	# BE/LE endian issues.
 	depends on BR2_USE_MMU # libcap
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 7bde6c92af..ea2b33fca7 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,8 +1,9 @@
-comment "kismet needs a toolchain w/ threads, C++, gcc >= 5"
+comment "kismet needs a toolchain w/ threads, C++, gcc >= 5, host-gcc >= 7"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_KISMET
@@ -11,6 +12,7 @@ config BR2_PACKAGE_KISMET
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_PROTOBUF_C
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index d96cd7b382..56b58afe99 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -4,12 +4,13 @@ config BR2_PACKAGE_PROTOBUF_C
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # c++17
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
 
 	  https://github.com/protobuf-c/protobuf-c
 
-comment "protobuf-c needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "protobuf-c needs a toolchain w/ C++, threads, host-gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/protobuf-c/protobuf-c.hash b/package/protobuf-c/protobuf-c.hash
index ec00442277..aafd98416a 100644
--- a/package/protobuf-c/protobuf-c.hash
+++ b/package/protobuf-c/protobuf-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4cc4facd508172f3e0a4d3a8736225d472418aee35b4ad053384b137b220339f  protobuf-c-1.4.1.tar.gz
-sha256  b8999cb392cc5bbe8cd679de59584ad8d2f26033123e76f1d662fa14b9d4f287  LICENSE
+sha256  7b404c63361ed35b3667aec75cc37b54298d56dd2bcf369de3373212cc06fd98  protobuf-c-1.5.0.tar.gz
+sha256  ad28bbf89340b86d15aad1ff62c4f4590025d836415307dc66cf0338235cc2f4  LICENSE
diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 0742a33db2..ccabd4723f 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 1.4.1
+PROTOBUF_C_VERSION = 1.5.0
 PROTOBUF_C_SITE = https://github.com/protobuf-c/protobuf-c/releases/download/v$(PROTOBUF_C_VERSION)
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf host-pkgconf
@@ -15,8 +15,8 @@ PROTOBUF_C_LICENSE = BSD-2-Clause
 PROTOBUF_C_LICENSE_FILES = LICENSE
 PROTOBUF_C_CPE_ID_VENDOR = protobuf-c_project
 
-# host-protobuf needs c++11 (since 3.6.0)
-HOST_PROTOBUF_C_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
+# when building with protoc (from host-protobuf) c++17 is now required
+HOST_PROTOBUF_C_CONF_ENV += CXXFLAGS="$(HOST_CXXFLAGS) -std=c++17"
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
index 6c3c35caf8..ba6a665dab 100644
--- a/package/riemann-c-client/Config.in
+++ b/package/riemann-c-client/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Riemann-c-client is a C client library for the Riemann
@@ -12,6 +13,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 
 	  https://github.com/algernon/riemann-c-client
 
-comment "riemann-c-client needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "riemann-c-client needs a toolchain w/ C++, threads, host-gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
