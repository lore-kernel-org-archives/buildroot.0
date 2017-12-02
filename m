From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 13:08:49 +0100
Subject: [Buildroot] [PATCH 1/1] motion: add webp support
Message-ID: <20171202120849.28407-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/motion/motion.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index dfbb70d64..03144065c 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -48,6 +48,13 @@ else
 MOTION_CONF_OPTS += --without-sqlite3
 endif
 
+ifeq ($(BR2_PACKAGE_WEBP_MUX),y)
+MOTION_DEPENDENCIES += webp
+MOTION_CONF_OPTS += --with-webp
+else
+MOTION_CONF_OPTS += --without-webp
+endif
+
 # Do not use default install target as it installs many unneeded files and
 # directories: docs, examples and init scripts
 define MOTION_INSTALL_TARGET_CMDS
-- 
2.14.1
