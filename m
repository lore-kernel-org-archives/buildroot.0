From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:43:41 +0100
Subject: [Buildroot] [git commit] motion: add webp support
Message-ID: <20171202133623.9578B80F6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b9f4d5a9dd73ae31bd213e7a2a8c6507fa924e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/motion/motion.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index dfbb70d..0314406 100644
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
