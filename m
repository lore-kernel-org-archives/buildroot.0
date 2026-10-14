Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 713B0C3DA7A
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 19:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12A4640790;
	Wed, 14 Oct 2026 19:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BINI1g8hifil; Wed, 14 Oct 2026 19:56:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1B3D1405E2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792007780;
	b=nq/5Xxm6LXVEAw7tS/jFWnQnF7eXeDCB5YRjDFJhk8HuwcsAmrd7Vi2qdu5IsFL16gvw
	 weKSwPV2WRFiXvqJLvTerjblZWV7VX04BPvUg+vreu3Tdvta+NiSBXqR0al6ik93gDgqw
	 pvDBSJ2Q6vRPeGIdt6jsa/mrQTWKUngCo8tnmr6LmStQw+je64X1pQ5e2fGLe39LP4zHZ
	 59xBdT88IHYPOWllPvShoQ55mq0ojXFbLTSAxa7Xv44s3X4jNpQzwn9W79KttsE5t+3c1
	 hrXLZuuFk/im/kV9Yvn1Bo2/aPSU+lxBeM0uPnLKu17M55/q2LkIfpL6G1/wG23flrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792007780;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pVl2mlNRdee+5QmE6VYVJGMgiJpOJ+flgVlyyc31L8g=;
	b=AGv1YOLcAtWEG/EgJd8iiZumFiCVbdgjSyPdmDwSPPqQ1a4wUnEOd8Ugmk8+ggqrq+lv
	 jHicwGPUf4BdXCeel6ypNV0r9H40gR34eJGNBuSbHRNIU4L3L246zov3U7PqKV5VTh5jN
	 aI2viUqmjPIzPsdK1p2L9N6VJK6X4ZGhdzMIo9FePJWNZcE3Hme8Wma2mewwYFzo+ythQ
	 xEt8fh2lGwJ1wr2+I8Ee9q6Zhazeo9AfqpHHVcyTbgGgWz8Iq1Smo407i+i73ur+RssOd
	 k04jMP/iVmHsoNgOtaReldlwY11GFsjo359K/o6C0nEq/+bAnA8iCVbqau4GLG5IHkg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792007780;
	bh=pVl2mlNRdee+5QmE6VYVJGMgiJpOJ+flgVlyyc31L8g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Xd7lRGEbUvHd0EWqK9JcNOWyZ5aer+BZE1VQy+OmYQ05dCIkuuaOOb97Xd7O010g/
	 aBJXtRXFd8ahJzYXPfqwXN5WfBVlfLxCvDOm+ZHFNlf1D9v4arB5IREJEFpvcFiYLN
	 oX+7ocBjSLTdPZbBqqTeChUM3To4EiWqjkxPOmxyP0xOP1xn932mnWbubOeLOjAzPE
	 cvrBVCIJtuakBBdopYgU52tv6mZ9794DcMjlorHb+SemRsNQDIo0ivo8IasA6A+S5p
	 BSjKgJl+f7ba4Jy5Uxuo9giXUuw5TDG4Z8Hvl8tmbdT8mJBErwEz9hnPcKHvHuvURV
	 NEk5kDGCV/GhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B3D1405E2;
	Wed, 14 Oct 2026 19:56:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 026112AC
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E831A60840
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vql6SHSqX22j for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 19:56:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 79178607E2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792007777;
 b=XnAWNP8xmpxnqc/AAswcZrvj5rf3hxjIYC99QSZtzg0btV8toifmGKYjIHG6qr0y+Pzj
 gFr8P9AIoOGhTwe67Q9VzDqY9EIqtAQmC1sghYHTGvjloe9cZJbfvMk9b5AhJdPQGiL57
 bWVR2A4VxrX2sgVT/MhwFyZR6AS5RHqfP25FXQlgiDSeUbJ08cB1C5RECvyZzigbe9YQh
 ccbXbQJ/vb3i/TZDKWvFlswiNPKlWprBLvmn38jaFWN12BEKLUWQ25ePT6vYz/0lpqzBo
 ljpffRVHwiGoP91JcXq1DS18Yu7ClPGsmAvZ8qoFoyqX38dm54G39F6OkjeI1H/jLGw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792007777;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=ljN50azVPvoPH/Jp/01N8wDDkIncf72RYoVcRcXo4uE=;
 b=raEKHszn9EyYPHd4cnO7TVODM88FJdvMLOvq6HFRQWtTRzDyb8l/1ZsZpjsTIwNu01/x
 LgC2NbYsse+0dZJRw7pE+TscG9ip2lkl9MajlUGTCJGp76Aq+OqfYQST2z+eyxIhL/dbv
 kDAf5uFPmomXLtvx/y3K9Pyf4PmROKCsqkBml8hIntcgTFeiFeMhk/qi+JU573Lme0+8w
 RoHf+hvt3qyxqmlXnoo7d4idAKSw6YwCdpTRuBYP8kVQlHfN51E3fFChO2/5vwfsdyCyN
 cXjvpJBFt/jywxStrzBdPsxWVjclggOV53RfwtVLv2dIGQ40f7jKqznnsnegwJpHgUw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=heine.tech;
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=Vzx5OKJa; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79178607E2
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 19:56:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 694761814BB; Wed, 14 Oct 2026 21:56:08 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 21:55:40 +0200
Message-ID: <20261014195542.257729-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v3] package/libabseil-cpp: require wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>,
 Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Robert Rose <robertroyrose@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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

---

V3: add Fixes with commit that introduced the issue to buildroot.

V2: - moved the depends from ARCH_SUPPORT directly on the symbol.
 - propagate that dependency to packages
 - update comment
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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
