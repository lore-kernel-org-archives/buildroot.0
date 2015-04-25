From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 10:15:43 +0200
Subject: [Buildroot] [git commit] qwt: bump to version 6.1.2
Message-ID: <20150425081612.809457FFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04f77f08e34f64e16712a2dc25f7a06276137e19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Qwt 6.1.2 fixes several minor issues in 6.1.0 and removes the need to
carry a patch in Buildroot.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qwt/0001-remove-installed-check.patch |   32 -------------------------
 package/qwt/qwt.hash                          |    2 +-
 package/qwt/qwt.mk                            |    2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/package/qwt/0001-remove-installed-check.patch b/package/qwt/0001-remove-installed-check.patch
deleted file mode 100644
index 7490a7b..0000000
--- a/package/qwt/0001-remove-installed-check.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Remove useless check at build time
-
-At build time, Qwt looks whether the Qwt libraries are already
-installed in the destination directory, to avoid confusion between
-libraries installed system-wide and locally-built shared
-libraries. However, this behaviour conflicts with how Buildroot builds
-and installs libraries, so get rid of it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: qwt-6.0.0/qwtbuild.pri
-===================================================================
---- qwt-6.0.0.orig/qwtbuild.pri	2011-09-12 19:37:35.663275952 +0200
-+++ qwt-6.0.0/qwtbuild.pri	2011-09-12 19:37:41.913275949 +0200
-@@ -53,17 +53,3 @@
- !debug_and_release {
-     OBJECTS_DIR       = obj
- }
--
--unix {
--
--    exists( $${QMAKE_LIBDIR_QT}/libqwt.* ) {
--
--        # On some Linux distributions the Qwt libraries are installed 
--        # in the same directory as the Qt libraries. Unfortunately
--        # qmake always adds QMAKE_LIBDIR_QT at the beginning of the 
--        # linker path, so that the installed libraries will be
--        # used instead of the local ones.
--
--        error( "local build will conflict with $${QMAKE_LIBDIR_QT}/libqwt.*" )
--    }
--}
diff --git a/package/qwt/qwt.hash b/package/qwt/qwt.hash
index dfc9c31..fc78b75 100644
--- a/package/qwt/qwt.hash
+++ b/package/qwt/qwt.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  a7e3d9f1db917d186a973c5f04a316bc9607c7c35794d7a16de323aba5e17402  qwt-6.1.0.tar.bz2
+sha256  2b08f18d1d3970e7c3c6096d850f17aea6b54459389731d3ce715d193e243d0c  qwt-6.1.2.tar.bz2
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index c565ba0..8a46c25 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QWT_VERSION = 6.1.0
+QWT_VERSION = 6.1.2
 QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
 QWT_INSTALL_STAGING = YES
