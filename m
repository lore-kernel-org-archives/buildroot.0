Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A06DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6A2860FB2;
	Mon,  4 Apr 2022 20:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyRLRYsYqsFp; Mon,  4 Apr 2022 20:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE58E60864;
	Mon,  4 Apr 2022 20:20:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF8B1BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D32A60B71
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LU0jTlfaWMEq for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A496068D
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 14EF882DF6; Mon,  4 Apr 2022 20:09:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 21:47:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 968450adfdf1042ddcd8a0ab157dd9747ec6ee8b
X-Git-Newrev: d949b4e26bc318f5f68f12e5e1634642ad08ba63
X-Patchwork-Hint: ignore
Message-Id: <20220404200948.14EF882DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/protobuf: add additional supported
 host architectures
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d949b4e26bc318f5f68f12e5e1634642ad08ba63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Move supported host architectures under
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS and propagate the reverse
dependency.

Add additional supported host architectures based on current
src/google/protobuf/stubs/platform_macros.h

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/collectd/Config.in         |  6 +++---
 package/kismet/Config.in           |  4 ++--
 package/protobuf-c/Config.in       |  4 ++--
 package/protobuf/Config.in         | 16 +++++++++++++++-
 package/python-protobuf/Config.in  |  2 +-
 package/riemann-c-client/Config.in |  4 ++--
 6 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 67413ffde0..43eef3bf66 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -725,7 +725,7 @@ config BR2_PACKAGE_COLLECTD_RIEMANN
 	bool "riemann"
 	# riemann-c-client -> protobuf-c
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	select BR2_PACKAGE_RIEMANN_C_CLIENT
 	select BR2_PACKAGE_LIBTOOL
 	help
@@ -759,7 +759,7 @@ config BR2_PACKAGE_COLLECTD_WRITELOG
 config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 	bool "write_prometheus"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
 	select BR2_PACKAGE_LIBMICROHTTPD
 	select BR2_PACKAGE_PROTOBUF_C
 	help
@@ -768,7 +768,7 @@ config BR2_PACKAGE_COLLECTD_WRITEPROMETHEUS
 
 comment "write_prometheus needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_COLLECTD_WRITEREDIS
 	bool "write_redis"
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 961d5f230e..7bde6c92af 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -3,14 +3,14 @@ comment "kismet needs a toolchain w/ threads, C++, gcc >= 5"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_KISMET
 	bool "kismet"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_PROTOBUF_C
diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index a32e6cd9e8..d96cd7b382 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PROTOBUF_C
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# host-protobuf only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
@@ -12,4 +12,4 @@ config BR2_PACKAGE_PROTOBUF_C
 
 comment "protobuf-c needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 46c820b9cf..47e987fa2b 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -14,6 +14,20 @@
 # and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
 #
 # host-protobuf only builds on certain architectures
+config BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
+	bool
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "arm"
+	default y if BR2_HOSTARCH = "mips"
+	default y if BR2_HOSTARCH = "mipsel"
+	default y if BR2_HOSTARCH = "powerpc"
+	default y if BR2_HOSTARCH = "powerpc64"
+	default y if BR2_HOSTARCH = "powerpc64le"
+	default y if BR2_HOSTARCH = "sparc"
+	default y if BR2_HOSTARCH = "sparc64"
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "x86_64"
+
 config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	bool
 	default y if BR2_arm
@@ -22,7 +36,7 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	default y if BR2_sparc64
 	default y if BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # fork()
 
 config BR2_PACKAGE_PROTOBUF
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 1af82112b4..7de463520d 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
 	# host-protobuf only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python implementation of the Google Protocol Buffers.
diff --git a/package/riemann-c-client/Config.in b/package/riemann-c-client/Config.in
index e9982b2fb0..6c3c35caf8 100644
--- a/package/riemann-c-client/Config.in
+++ b/package/riemann-c-client/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 	bool "riemann-c-client"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Riemann-c-client is a C client library for the Riemann
@@ -14,4 +14,4 @@ config BR2_PACKAGE_RIEMANN_C_CLIENT
 
 comment "riemann-c-client needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
