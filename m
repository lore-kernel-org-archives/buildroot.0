Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3C9C5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9BBC8128D;
	Fri, 21 Aug 2026 15:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dKHmuss1Ylc; Fri, 21 Aug 2026 15:08:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324915;
	bh=q7gwmg6U9M1qc9zLNLrd1JzFyCZlA/ZPACdKdBOcJg8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ac6RE8nLbNzE6q0EeriJzwddzgAcVyhFVdcf23ZOn6rKVzQpNXDp05QWtWrMZs1MC
	 7BLvG3cnuEhxS9Nk0e9fvacRm/HokRFM9hBRf5atNlH+hxhHTL9zOPdG3+ggijvdyQ
	 TWNJK/UYWneaTOpo1fsur83bBSr8IiT7apzf1PQ36rXwR9MFxZFSvoS06SSOhgnLFj
	 dViiJWlXt0nPDZOXNreDfXhFNnZSoBDG7Qf6JF1xSJe2VVpI5kg4+s1PyFbRfQNQkN
	 u29sAb7Saj3n51joIlnI1QVwyQ+HOZ9UQu1RQXRXlnjDguSxg8LS6h+LQOOjIR1WV3
	 iasJj5UhlKSRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DEFF815CD;
	Fri, 21 Aug 2026 15:08:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9612BEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8848440026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zfk01GbSDgkZ for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BB43400DC
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D1B48E150; Fri, 21 Aug 2026 15:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fc538710536aa4a8390492de807f3e79a9de6d00
X-Git-Newrev: 1ef39b9196e0a5979581187f15fd665ca390c2a0
X-Patchwork-Hint: ignore
Message-Id: <20260821150615.8D1B48E150@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/qt6: bump version
 to 6.8.4
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1ef39b9196e0a5979581187f15fd665ca390c2a0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For details see:
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.3/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.4/release-note.md

Qt 6.8.4 LTS source archives use the everywhere-opensource-src prefix. The qtmqtt and qtopcua repositories use the v6.8.4-lts-lgpl tag.

Signed-off-by: Conghao Hu <ocd2057try@gmail.com>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/qt6/qt6.mk                                     | 4 ++--
 package/qt6/qt6base/qt6base.hash                       | 4 ++--
 package/qt6/qt6charts/qt6charts.hash                   | 4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash         | 4 ++--
 package/qt6/qt6declarative/qt6declarative.hash         | 4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                   | 4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash   | 4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                       | 2 +-
 package/qt6/qt6mqtt/qt6mqtt.mk                         | 2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash           | 4 ++--
 package/qt6/qt6multimedia/qt6multimedia.mk             | 2 +-
 package/qt6/qt6opcua/qt6opcua.hash                     | 2 +-
 package/qt6/qt6opcua/qt6opcua.mk                       | 2 +-
 package/qt6/qt6quick3d/qt6quick3d.hash                 | 4 ++--
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash     | 4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                     | 4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash             | 4 ++--
 package/qt6/qt6serialport/qt6serialport.hash           | 4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash         | 4 ++--
 package/qt6/qt6svg/qt6svg.hash                         | 4 ++--
 package/qt6/qt6tools/qt6tools.hash                     | 4 ++--
 package/qt6/qt6tools/qt6tools.mk                       | 4 ++--
 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash | 4 ++--
 package/qt6/qt6wayland/qt6wayland.hash                 | 4 ++--
 package/qt6/qt6websockets/qt6websockets.hash           | 4 ++--
 25 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 33cbf7551f..056e30fac1 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 QT6_VERSION_MAJOR = 6.8
-QT6_VERSION = $(QT6_VERSION_MAJOR).1
-QT6_SOURCE_TARBALL_PREFIX = everywhere-src
+QT6_VERSION = $(QT6_VERSION_MAJOR).4
+QT6_SOURCE_TARBALL_PREFIX = everywhere-opensource-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
 
 QT6_GIT = git://code.qt.io
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 94269047c5..57707befbf 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtbase-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf  qtbase-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtbase-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  532dfbf3fa3cbc68fa37441ea9e81c5009da044eaecda78ffaeafd8bd125532f  qtbase-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 215d18c576..3fd8accd59 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtcharts-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2edea3f16e248ef508d99332798645b7f5ab6edbbf2e3d7d78fb674156f07d29  qtcharts-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtcharts-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  2120c2927c8a72dcdd55082e9464ddbe6409f1b2b5a3e97331e597e9d6a3b531  qtcharts-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index ba13da8d4e..91ff19f35e 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qt5compat-everywhere-src-6.8.1.tar.xz.sha256
-sha256  05c8c088b4cd8331fa8a9c8b7ff7c42a088cb112e673eae5708048d0131264fc  qt5compat-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qt5compat-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  9c1e9a3801887eb986d0bf2e09bbaa833ec1275cd315ef7aff23d14c37ec1081  qt5compat-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 81b8ca929b..6dcf206930 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtdeclarative-everywhere-src-6.8.1.tar.xz.sha256
-sha256  95d15d5c1b6adcedb1df6485219ad13b8dc1bb5168b5151f2f1f7246a4c039fc  qtdeclarative-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  e4e68aad4c07fbb9da670ecd621fabe51b56a2bfcce8da775653bdf8dcd768fc  qtdeclarative-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 59d35d9e66..99652991cb 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtgraphs-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  3b0a2502c88ca02ae57814f432b46155d56f1e4fe263352e31260a9ff5fb2ab5  qtgraphs-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index a330ecb323..0ad4652327 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtlanguageserver-everywhere-src-6.8.1.tar.xz.sha256
-sha256  865e9436c1432a53e38a30625b6cee60bf72553ff508047115513a233c8e6d7e  qtlanguageserver-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  747a8e406d6b67c6b724f35a34849489ca7859161392e9dffa979113fecc6ac9  qtlanguageserver-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index f13fbaab9c..9cea2ae2f1 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  757c96a645b81e858c19b5407d54b3a40ee288d04ffadc9a96dd52e50c6d8d6b  qt6mqtt-6.8.1-git4.tar.gz
+sha256  ac5827afaa10bfbcb3e473d53f422715e53b6732d19987249195c17a534e0f1a  qt6mqtt-v6.8.4-lts-lgpl-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.mk b/package/qt6/qt6mqtt/qt6mqtt.mk
index 00c6705cc8..9bec4d3d28 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.mk
+++ b/package/qt6/qt6mqtt/qt6mqtt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT6MQTT_VERSION = $(QT6_VERSION)
+QT6MQTT_VERSION = v$(QT6_VERSION)-lts-lgpl
 QT6MQTT_SITE = $(QT6_GIT)/qt/qtmqtt.git
 
 QT6MQTT_INSTALL_STAGING = YES
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index cddafb56a8..7e9e720554 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
-sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  01737014580d97fe6768ba4bf95b81233c488c8349dfb5b8861e48b6930c7ad2  qtmultimedia-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index c2a9d250cf..c9160a0e81 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -68,7 +68,7 @@ QT6MULTIMEDIA_CONF_OPTS += -DFEATURE_ffmpeg=ON
 QT6MULTIMEDIA_DEPENDENCIES += ffmpeg
 # libxext/libxrandr are needed for ffmpeg plugin to build with X11
 # support:
-# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=6.8.1#n198
+# https://code.qt.io/cgit/qt/qtmultimedia.git/tree/src/plugins/multimedia/ffmpeg/CMakeLists.txt?h=v6.8.4-lts-lgpl#n198
 ifeq ($(BR2_PACKAGE_XORG7),y)
 QT6MULTIMEDIA_DEPENDENCIES += xlib_libXext xlib_libXrandr
 endif
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 627450af60..6e910ca7fe 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0283f634707bf5c88ed30fec604bf7ea3bc22620cd060517812f9fb6304f254b  qt6opcua-6.8.1-git4.tar.gz
+sha256  53b80bc87ed164844f1cc742063f8b7735f3ad7219ef0c8fa91b1be569d3e3c6  qt6opcua-v6.8.4-lts-lgpl-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6opcua/qt6opcua.mk b/package/qt6/qt6opcua/qt6opcua.mk
index 28771ba8a5..b4e1d0908e 100644
--- a/package/qt6/qt6opcua/qt6opcua.mk
+++ b/package/qt6/qt6opcua/qt6opcua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT6OPCUA_VERSION = $(QT6_VERSION)
+QT6OPCUA_VERSION = v$(QT6_VERSION)-lts-lgpl
 QT6OPCUA_SITE = $(QT6_GIT)/qt/qtopcua.git
 QT6OPCUA_SITE_METHOD = git
 QT6OPCUA_INSTALL_STAGING = YES
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 960cda69ad..f6f626e3ad 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquick3d-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  a1e6239c20115f0f5bd08d6c5f288f0a79f6e98ce0e910665bb6b3545b231d43  qtquick3d-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index b042b4e2f8..db56e0dd1a 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
-sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  c0eec3e952e9f4d4acc843054dbcb23662359e768e968747554311e5dec39e2c  qtquicktimeline-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index f239f18dd3..b63f57e319 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtscxml-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2f406f44cfacd6eddb90468012a5d1d99d7a64ec05a21a2a7eda9dfc12614fd6  qtscxml-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtscxml-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  639bb421b25e3b7b0db00b9e3b2086d7504e44cbacaea11fe4dbecaccae1b1da  qtscxml-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 9777633b85..e98609effe 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialbus-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40788d92ec5c3ae297818e9f9eea9d21e398a54fa3fd8ddd530d324548ed15da  qtserialbus-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialbus-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  23782360cf662e8a2f3272e9f5a105b70d6c35ee10ed37775b5d68bae0b2f5f0  qtserialbus-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index d30c297d0f..25fe084e1f 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialport-everywhere-src-6.8.1.tar.xz.sha256
-sha256  098e72a5c06d7db003e3eea1b0ed72d7308e3ea9cb9e89b538816dc96c938395  qtserialport-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtserialport-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  8a91c7fd4839795f1ab6b3673ad51be7c84bf9c1fa50b88f8e08b46ddb8e11bb  qtserialport-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 015ec5b96f..9de49be57d 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtshadertools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  55b70cd632473a8043c74ba89310f7ba9c5041d253bc60e7ae1fa789169c4846  qtshadertools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtshadertools-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  379a70692b52903b82897869112c4759f7f6f4e76abc4987700e9cdd87c87ebd  qtshadertools-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index cd7a148fb7..df47d8e87d 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsvg-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3d0de73596e36b2daa7c48d77c4426bb091752856912fba720215f756c560dd0  qtsvg-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtsvg-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  e2a83b315b97eeaffa1d3f17e8192436541fe53e62171e82c7311c56ee9aac07  qtsvg-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index ede1608ec4..c53f37f064 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qttools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  9d43d409be08b8681a0155a9c65114b69c9a3fc11aef6487bb7fdc5b283c432d  qttools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qttools-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  c6030ea66d7be1ca7e3b40578beb35b0f4ff4014277d8e051d3219759f6ab399  qttools-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index fd32b3352a..2bfcff4cc2 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -37,7 +37,7 @@ QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_TESTS=OFF
 
 # Disable clang support in qt6tools for now, as version 17 is needed:
-# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=v6.8.4-lts-lgpl
 QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
 
 QT6TOOLS_DEPENDENCIES = \
@@ -55,7 +55,7 @@ HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_TESTS=OFF
 
 # Disable clang support in qt6tools for now, as version 17 is needed:
-# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=v6.8.4-lts-lgpl
 HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
 
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 60b9ab08de..142f9425c0 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1022a3bc4093ec732e85b659158c8a70a31eecbd0dfef4e4f6c67f474f89a264  qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  7bfe9a4d1ded37e1e10e28098dccf1768e75ec26bb0d1d27fcb3d83988397d98  qtvirtualkeyboard-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index a378097eb4..8ab0f5a21b 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwayland-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2226fbde4e2ddd12f8bf4b239c8f38fd706a54e789e63467dfddc77129eca203  qtwayland-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwayland-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  b2475cfae9f5b8f40ea456b762cc634e7d083873aa554eb63954ee20e8a7bb8b  qtwayland-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 789f51a71d..665c3e0008 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwebsockets-everywhere-src-6.8.1.tar.xz.sha256
-sha256  e4cfdae8760bedd1c2b00429a6c9bf88cc11c5018dcb46bde277fb1edf341e3f  qtwebsockets-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.4/submodules/qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz.sha256
+sha256  acadb896c557659fe8a2f29f130ad3553c1497524a1bf5165aacd346e1349521  qtwebsockets-everywhere-opensource-src-6.8.4.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
