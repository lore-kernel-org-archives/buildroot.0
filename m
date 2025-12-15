Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C0BD5B871
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 22:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B20860F15;
	Mon, 15 Dec 2025 22:29:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTuzhwFc4ulp; Mon, 15 Dec 2025 22:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE23E60F1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765837753;
	bh=5MxWYGmPsjGuwclAJFMay1SoOCCPlHAs16H5dAI/u8c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o81a1L5Uo/Z0FpMlqsHIj/428MsB1NfIm6FhltYa2squdTD7FBGiQ6IGpOYNpdr2Z
	 uzQZjbHj/Qas2AgJt/xAtfJyMudbD6qngGETKU+swg+gcfuO7Rbq5E1ay3sWg3nKVM
	 wtE/qaCloyzh8ovVQhj75XwG76jhyu46DWUcCKgcUy6i++r7aUwnnnJwDqfbFq1fm3
	 FS35lvOKvlGjIWC5s1ycNQLhtQbTBjEuWWv1J4I931Qg4s3Krr5B2EJf9E58WYtv5h
	 xCcdrW3zTME2VZN+yFj01u8Da+hZ927Yb31ZD4OYVCXwPDamb4q/8rQaiPvjA76Yof
	 jNzdCoooRV6Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE23E60F1F;
	Mon, 15 Dec 2025 22:29:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50457151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41FD640AB1
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84l9h6O6c0o2 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 22:29:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E52F940AAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52F940AAB
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 22:29:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CED5A87042; Mon, 15 Dec 2025 22:29:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 23:25:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a3aa90e8886fd981248f5c4946f48b024d9e24b
X-Git-Newrev: 5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417
X-Patchwork-Hint: ignore
Message-Id: <20251215222910.CED5A87042@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6: bump version to 6.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ae304d96cb7c4df040ba1bdfedfb09b3d5a3417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see:
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.2/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.8.3/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.0/release-note.md
 - https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.9.1/release-note.md

Qt6 Multimedia:
legal-info broke because license files were removed. This problem was fixed
by removing the corresponding hashes and LICENSE_FILES entries.

Qt6 SVG:
Fix legal-info after license file was removed.

Qt6 Quick 3d:
Fix legal-info after license files were removed.

Qt6 Virtual Keyboard:
Fix legal-info after change in license file.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6.mk                                     |  2 +-
 package/qt6/qt6base/qt6base.hash                       |  4 ++--
 package/qt6/qt6charts/qt6charts.hash                   |  4 ++--
 package/qt6/qt6core5compat/qt6core5compat.hash         |  4 ++--
 package/qt6/qt6declarative/qt6declarative.hash         |  4 ++--
 package/qt6/qt6graphs/qt6graphs.hash                   |  4 ++--
 package/qt6/qt6languageserver/qt6languageserver.hash   |  4 ++--
 package/qt6/qt6mqtt/qt6mqtt.hash                       |  2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash           | 12 ++----------
 package/qt6/qt6multimedia/qt6multimedia.mk             |  8 --------
 package/qt6/qt6opcua/qt6opcua.hash                     |  2 +-
 package/qt6/qt6quick3d/qt6quick3d.hash                 |  6 ++----
 package/qt6/qt6quick3d/qt6quick3d.mk                   |  4 +---
 package/qt6/qt6quicktimeline/qt6quicktimeline.hash     |  4 ++--
 package/qt6/qt6scxml/qt6scxml.hash                     |  4 ++--
 package/qt6/qt6serialbus/qt6serialbus.hash             |  4 ++--
 package/qt6/qt6serialport/qt6serialport.hash           |  4 ++--
 package/qt6/qt6shadertools/qt6shadertools.hash         |  4 ++--
 package/qt6/qt6svg/qt6svg.hash                         |  5 ++---
 package/qt6/qt6svg/qt6svg.mk                           |  3 +--
 package/qt6/qt6tools/qt6tools.hash                     |  4 ++--
 package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash |  6 +++---
 package/qt6/qt6wayland/qt6wayland.hash                 |  4 ++--
 package/qt6/qt6websockets/qt6websockets.hash           |  4 ++--
 24 files changed, 42 insertions(+), 64 deletions(-)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 33cbf7551f..f6183f513a 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT6_VERSION_MAJOR = 6.8
+QT6_VERSION_MAJOR = 6.9
 QT6_VERSION = $(QT6_VERSION_MAJOR).1
 QT6_SOURCE_TARBALL_PREFIX = everywhere-src
 QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base.hash
index 94269047c5..a4e2e81056 100644
--- a/package/qt6/qt6base/qt6base.hash
+++ b/package/qt6/qt6base/qt6base.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtbase-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40b14562ef3bd779bc0e0418ea2ae08fa28235f8ea6e8c0cb3bce1d6ad58dcaf  qtbase-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtbase-everywhere-src-6.9.1.tar.xz.sha256
+sha256  40caedbf83cc9a1959610830563565889878bc95f115868bbf545d1914acf28e  qtbase-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files
 sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb  LICENSES/Apache-2.0.txt
diff --git a/package/qt6/qt6charts/qt6charts.hash b/package/qt6/qt6charts/qt6charts.hash
index 215d18c576..0d39e0d6dd 100644
--- a/package/qt6/qt6charts/qt6charts.hash
+++ b/package/qt6/qt6charts/qt6charts.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtcharts-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2edea3f16e248ef508d99332798645b7f5ab6edbbf2e3d7d78fb674156f07d29  qtcharts-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtcharts-everywhere-src-6.9.1.tar.xz.sha256
+sha256  b8871beb7ac816e9241db9cbdc4803a53313f84a1e4b951f108bd00709aec3d3  qtcharts-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6core5compat/qt6core5compat.hash b/package/qt6/qt6core5compat/qt6core5compat.hash
index ba13da8d4e..fac62a39fc 100644
--- a/package/qt6/qt6core5compat/qt6core5compat.hash
+++ b/package/qt6/qt6core5compat/qt6core5compat.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qt5compat-everywhere-src-6.8.1.tar.xz.sha256
-sha256  05c8c088b4cd8331fa8a9c8b7ff7c42a088cb112e673eae5708048d0131264fc  qt5compat-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qt5compat-everywhere-src-6.9.1.tar.xz.sha256
+sha256  96c726ac3f0d5c40570e75196e4ab5c95d3de7c85d15604fe97ac2a6573d917a  qt5compat-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6declarative/qt6declarative.hash b/package/qt6/qt6declarative/qt6declarative.hash
index 81b8ca929b..6d09e6dcfa 100644
--- a/package/qt6/qt6declarative/qt6declarative.hash
+++ b/package/qt6/qt6declarative/qt6declarative.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtdeclarative-everywhere-src-6.8.1.tar.xz.sha256
-sha256  95d15d5c1b6adcedb1df6485219ad13b8dc1bb5168b5151f2f1f7246a4c039fc  qtdeclarative-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtdeclarative-everywhere-src-6.9.1.tar.xz.sha256
+sha256  ccb94665df0199d7ee387b965b29677c8b89cfb1782bb6f01239b1d1524cec97  qtdeclarative-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6graphs/qt6graphs.hash b/package/qt6/qt6graphs/qt6graphs.hash
index 59d35d9e66..03ccf2bc09 100644
--- a/package/qt6/qt6graphs/qt6graphs.hash
+++ b/package/qt6/qt6graphs/qt6graphs.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtgraphs-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1e46e3de69936835652ab40ef8caf5824ea71e26871274561fb65ec142d54a80  qtgraphs-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtgraphs-everywhere-src-6.9.1.tar.xz.sha256
+sha256  f52ddc5052cdbb5a3a321b211e42371014cccf3bc6c0f442d9bec3ddfe593444  qtgraphs-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6languageserver/qt6languageserver.hash b/package/qt6/qt6languageserver/qt6languageserver.hash
index a330ecb323..548f7e27fd 100644
--- a/package/qt6/qt6languageserver/qt6languageserver.hash
+++ b/package/qt6/qt6languageserver/qt6languageserver.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtlanguageserver-everywhere-src-6.8.1.tar.xz.sha256
-sha256  865e9436c1432a53e38a30625b6cee60bf72553ff508047115513a233c8e6d7e  qtlanguageserver-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtlanguageserver-everywhere-src-6.9.1.tar.xz.sha256
+sha256  ca17353612760b9bb6e3115bfacc9ba5e06d0d18b522f4f62ae6d510d63488ec  qtlanguageserver-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6mqtt/qt6mqtt.hash b/package/qt6/qt6mqtt/qt6mqtt.hash
index f13fbaab9c..511048566e 100644
--- a/package/qt6/qt6mqtt/qt6mqtt.hash
+++ b/package/qt6/qt6mqtt/qt6mqtt.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  757c96a645b81e858c19b5407d54b3a40ee288d04ffadc9a96dd52e50c6d8d6b  qt6mqtt-6.8.1-git4.tar.gz
+sha256  1e68591b33dcf48ad1f61ca3ba56c63fedd620a5a6333903f9daddc5847cbaa4  qt6mqtt-6.9.1-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6multimedia/qt6multimedia.hash b/package/qt6/qt6multimedia/qt6multimedia.hash
index cddafb56a8..76a89075c3 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.hash
+++ b/package/qt6/qt6multimedia/qt6multimedia.hash
@@ -1,22 +1,14 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtmultimedia-everywhere-src-6.8.1.tar.xz.sha256
-sha256  75fa87134f9afab7f0a62c55a4744799ac79519560d19c8e1d4c32bdd173f953  qtmultimedia-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtmultimedia-everywhere-src-6.9.1.tar.xz.sha256
+sha256  955e36459518ee55f8e2bb79defc6e44aa94dc1edf5ac58a22d7734b2e07391d  qtmultimedia-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files
-sha256  f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df  LICENSES/BSD-2-Clause.txt
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
-sha256  1f1b677d26ab73e159a55c3a914cf12d888e18a9d0d469fedab4aa6e5a48b1c0  LICENSES/BSD-Source-Code.txt
-sha256  84c6ef3ea9e3254a54d0acf5d3e0c61ae011b8fef7dd6940591cf060e6380a8f  LICENSES/BSL-1.0.txt
 sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
-sha256  7658542977bfdced9e1059a6c934ce4281de76d103b831007b825917dc62511a  LICENSES/IJG.txt
-sha256  f2ec607f67bb0dd3053b49835b02110d5cd0f8eb6da3aac4dc0b142a6b299be9  LICENSES/ISC.txt
-sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-or-later.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  66a3107d5ad6a058aab753eaac2047ccb2ed0e39465dd0fe5844da3e300d5172  LICENSES/MPL-2.0.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
-sha256  bfb1112d49db5b1daecdfef24bd7e2f3ea0bafb33aa67aa0ab51e2bf8407c03d  LICENSES/Zlib.txt
 sha256  85da7c29c2d2f2e6b3116b1219584cb513474cab797b3312a779be4c2181e51e  src/3rdparty/eigen/COPYING.BSD
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  src/3rdparty/eigen/COPYING.MPL2
 sha256  8b69cf3ac3ddd34df478c4ae6eaacf5e6c63ea7ee6403c8dad97e4d1438bc3c4  src/3rdparty/eigen/COPYRIGHTS
diff --git a/package/qt6/qt6multimedia/qt6multimedia.mk b/package/qt6/qt6multimedia/qt6multimedia.mk
index c2a9d250cf..d0d08cacc7 100644
--- a/package/qt6/qt6multimedia/qt6multimedia.mk
+++ b/package/qt6/qt6multimedia/qt6multimedia.mk
@@ -13,21 +13,13 @@ QT6MULTIMEDIA_CMAKE_BACKEND = ninja
 QT6MULTIMEDIA_LICENSE = GPL-3.0, LGPL-3.0
 
 QT6MULTIMEDIA_LICENSE_FILES = \
-	LICENSES/BSD-2-Clause.txt \
 	LICENSES/BSD-3-Clause.txt \
-	LICENSES/BSD-Source-Code.txt \
-	LICENSES/BSL-1.0.txt \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/IJG.txt \
-	LICENSES/ISC.txt \
-	LICENSES/LGPL-2.1-or-later.txt \
 	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/MIT.txt \
 	LICENSES/MPL-2.0.txt \
 	LICENSES/Qt-GPL-exception-1.0.txt \
-	LICENSES/Zlib.txt \
 	src/3rdparty/eigen/COPYING.BSD \
 	src/3rdparty/eigen/COPYING.MPL2 \
 	src/3rdparty/eigen/COPYRIGHTS \
diff --git a/package/qt6/qt6opcua/qt6opcua.hash b/package/qt6/qt6opcua/qt6opcua.hash
index 627450af60..746ed73c60 100644
--- a/package/qt6/qt6opcua/qt6opcua.hash
+++ b/package/qt6/qt6opcua/qt6opcua.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0283f634707bf5c88ed30fec604bf7ea3bc22620cd060517812f9fb6304f254b  qt6opcua-6.8.1-git4.tar.gz
+sha256  af12c0be6e13e858d30d286276e7312880fc91b475fb445aa42cd281e00b0b4b  qt6opcua-6.9.1-git4.tar.gz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.hash b/package/qt6/qt6quick3d/qt6quick3d.hash
index 960cda69ad..039bdfc15d 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.hash
+++ b/package/qt6/qt6quick3d/qt6quick3d.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquick3d-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3f3d345e6c95fcd40ab37e6a37cd31811e5d239dea8e142e632d4ea41bf20ce7  qtquick3d-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtquick3d-everywhere-src-6.9.1.tar.xz.sha256
+sha256  f61600da8fbfd51b7d6b5c431cef453d7c24015c374ae25756c0faf0db2c9977  qtquick3d-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -10,5 +10,3 @@ sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  src/3r
 sha256  063805e3b8e24ceab4c5dea358b03245ee41c31be87cf65c61d836636cb494bb  src/3rdparty/meshoptimizer/LICENSE.md
 sha256  2af9d14c7cd67f13c3e7e91dcfe15ec5c8af42923635441e0f5a75bcadadeb33  src/3rdparty/tinyexr/LICENSE
 sha256  2c16d5b1c2808277fe975b4f70f0fd9afc9b3bcf04e6c676665a82cb2d5579e3  src/3rdparty/xatlas/LICENSE
-sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/helpers/GODOT_LICENSE.txt
-sha256  966313e8129db5d0b3b081d1a50ae107da9a3da2d8faa05899e3042a33192525  src/runtimerender/GODOT_LICENSE.txt
diff --git a/package/qt6/qt6quick3d/qt6quick3d.mk b/package/qt6/qt6quick3d/qt6quick3d.mk
index 246bd2d82d..cd31388529 100644
--- a/package/qt6/qt6quick3d/qt6quick3d.mk
+++ b/package/qt6/qt6quick3d/qt6quick3d.mk
@@ -20,9 +20,7 @@ QT6QUICK3D_LICENSE_FILES = \
 	src/3rdparty/embree/LICENSE.txt \
 	src/3rdparty/meshoptimizer/LICENSE.md \
 	src/3rdparty/tinyexr/LICENSE \
-	src/3rdparty/xatlas/LICENSE \
-	src/helpers/GODOT_LICENSE.txt \
-	src/runtimerender/GODOT_LICENSE.txt
+	src/3rdparty/xatlas/LICENSE
 
 QT6QUICK3D_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
index b042b4e2f8..02e3cd8407 100644
--- a/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
+++ b/package/qt6/qt6quicktimeline/qt6quicktimeline.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtquicktimeline-everywhere-src-6.8.1.tar.xz.sha256
-sha256  fdbc198e27fd7bce0801fb3cfa336e81932607e6a36c97ae8394880eedfe12a3  qtquicktimeline-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtquicktimeline-everywhere-src-6.9.1.tar.xz.sha256
+sha256  78bfdbe7ca8178e4e0931372e07a3076dec503b6a55ff07e41b594d781897294  qtquicktimeline-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
diff --git a/package/qt6/qt6scxml/qt6scxml.hash b/package/qt6/qt6scxml/qt6scxml.hash
index f239f18dd3..8df1c47554 100644
--- a/package/qt6/qt6scxml/qt6scxml.hash
+++ b/package/qt6/qt6scxml/qt6scxml.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtscxml-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2f406f44cfacd6eddb90468012a5d1d99d7a64ec05a21a2a7eda9dfc12614fd6  qtscxml-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtscxml-everywhere-src-6.9.1.tar.xz.sha256
+sha256  0c33de2023b33a54fa6debd46f422440dca92da532faa7742af051fd88254780  qtscxml-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialbus/qt6serialbus.hash b/package/qt6/qt6serialbus/qt6serialbus.hash
index 9777633b85..af0362c289 100644
--- a/package/qt6/qt6serialbus/qt6serialbus.hash
+++ b/package/qt6/qt6serialbus/qt6serialbus.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialbus-everywhere-src-6.8.1.tar.xz.sha256
-sha256  40788d92ec5c3ae297818e9f9eea9d21e398a54fa3fd8ddd530d324548ed15da  qtserialbus-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtserialbus-everywhere-src-6.9.1.tar.xz.sha256
+sha256  491ece4583565f5d809ea9dd8caa2779a97c23a7d4d8352ba8a7a660e1ab04d7  qtserialbus-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6serialport/qt6serialport.hash
index d30c297d0f..d54a422826 100644
--- a/package/qt6/qt6serialport/qt6serialport.hash
+++ b/package/qt6/qt6serialport/qt6serialport.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtserialport-everywhere-src-6.8.1.tar.xz.sha256
-sha256  098e72a5c06d7db003e3eea1b0ed72d7308e3ea9cb9e89b538816dc96c938395  qtserialport-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtserialport-everywhere-src-6.9.1.tar.xz.sha256
+sha256  808fed52380c74ae89268306ce4d04b00f8f6b81f8c442489c390006d93eff10  qtserialport-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6shadertools/qt6shadertools.hash b/package/qt6/qt6shadertools/qt6shadertools.hash
index 015ec5b96f..736907509d 100644
--- a/package/qt6/qt6shadertools/qt6shadertools.hash
+++ b/package/qt6/qt6shadertools/qt6shadertools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtshadertools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  55b70cd632473a8043c74ba89310f7ba9c5041d253bc60e7ae1fa789169c4846  qtshadertools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtshadertools-everywhere-src-6.9.1.tar.xz.sha256
+sha256  4e1ed24cce0887fb4b6c7be4f150239853a29c330c9717f6bacfb6376f3b4b74  qtshadertools-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6svg/qt6svg.hash b/package/qt6/qt6svg/qt6svg.hash
index cd7a148fb7..2df065341e 100644
--- a/package/qt6/qt6svg/qt6svg.hash
+++ b/package/qt6/qt6svg/qt6svg.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtsvg-everywhere-src-6.8.1.tar.xz.sha256
-sha256  3d0de73596e36b2daa7c48d77c4426bb091752856912fba720215f756c560dd0  qtsvg-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtsvg-everywhere-src-6.9.1.tar.xz.sha256
+sha256  2dfc5de5fd891ff2afd9861e519bf1a26e6deb729b3133f68a28ba763c9abbd5  qtsvg-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -7,4 +7,3 @@ sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENS
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSES/LGPL-3.0-only.txt
-sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 08570c7f9c..c8d5e8fd17 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -23,8 +23,7 @@ QT6SVG_LICENSE_FILES = \
 	LICENSES/GFDL-1.3-no-invariants-only.txt \
 	LICENSES/GPL-2.0-only.txt \
 	LICENSES/GPL-3.0-only.txt \
-	LICENSES/LGPL-3.0-only.txt \
-	LICENSES/Qt-GPL-exception-1.0.txt
+	LICENSES/LGPL-3.0-only.txt
 
 QT6SVG_CONF_OPTS = \
 	-DQT_HOST_PATH=$(HOST_DIR) \
diff --git a/package/qt6/qt6tools/qt6tools.hash b/package/qt6/qt6tools/qt6tools.hash
index ede1608ec4..82209c3d9c 100644
--- a/package/qt6/qt6tools/qt6tools.hash
+++ b/package/qt6/qt6tools/qt6tools.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qttools-everywhere-src-6.8.1.tar.xz.sha256
-sha256  9d43d409be08b8681a0155a9c65114b69c9a3fc11aef6487bb7fdc5b283c432d  qttools-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qttools-everywhere-src-6.9.1.tar.xz.sha256
+sha256  90c4a562f4ccfd043fd99f34c600853e0b5ba9babc6ec616c0f306f2ce3f4b4c  qttools-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
index 60b9ab08de..14bf9a80c3 100644
--- a/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
+++ b/package/qt6/qt6virtualkeyboard/qt6virtualkeyboard.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz.sha256
-sha256  1022a3bc4093ec732e85b659158c8a70a31eecbd0dfef4e4f6c67f474f89a264  qtvirtualkeyboard-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtvirtualkeyboard-everywhere-src-6.9.1.tar.xz.sha256
+sha256  80059a38bdb836f0785292396970edc108f477a68d9a35bed8393750de3d281f  qtvirtualkeyboard-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
@@ -8,5 +8,5 @@ sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENS
 sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
 sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
 sha256  05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1  src/plugins/openwnn/3rdparty/openwnn/NOTICE
-sha256  b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986  src/plugins/pinyin/3rdparty/pinyin/NOTICE
+sha256  554aa1a1047c04056ad6206ce942a43f11c2b2daa0c01cb029f2b165072342d8  src/plugins/pinyin/3rdparty/pinyin/NOTICE
 sha256  9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6  src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt6/qt6wayland/qt6wayland.hash b/package/qt6/qt6wayland/qt6wayland.hash
index a378097eb4..f59c667d0c 100644
--- a/package/qt6/qt6wayland/qt6wayland.hash
+++ b/package/qt6/qt6wayland/qt6wayland.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwayland-everywhere-src-6.8.1.tar.xz.sha256
-sha256  2226fbde4e2ddd12f8bf4b239c8f38fd706a54e789e63467dfddc77129eca203  qtwayland-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtwayland-everywhere-src-6.9.1.tar.xz.sha256
+sha256  7d21ea0e687180ebb19b9a1f86ae9cfa7a25b4f02d5db05ec834164409932e3e  qtwayland-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
diff --git a/package/qt6/qt6websockets/qt6websockets.hash b/package/qt6/qt6websockets/qt6websockets.hash
index 789f51a71d..93ad174c84 100644
--- a/package/qt6/qt6websockets/qt6websockets.hash
+++ b/package/qt6/qt6websockets/qt6websockets.hash
@@ -1,5 +1,5 @@
-# Hash from: https://download.qt.io/official_releases/qt/6.8/6.8.1/submodules/qtwebsockets-everywhere-src-6.8.1.tar.xz.sha256
-sha256  e4cfdae8760bedd1c2b00429a6c9bf88cc11c5018dcb46bde277fb1edf341e3f  qtwebsockets-everywhere-src-6.8.1.tar.xz
+# Hash from: https://download.qt.io/official_releases/qt/6.9/6.9.1/submodules/qtwebsockets-everywhere-src-6.9.1.tar.xz.sha256
+sha256  98be8c863b7f02cc98eedc0b6eac07544c10a9d2fa11c685fd61f6b243f748f5  qtwebsockets-everywhere-src-6.9.1.tar.xz
 
 # Hashes for license files:
 sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
