Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BE4606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TqAwpLF6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EA6E40CAA;
	Fri, 30 Oct 2026 14:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lT_92YzYKTJp; Fri, 30 Oct 2026 14:08:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EF83F40C91
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369319;
	b=ZoAp90Qs97D9G8DLUq63L+pbuzxCHqFeKYyIn7WC8Vu1E2X3qUwanPGBbLGQQyUpsvSp
	 liP7NnAaKAi6xTqQX1BnVHiz2GM3SpJNtEJ9GFdfUjA/6GkArOy5CQHuRtkoVfJklcYPw
	 cP3Ebz5RaVIApBQQmD4t5jhYEc9pgICscXecopO4o/X3xZD6rfE1AwNWrp/w0NpRtIedg
	 FA8cpvPJMnbNjRL+kQ5gcYu6dL4Piqz4Mh2g5AN3ApRozynql2kedjwS1r2+D2AnlcgJJ
	 apQuosm/quqZQlJE0iSyEADbzLRfFxWwouxrR0uO8jJUQjlPmLOSiydakd53DC9RGPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pQvmrfMod+bIwVns7BM2tEswnYtPMxW5cw4Azh4qW3g=;
	b=P4R2ZDfFzQsCJ0VEFHOiOz/EE2JJ2lxKLXoxBqAl7eHRE1fXSwozbu3ghLkmZfM716Iy
	 Scdoc3qB5+T2N73NIJmEWkUTEbv8W/ywJOzYJxakTe7fhpv2e1qJ+zpVgHAulp2+VY2A4
	 F+4KylwqkjEHpddaZ+BgivjJYJgwDjwRp/mTXxyuF8LoP0zgRU7/sgJwWf7NoXsR/8KLz
	 Oz+2dVlq6EkJT+1l6eawko7tjv0WgiifeRi3JaFirUZYC6MfQAtdO1MeD+n+NUPvV0O7e
	 4tW+a5GF9BgQZ3FrwO/CQEkGU9jU7hKO/Iw+cbEyjkHURBvwKN0qBLSQZ1rUzcAWrSw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369319;
	bh=pQvmrfMod+bIwVns7BM2tEswnYtPMxW5cw4Azh4qW3g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TqAwpLF6cVZ+C0pu4s9vouc67b2+s2AX1/bI/HKca9MPWxpWt+wuZYQ5nixXganH3
	 WpYMLu7Sld47c0/OAtRYYYnXYQUkihNiArQ3xpbRn0Wd8bPj4aT8DK6HZ6ZuX3uEw4
	 YGYXOjSaYcor5oyF0toQX711gQeAXnrfmA2oP3d7XRYski+YJlttL1uAeRApk7EyDE
	 fc8taG8/0cT7h+gMdjPqKOGUeLKW3Ijk+CTz5LkvC475VIZFr2/TbE+HlD4msJ9Gb6
	 5uU2aHGcWjYciT5Pu8UOLUmFCfeApr0SGs9UJTB29cdVpWx6e5LfDhz+tpqnuuYebx
	 70qm4RsgpNhWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF83F40C91;
	Fri, 30 Oct 2026 14:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1009A362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09A0C40B2C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFyCYdg5n25B for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A9C840B33
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369169;
 b=dSIRTqEDtZMVQhIWXICIMYHbX4ZuSyk3yjq3qhwHasmmFbcz8nyBeQG/iVSbxHJPI7Df
 8foufV0eUQ3g7TQYUf5LQpLggsBVL50GcGt4OD0XEtvmQOhmdtOodUO/pSBgb4TdZ+QNW
 ylTkF4gRV5Lw5iSy9d5bpfi5MvNRYbtcMz1shzv3CepzN5Yz8qQPO/WjUqsyJv8MG5pdU
 uEgAh3kYDyDC6SSa3yvm31gTx8m7aUKb4RJqWya2VmYARVAF1ySK1gV0giQCsP8h0tIMs
 VHlaYjx5jdGX7S63IOSLYBr/Gp4gjmJkqQOhM75FnL16lbOoslW6E01zPRHnJVcEDZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369169;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fBngTzRuTRN+g+M0nubP3izECOquubKwUjCA27/w66U=;
 b=rFpgGXFQ9MmQQtLWaP/u8UJfdh/e62DUnu1QOyclV7aaNTxSxA1j11gcMYQ9T8O8ofdf
 B8wir74zsow4K94ukK6ENiPalSf2YhlO2jWkLVEITpimuySw/Q50dLNfy0YQYPe9wGggS
 TeQTec9VBsIBPf3Vzu4rcDO2GRXXaiTFx5NsPYu6EUvk+yLcDTQYp9KfVs9e50Yw3Nfej
 ttis7u11DUOIjvWZmmMUpqVnWDwjhg+EJPsQ0w8fcQAuXwuY08XV5EW+1aCpSj+ZTs5XM
 hFRLYjnTIp7cHj/M5UewEoOaWFGsAKutMQK4iLyAv4N5ImfQCNFudYPaH+U7EozXg5g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A9C840B33
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5972B9D388; Fri, 30 Oct 2026 14:04:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:20:01 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 419b96be31207e6849ee850b72c1ac9276607665
X-Git-Newrev: 2d973a59edfb43820ec1a84d14a503bc0b15cdb2
X-Patchwork-Hint: ignore
Message-Id: <20261030140441.5972B9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libabseil-cpp:
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
Content-Type: multipart/mixed; boundary="===============4481854119170977101=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4481854119170977101==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d973a59edfb43820ec1a84d14a503bc0b15cdb2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
[Raphaël: resolve conflicts (gcc8)]
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
index 59ca62867b..f02e5ffc32 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -692,13 +692,15 @@ config BR2_PACKAGE_COLLECTD_GRPC
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
index 89db860f87..359ba652ab 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -677,6 +677,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
 	# All depends from webrtc-audio-processing
 	depends on BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
@@ -685,11 +686,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTCDSP
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
index 0750dc5495..73d09df8ad 100644
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
index b79e711ad3..31f2001d45 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # libabseil-cpp
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
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

--===============4481854119170977101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4481854119170977101==--
