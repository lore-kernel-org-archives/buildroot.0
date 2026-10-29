Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A584606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IVgopUAf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48AA860DD6;
	Fri, 30 Oct 2026 14:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRARSlVLK-0M; Fri, 30 Oct 2026 14:20:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D1D9260DC5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370059;
	b=H6+O2qLOtt64bpt9sXOhUfvd7RBZ96R9rwwIBLvX/5WOHB0ll/AhxJanuPEqCSaRVgpH
	 48Er6B9xH1pvBwxjqITA37+2o2a1ghj6HmH7uXwUtGd8Igl9nDUmSUqBOO6Ik2Qbeg8tW
	 Vz5mIFEBy5oqZgtVFeKMLKadxMsDXKVc51vhAyBPM8p+LD4rHJPrX0HJLMkMVaGz5dZHw
	 GAeaDI0Gj6Ht2qlbU2IYbyfl8d/Kw2A3HNLq0hna+ff0vgqXkFWZuNoYx+Ir0xdkDOEOy
	 1mL2AIc9zAnEkQ0oqmCQZmCr2DglAbIBG7R51EMUerF4LTiFfI1/pbERpzXuvnPjseg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ChvFmBbweikxvM/m/TWOyFYHIFQBiENsuDxvKBx+0s0=;
	b=tUrX9Mk9wUaaHDqbbk1Rxta8cATJXdUb0DdlKN/NyNyn+P4cRQbIHvsG4jKnwOeqo87N
	 hOjj8bBlTGXrctwd1Sgzw2yQO1Sr+iOqHS3T67/c/If/33OGdiZg9CWeJ/WIKJlvq56cY
	 Tx3LMN6ZTM0HJgDdg69icj6X48t9Su1DwPO+yJvX7mnt9W4c7zvEtKmxMCqsPNcwFQjdt
	 HH6XjucN0r6qheVHDINq/GKyf5gQMwqw0c28VNYrLSFlw8LF6ZUeGDaXsY83bCSL8AV7W
	 B4QFl3UuHE9SF6Ri6POh7I0jZcX227NBjnqAgzAnktojSfIUJQ0h0/tBBJLKnp6Sftw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370058;
	bh=ChvFmBbweikxvM/m/TWOyFYHIFQBiENsuDxvKBx+0s0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IVgopUAf74qyTZzGkegq+BRIKRtfKwT+Wsxrq3amvUU7LkGiw8TpUTldSsFWdTgcK
	 rFrFEPVDwELFEgyX3cgN9o9nMh4+psw2OSr0JCcf2YF4HE0yXA/ZTTfioB8BWvpdDb
	 j8/hIF9zvpehJZuTbk2hH3fB4ZxB6Mytge3k4ClJL4RzYhhTlXy2CFDxGWE+PHoY7D
	 uaXd6PVChDe2gaFCcSarqujLDsVxsPd2YdcRbLhq8aTtKlAMfodQkkSX1ZHRMHtLVW
	 tIYLRm0FhjhoXoddRqO8lyj/81PWzYZK2WFMvWV9ZQcgAVS7QwExwemKCm+P0W1Xif
	 rqTDsvxdmv8dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1D9260DC5;
	Fri, 30 Oct 2026 14:20:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A8394362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AE3F40243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uZ3cc30bMmo for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 72003400D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369897;
 b=ktukDpgLaffugSGRsK2Cse05Bs8zeg4gLtzj6IHgKYyqR6cUkF8sVnrqqCSPG5KxIanW
 7DPjxcID0rco3IEBAK4uG4iNx1/sCf3nJjKYTU4LDt747UylXAMRMuCzuOxnK7L5mYWCB
 efXJ3M1CgFyAHL7xRtKECX/lI4Rtlhv6GHlwnnnYrwKAvw+sJ+RsJnXQuMbl1p87vqMU7
 FOkcsLYt4m2Ab0gXWqaRuayLB7OU3vbpezy0IwAMaPK0O8iWXtY8d0FqGwaiuYmzRfUqv
 5IiEy8KnO6Ejs4+odduAmIahmPAv5vaqeN9n+gpfe4x2YEBlpz+HB6ssDgOEgIujg/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369897;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GK1TPwN+162J5Ktt1xPVSX79HSmxKrIsdhS9p370wmk=;
 b=dajdOQjFefcIzurcxH84mdGsTdzgUY9okdkn+RKIuyXi/94FfRSJ2qVxyrX68OxveF2m
 5rruetjHlCxrIcRQO9pGMdn0qZDj+vLJKFTexEXKBgvsSh9XXoI4IjX6jPiywplmULr+M
 bCSG+rJd2pl2rpl1tx6n55EF2pTTrn9W4R7/SxirE9xUOv488xz3KMBmLUaFpTEDv9QS8
 OWtPwqXH6LQLEXCX2mxuH9t6O3JIKHBmDcXcVWm5BJsH8Mytg3nfcvIYsvwFyaB4Of0lD
 yo4xSXFfSOcH/vlFupkCaTtT0rbg4kOtDblulOMqS6fzgi7BcFJaNV/++Nyma94Ie2A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72003400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 837C49D388; Fri, 30 Oct 2026 14:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:13 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d09335179f82122f90b75bfeb801e50256f36d34
X-Git-Newrev: 2384303e975f27ccbe827b91c180224278382c70
X-Patchwork-Hint: ignore
Message-Id: <20261030141649.837C49D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libabseil-cpp:
 require wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2633978061116748387=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2633978061116748387==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2384303e975f27ccbe827b91c180224278382c70
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit 3cb3f451a5b6ddf6dfff9f83c7f65c738df6d90a)
[Raphaël: fix conflicts (gcc8)]
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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
index d1ed36ef5e..ac645c66fe 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -694,13 +694,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # grpc -> libabseil-cpp
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
index 1c3e4d9bb8..91a5b47aac 100644
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
index 7664948b40..11d31350b9 100644
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
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "grpc needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
+		|| !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 45a8a44077..6ff203c705 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -673,6 +673,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	# All depends from webrtc-audio-processing
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -681,11 +682,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	help
 	  WebRTC echo-cancellation, gain control and noise suppression
 
-comment "webrtcdsp needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 8"
+comment "webrtcdsp needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
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
index 773791ce3c..f629498bc2 100644
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
 
-comment "libabseil-cpp needs a toolchain w/ gcc >= 8, C++, threads, dynamic library"
+comment "libabseil-cpp needs a toolchain w/ wchar, gcc >= 8, C++, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR
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
index 633201b38c..8cc674e3ac 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -45,6 +45,7 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBABSEIL_CPP
@@ -55,7 +56,7 @@ config BR2_PACKAGE_PROTOBUF
 
 	  https://developers.google.com/protocol-buffers
 
-comment "protobuf needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "protobuf needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/re2/Config.in b/package/re2/Config.in
index acc4bdbe46..ab3f5d7e99 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -14,8 +15,8 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "re2 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR
diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 3a3670f5cb..b791470d8f 100644
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
 
-comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
+comment "sysdig needs a glibc toolchain w/ C++, threads, wchar, gcc >= 8, dynamic library, a Linux kernel, and luajit or lua 5.1 to be built"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_LINUX_KERNEL || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_USES_GLIBC \
 		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 4c448b0352..993540c8e3 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 	bool "tensorflow-lite"
 	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # cpuinfo
 	depends on BR2_TOOLCHAIN_USES_GLIBC
@@ -31,8 +32,8 @@ config BR2_PACKAGE_TENSORFLOW_LITE
 
 	  https://www.tensorflow.org/
 
-comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 8, C++, threads, dynamic libraries"
+comment "tensorflow-lite needs a glibc toolchain w/ gcc >= 8, C++, threads, wchar, dynamic libraries"
 	depends on BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || \
 			!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_TOOLCHAIN_HAS_THREADS || \
-			BR2_STATIC_LIBS
+			BR2_STATIC_LIBS || !BR2_USE_WCHAR
diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index 254209ff64..07ae109ae9 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USBGUARD
 	bool "usbguard"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_USE_WCHAR # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf, C++17 filesystem
@@ -18,9 +19,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+comment "usbguard needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 comment "usbguard needs a toolchain not affected by GCC bug 64735"
diff --git a/package/webrtc-audio-processing/Config.in b/package/webrtc-audio-processing/Config.in
index cb3b21367b..ff7985d562 100644
--- a/package/webrtc-audio-processing/Config.in
+++ b/package/webrtc-audio-processing/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 	bool "webrtc-audio-processing"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp
 	# pthread_condattr_setclock
@@ -18,8 +19,9 @@ config BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING
 
 	  http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 
-comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 8"
+comment "webrtc-audio-processing needs a toolchain w/ C++, NPTL, wchar, dynamic library, gcc >= 8"
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
+		|| !BR2_USE_WCHAR

--===============2633978061116748387==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2633978061116748387==--
