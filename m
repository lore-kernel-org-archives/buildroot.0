Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A6DC55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 14:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD32B60714;
	Sat,  1 Aug 2026 14:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSoZJuz1pDIP; Sat,  1 Aug 2026 14:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF645606E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785594431;
	bh=HKdbcfPTJA/bSySKZkBSnnuPKZNb1ohVmDH0d0DS5S8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ABjp2HN2daRQifIokxPfFQC7YZ/OQtWgvEn34YO+mT1MLjspbnu1INmMs9efh6RHF
	 bOsgfGAHbWpnHlfOc6Al6uf7wZbVCQAfF8YNVIf7iPH4hv+G2m988hdZT1Tx8CLbRQ
	 tpV0A66VqdLZVAYPqv5hlhQasPLFSe0/3zrt/KWW3annklEjYY+B40DkI4pBvDJWAv
	 4DdOtRB4o7Sm/z6ma7L3F5UPL18yP3PeThUkrfRJfcdOV5ZUKHwc2LNJ5PPsa+awtO
	 BzhkdPFQXL4JIgc3QumjIWI8cLUaMQjWJc6IJvIzS6wL0u42wcZfPsuZ4yAa56g4xX
	 EXAYIjhxy1dbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF645606E8;
	Sat,  1 Aug 2026 14:27:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90567FE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7682D80D2B
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3plBX9G8YoWh for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 14:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D7CC80D1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D7CC80D1F
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:27:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06FC28707D; Sat,  1 Aug 2026 14:26:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 16:26:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46b5c95647577febda3cc4556fc1e7eed017bce5
X-Git-Newrev: bba497d60daf565dc230e4dbd46af1e16988d966
X-Patchwork-Hint: ignore
Message-Id: <20260801142626.06FC28707D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-argparse: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bba497d60daf565dc230e4dbd46af1e16988d966
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

A Modern C++ header-only library
for parsing command-line arguments.

https://github.com/p-ranav/argparse

Signed-off-by: Konstantin Menyaev <viper@landau.one>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                      |  1 +
 package/cpp-argparse/Config.in         | 12 ++++++++++++
 package/cpp-argparse/cpp-argparse.hash |  3 +++
 package/cpp-argparse/cpp-argparse.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index fc1e57d30d..cdf996fe24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -170,6 +170,7 @@ menu "Development tools"
 	source "package/bustle/Config.in"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
+	source "package/cpp-argparse/Config.in"
 	source "package/cppunit/Config.in"
 	source "package/cukinia/Config.in"
 	source "package/cunit/Config.in"
diff --git a/package/cpp-argparse/Config.in b/package/cpp-argparse/Config.in
new file mode 100644
index 0000000000..e33c4e0ef6
--- /dev/null
+++ b/package/cpp-argparse/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CPP_ARGPARSE
+	bool "cpp-argparse"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	help
+	  Argument Parser for Modern C++. A header-only library
+	  for parsing command-line arguments.
+
+	  https://github.com/p-ranav/argparse
+
+comment "cpp-argparse needs a toolchain w/ C++, gcc >= 8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/cpp-argparse/cpp-argparse.hash b/package/cpp-argparse/cpp-argparse.hash
new file mode 100644
index 0000000000..3a46ded059
--- /dev/null
+++ b/package/cpp-argparse/cpp-argparse.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9dcb3d8ce0a41b2a48ac8baa54b51a9f1b6a2c52dd374e28cc713bab0568ec98  cpp-argparse-3.2.tar.gz
+sha256  a3a9e0dc669644b703773777503f73abff8dffacc4e697d8535be930766fa771  LICENSE
diff --git a/package/cpp-argparse/cpp-argparse.mk b/package/cpp-argparse/cpp-argparse.mk
new file mode 100644
index 0000000000..53b1cd241b
--- /dev/null
+++ b/package/cpp-argparse/cpp-argparse.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# cpp-argparse
+#
+################################################################################
+
+CPP_ARGPARSE_VERSION = 3.2
+CPP_ARGPARSE_SITE = $(call github,p-ranav,argparse,v$(CPP_ARGPARSE_VERSION))
+CPP_ARGPARSE_LICENSE = MIT
+CPP_ARGPARSE_LICENSE_FILES = LICENSE
+CPP_ARGPARSE_INSTALL_STAGING = YES
+CPP_ARGPARSE_INSTALL_TARGET = NO
+
+CPP_ARGPARSE_CONF_OPTS = -DARGPARSE_BUILD_SAMPLES=OFF -DARGPARSE_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
