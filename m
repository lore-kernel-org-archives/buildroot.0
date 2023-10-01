Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EADEE748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4621C82190;
	Sun,  1 Oct 2023 16:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4621C82190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyHzgsXPhXzy; Sun,  1 Oct 2023 16:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 660A781309;
	Sun,  1 Oct 2023 16:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 660A781309
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B62401BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 759384180B
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 759384180B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYlVS9NTqUvG for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2AB78418D0
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AB78418D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10D4483DBA; Sun,  1 Oct 2023 16:31:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 18:31:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4947445f278c1ca4476ca48220a5c1a7fb8ff9d4
X-Git-Newrev: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
X-Patchwork-Hint: ignore
Message-Id: <20231001163134.10D4483DBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-tools: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0a01085abeb7d8a097cb68b9f7f4faec7711543c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is required by mesa3d for building rusticl:

https://docs.mesa3d.org/rusticl.html

As the version needs to be kept in sync between spirv-headers and
spirv-tools, we add a small comment about this in each package.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                      |  1 +
 package/spirv-headers/spirv-headers.mk |  1 +
 package/spirv-tools/Config.in          |  8 ++++++++
 package/spirv-tools/spirv-tools.hash   |  3 +++
 package/spirv-tools/spirv-tools.mk     | 21 +++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index d673f0616d..009f7ba186 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -327,6 +327,7 @@ comment "Graphic applications"
 	source "package/pngquant/Config.in"
 	source "package/qt5cinex/Config.in"
 	source "package/rrdtool/Config.in"
+	source "package/spirv-tools/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/sway/Config.in"
 	source "package/swaybg/Config.in"
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 3ab506e0db..ff43dfd8e9 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Keep in sync with spirv-tools version
 SPIRV_HEADERS_VERSION = 1.3.261.1
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
new file mode 100644
index 0000000000..e2f46253a9
--- /dev/null
+++ b/package/spirv-tools/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SPIRV_TOOLS
+	bool "spirv-tools"
+	select BR2_PACKAGE_SPIRV_HEADERS
+	help
+	  The SPIR-V Tools project provides an API and commands for
+	  processing SPIR-V modules.
+
+	  https://github.com/KhronosGroup/SPIRV-Tools
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
new file mode 100644
index 0000000000..65cb9c619b
--- /dev/null
+++ b/package/spirv-tools/spirv-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  ead95c626ad482882a141d1aa0ce47b9453871f72c42c0b28d39c82f60a52008  spirv-tools-1.3.261.1.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
new file mode 100644
index 0000000000..e863911b03
--- /dev/null
+++ b/package/spirv-tools/spirv-tools.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# spirv-tools
+#
+################################################################################
+
+# Keep in sync with spirv-headers version
+SPIRV_TOOLS_VERSION = 1.3.261.1
+SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERSION))
+SPIRV_TOOLS_LICENSE = Apache-2.0
+SPIRV_TOOLS_LICENSE_FILES = LICENSE
+SPIRV_TOOLS_DEPENDENCIES = spirv-headers
+SPIRV_TOOLS_INSTALL_STAGING = YES
+
+SPIRV_TOOLS_CONF_OPTS = \
+	-DSPIRV-Headers_SOURCE_DIR=$(STAGING_DIR)/usr \
+	-DSPIRV_TOOLS_BUILD_STATIC=OFF \
+	-DSPIRV_SKIP_TESTS=ON \
+	-DSPIRV_WERROR=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
