Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6D3C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AA164023F;
	Mon,  5 Feb 2024 18:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA164023F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KXr2QAQTbvce; Mon,  5 Feb 2024 18:09:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 781B940468;
	Mon,  5 Feb 2024 18:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 781B940468
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 447BA1BF379
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D2B060AE6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D2B060AE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kw2ascHxzIIc for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:09:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7C8160AC3
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7C8160AC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D25CA86DC7; Mon,  5 Feb 2024 18:09:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 19:09:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6c33f3e89f7f26e5b7613a757c82c9efc62654a
X-Git-Newrev: e97fc89e7ba75f5f664161916b44e727820a04a5
X-Patchwork-Hint: ignore
Message-Id: <20240205180912.D25CA86DC7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protobuf-c: bump to version 1.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e97fc89e7ba75f5f664161916b44e727820a04a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- drops support for proto2
- fixes compatibility with protobuf >= 22.0 (which we did not yet bump)
- to be compatible with new protobuf versions c++17 is now required
  when building with protoc (which we only do for the host package) [0]
  hence require host gcc >= 7 for c++17 support, propagate to
  depending packages
- the license file has changed with a change of the copyright years,
  nothing else

[0] https://github.com/protobuf-c/protobuf-c/pull/673

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in         | 10 ++++++++--
 package/criu/Config.in             |  6 ++++--
 package/kismet/Config.in           |  6 ++++--
 package/protobuf-c/Config.in       |  5 +++--
 package/protobuf-c/protobuf-c.hash |  4 ++--
 package/protobuf-c/protobuf-c.mk   |  6 +++---
 package/riemann-c-client/Config.in |  6 ++++--
 7 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index d3b686771d..a0c367c78d 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -738,12 +738,17 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	# riemann-c-client -> protobuf-c
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
 	  Sends data to Riemann, a stream processing and monitoring
 	  system.
 
+comment "riemann needs a toolchain w/ C++, host gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+
 config BR2_PACKAGE_COLLECTD_UNIXSOCK
 	bool "unixsock"
 	help
@@ -772,14 +777,15 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 	bool "write_prometheus"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Publishes values using an embedded HTTP server, in a format
 	  compatible with Prometheus' collectd_exporter.
 
-comment "write_prometheus needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "write_prometheus needs a toolchain w/ C++, host gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_COLLECTD_WRITEREDIS
diff --git a/package/criu/Config.in b/package/criu/Config.in
index a5adc0cedd..30b131cd30 100644
--- a/package/criu/Config.in
+++ b/package/criu/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 config BR2_PACKAGE_CRIU
 	bool "criu"
 	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # -march=armv7-a+fp
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 # rseq.h
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no aio.h
@@ -43,9 +44,10 @@ config BR2_PACKAGE_CRIU
 
 	  https://criu.org/Main_Page
 
-comment "criu needs a glibc or musl toolchain w/ threads, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
+comment "criu needs a glibc or musl toolchain w/ threads, host gcc >= 7, gcc >= 8, headers >= 4.18, C++, dynamic library, wchar"
 	depends on BR2_PACKAGE_CRIU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18 \
 		|| BR2_TOOLCHAIN_USES_UCLIBC || !BR2_INSTALL_LIBSTDCPP \
-		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR
+		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
+		|| BR2_HOST_GCC_AT_LEAST_7
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 80e68743a5..2e1e0cfbd0 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,8 +1,9 @@
-comment "kismet needs a toolchain w/ threads, C++, gcc >= 5"
+comment "kismet needs a toolchain w/ threads, C++, gcc >= 5, host gcc >= 7"
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
index d96cd7b382..a438b32221 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -4,12 +4,13 @@ config BR2_PACKAGE_PROTOBUF_C
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_HOST_GCC_AT_LEAST_7 # c++17 for host variant
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
 
 	  https://github.com/protobuf-c/protobuf-c
 
-comment "protobuf-c needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "protobuf-c needs a toolchain w/ C++, threads, host gcc >= 7"
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
index 6c3c35caf8..0985972a8b 100644
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
+comment "riemann-c-client needs a toolchain w/ C++, threads, host gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_HOST_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
