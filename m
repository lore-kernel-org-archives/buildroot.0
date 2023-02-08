Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D2DC678D5
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B6104F327;
	Tue, 21 Feb 2023 00:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6104F327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63kwOGMYFASO; Tue, 21 Feb 2023 00:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBDDE4F4BA;
	Tue, 21 Feb 2023 00:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDDE4F4BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 37A3A1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B171417F9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B171417F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvfoBDufmnSM for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A9C740C1A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A9C740C1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9C908648F; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:50:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c189e7462103591eb17d34a6e33430ddc636c84
X-Git-Newrev: bf5c0db35a06455182f6568ab2cfa69346f8b3a1
X-Patchwork-Hint: ignore
Message-Id: <20230220205254.E9C908648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for fontconfig/harfbuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf5c0db35a06455182f6568ab2cfa69346f8b3a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Additionally the harfbuzz license file is added and the hash for this is
also added to the hash file

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in    | 17 +++++++++++++++++
 package/qt6/qt6base/qt6base.hash |  1 +
 package/qt6/qt6base/qt6base.mk   | 23 +++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 1810b1586d..ac2058c901 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -59,6 +59,23 @@ config BR2_PACKAGE_QT6BASE_XCB
 comment "X.org XCB backend available if X.org is enabled"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_QT6BASE_FONTCONFIG
+	bool "fontconfig support"
+	select BR2_PACKAGE_FONTCONFIG
+	help
+	  This option enables Fontconfig support using the system
+	  fontconfig library.
+
+config BR2_PACKAGE_QT6BASE_HARFBUZZ
+	bool "harfbuzz support"
+	select BR2_PACKAGE_HARFBUZZ if \
+		BR2_TOOLCHAIN_HAS_SYNC_4 && \
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	help
+	  This option enables HarfBuzz support (either system harfbuzz
+	  if the toolchain supports __sync for 4 bytes, or the qt
+	  provided one which avoids this dependency by using QAtomic).
+
 endif
 
 config BR2_PACKAGE_QT6BASE_NETWORK
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 6544a371c6..fedbbba79f 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -11,3 +11,4 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
+sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index bcf2464590..6c155a4abb 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -172,6 +172,29 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_HARFBUZZ),y)
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=ON
+ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_4),y)
+# system harfbuzz in case __sync for 4 bytes is supported
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=OFF
+QT6BASE_DEPENDENCIES += harfbuzz
+else #BR2_TOOLCHAIN_HAS_SYNC_4
+# qt harfbuzz otherwise (using QAtomic instead)
+QT6BASE_CONF_OPTS += -DQT_USE_BUNDLED_BundledHarfbuzz=ON
+QT6BASE_LICENSE += , MIT (harfbuzz)
+QT6BASE_LICENSE_FILES += src/3rdparty/harfbuzz-ng/COPYING
+endif
+else
+QT6BASE_CONF_OPTS += -DFEATURE_harfbuzz=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
+QT6BASE_DEPENDENCIES += fontconfig
+else
+QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=OFF
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
