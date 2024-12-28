Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEBAC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCCD84EFCC;
	Fri, 28 Feb 2025 16:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30NmG5H5EBOy; Fri, 28 Feb 2025 16:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE924154B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE924154B;
	Fri, 28 Feb 2025 16:46:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FF961DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10CBF42DBD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZALIzihyxIlC for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 252FE4251F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 252FE4251F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E3A780584; Fri, 28 Feb 2025 16:29:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 22:06:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d63801823dbf093463661dfeb653f66670bd0d3e
X-Git-Newrev: ecea4d94ac676ae9e66ce3e8799c0ba7dc14cc96
X-Patchwork-Hint: ignore
Message-Id: <20250228162950.1E3A780584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6: bump version to
 6.8.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ecea4d94ac676ae9e66ce3e8799c0ba7dc14cc96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For details see:
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.1/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.0/release-note.md

qt6serialport:
 - Fix legal-info. LICENSES/Qt-GPL-exception-1.0.txt was removed from
 Qt6 Serial Port. This broke make qt6serialport-legal-info, so we had to
 do some minor modification to the qt6serialport package.

qt6declarative:
 - Remove patch from qt6declarative, since it's already included in this
 version.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6.mk                                 |  4 ++--
 package/qt6/qt6base/qt6base.hash                   |  6 ++---
 package/qt6/qt6charts/qt6charts.hash               |  4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash     |  4 ++--
 .../0001-Fix-build-with--no-feature-network.patch  | 28 ----------------------
 package/qt6/qt6declarative/qt6declarative.hash     |  4 ++--
 .../qt6/qt6languageserver/qt6languageserver.hash   |  4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                   |  2 +-
 package/qt6/qt6opcua/qt6opcua.hash                 |  2 +-
 package/qt6/qt6scxml/qt6scxml.hash                 |  4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash         |  4 ++--
 package/qt6/qt6serialport/qt6serialport.hash       |  5 ++--
 package/qt6/qt6serialport/qt6serialport.mk         |  3 +--
 package/qt6/qt6shadertools/qt6shadertools.hash     |  4 ++--
 package/qt6/qt6svg/qt6svg.hash                     |  4 ++--
 package/qt6/qt6tools/qt6tools.hash                 |  4 ++--
 .../qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash |  4 ++--
 package/qt6/qt6wayland/qt6wayland.hash             |  4 ++--
 package/qt6/qt6websockets/qt6websockets.hash       |  4 ++--
 19 files changed, 34 insertions(+), 64 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 56c5a413ad..33cbf7551f 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.7
-QT6_VERSION = $(QT6_VERSION_MAJOR).3
+QT6_VERSION_MAJOR = 6.8
+QT6_VERSION = $(QT6_VERSION_MAJOR).1
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 695c1134c8..94269047c5 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtbase-everywhere-src-6.7.3.tar.xz.sha256
-sha256  8ccbb9ab055205ac76632c9eeddd1ed6fc66936fc56afc2ed0fd5d9e23da3097  qtbase-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtbase-everywhere-src-6.8.1.tar.xz.sha256
+sha256  40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf  qtbase-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
@@ -11,4 +11,4 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
 sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc  LICENSES/MIT.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-sha256  2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216  src/3rdparty/harfbuzz-ng/COPYING
+sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  src/3rdparty/harfbuzz-ng/COPYING
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index fbeb580f29..215d18c576 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtcharts-everywhere-src-6.7.3.tar.xz.sha256
-sha256  07ea63a550e6bcfa4a9c38056f7aa524357305572268fe26f6063d83e4233659  qtcharts-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtcharts-everywhere-src-6.8.1.tar.xz.sha256
+sha256  2edea3f16e248ef508d99332798645b7f5ab6edbbf2e3d7d78fb674156f07d29  qtcharts-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index 0d8b1cf5d8..ba13da8d4e 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qt5compat-everywhere-src-6.7.3.tar.xz.sha256
-sha256  8b6a68a3dfaa7e9d10a0dafccee594c72e8de061bc573ae86b1c081b423a53f0  qt5compat-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qt5compat-everywhere-src-6.8.1.tar.xz.sha256
+sha256  05c8c088b4cd8331fa8a9c8b7ff7c42a088cb112e673eae5708048d0131264fc  qt5compat-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch b/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
deleted file mode 100644
index bef5794229..0000000000
--- a/package/qt6/qt6declarative/0001-Fix-build-with--no-feature-network.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8377691a0998fd84e6fc8349a5db450bf2d79164 Mon Sep 17 00:00:00 2001
-From: Tasuku Suzuki <tasuku.suzuki@signal-slot.co.jp>
-Date: Tue, 21 Nov 2023 23:58:43 +0900
-Subject: Fix build with -no-feature-network
-
-Change-Id: Ib21012301da6afb5458f707b39a9a8079d93eb93
-Reviewed-by: Ulf Hermann <ulf.hermann@qt.io>
-Upstream: https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=8377691a0998fd84e6fc8349a5db450bf2d79164
-Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>
----
- src/qml/configure.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/qml/configure.cmake b/src/qml/configure.cmake
-index 2d0434643a..d1ff90bd54 100644
---- a/src/qml/configure.cmake
-+++ b/src/qml/configure.cmake
-@@ -82,7 +82,7 @@ qt_feature("qml-ssl" PUBLIC
-     SECTION "QML"
-     LABEL "QML SSL support"
-     PURPOSE "Provides ssl support in QML."
--    CONDITION QT_FEATURE_ssl
-+    CONDITION QT_FEATURE_qml_network AND QT_FEATURE_ssl
- )
- 
- # On arm and arm64 we need a specialization of cacheFlush() for each OS to be
--- 
-cgit v1.2.3
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 473b9b6baf..81b8ca929b 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtdeclarative-everywhere-src-6.7.3.tar.xz.sha256
-sha256  937b70e441abf5bc4e50d44d26610e2714a28514acf3885cd36116cd610b9875  qtdeclarative-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtdeclarative-everywhere-src-6.8.1.tar.xz.sha256
+sha256  95d15d5c1b6adcedb1df6485219ad13b8dc1bb5168b5151f2f1f7246a4c039fc  qtdeclarative-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index e328cac5e4..a330ecb323 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtlanguageserver-everywhere-src-6.7.3.tar.xz.sha256
-sha256  c56d3872428503d9e49bfc6fa1023332f035ffd711d39e904e50cd6bb1f9df8f  qtlanguageserver-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtlanguageserver-everywhere-src-6.8.1.tar.xz.sha256
+sha256  865e9436c1432a53e38a30625b6cee60bf72553ff508047115513a233c8e6d7e  qtlanguageserver-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index bc2dc68447..f13fbaab9c 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0a80d52cf349b61e0c012f1aa692639ac958de46d8a76cdb99af7b6067cf5c46  qt6mqtt-6.7.3-git4.tar.gz
+sha256  757c96a645b81e858c19b5407d54b3a40ee288d04ffadc9a96dd52e50c6d8d6b  qt6mqtt-6.8.1-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 8bb89abd58..627450af60 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  09b5e525ad1a61b537b826f049b8725ab3b783bcaf3010a58361f73ff4df1cdb  qt6opcua-6.7.3-git4.tar.gz
+sha256  0283f634707bf5c88ed30fec604bf7ea3bc22620cd060517812f9fb6304f254b  qt6opcua-6.8.1-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index f5e8b075a5..f239f18dd3 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtscxml-everywhere-src-6.7.3.tar.xz.sha256
-sha256  608febeb0dafb6fbf559e064dee779ab799441ed804267b534705ea5077eeda3  qtscxml-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtscxml-everywhere-src-6.8.1.tar.xz.sha256
+sha256  2f406f44cfacd6eddb90468012a5d1d99d7a64ec05a21a2a7eda9dfc12614fd6  qtscxml-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 7da5f2bb43..9777633b85 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtserialbus-everywhere-src-6.7.3.tar.xz.sha256
-sha256  55d82e9c7a827808b7383f0a57ad12c2a6fcf5b6c936b27e633155163c0a6276  qtserialbus-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialbus-everywhere-src-6.8.1.tar.xz.sha256
+sha256  40788d92ec5c3ae297818e9f9eea9d21e398a54fa3fd8ddd530d324548ed15da  qtserialbus-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index 7972749d10..d30c297d0f 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtserialport-everywhere-src-6.7.3.tar.xz.sha256
-sha256  d4fa58ee809b39c9eda8d20ee4677971e918edb9a076540466693bc46db146f0  qtserialport-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialport-everywhere-src-6.8.1.tar.xz.sha256
+sha256  098e72a5c06d7db003e3eea1b0ed72d7308e3ea9cb9e89b538816dc96c938395  qtserialport-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -7,4 +7,3 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.mk b/package/qt6/qt6serialport/qt6serialport.mk
index bdb16dd892..4a006d971a 100644
--- a/package/qt6/qt6serialport/qt6serialport.mk
+++ b/package/qt6/qt6serialport/qt6serialport.mk
@@ -23,8 +23,7 @@ QT6SERIALPORT_LICENSE_FILES = \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/LGPL-3.0-only.txt
 
 QT6SERIALPORT_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index d796561424..015ec5b96f 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtshadertools-everywhere-src-6.7.3.tar.xz.sha256
-sha256  74e512798c7ddbda354a2d8d975211454bbabb47afb7e598892067a5828c0995  qtshadertools-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtshadertools-everywhere-src-6.8.1.tar.xz.sha256
+sha256  55b70cd632473a8043c74ba89310f7ba9c5041d253bc60e7ae1fa789169c4846  qtshadertools-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index 611dbf72a7..cd7a148fb7 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtsvg-everywhere-src-6.7.3.tar.xz.sha256
-sha256  40142cb71fb1e07ad612bc361b67f5d54cd9367f9979ae6b86124a064deda06b  qtsvg-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsvg-everywhere-src-6.8.1.tar.xz.sha256
+sha256  3d0de73596e36b2daa7c48d77c4426bb091752856912fba720215f756c560dd0  qtsvg-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index dba38b2895..ede1608ec4 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qttools-everywhere-src-6.7.3.tar.xz.sha256
-sha256  f03bb7df619cd9ac9dba110e30b7bcab5dd88eb8bdc9cc752563b4367233203f  qttools-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qttools-everywhere-src-6.8.1.tar.xz.sha256
+sha256  9d43d409be08b8681a0155a9c65114b69c9a3fc11aef6487bb7fdc5b283c432d  qttools-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 3f568755ed..60b9ab08de 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtvirtualkeyboard-everywhere-src-6.7.3.tar.xz.sha256
-sha256  1a872104e212c048ada47d28ea8bb2e0ab0637663a3b085989349e249f1423d9  qtvirtualkeyboard-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz.sha256
+sha256  1022a3bc4093ec732e85b659158c8a70a31eecbd0dfef4e4f6c67f474f89a264  qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index a1fdb649b2..a378097eb4 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtwayland-everywhere-src-6.7.3.tar.xz.sha256
-sha256  e326c7ceb628f503bfc20577d5d2df9690ee10db08eb940cb80c759a6972b2b5  qtwayland-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwayland-everywhere-src-6.8.1.tar.xz.sha256
+sha256  2226fbde4e2ddd12f8bf4b239c8f38fd706a54e789e63467dfddc77129eca203  qtwayland-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index d9cfe8e173..789f51a71d 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.7/6.7.3/submodules/qtwebsockets-everywhere-src-6.7.3.tar.xz.sha256
-sha256  ba03007db7ee68a5bc3e3bd1d71e11f3e1f84e470bcb8c54cd7c01bbe1c5990e  qtwebsockets-everywhere-src-6.7.3.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwebsockets-everywhere-src-6.8.1.tar.xz.sha256
+sha256  e4cfdae8760bedd1c2b00429a6c9bf88cc11c5018dcb46bde277fb1edf341e3f  qtwebsockets-everywhere-src-6.8.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
