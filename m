Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3377D107761B
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 21:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E677360DD5;
	Wed, 18 Mar 2026 21:05:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCoFi8lrVD0T; Wed, 18 Mar 2026 21:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 098F160DD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773867911;
	bh=W4SCQ4Yyrcpf2Tc+qFPHtfkedF3KKHxtk65kLcdccLg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s1nqCgEsOu3H1n8hR0JLNQKevxpUDXeYoHlp3Y3hOy4E6uLntxq81Pm8/mpIf+EEd
	 n4RwG9e7XOttedHnIi9TiQjhFMndiPAsiV3xN2hNFwQcQBnqFV1Gl4RaNrCAFq4OCt
	 YasD2p1JA6/bTpNU1Zwbfvx2GCovjQMOYqk+nfLE5zHY1EBH2P06JpB/wjwgh3G0C/
	 0Ds3onSIuPIeOhE1UBbY3xDe7sauntyOf+WSK5dpPZC0kJo/UOgF4TNDFziSWhZvPY
	 YKYBqCR7qgTkuYDwNuBbxy01LzlF4ce80JE3ThF+Ibvng72s2TMYt0VcNAYNt3HlPj
	 hWDWkzCtC1mNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098F160DD7;
	Wed, 18 Mar 2026 21:05:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB2E31B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC97640575
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVhiryKgq-ba for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 21:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BE9E40573
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BE9E40573
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2217284AC2; Wed, 18 Mar 2026 21:05:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 22:01:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e78c6cf3323b4a45f84bcbc504f511dd268e270
X-Git-Newrev: 05c36d5d875713521f99b7bad48be316dcde2510
X-Patchwork-Hint: ignore
Message-Id: <20260318210508.2217284AC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llama-cpp: bump to version b8117
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05c36d5d875713521f99b7bad48be316dcde2510
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes: https://github.com/ggml-org/llama.cpp/releases

Merge BR2_PACKAGE_LLAMA_CPP_SERVER into BR2_PACKAGE_LLAMA_CPP_TOOLS, as
both of these options must be enabled to build tools like llama-cli and
llama-server. See upstream commit [1].

Since the Buildroot option BR2_PACKAGE_LLAMA_CPP_SERVER is removed, this
commit also removes it from support/testing/tests/package/test_aichat.py
which was using it.

[1] https://github.com/ggml-org/llama.cpp/commit/a180ba78c710f52af7c7edee562fbe98c36d6ddd

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Julien:
 - reindent options in .mk
 - remove BR2_PACKAGE_LLAMA_CPP_SERVER in test_aichat.py
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                             |  9 +++++++++
 package/llama-cpp/Config.in                  |  8 ++------
 package/llama-cpp/llama-cpp.hash             |  4 ++--
 package/llama-cpp/llama-cpp.mk               | 16 +++++++---------
 support/testing/tests/package/test_aichat.py |  1 -
 5 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b85a147032..518251c816 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_LLAMA_CPP_SERVER
+	bool "llama-cpp option removed"
+	select BR2_PACKAGE_LLAMA_CPP_TOOLS
+	select BR2_LEGACY
+	help
+	  Several tools (server, cli) now require building both
+	  tools and server, so enable both with the same config
+	  BR2_PACKAGE_LLAMA_CPP_TOOLS
+
 config BR2_PACKAGE_PYTHON3_OSSAUDIODEV
 	bool "python3 ossaudiodev module removed"
 	select BR2_LEGACY
diff --git a/package/llama-cpp/Config.in b/package/llama-cpp/Config.in
index c3eaa2a4ea..fa7da609de 100644
--- a/package/llama-cpp/Config.in
+++ b/package/llama-cpp/Config.in
@@ -25,12 +25,8 @@ if BR2_PACKAGE_LLAMA_CPP
 config BR2_PACKAGE_LLAMA_CPP_TOOLS
 	bool "Enable tools"
 	help
-	  Build CLI tools like llama-cli, llama-bench, etc.
-
-config BR2_PACKAGE_LLAMA_CPP_SERVER
-	bool "Enable server"
-	help
-	  Build OpenAI API-compatible web server, llama-server.
+	  Build CLI tools like llama-cli, llama-server, llama-bench,
+	  etc.
 
 config BR2_PACKAGE_LLAMA_CPP_VULKAN
 	bool "Vulkan support"
diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 765025f180..3967bc2fbc 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b2c4c89b6282c4ddc7c9c00c79af77d84811b6092aa47838a194e8a2981fa104  b7271.tar.gz
+sha256  4f9fdf018339783722936d537573d40cca596262e42714f597b1c93299113cea  b8117.tar.gz
 # License
-sha256  e562a2ddfaf8280537795ac5ecd34e3012b6582a147ef69ba6a6a5c08c84757d  LICENSE
+sha256  94f29bbed6a22c35b992c5c6ebf0e7c92f13b836b90f36f461c9cf2f0f1d010d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index 5112022656..a368d9d6b7 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b7271
+LLAMA_CPP_VERSION = b8117
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT
@@ -42,15 +42,13 @@ LLAMA_CPP_CONF_OPTS += -DLLAMA_CURL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LLAMA_CPP_TOOLS),y)
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=ON
-else
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_TOOLS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_LLAMA_CPP_SERVER),y)
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=ON
+LLAMA_CPP_CONF_OPTS += \
+	-DLLAMA_BUILD_SERVER=ON \
+	-DLLAMA_BUILD_TOOLS=ON
 else
-LLAMA_CPP_CONF_OPTS += -DLLAMA_BUILD_SERVER=OFF
+LLAMA_CPP_CONF_OPTS += \
+	-DLLAMA_BUILD_SERVER=OFF \
+	-DLLAMA_BUILD_TOOLS=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LLAMA_CPP_VULKAN),y)
diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
index 7c978315c9..5fc554bbb5 100644
--- a/support/testing/tests/package/test_aichat.py
+++ b/support/testing/tests/package/test_aichat.py
@@ -23,7 +23,6 @@ class TestAiChat(infra.basetest.BRTest):
         BR2_PACKAGE_LIBCURL=y
         BR2_PACKAGE_LIBCURL_CURL=y
         BR2_PACKAGE_LLAMA_CPP=y
-        BR2_PACKAGE_LLAMA_CPP_SERVER=y
         BR2_PACKAGE_LLAMA_CPP_TOOLS=y
         BR2_PACKAGE_OPENSSL=y
         BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
