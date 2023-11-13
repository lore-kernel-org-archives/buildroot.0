Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB061C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 21:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EFCE41BDD;
	Mon, 13 Nov 2023 21:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EFCE41BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JH2leywkntGr; Mon, 13 Nov 2023 21:27:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F077D41BF2;
	Mon, 13 Nov 2023 21:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F077D41BF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4DD961BF389
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31B8240129
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 21:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31B8240129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVhBhj9fBgqc for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 21:27:24 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5B3F400C6
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 21:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5B3F400C6
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CD59E1814B9; Mon, 13 Nov 2023 22:27:19 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 22:27:06 +0100
Message-Id: <20231113212707.1229840-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1699910840; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=6n6Uudou0Tf6tZUJHMyztevz2XuWeCO00bZ7VNpCc/s=;
 b=q9Rcu+jTN+/P5OruK9FXXSkABNCD2gq07TIq3mXf9PM8VWYUsOSOlFH20zosINoRtsbjIY
 so93sFWUQJYkjN2fsI7B6ZtHneeQz8K1+zJ4LLMWI08RI9fT5lSvuApjm1PJmClbQDOxvV
 0tj0JVOsPT3MXSoXmMEp9VzSsBs5ess=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=q9Rcu+jT
Subject: [Buildroot] [PATCH v2] package/libabseil-cpp: bump to version
 20230802.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Robert Rose <robertroyrose@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

abseil and other google tools are now subject to
"Google's Foundational C++ Support Policy" [0][1]. This currently mandates
gcc 7.3.1 and C++14 as minimum versions.

Since we don't have guards for patch versions of gcc 7 use gcc 8 as minimum.

[0] https://github.com/abseil/abseil-cpp/releases/tag/20230125.0
[1] https://github.com/google/oss-policies-info/blob/b842c39db88e6569dfe2cf98be434b03507cb503/foundational-cxx-support-matrix.md

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

v1 -> v2:
- bump minimum gcc from 7 to 8
---
 package/collectd/Config.in               | 6 +++---
 package/falcosecurity-libs/Config.in     | 2 +-
 package/grpc/Config.in                   | 6 +++---
 package/libabseil-cpp/Config.in          | 6 +++---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 6 +++---
 package/sysdig/Config.in                 | 6 +++---
 7 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index a431da79f1..d3b686771d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -683,15 +683,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc -> libabseil-cpp
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # grpc -> libabseil-cpp
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 	select BR2_PACKAGE_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
 
-comment "grpc needs a toolchain w/ C++, gcc >= 5"
+comment "grpc needs a toolchain w/ C++, gcc >= 8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index f101883384..028a0ed28b 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FALCOSECURITY_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # grpc, gtest
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # grpc -> libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # protobuf, tbb
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index db6425819b..afe0ea8450 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -19,9 +19,9 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 5"
+comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 45f339ff26..7b65ec40d0 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -31,7 +31,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 
 	  https://github.com/abseil/abseil-cpp
 
-comment "libabseil-cpp needs a toolchain w/ gcc >= 4.9, C++, threads, dynamic library"
+comment "libabseil-cpp needs a toolchain w/ gcc >= 8, C++, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 808bdbab29..c3fc0d85e1 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  91ac87d30cc6d79f9ab974c51874a704de9c2647c40f6932597329a282217ba8  libabseil-cpp-20220623.1.tar.gz
+sha256  987ce98f02eefbaf930d6e38ab16aa05737234d7afbab2d5c4ea7adbe50c28ed  libabseil-cpp-20230802.1.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index ceda106b7d..a5dfc8eb19 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20220623.1
+LIBABSEIL_CPP_VERSION = 20230802.1
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
 LIBABSEIL_CPP_INSTALL_STAGING = YES
 
 LIBABSEIL_CPP_CONF_OPTS = \
-	-DCMAKE_CXX_STANDARD=11 \
+	-DCMAKE_CXX_STANDARD=14 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
 HOST_LIBABSEIL_CPP_CONF_OPTS = \
-	-DCMAKE_CXX_STANDARD=11 \
+	-DCMAKE_CXX_STANDARD=14 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index c0a631bd49..3a3670f5cb 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
 	depends on BR2_LINUX_KERNEL # falcosecurity-libs
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # falcosecurity-libs
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # falcosecurity-libs -> grpc -> libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # falcosecurity-libs
 	depends on !BR2_STATIC_LIBS # falcosecurity-libs
 	depends on BR2_TOOLCHAIN_USES_GLIBC # falcosecurity-libs
@@ -23,12 +23,12 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 5, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
