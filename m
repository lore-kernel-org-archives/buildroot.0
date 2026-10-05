Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3556DCA5FF0
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A97B14069C;
	Mon,  5 Oct 2026 19:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RnTuyv7crVsj; Mon,  5 Oct 2026 19:51:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 119C640660
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791229882;
	b=GWdn8PCsjMhppWcvwwKAiD7AD7qfTsbUIv1QiwZAEGmFdqmv8YeROvOjM4/oMVQzyiuY
	 uPhc8jSVuDb3LwVgvI0gENLiX3AfFVaVxKZ2aDxClvBd/IdPUZt9Xip6/OWKNovO7Duvn
	 FqA5/PlFYPUv3rGJHiSHVjZl2c79jeJLEIHDeCdmxmHxZLtD/HFRezjZDwVBD1JqVpupH
	 PNwddKHC3JPi6wMOIljlMGCZ1uWizOWE00ePZ2Uyk1mpEncdIGXA4tC/95OEZoEsAw3Au
	 /hmkx/wpC4eBgAhD2+2Df/3+zfxDa0UTAuWTVuOzVR/xBjekdhUZ+Ml1FSnQV3HY3nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791229882;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+iMqlG6OTwPFOyvd8C2OTDApuGwh5wEIVDjsCEk5XCU=;
	b=f34UUlyaoz+GswJWebJ+FWjbLqPJa8K3O2TDqQUyZPdrcxwFLQjOux0xL2KCpdOYikDA
	 emuIplCOQZt5VFaxc7SLs2aa5l6plBXy4+vhHQSL6q4QRGVACdMhNoj4f1oOyi+0UIOO6
	 oiRIbqk36Fg+4PODMsWJyu7QBLM7TaNB0+QSswRD3nXYs58O8uweB69Bl0+eYTTatOwSC
	 lcRPbTch/si6chzotcZbalG/sjRa5vuJmvTLgJSUo/a30fLH9Hyjisalr6/9nzJckdt0S
	 QZpOW6qsPBHzAw+A233G5saH40PLmCmZOy/klR2Rb6Yluv1y0+5ND96kv5pToznjHmA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791229882;
	bh=+iMqlG6OTwPFOyvd8C2OTDApuGwh5wEIVDjsCEk5XCU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=ELD1UsyJk4tGmw3qrtBihy5z+tA+N3ubLnWrSa/2fxV/JZdGWs/gvnTZ8MUdYuAxk
	 tSpXpslmRNiRH5YHEpDEEa/jFKROvd2CnnxlBAkJO6xSFSr0QRsxdliwxpN18V8H4i
	 bVIUQIvABJQY7dO1qkOUJ1epyueXQrH7HinvltBII+yk3Pgx4dvnlmUv+XBugZmYKw
	 8YKfgGANuoITJUbaPF5DniwCGfgq6DHFxxGIHSiGODNbHesfYn7cnGsV24PtqEtIZN
	 Met0ct6fNTFtAuGuEM3cEz6DPIQcLwhBjX4mvDOeDF4XKBuzHvpmtWyI65dMKsV2Vs
	 vWlViKlq3SMgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 119C640660;
	Mon,  5 Oct 2026 19:51:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B33BB34E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 19:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990C940042
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 19:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32z7KfyJDngy for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 19:48:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 10B5E4009F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791229705;
 b=SnrERuWCps4AldbSWuMuNVbH/YOwy9+cWXIkMNfQAU7ebscI6wOq0SgjZdc7uQTRYU31
 2u6OAL3yYlStTvPefpiWAPAzA1Ae4Qhxqoh/CbWFpK3gsWHQrSMeIUpDUjee6UcvN8fOJ
 f+nI2cfhMoGxmS88xz9flItOljtJqLdkmoo+yL7HnynrQKOSiaXYntV1pQmTIZIUfLeGD
 zDRVSWPjxGuFkQD5oV6t4/zkB5pywVuullUmOt6TszZkistC37PJwELii0eGNIWV7Wfmn
 9ZP0wdzZBAvIU/XUaBrKz4miKw9KJPruyFcIJqdoKoZNWoB7aRW3d/6XqxO/G7S7f/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791229705;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=Y2Z2gcVE1ktVcOlakIanr3spccXEkOxB54LXfxjaqXs=;
 b=W5kNcTHn5oEo2Kxg+gOyDwS5Ju91NngiLBub8ado3JjkUljQ9uT1bEjif5iHBJ1HHpL6
 sy2qb2BGQhCWcyM52w78DhfC4pIz0FIh2EbnNfp/w+4fd0+zwHvUKA1H6E4Akwu2Hk12h
 C36fDIwg/CREtmdKOvEJtQ0An1cZka5l1RfXfdZ4fV4aebaK3f3owXd5DWbjezJLeuwoP
 GNek4Z9ZPFef3uzjiBHVimF9LWCkNtFbv2X3YhIHB3n4OXluF2+ajgZGjFQcArt5y/7BK
 N56VMlno1V/5eyInGEL+Ao2iKKx2N/4UCSOgPZtN59g5y3a3n+Hf+0id7NyFIHVga1Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=heine.tech; 
 dkim=pass header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=oPKCGIFV; 
 arc=none smtp.remote-ip="2a01:4f8:1c0c:5073::1"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 10B5E4009F
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 19:48:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E8B6B1814BB; Mon, 05 Oct 2026 21:48:19 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 21:48:13 +0200
Message-ID: <20261005194814.1090598-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2] package/libabseil-cpp: require wchar
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

Fixes:
https://autobuild.buildroot.org/results/948/948463b01ce52456179b06ae17d4ace9a823f92b//

Assisted-by: Github Copilot:GPT-6 Luna
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

V2:
 - moved the depends from ARCH_SUPPORT directly on the symbol.
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
