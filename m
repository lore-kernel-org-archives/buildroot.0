Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DF8C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CD3060AD6;
	Sat,  8 Jan 2022 22:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXWYE88U3Kto; Sat,  8 Jan 2022 22:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6933C60AAC;
	Sat,  8 Jan 2022 22:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1A091BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A58A340256
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c51pM3_5xoft for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8DB640220
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7D75D832C8; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 049ca10248a4c5a808e7d96acd8711563916d318
X-Git-Newrev: 43c580ac9f848449333ecbe4336c2c9f2ba12158
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.7D75D832C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinifier: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=43c580ac9f848449333ecbe4336c2c9f2ba12158
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a Go package that needs vendor modules to be downloaded at
build time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Christian Stewart <christian@paral.in>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/tinifier/Config.in     | 10 ++++++++++
 package/tinifier/tinifier.hash |  3 +++
 package/tinifier/tinifier.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index df7d988279..ab6648cec2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2787,6 +2787,7 @@ F:	package/rtc-tools/
 F:	package/sam-ba/
 F:	package/scons/
 F:	package/squashfs/
+F:	package/tinifier/
 F:	package/wayland/
 F:	package/weston/
 F:	support/testing/tests/boot/test_syslinux.py
diff --git a/package/Config.in b/package/Config.in
index 15a831c1bf..ad6741f74c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ comment "Graphic applications"
 	source "package/rrdtool/Config.in"
 	source "package/stellarium/Config.in"
 	source "package/tesseract-ocr/Config.in"
+	source "package/tinifier/Config.in"
 
 comment "Graphic libraries"
 	source "package/cegui/Config.in"
diff --git a/package/tinifier/Config.in b/package/tinifier/Config.in
new file mode 100644
index 0000000000..fbadfe6bd9
--- /dev/null
+++ b/package/tinifier/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TINIFIER
+	bool "tinifier"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  CLI tool for images compressing
+
+	  This tool uses tinypng.com API endpoint for compressing your
+	  local jpg/png images (it supports parallel jobs).
+
+	  https://github.com/tarampampam/tinifier
diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
new file mode 100644
index 0000000000..5681ed6a55
--- /dev/null
+++ b/package/tinifier/tinifier.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  927e966f9d23ea7cc1942967a8fc16ef4c55c51bd096d44f54b418844a51aa12  tinifier-3.4.0.tar.gz
+sha256  791d8fd993ace44d4d83e2f4820a64d5ad3e37412f029afad46d17a9259de2b6  LICENSE
diff --git a/package/tinifier/tinifier.mk b/package/tinifier/tinifier.mk
new file mode 100644
index 0000000000..d7ed6f7c93
--- /dev/null
+++ b/package/tinifier/tinifier.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinifier
+#
+################################################################################
+
+TINIFIER_VERSION = 3.4.0
+TINIFIER_SITE = $(call github,tarampampam,tinifier,v$(TINIFIER_VERSION))
+TINIFIER_LICENSE = MIT
+TINIFIER_LICENSE_FILES = LICENSE
+TINIFIER_GOMOD = ./cmd/tinifier
+
+$(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
