Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93861C7115C
	for <buildroot@archiver.kernel.org>; Sun, 22 Jun 2025 11:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47AEE41C66;
	Sun, 22 Jun 2025 11:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5qWDFezxXmm; Sun, 22 Jun 2025 11:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED2741C09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ED2741C09;
	Sun, 22 Jun 2025 11:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64C39154
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E53940428
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xyd_wPykjWCK for <buildroot@buildroot.org>;
 Sun, 22 Jun 2025 11:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08192400F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08192400F1
 for <buildroot@buildroot.org>; Sun, 22 Jun 2025 11:44:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA6A68415D; Sun, 22 Jun 2025 11:44:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Jun 2025 12:43:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6252c2e50b7fe555f62cbf38fdde8ba540f00ea
X-Git-Newrev: 69cb3de4bf0ac1cbf04c8b54cc620bf562f5772d
X-Patchwork-Hint: ignore
Message-Id: <20250622114443.EA6A68415D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-sdk: new package
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
Content-Type: multipart/mixed; boundary="===============0331210430268511111=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0331210430268511111==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=69cb3de4bf0ac1cbf04c8b54cc620bf562f5772d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The principle component of this is the new volk meta-loader which is
required for more recent versions of vulkan-tools. There does seem to
be a little confusion with github Releases lagging behind tagged
versions of the sdk. I've gone for the latest SDK version to stay as
closely aligned to the rest of the system as I can.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[Julien: remove _SOURCE to fix a check-package warning]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                  |  1 +
 package/vulkan-sdk/Config.in       | 12 ++++++++++++
 package/vulkan-sdk/vulkan-sdk.hash |  3 +++
 package/vulkan-sdk/vulkan-sdk.mk   | 17 +++++++++++++++++
 4 files changed, 33 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 227c81ebed..816c7830e8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -375,6 +375,7 @@ comment "Graphic libraries"
 	source "package/tk/Config.in"
 	source "package/vulkan-headers/Config.in"
 	source "package/vulkan-loader/Config.in"
+	source "package/vulkan-sdk/Config.in"
 	source "package/vulkan-tools/Config.in"
 
 comment "Other GUIs"
diff --git a/package/vulkan-sdk/Config.in b/package/vulkan-sdk/Config.in
new file mode 100644
index 0000000000..a2cd51ef0f
--- /dev/null
+++ b/package/vulkan-sdk/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_VULKAN_SDK
+	bool "vulkan-sdk"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_INSTALL_LIBSTDCPP # C++
+	select BR2_PACKAGE_VULKAN_HEADERS
+	help
+	  The Vulkan meta-loader
+
+	  https://github.com/zeux/volk
+
+comment "Vulkan-SDK needs toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/vulkan-sdk/vulkan-sdk.hash b/package/vulkan-sdk/vulkan-sdk.hash
new file mode 100644
index 0000000000..f0f3da0e79
--- /dev/null
+++ b/package/vulkan-sdk/vulkan-sdk.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  d86bcf1aff499f41a3e445b55df5e393a5ce49b1bda689eb7335b0a0a54a3c0b  vulkan-sdk-1.4.313.0.tar.gz
+sha256  33c831f76b79501665e66c23ac8f876020457c216d44526a8f747da897999b35  LICENSE.md
diff --git a/package/vulkan-sdk/vulkan-sdk.mk b/package/vulkan-sdk/vulkan-sdk.mk
new file mode 100644
index 0000000000..2851e511bc
--- /dev/null
+++ b/package/vulkan-sdk/vulkan-sdk.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# vulkan-sdk
+#
+################################################################################
+
+VULKAN_SDK_VERSION = 1.4.313.0
+VULKAN_SDK_SITE = https://github.com/zeux/volk/archive/refs/tags
+VULKAN_SDK_LICENSE = MIT
+VULKAN_SDK_LICENSE_FILES = LICENSE.md
+VULKAN_SDK_INSTALL_STAGING = YES
+
+VULKAN_SDK_DEPENDENCIES = vulkan-headers
+
+VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON
+
+$(eval $(cmake-package))

--===============0331210430268511111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0331210430268511111==--
