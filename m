Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7E6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B55C081D98;
	Sun,  9 Jan 2022 20:30:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4Cc9Rw2jPx7; Sun,  9 Jan 2022 20:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13FA381D24;
	Sun,  9 Jan 2022 20:30:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50B141BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F4E160B12
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RBZzMzU-pVvP for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:30:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6835F605A2
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2D2F282AB8; Sun,  9 Jan 2022 20:24:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 21:29:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69d5165bc44276e580690dad234abe9a4298f3b5
X-Git-Newrev: fb588f078045082e48ebcf8e62f486888ad2956b
X-Patchwork-Hint: ignore
Message-Id: <20220109202417.2D2F282AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-headers: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb588f078045082e48ebcf8e62f486888ad2956b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Arnout: update to 1.2.203]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in                          |  1 +
 package/vulkan-headers/Config.in           |  7 +++++++
 package/vulkan-headers/vulkan-headers.hash |  3 +++
 package/vulkan-headers/vulkan-headers.mk   | 13 +++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index edae7e4f62..5e01187b83 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -353,6 +353,7 @@ comment "Graphic libraries"
 	source "package/sdl2_net/Config.in"
 	source "package/sdl2_ttf/Config.in"
 	source "package/tk/Config.in"
+	source "package/vulkan-headers/Config.in"
 
 comment "Other GUIs"
 	source "package/qt5/Config.in"
diff --git a/package/vulkan-headers/Config.in b/package/vulkan-headers/Config.in
new file mode 100644
index 0000000000..c0fc8f20b0
--- /dev/null
+++ b/package/vulkan-headers/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_VULKAN_HEADERS
+	bool "vulkan-headers"
+	help
+	  The Khronos official Vulkan header files and API
+	  registry.
+
+	  https://github.com/KhronosGroup/Vulkan-Headers
diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
new file mode 100644
index 0000000000..c43736405c
--- /dev/null
+++ b/package/vulkan-headers/vulkan-headers.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7239108c372f1fbe365bd8d1610ca2bb4e72b73b2151f2551bf9df54dd539639  vulkan-headers-1.2.203.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
new file mode 100644
index 0000000000..13cae1e685
--- /dev/null
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# vulkan-headers
+#
+################################################################################
+
+VULKAN_HEADERS_VERSION = 1.2.203
+VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
+VULKAN_HEADERS_LICENSE = Apache-2.0
+VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
+VULKAN_HEADERS_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
