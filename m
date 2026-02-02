Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325F7E7FDF7
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 22:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D49AC80EC8;
	Mon,  2 Feb 2026 22:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXTwdW5y7UqZ; Mon,  2 Feb 2026 22:13:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA60F8277E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770070429;
	bh=to3CGn61IUikqfJTVJxa4VqPm+P3KQaKxSUed2AfLR4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FrQTob8Mjokj9+t1AobsiKOKH+3QhsK0msEkdjdlzjvXV3ZFNXHEDxLeLN69GB7ba
	 zcpFtLQVfZ+9S82NZ1X5CyXZBvDGSwD/XEFs6mwLjrmwBCvv3iCNCVP7zvEYl7LuEj
	 mFPRy6B4HtnBejCNPY8Gl4BVt9i/BqIr2E0v1odzsjGgTodmmaUVJyzml7ZD/kob6f
	 coG+U95D2fJE+BbQZcUfuKeFf+5pLFVvKUHDHlMUobIQGTVTA1FiHjfUjmH2mwNwzS
	 aJ7uNE0k/NGbUQlzX2aq3Gm4goi8DMpO1/4kWDUeBwMLRneqeOFlZT+AbGQtvj9kz+
	 tFMn3pClj7ZGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA60F8277E;
	Mon,  2 Feb 2026 22:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C538534C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2E01409E4
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNtJ5aTfUaWG for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 22:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD1CD409C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1CD409C0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 22:13:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B146A864E8; Mon,  2 Feb 2026 22:13:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 22:40:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ed45eff338e2828f3b2f456f7e0205c38caaf7d
X-Git-Newrev: 1c9374b8b7fa480a11e95867b18533dda0283563
X-Patchwork-Hint: ignore
Message-Id: <20260202221345.B146A864E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: bump to version
 20250814.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c9374b8b7fa480a11e95867b18533dda0283563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- enforce C++17 as this is required since 20250512

Release Notes:
https://github.com/abseil/abseil-cpp/releases/tag/20250814.1
https://github.com/abseil/abseil-cpp/releases/tag/20250814.0
https://github.com/abseil/abseil-cpp/releases/tag/20250512.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libabseil-cpp/Config.in          | 2 +-
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 7b65ec40d0..6bbe9518b2 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn.h
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 701801a7c4..e1b8763e2a 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  16242f394245627e508ec6bb296b433c90f8d914f73b9c026fddb905e27276e8  libabseil-cpp-20250127.0.tar.gz
+sha256  1692f77d1739bacf3f94337188b78583cf09bab7e420d2dc6c5605a4f86785a1  libabseil-cpp-20250814.1.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 34d62c4dd1..fe97c1c2f3 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,19 +4,19 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20250127.0
+LIBABSEIL_CPP_VERSION = 20250814.1
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
 LIBABSEIL_CPP_INSTALL_STAGING = YES
 
 LIBABSEIL_CPP_CONF_OPTS = \
-	-DCMAKE_CXX_STANDARD=14 \
+	-DCMAKE_CXX_STANDARD=17 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
 HOST_LIBABSEIL_CPP_CONF_OPTS = \
-	-DCMAKE_CXX_STANDARD=14 \
+	-DCMAKE_CXX_STANDARD=17 \
 	-DABSL_ENABLE_INSTALL=ON \
 	-DABSL_USE_GOOGLETEST_HEAD=OFF
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
