Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4380781345;
	Mon,  7 Mar 2022 21:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P1frO-5m83CQ; Mon,  7 Mar 2022 21:24:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED3E812F5;
	Mon,  7 Mar 2022 21:24:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F23701BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E120660BD1
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LHWvO9Rwiv5I for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD88660B35
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 039E68263F; Mon,  7 Mar 2022 21:15:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:21:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 338acc3d440a5ade6c0d79b86a7b67342ea3f371
X-Git-Newrev: 84e7062cba31f64fbca98b042d3ac1da1866418e
X-Patchwork-Hint: ignore
Message-Id: <20220307211546.039E68263F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kf5: bump to version 5.91
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

commit: https://git.buildroot.net/buildroot/commit/?id=84e7062cba31f64fbca98b042d3ac1da1866418e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure of kf5-kcoreaddons with
python 3.10 raised since commit
25b1fc2898d68ddf2674b14c738045875fc5a2dc:

CMake Error at /home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/share/ECM/find-modules/FindPythonModuleGeneration.cmake:149 (message):
  The max python version in PythonModuleGeneration must be updated.
Call Stack (most recent call first):
  src/lib/CMakeLists.txt:208 (find_package)

It will also fix the following build failure of kf5-kcoreaddons raised
since commit 5770a645a3a49a3f0f02972131a4ff5283b4c11e:

In file included from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/qchar.h:43,
                 from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/qstring.h:49,
                 from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/QString:1,
                 from /home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.h:27,
                 from /home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.cpp:22:
/home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/qt5/QtCore/qglobal.h:1274:80: note: declared here
 1274 | Q_CORE_EXPORT QT_DEPRECATED_VERSION_X_5_15("use QRandomGenerator instead") int qrand();
      |                                                                                ^~~~~
/home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.cpp: In function 'QString KRandom::randomString(int)':
/home/peko/autobuild/instance-0/output-1/build/kf5-kcoreaddons-5.47.0/src/lib/randomness/krandom.cpp:76:27: error: use of deleted function 'QCharRef& QCharRef::operator=(char)'
   76 |         str[i++] =  char(r);
      |                           ^

- Update indentation in hash file (two spaces)
- Update licenses due to
  https://invent.kde.org/frameworks/kcoreaddons/-/commit/93480398b551aee572f9f1a0ee48ed45a8476580
  https://invent.kde.org/frameworks/modemmanager-qt/-/commit/8ad494d957cab343a60a61a2163f1ca23e9e3511
  https://invent.kde.org/frameworks/networkmanager-qt/-/commit/fa9ef0d84898ad5e1f28857307bd5fcb8eb38e20

Fixes:
 - http://autobuild.buildroot.org/results/0267ff54ee82d853476ff7d6b14edb4aba308aa2
 - http://autobuild.buildroot.org/results/694a2322d9161b55f5db66d1ace57d836360ed84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../kf5-extra-cmake-modules.hash                     |  4 ++--
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash     | 17 +++++++++++++++--
 package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk       | 20 ++++++++++++++++++--
 .../kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash | 11 +++++++++--
 .../kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk   | 13 +++++++++++--
 .../kf5-networkmanager-qt/kf5-networkmanager-qt.hash | 11 +++++++++--
 .../kf5-networkmanager-qt/kf5-networkmanager-qt.mk   | 12 ++++++++++--
 package/kf5/kf5.mk                                   |  2 +-
 8 files changed, 75 insertions(+), 15 deletions(-)

diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
index 733e267fdb..70b776b5d7 100644
--- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 976d8bd15a0b929376bfaef34602a0fb9614229851c46fac3c4b28938f682195 extra-cmake-modules-5.47.0.tar.xz
-sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
+sha256  9717885e30aadf184fa71511930409cabbf08eb6627ea8b051de8804fbcec54c  extra-cmake-modules-5.91.0.tar.xz
+sha256  46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b  COPYING-CMAKE-SCRIPTS
diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
index 0cd8dcfc15..e4ebf2bb39 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
@@ -1,3 +1,16 @@
 # Locally calculated
-sha256 40ff04757e4ac19bc8448940fe18886c894a2069865966cc865fc55ff67b0b46 kcoreaddons-5.47.0.tar.xz
-sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 COPYING.LIB
+sha256  dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  kcoreaddons-5.91.0.tar.xz
+
+# Hash for license files
+sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
+sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
+sha256  2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286  LICENSES/GPL-3.0-only.txt
+sha256  de588a8b1c41fe73ffe1201f9d12c718a988ed8e1302929625a6e7c2bced7461  LICENSES/LGPL-2.0-only.txt
+sha256  de588a8b1c41fe73ffe1201f9d12c718a988ed8e1302929625a6e7c2bced7461  LICENSES/LGPL-2.0-or-later.txt
+sha256  211f1b738d1b864bab2648bee9b55becd39fd2d6aa49c1196e7d87b41db4bc07  LICENSES/LGPL-2.1-only.txt
+sha256  476b03829862ab7e3ed920f87fad3de3c995f7dd93c26476eb40f0117de43fdc  LICENSES/LGPL-3.0-only.txt
+sha256  ef839531eb65b0168f9aed14047c84be13e9ea38801a73bc18abe24dc93e6ac9  LICENSES/LicenseRef-KDE-Accepted-GPL.txt
+sha256  d9f25707d20e804f15005be46527366b0604bd739754d144a83d3983d94a9a6a  LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
+sha256  272bc0fa06a23d3c807375f95f8d6ccd98541321d2882732668ab139c16f9bf4  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  a3b538a7d81c4935d185056479d12fd43042bb9f3a21c9cbb4a8500fab8e5880  LICENSES/MPL-1.1.txt
+sha256  7dea3adab58690d8ee14775da755cd30a52649a47704ff78ae85197ae0d37c60  LICENSES/Qt-LGPL-exception-1.1.txt
diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
index 9a034ba763..e2f67f15b2 100644
--- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
+++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.mk
@@ -7,8 +7,24 @@
 KF5_KCOREADDONS_VERSION = $(KF5_VERSION)
 KF5_KCOREADDONS_SITE = $(KF5_SITE)
 KF5_KCOREADDONS_SOURCE = kcoreaddons-$(KF5_KCOREADDONS_VERSION).tar.xz
-KF5_KCOREADDONS_LICENSE = LGPL-2.1
-KF5_KCOREADDONS_LICENSE_FILES = COPYING.LIB
+KF5_KCOREADDONS_LICENSE = \
+	LGPL-2.0+, LGPL-2.1 or LGPL-3.0 or LicenseRef-KDE-Accepted-LGPL (library), \
+	MPL.1.1 or GPL-2.0+ or LGPL-2.1+ (posix_fallocate_mac.h), \
+	LGPL-2.1 with Qt-LGPL-exception-1.1 or LicenseRef-Qt-Commercial (kprocesslist), \
+	GPL-2.0 or GPL-3.0 or LicenseRef-KDE-Accepted-GPL (autotests)
+KF5_KCOREADDONS_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-2.0-only.txt \
+	LICENSES/LGPL-2.0-or-later.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
+	LICENSES/LicenseRef-KDE-Accepted-LGPL.txt \
+	LICENSES/LicenseRef-Qt-Commercial.txt \
+	LICENSES/MPL-1.1.txt \
+	LICENSES/Qt-LGPL-exception-1.1.txt
 
 KF5_KCOREADDONS_DEPENDENCIES = \
 	kf5-extra-cmake-modules \
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
index 408eb0c0b0..4b6c03a3bb 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
@@ -1,3 +1,10 @@
 # Locally calculated
-sha256 8b6ab15ce82b7a30b26814178ac33380056ec4398707481aa5ce95cf09d39d03 modemmanager-qt-5.47.0.tar.xz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LIB
+sha256  a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  modemmanager-qt-5.91.0.tar.xz
+
+# Hash for license files
+sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
+sha256  2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286  LICENSES/GPL-3.0-only.txt
+sha256  211f1b738d1b864bab2648bee9b55becd39fd2d6aa49c1196e7d87b41db4bc07  LICENSES/LGPL-2.1-only.txt
+sha256  476b03829862ab7e3ed920f87fad3de3c995f7dd93c26476eb40f0117de43fdc  LICENSES/LGPL-3.0-only.txt
+sha256  ef839531eb65b0168f9aed14047c84be13e9ea38801a73bc18abe24dc93e6ac9  LICENSES/LicenseRef-KDE-Accepted-GPL.txt
+sha256  d9f25707d20e804f15005be46527366b0604bd739754d144a83d3983d94a9a6a  LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
index 81617492c0..38c80d3da8 100644
--- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
+++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.mk
@@ -7,8 +7,17 @@
 KF5_MODEMMANAGER_QT_VERSION = $(KF5_VERSION)
 KF5_MODEMMANAGER_QT_SITE = $(KF5_SITE)
 KF5_MODEMMANAGER_QT_SOURCE = modemmanager-qt-$(KF5_MODEMMANAGER_QT_VERSION).tar.xz
-KF5_MODEMMANAGER_QT_LICENSE = LGPL-2.1+
-KF5_MODEMMANAGER_QT_LICENSE_FILES = COPYING.LIB
+KF5_MODEMMANAGER_QT_LICENSE = \
+	LGPL-2.1 or LGPL-3.0 or LicenseRef-KDE-Accepted-LGPL (library), \
+	GPL-2.0 or GPL-3.0 or LicenseRef-KDE-Accepted-GPL (autotests, examples)
+
+KF5_MODEMMANAGER_QT_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
+	LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
 
 KF5_MODEMMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules modem-manager qt5base
 KF5_MODEMMANAGER_QT_INSTALL_STAGING = YES
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
index 8ccada455e..de4504064f 100644
--- a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash
@@ -1,3 +1,10 @@
 # Locally calculated
-sha256 d0b377500ee4cf4f029f4d04d6844bcf3d2d6734982b511a5fffab5165688209 networkmanager-qt-5.47.0.tar.xz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LIB
+sha256  2e20ffd995ce64a90b1133b594bab2b2292be54e538f62633e78e8296cc44738  networkmanager-qt-5.91.0.tar.xz
+
+# Hash for license files
+sha256  d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  LICENSES/GPL-2.0-only.txt
+sha256  2ca9503d76d1ffab14f599b4741382eec11face60ad1f0d7a41897809003a286  LICENSES/GPL-3.0-only.txt
+sha256  211f1b738d1b864bab2648bee9b55becd39fd2d6aa49c1196e7d87b41db4bc07  LICENSES/LGPL-2.1-only.txt
+sha256  476b03829862ab7e3ed920f87fad3de3c995f7dd93c26476eb40f0117de43fdc  LICENSES/LGPL-3.0-only.txt
+sha256  ef839531eb65b0168f9aed14047c84be13e9ea38801a73bc18abe24dc93e6ac9  LICENSES/LicenseRef-KDE-Accepted-GPL.txt
+sha256  d9f25707d20e804f15005be46527366b0604bd739754d144a83d3983d94a9a6a  LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
diff --git a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
index c383f98e9b..7adff2deb7 100644
--- a/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
+++ b/package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.mk
@@ -7,8 +7,16 @@
 KF5_NETWORKMANAGER_QT_VERSION = $(KF5_VERSION)
 KF5_NETWORKMANAGER_QT_SITE = $(KF5_SITE)
 KF5_NETWORKMANAGER_QT_SOURCE = networkmanager-qt-$(KF5_NETWORKMANAGER_QT_VERSION).tar.xz
-KF5_NETWORKMANAGER_QT_LICENSE = LGPL-2.1+
-KF5_NETWORKMANAGER_QT_LICENSE_FILES = COPYING.LIB
+KF5_NETWORKMANAGER_QT_LICENSE = \
+	LGPL-2.1 or LGPL-3.0 or LicenseRef-KDE-Accepted-LGPL (library), \
+	GPL-2.0 or GPL-3.0 or LicenseRef-KDE-Accepted-GPL (autotests, examples)
+KF5_NETWORKMANAGER_QT_LICENSE_FILES = \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-2.1-only.txt \
+	LICENSES/LGPL-3.0-only.txt \
+	LICENSES/LicenseRef-KDE-Accepted-GPL.txt \
+	LICENSES/LicenseRef-KDE-Accepted-LGPL.txt
 
 KF5_NETWORKMANAGER_QT_DEPENDENCIES = kf5-extra-cmake-modules network-manager qt5base
 KF5_NETWORKMANAGER_QT_INSTALL_STAGING = YES
diff --git a/package/kf5/kf5.mk b/package/kf5/kf5.mk
index 8360fc9b63..64b08bae4f 100644
--- a/package/kf5/kf5.mk
+++ b/package/kf5/kf5.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KF5_VERSION_MAJOR = 5.47
+KF5_VERSION_MAJOR = 5.91
 KF5_VERSION = $(KF5_VERSION_MAJOR).0
 KF5_SITE = https://download.kde.org/stable/frameworks/$(KF5_VERSION_MAJOR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
