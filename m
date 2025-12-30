Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D34EE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F659403F4;
	Tue, 30 Dec 2025 18:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Y7MQMJymXWx; Tue, 30 Dec 2025 18:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A64E403B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118361;
	bh=iwvPrK9uFGCIWlcLmeNBJMJrNQIuSAHvnqLBsbbjrFo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VZK/BECRbuwU+8lw0QnBoNpENFYf1MZY0Mfw5q4PvtlwiajiqSau1a9rCmM2smyeT
	 xdc1W+2LURzSpXuXAhgIqnem0puO2bo9oYXJ5bglwwjs+8HyP6LbtOQKwcKYXG17oL
	 0kp6rl3q0/05A4K1ip39lMaNtknSmpgH5ShIrOO/NaOag6op3zQ9puh0xDcKYCtVQ4
	 6rAJ22YKdmcbOoad2iPVe+BXtvtQeENDTafxCcHaKTOo7xLClOj0JaRKhrG5nAR13+
	 RmXPGlPHG6Nz1y+dZYmmWNnwgPFqhceEsFLM55cZB1agthjUIzdvP9xxqIVOBjiFMs
	 2bAv5R3upmosg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A64E403B8;
	Tue, 30 Dec 2025 18:12:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A19A277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAFDB403B0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubs5jcuhxghX for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1AC3403B8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1AC3403B8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB78187C3F; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b2b1a18da53c7dabeb81e3a126537f6ff76fe01
X-Git-Newrev: ebabcd6263bff13d2a809349c6a044191efc60b9
X-Patchwork-Hint: ignore
Message-Id: <20251230181234.BB78187C3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opentracing-cpp: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebabcd6263bff13d2a809349c6a044191efc60b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting https://github.com/opentracing/opentracing-cpp
"This library is DEPRECATED!"
https://github.com/opentracing/specification/issues/163
https://github.com/opentracing/opentracing.io/pull/460

The package is broken with cmake 4 and no other package depends on it.

Fixes:

  https://autobuild.buildroot.net/results/cbc80ffb0dc4d4407bb788cec05d13ae37d1eff4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Jan Heylen <jan.heylen@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                             |  6 ++++++
 DEVELOPERS                                   |  3 ---
 package/Config.in                            |  1 -
 package/opentracing-cpp/Config.in            | 18 ------------------
 package/opentracing-cpp/opentracing-cpp.hash |  3 ---
 package/opentracing-cpp/opentracing-cpp.mk   | 28 ----------------------------
 6 files changed, 6 insertions(+), 53 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 8e6c4a37e8..a0dad6461d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENTRACING_CPP
+	bool "opentracing-cpp has been removed"
+	select BR2_LEGACY
+	help
+	  opentracing-cpp was deprecated upstream and has been removed
+
 config BR2_PACKAGE_OPENPOWERLINK
 	bool "openpowerlink has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e157e98f79..9775c85556 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1564,9 +1564,6 @@ N:	Jan Havran <havran.jan@email.cz>
 F:	board/pine64/pinecube/
 F:	configs/pine64_pinecube_defconfig
 
-N:	Jan Heylen <jan.heylen@nokia.com>
-F:	package/opentracing-cpp/
-
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
diff --git a/package/Config.in b/package/Config.in
index 330216fcf0..857266c8f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1955,7 +1955,6 @@ menu "Logging"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
 	source "package/log4qt/Config.in"
-	source "package/opentracing-cpp/Config.in"
 	source "package/spdlog/Config.in"
 	source "package/ulog/Config.in"
 	source "package/zlog/Config.in"
diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
deleted file mode 100644
index ff3067b7d1..0000000000
--- a/package/opentracing-cpp/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_OPENTRACING_CPP
-	bool "opentracing-cpp"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
-	help
-	  OpenTracing API for C++
-
-	  http://opentracing.io
-
-comment "opentracing-cpp needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-comment "opentracing-cpp needs exception_ptr"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
deleted file mode 100644
index 8cfaf5fd47..0000000000
--- a/package/opentracing-cpp/opentracing-cpp.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  5b170042da4d1c4c231df6594da120875429d5231e9baa5179822ee8d1054ac3  opentracing-cpp-1.6.0.tar.gz
-sha256  076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717  LICENSE
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
deleted file mode 100644
index 12ce40fbed..0000000000
--- a/package/opentracing-cpp/opentracing-cpp.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# opentracing-cpp
-#
-################################################################################
-
-OPENTRACING_CPP_VERSION = 1.6.0
-OPENTRACING_CPP_SITE = \
-	$(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
-OPENTRACING_CPP_LICENSE = Apache-2.0
-OPENTRACING_CPP_LICENSE_FILES = LICENSE
-
-OPENTRACING_CPP_INSTALL_STAGING = YES
-
-# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
-# although BUILD_STATIC_LIBS=ON is default, make it explicit,
-# cmake and static/shared libs is confusing enough already.
-ifeq ($(BR2_STATIC_LIBS),y)
-OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
-endif
-
-OPENTRACING_CPP_CONF_OPTS += -DENABLE_LINTING=OFF
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
