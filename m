Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5DBC7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 11:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7AB741CA9;
	Sun, 22 Jun 2025 11:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yNz8X0KWxqW6; Sun, 22 Jun 2025 11:44:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8F141CA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8F141CA1;
	Sun, 22 Jun 2025 11:44:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1577A12C
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8D86400F1
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0LbmyO6aVUk for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 11:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB9040290
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FB9040290
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:44:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3E097FD45; Sun, 22 Jun 2025 11:44:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:43:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69cb3de4bf0ac1cbf04c8b54cc620bf562f5772d
X-Git-Newrev: 52664093dee0f280db191c391167848dc5b09745
X-Patchwork-Hint: ignore
Message-Id: <20250622114443.F3E097FD45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-{headers, loader,
 tools}: bump to 1.4.317 release
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3139944765953103829=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3139944765953103829==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=52664093dee0f280db191c391167848dc5b09745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to the current release. We now need the recently added
vulkan-sdk to have access to the volk loader. Update the depends
comments appropriately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[Julien:
 - reword commit log title to use bash brace-expansion style
 - remove "vulkan-sdk" from Kconfig comment
 - remove newline before Kconfig help section
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vulkan-headers/vulkan-headers.hash | 2 +-
 package/vulkan-headers/vulkan-headers.mk   | 2 +-
 package/vulkan-loader/vulkan-loader.hash   | 2 +-
 package/vulkan-tools/Config.in             | 4 ++--
 package/vulkan-tools/vulkan-tools.hash     | 2 +-
 package/vulkan-tools/vulkan-tools.mk       | 3 ++-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
index b38bfcff47..286639b579 100644
--- a/package/vulkan-headers/vulkan-headers.hash
+++ b/package/vulkan-headers/vulkan-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  317e467a5fb2eaa6a18b984ec70fdbfaccd93595a3e6f4bcceca7d3fab280505  vulkan-headers-1.3.262.tar.gz
+sha256  78665959d10b09061d8c3e21db8bf3e8b699e2d3d532fce850a32312dba7228b  vulkan-headers-1.4.317.tar.gz
 sha256  ac24e5ea920e4318e4d02c4086ae51f53cfb03feed06c18df1019e7ada1ec7bc  LICENSE.md
diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
index 20b248364d..52d5b56086 100644
--- a/package/vulkan-headers/vulkan-headers.mk
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -6,7 +6,7 @@
 
 # Note: changing this version will also affect vulkan-loader and
 # vulkan-tools, so please update those packages as well.
-VULKAN_HEADERS_VERSION = 1.3.262
+VULKAN_HEADERS_VERSION = 1.4.317
 VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
 VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
 VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
diff --git a/package/vulkan-loader/vulkan-loader.hash b/package/vulkan-loader/vulkan-loader.hash
index e09ecda8a9..5bfc02f5c8 100644
--- a/package/vulkan-loader/vulkan-loader.hash
+++ b/package/vulkan-loader/vulkan-loader.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3bbaa5ee64058a89949eb777de66ce94bfe3141892514172cfc9451c756802d5  vulkan-loader-1.3.262.tar.gz
+sha256  e4e18585fe902ee04e86c1cdb2996b686bffef2cab02cb6079221fe69df05af8  vulkan-loader-1.4.317.tar.gz
 sha256  43c0a37e6a0fa7ff3c843b3ec5a4fac84b712558ddac103fbd4c1649662a9ece  LICENSE.txt
diff --git a/package/vulkan-tools/Config.in b/package/vulkan-tools/Config.in
index 54fa539dab..f0a4cfee93 100644
--- a/package/vulkan-tools/Config.in
+++ b/package/vulkan-tools/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_VULKAN_TOOLS
 	bool "vulkan-tools"
 	depends on BR2_INSTALL_LIBSTDCPP # vulkan-loader
-	depends on !BR2_STATIC_LIBS # vullan-loader
+	depends on !BR2_STATIC_LIBS # vulkan-loader, vulkan-sdk
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # vulkan-loader
 	select BR2_PACKAGE_VULKAN_HEADERS
 	select BR2_PACKAGE_VULKAN_LOADER
-
+	select BR2_PACKAGE_VULKAN_SDK
 	help
 	  The Khronos official Vulkan Tools and Utilities.
 
diff --git a/package/vulkan-tools/vulkan-tools.hash b/package/vulkan-tools/vulkan-tools.hash
index 24c0697784..504177379b 100644
--- a/package/vulkan-tools/vulkan-tools.hash
+++ b/package/vulkan-tools/vulkan-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8c77d02694d0516ae2ba3f3718745647e87e788ef93faabb2e3674ff32608010  vulkan-tools-1.3.262.tar.gz
+sha256  4586309ab5b2a9584fde62fd85b0ef5bb98b4cdbca9cb1ba3a2b4978dc2f355c  vulkan-tools-1.4.317.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-tools/vulkan-tools.mk b/package/vulkan-tools/vulkan-tools.mk
index 9f5bf46b79..9deeda6086 100644
--- a/package/vulkan-tools/vulkan-tools.mk
+++ b/package/vulkan-tools/vulkan-tools.mk
@@ -11,7 +11,8 @@ VULKAN_TOOLS_LICENSE_FILES = LICENSE.txt
 
 VULKAN_TOOLS_DEPENDENCIES = \
 	vulkan-headers \
-	vulkan-loader
+	vulkan-loader \
+	vulkan-sdk
 
 VULKAN_TOOLS_CONF_OPTS += \
 	-DBUILD_CUBE=OFF \

--===============3139944765953103829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3139944765953103829==--
