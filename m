Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFFFC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E051784603;
	Fri, 12 Jul 2024 08:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mBVFehwl7RSt; Fri, 12 Jul 2024 08:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2BF2845F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2BF2845F6;
	Fri, 12 Jul 2024 08:45:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 15F111BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C31A81354
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVmQAIczUor3 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F54F84076
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F54F84076
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 890E185CCA; Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 10:44:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00484ef59c190bb20001684590ea02ff613b33ee
X-Git-Newrev: e4e4fd4aeaf4bcd8a98d2fec8d59ce66a2dc4b93
X-Patchwork-Hint: ignore
Message-Id: <20240712084455.890E185CCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add blind option to
 enable GUI support on host
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4e4fd4aeaf4bcd8a98d2fec8d59ce66a2dc4b93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need host-qt6base with Gui support when building host-qt6shadertools,
otherwise the build is skipped and no qsb host tool is generated.
qt6shadertools fail to build if qsb is not available.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in.host             |  1 +
 package/qt6/Config.in.host         |  5 +++++
 package/qt6/qt6base/Config.in.host |  4 ++++
 package/qt6/qt6base/qt6base.mk     | 27 ++++++++++++++++++++++++++-
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 9cdca62633..66f3a6fa9d 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -92,6 +92,7 @@ menu "Host utilities"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
+	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
diff --git a/package/qt6/Config.in.host b/package/qt6/Config.in.host
new file mode 100644
index 0000000000..dfe7865c57
--- /dev/null
+++ b/package/qt6/Config.in.host
@@ -0,0 +1,5 @@
+if BR2_PACKAGE_QT6
+
+source "package/qt6/qt6base/Config.in.host"
+
+endif
diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
new file mode 100644
index 0000000000..326c06278e
--- /dev/null
+++ b/package/qt6/qt6base/Config.in.host
@@ -0,0 +1,4 @@
+# Select this if you need host qt6 tools that require the Qt::Gui module (e.g.
+# Qt Shader Baker(qsb)).
+config BR2_PACKAGE_HOST_QT6BASE_GUI
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 211808d2af..57f88e7779 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -84,7 +84,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
@@ -98,6 +97,32 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+# We need host-qt6base with Gui support when building host-qt6shadertools,
+# otherwise the build is skipped and no qsb host tool is generated.
+# qt6shadertools fail to build if qsb is not available.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += \
+	-DFEATURE_gui=ON \
+	-DFEATURE_freetype=OFF \
+	-DFEATURE_vulkan=OFF \
+	-DFEATURE_linuxfb=ON \
+	-DFEATURE_xcb=OFF \
+	-DFEATURE_opengl=OFF -DINPUT_opengl=no \
+	-DFEATURE_harfbuzz=OFF \
+	-DFEATURE_png=OFF \
+	-DFEATURE_gif=OFF \
+	-DFEATURE_jpeg=OFF \
+	-DFEATURE_printsupport=OFF \
+	-DFEATURE_kms=OFF \
+	-DFEATURE_fontconfig=OFF \
+	-DFEATURE_widgets=OFF \
+	-DFEATURE_libinput=OFF \
+	-DFEATURE_tslib=OFF \
+	-DFEATURE_eglfs=OFF
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
