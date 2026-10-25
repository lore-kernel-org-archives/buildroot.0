Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26953606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=b1VtrGX7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00FCE60607;
	Sun, 25 Oct 2026 21:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5RF26tT5o37; Sun, 25 Oct 2026 21:34:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 933296060B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792964064;
	b=ePVzgzkXLdNy8X7SxyTVfuI1g0fDL1uUPn+RQOfj6ke9XZYTsHMG0zjrEo5hBrTjcCRI
	 hV8Z2a1xKCMR0XUBjDISRfJsb5zu1p6jrheTnqNrS7YmptFuokmJXauQYlCB8fuQmCiHk
	 dLagoJS0PVnPx8w5SSLssXhZybymov/PZOmx71dYIGupgWkdhsQ1iokBDTZZyJfBBGS02
	 K3VUcGRl22iwH7EJTz6VOgXFgOp6ixxuCNvrQpXV2OBqUBDrSiR+fVYtT0V9ZXnlLK8Ib
	 GaDZTgev2dUw9b3ukM9T/xm8QbRFgpZbpmzxAettzDLO03triXh4pndSvY/gz9cuXAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792964064;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ycNcyPZ6o8HydgYqFA3IQgYqdEAoX5gkh02+i8MDxNo=;
	b=I3H4E2EGvaGC7bJsarziUfy73/r3hPHFndQ5i6puuzwLIryq2ih+hMuMJR/trHhBTbmH
	 dnhnyDGCWENxhsAZ2P/1v4Z+pAnLmgYmqA+3dzxUxns/tjMSpJbdGBmuqqe+zYsD5f7Y2
	 QXgkNUS0Lx9W9FB8KHW8jfBJc0EocsUNngbBzii7MvXyqpxt53g3vlawe4ot2NMWS/u2I
	 Pp2uFCxmxVg5OFA64oWBes3Iw1eKinq6cgShDb///ZB02qvLBUEEUFgwGBtJJnoOQdxAZ
	 h0UUPHPVCUdIRTgNPMrvP0wBqwQL8GOrcIEyy5+S6r7kvo0F0jpxRQ41ySthPLnMtUg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792964064;
	bh=ycNcyPZ6o8HydgYqFA3IQgYqdEAoX5gkh02+i8MDxNo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=b1VtrGX74zTBxqv7QoN4YRH53usuZ1UGCoGNrzxtQzN7+8eU7OrugueUFzEgQ0mQJ
	 ncmmQax9WFmIahV5Mu4TZ7oBs52beWtpfeN0l8ZXoQfUlarrEC2QyIR1iFQU6IeDgn
	 tZ8yX3mG2CGqDKVxYmI6KQKod5kxznXjGuIh9o7hNrFrU5x+mKNFh1jW04h1xA3CF6
	 zpycRGa73w9vbDGKpaOetAlnXNm7qRm8olRMdPyyrwseZOGqgicHkRDh5MVrpLyW9z
	 DRSBCFFAVbBKvYO3auyECTP6KTkCGmqVRM9KcGyJuVrf5Ae59O47Ve73S+csU/wVst
	 1UF4XGLi86M3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933296060B;
	Sun, 25 Oct 2026 21:34:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6322B356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54EB340070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVCLHNhG4c2j for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:34:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 253EA40057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792964062;
 b=ksg1pe4XVKixkMtTC3RynB7kqimKfgtVwg8+jjeVnO5oPq2FVEv359ZTkEgHSaMyjgQM
 tyzvDiytocoMZKnrcQs1yzKm/1g472hR1xHwnajSoE93vqzEn4MlC2Wg0m0+U66+ILfDb
 AKzvil+R2Z4Ny1ipTXOJ0o9QcL3jABEYhFS1hkhVLfuqDWzRBKZVt6LqAQ+BtkaufkLws
 i/Bhip1JZlpPgRKyRRa22QPU6iiNqsjcL9aa1uaBasV1bjB8A1ZRa3ZHv5/PqKPY7JhVv
 A9l2ua2YlUyXL6ZrNcnn/iAv8vx5t0BNbQVPtl4VP+aJKyJwg66M4FBOZJ7JdLWoSgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792964062;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Y9XT67jzFYBk1SQLPmXVeGldy3oYdIXE4uibqKCIrgo=;
 b=DaeOBBoM5Ydsl03gayndJ9yCn4boN85666PzccMObuovDp4K+FbZOpJn2hvBHTmkk5Jp
 1ofRUE4IpKMLdUzNVgL5z1wKtX89vFelAN8tB7si1q7EJ3zgaGJYyw6AalbkPlhufjsJ0
 yjU40ynJIyHxXclJgYHuScxUu5kRHxrrHTPgl+rLd9CX1QN9DNde+aOtNxJKmQrRQhEWZ
 jLNwC93b4HjyMSN7rfwSTkpSfuYUP2bJlgjL0FhYkirn+xTWb4LczLzD6d9BRNjoZhRIA
 jNGiH3zNMgZ7d3nJnNPoSJq59Kv9BXbFGZQ2zbcIxsYag6r4C+Z5EVejAtXjhzCxQUg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 253EA40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:34:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85DB49CEFD; Sun, 25 Oct 2026 21:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 22:32:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81d0026f25c1ef6f10db7eca0469689a85007e45
X-Git-Newrev: 3cb3f451a5b6ddf6dfff9f83c7f65c738df6d90a
X-Patchwork-Hint: ignore
Message-Id: <20261025213256.85DB49CEFD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: require wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3cb3f451a5b6ddf6dfff9f83c7f65c738df6d90a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

absl::StrFormat() unconditionally includes <cwchar>. So a toolchain
with wchar support is required.

This was introduced to abseil in [0] and landed in buildroot with the
bump to 20240722.0.

[0] https://github.com/abseil/abseil-cpp/commit/5dc2cc1a6a992e09d9cf930cdce7984640e2b7e0

Fixes:
https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//

Fixes: 0d40b47866 ("package/libabseil-cpp: bump to version 20240722.0")
Assisted-by: Github Copilot:GPT-6 Luna
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/collectd/Config.in                    | 6 ++++--
 package/falcosecurity-libs/Config.in          | 1 +
 package/grpc/Config.in                        | 6 ++++--
 package/gstreamer1/gst1-plugins-bad/Config.in | 6 ++++--
 package/kismet/Config.in                      | 5 +++--
 package/libabseil-cpp/Config.in               | 5 +++--
 package/netdata/Config.in                     | 5 +++--
 package/protobuf/Config.in                    | 5 +++--
 package/re2/Config.in                         | 5 +++--
 package/sysdig/Config.in                      | 6 ++++--
 package/tensorflow-lite/Config.in             | 5 +++--
 package/usbguard/Config.in                    | 5 +++--
 package/webrtc-audio-processing/Config.in     | 6 ++++--
 13 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 8df1f5fa9b..0b210c66a1 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -694,13 +694,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # grpc -> libabseil-cpp
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
+	depends on BR2_USE_WCHAR # grpc -> libabseil-cpp
 	select BR2_PACKAGE_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
 
-comment "grpc needs a toolchain w/ C++, gcc >= 8"
+comment "grpc needs a toolchain w/ C++, wchar, gcc >= 8"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
 
diff --git a/package/falcosecurity-libs/Config.in b/package/falcosecurity-libs/Config.in
index 9d9cbd12aa..66ee55f101 100644
--- a/package/falcosecurity-libs/Config.in
+++ b/package/falcosecurity-libs/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FALCOSECURITY_LIBS
 	bool
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # grpc
+	depends on BR2_USE_WCHAR # grpc -> libabseil-cpp
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index bdb31fc899..754ae16fea 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_GRPC
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp, re2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_LIBABSEIL_CPP
 	select BR2_PACKAGE_OPENSSL
@@ -19,9 +20,10 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
+comment "grpc needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0586b7f327..fd518c228d 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -673,6 +673,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	# All depends from webrtc-audio-processing
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -681,11 +682,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
+comment "webrtcdsp needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WPE
 	bool "wpe"
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 65c17baeaf..d03bf199f4 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -34,6 +34,7 @@ if BR2_PACKAGE_KISMET
 config BR2_PACKAGE_KISMET_PYTHON_TOOLS
 	bool "Install python tools"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_USE_WCHAR # protobuf
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	depends on BR2_PACKAGE_PYTHON3
@@ -52,12 +53,12 @@ comment "python tools needs python3"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 
-comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 8"
+comment "python tools needs a glibc or musl toolchain w/ wchar, dynamic library, gcc >= 8"
 	depends on BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_KISMET_SERVER
 	bool "Install server"
diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index feb4963042..aba065fca7 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
 	help
 	  Abseil is an open-source collection of C++ library code
 	  designed to augment the C++ standard library. The Abseil
@@ -35,7 +36,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP
 
 	  https://github.com/abseil/abseil-cpp
 
-comment "libabseil-cpp needs a toolchain w/ gcc >= 10, C++, threads, dynamic library"
+comment "libabseil-cpp needs a toolchain w/ wchar, gcc >= 10, C++, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 2c7d456528..65eba65ac0 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -23,14 +23,15 @@ if BR2_PACKAGE_NETDATA
 config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+comment "prometheus remote write backend needs a toolchain w/ wchar, gcc >= 10"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index ae4044ea32..1f30314c3f 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -45,6 +45,7 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBABSEIL_CPP
@@ -55,7 +56,7 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
+comment "protobuf needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/re2/Config.in b/package/re2/Config.in
index b2de476bad..4e90423865 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++17, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -14,8 +15,8 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
+comment "re2 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index a6e6809d82..73ac03e240 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SYSDIG
 	bool "sysdig"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # falcosecurity-libs
+	depends on BR2_USE_WCHAR # falcosecurity-libs -> libabseil-cpp
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # falcosecurity-libs
 	depends on BR2_LINUX_KERNEL # falcosecurity-libs
 	depends on BR2_INSTALL_LIBSTDCPP
@@ -23,12 +24,13 @@ config BR2_PACKAGE_SYSDIG
 
 	  https://github.com/draios/sysdig/wiki
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 10, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 2536112f99..6d2db7b2c2 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 	bool "tensorflow-lite"
 	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -31,8 +32,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 
 	  https://www.tensorflow.org/
 
-comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, dynamic libraries"
+comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 10, C++, threads, wchar, dynamic libraries"
 	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
 			!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_TOOLCHAIN_HAS_THREADS || \
-			BR2_STATIC_LIBS
+			BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index b71333aed9..7f9a95ad3c 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USBGUARD
 	bool "usbguard"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_USE_WCHAR # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
@@ -18,9 +19,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 10"
+comment "usbguard needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 comment "usbguard needs a toolchain not affected by GCC bug 64735"
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index 051985f5e3..f6cc4b6801 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libabseil-cpp
 	# pthread_condattr_setclock
@@ -18,8 +19,9 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 10"
+comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 10"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
