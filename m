Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18DFC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 22:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC73961096;
	Wed, 20 Dec 2023 22:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC73961096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TeOsFgQd9sUX; Wed, 20 Dec 2023 22:22:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B12BC61573;
	Wed, 20 Dec 2023 22:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B12BC61573
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9FF21BF471
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9ED440525
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 22:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9ED440525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iilmQXg1Etjs for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 22:22:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AB3A41917
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 22:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB3A41917
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4397F87CDA; Wed, 20 Dec 2023 22:22:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 23:12:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 996b786cfc03c3cf2ac631045650545c901e3075
X-Git-Newrev: de5a82755d11ebd2f351a7c8f9250838542fce43
X-Patchwork-Hint: ignore
Message-Id: <20231220222241.4397F87CDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fcft: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=de5a82755d11ebd2f351a7c8f9250838542fce43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/fcft/Config.in | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
 package/fcft/fcft.hash |  3 +++
 package/fcft/fcft.mk   | 44 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 101 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4c8a94ebb6..6e5bebeea6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -33,6 +33,7 @@ F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
+F:	package/fcft/
 F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
diff --git a/package/Config.in b/package/Config.in
index ccef66e1ea..ce8b8a610e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2225,6 +2225,7 @@ menu "Text and terminal handling"
 	source "package/cli11/Config.in"
 	source "package/docopt-cpp/Config.in"
 	source "package/enchant/Config.in"
+	source "package/fcft/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
 	source "package/icu/Config.in"
diff --git a/package/fcft/Config.in b/package/fcft/Config.in
new file mode 100644
index 0000000000..b65515a3f1
--- /dev/null
+++ b/package/fcft/Config.in
@@ -0,0 +1,52 @@
+config BR2_PACKAGE_FCFT
+	bool "fcft"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_TLLIST
+	help
+	  A simple library for font loading and glyph rasterization
+	  using FontConfig, FreeType and pixman.
+
+	  https://codeberg.org/dnkl/fcft
+
+if BR2_PACKAGE_FCFT
+
+config BR2_PACKAGE_FCFT_GRAPHEME_SHAPING
+	bool "grapheme-shaping"
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	select BR2_PACKAGE_HARFBUZZ
+	help
+	  Enables shaping of individual grapheme clusters
+
+comment "grapheme-shaping needs a toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_FCFT_RUN_SHAPING
+	bool "run-shaping"
+	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_UTF8PROC
+	help
+	  Enables shaping of whole text runs.
+
+comment "run-shaping needs a toolchain w/ C++, gcc >= 4.9"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_FCFT_SVG_SUPPORT
+	bool "svg support"
+	help
+	  Enables svg support. This option increases the size of the
+	  library by approximately 55KB.
+
+endif # BR2_PACKAGE_FCFT
+
+comment "fcft needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
new file mode 100644
index 0000000000..96d885db1d
--- /dev/null
+++ b/package/fcft/fcft.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  904f40d749d198d97c46c5a459cd3c53fe92f008cf1e3e61949f6cf3036a78b7  3.1.6.tar.gz
+sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
new file mode 100644
index 0000000000..538d8a0748
--- /dev/null
+++ b/package/fcft/fcft.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# fcft
+#
+################################################################################
+
+FCFT_VERSION = 3.1.6
+FCFT_SOURCE = $(FCFT_VERSION).tar.gz
+FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
+FCFT_LICENSE = MIT
+FCFT_LICENSE_FILES = LICENSE
+FCFT_INSTALL_STAGING = YES
+
+FCFT_DEPENDENCIES = \
+	fontconfig \
+	freetype \
+	pixman \
+	tllist
+
+FCFT_CONF_OPTS = \
+	-Ddocs=disabled \
+	-Dexamples=false
+
+ifeq ($(BR2_PACKAGE_FCFT_GRAPHEME_SHAPING),y)
+FCFT_DEPENDENCIES += harfbuzz
+FCFT_CONF_OPTS += -Dgrapheme-shaping=enabled
+else
+FCFT_CONF_OPTS += -Dgrapheme-shaping=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FCFT_RUN_SHAPING),y)
+FCFT_DEPENDENCIES += harfbuzz utf8proc
+FCFT_CONF_OPTS += -Drun-shaping=enabled
+else
+FCFT_CONF_OPTS += -Drun-shaping=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_FCFT_SVG_SUPPORT),y)
+FCFT_CONF_OPTS += -Dsvg-backend='nanosvg'
+else
+FCFT_CONF_OPTS += -Dsvg-backend='none'
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
