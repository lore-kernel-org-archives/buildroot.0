From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 22:42:17 +0200
Subject: [Buildroot] [git commit] qt5virtualkeyboard: fix patch applied to
 2.0 version
Message-ID: <20180905204451.C8F8A828BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=945a8361748c4b9817f0b308bcfa03386eababda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0001-remove-weird-install-path-for-example.patch using
patch: does not apply properly and needs to be fixed.

The patch was backported from 5.7 [1] with path adaptation in commit
(cb97d9473b qt5virtualkeyboard: allow to build with qt5.6), but the
submitted patch did not reflect that said adaptation.

Apply the said patch adaptation (i.e. add missing basic subdirectory) to
apply properly the patch.

Fixes:

   >>> qt5virtualkeyboard 2.0 Patching

   Applying 0001-remove-weird-install-path-for-example.patch using patch:
   patching file examples/virtualkeyboard/basic/basic.pro
   Hunk #1 FAILED at 7.
   1 out of 1 hunk FAILED -- saving rejects to file examples/virtualkeyboard/basic/basic.pro.rej
   make: ***[/home/test/autobuild/run/instance-2/output/build/qt5virtualkeyboard-2.0/.stamp_patched] Error 1

[1]: https://github.com/qt/qtvirtualkeyboard/commit/aef55eb7b3470ba6dee4abc67acda1d308c90e97

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../2.0/0001-remove-weird-install-path-for-example.patch            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch b/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
index 2f8ea3bc94..367cc4a1f7 100644
--- a/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
+++ b/package/qt5/qt5virtualkeyboard/2.0/0001-remove-weird-install-path-for-example.patch
@@ -23,13 +23,13 @@ index 28cc4dc..0f71e0e 100644
      QTPLUGIN += qtvirtualkeyboardplugin
  }
 -android-no-sdk|!isEmpty(CROSS_COMPILE) {
--    TARGETPATH = /data/user/qt/virtualkeyboard
+-    TARGETPATH = /data/user/qt/virtualkeyboard/basic
 -} else {
--    TARGETPATH = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard
+-    TARGETPATH = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard/basic
 -}
 -target.path = $$TARGETPATH
 +
-+target.path = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard
++target.path = $$[QT_INSTALL_EXAMPLES]/virtualkeyboard/basic
  INSTALLS += target
  
  RESOURCES += \
