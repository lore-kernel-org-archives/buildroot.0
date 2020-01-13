From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 13 Jan 2020 09:38:19 +0100
Subject: [Buildroot] [PATCH v1] package/qt5virtualkeyboard: fix install for
 Qt 5.12.x
Message-ID: <20200113083819.13783-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Qt 5.12.x only handwriting/lipi-toolkit needs 3rdparty parts
installation (with Qt 5.6.x although zn_CZ/pinyin and zh_TW tcime).

Fixes:
  - https://bugs.busybox.net/show_bug.cgi?id=12456

  cp: cannot stat '.../host/arm-buildroot-linux-gnueabihf/sysroot/usr/qtvirtualkeyboard': No such file or directory

Reported-by: Sam Petrocelli<sam.petrocelli@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 59ee30c2d2..995e3e3aba 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -34,9 +34,9 @@ endif
 endif
 
 ifneq ($(filter zh_CN all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (pinyin)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/pinyin/NOTICE
 else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/pinyin/3rdparty/pinyin/NOTICE
@@ -44,9 +44,9 @@ endif
 endif
 
 ifneq ($(filter zh_TW all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
-QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE += , Apache-2.0 (tcime), BSD-3-Clause (tcime)
 ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+QT5VIRTUALKEYBOARD_3RDPARTY_PARTS = YES
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/virtualkeyboard/3rdparty/tcime/COPYING
 else
 QT5VIRTUALKEYBOARD_LICENSE_FILES += src/plugins/tcime/3rdparty/tcime/COPYING
-- 
2.24.1
