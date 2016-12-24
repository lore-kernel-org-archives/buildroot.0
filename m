From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 24 Dec 2016 12:37:39 +0100
Subject: [Buildroot] [PATCH] package/bullet: bump to version 2.85.1
Message-ID: <1482579459-3280-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://bulletphysics.org/wordpress/?p=456

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/bullet/bullet.hash |  2 +-
 package/bullet/bullet.mk   | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/bullet/bullet.hash b/package/bullet/bullet.hash
index 5b5360c..cccc425 100644
--- a/package/bullet/bullet.hash
+++ b/package/bullet/bullet.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c26ac96b487d7e44136ff4406dbbfe5a4d7d254ed1a2c09122c464803e7d1314  bullet-19f999ac087e68ffc2551ffb73e35e60271a0d27.tar.gz
+sha256 6e157c0b50373bc0e860de27f06397827bb28a4205bc568ae79d76a0f919ed62  bullet-2.85.1.tar.gz
diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index 3ec97b4..99ff423 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-# This is the git id of the 2.82 release.
-BULLET_VERSION = 19f999ac087e68ffc2551ffb73e35e60271a0d27
+BULLET_VERSION = 2.85.1
 BULLET_SITE = $(call github,bulletphysics,bullet3,$(BULLET_VERSION))
 BULLET_INSTALL_STAGING = YES
 BULLET_LICENSE = zlib license
-BULLET_LICENSE_FILES = BulletLicense.txt COPYING
+BULLET_LICENSE_FILES = LICENSE.txt
 
-# Disable GLUT support since there is no freeglut or OpenGLUT package and we
-# don't build the demos apps.
-BULLET_CONF_OPTS = -DUSE_GLUT=OFF -DBUILD_DEMOS=OFF
+# Disable demos apps and unit tests.
+# Disable Bullet3 library.
+BULLET_CONF_OPTS = -DBUILD_UNIT_TESTS=OFF \
+	-DBUILD_BULLET2_DEMOS=OFF \
+	-DBUILD_BULLET3=OFF
 
 $(eval $(cmake-package))
-- 
2.5.5
