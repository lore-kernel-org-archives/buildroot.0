From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 11 Apr 2019 16:40:42 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5virtualkeyboard: fix legal-info
 failure
Message-ID: <20190411144042.57324-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After version bump, all sha256 were updated, but not the changed license
files paths.

Update license files paths.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash | 8 ++++----
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk      | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
index 69c947359a..245f2b4a70 100644
--- a/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
+++ b/package/qt5/qt5virtualkeyboard/5.12.2/qt5virtualkeyboard.hash
@@ -3,7 +3,7 @@ sha256 7111de5c78f8a0d29394409727647b90ae5906fd5105c843af98c3ae3804248d qtvirtua
 
 # Hashes for license files:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
-sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
-sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/virtualkeyboard/3rdparty/openwnn/NOTICE
-sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/virtualkeyboard/3rdparty/pinyin/NOTICE
-sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/virtualkeyboard/3rdparty/tcime/COPYING
+sha256 7a45a9769d19545480a241230e6ea520b5156fac00930dcd69b6886749743d10 src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
+sha256 05cc719deafd0ab083b03296bb2911de10d116953b626a7629b9ca59938038b1 src/plugins/openwnn/3rdparty/openwnn/NOTICE
+sha256 b5830d96fb5a7e7e7ebcc295f352846b4b998e78fdc8f9aa68e134d2e4b39986 src/plugins/pinyin/3rdparty/pinyin/NOTICE
+sha256 9400a6128693d2f25653698e695f554660c71efccc8c21af28bf143e35199db6 src/plugins/tcime/3rdparty/tcime/COPYING
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 3f1ebdbaa4..b5c611f6d0 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -26,19 +26,19 @@ QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LA
 
 ifneq ($(filter ja_JP all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (openwnn)
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/openwnn/NOTICE
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/openwnn/3rdparty/openwnn/NOTICE
 endif
 
 ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (pinyin)
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/pinyin/3rdparty/pinyin/NOTICE
 endif
 
 ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
 QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), Apache-2.0 (tcime), BSD-3-Clause (tcime)
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/tcime/3rdparty/tcime/COPYING
 endif
 endif
 
@@ -49,7 +49,7 @@ QT5VIRTUALKEYBOARD_LICENSE := $(QT5VIRTUALKEYBOARD_LICENSE), MIT (lipi-toolkit)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/license.txt
 else
-QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/lipi-toolkit/MIT_LICENSE.txt
+QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/lipi-toolkit/3rdparty/lipi-toolkit/MIT_LICENSE.txt
 endif
 endif
 
-- 
2.17.1
