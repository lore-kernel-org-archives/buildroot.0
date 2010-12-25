From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sat, 25 Dec 2010 10:17:56 -0600
Subject: [Buildroot] [PATCH] lvm2: force the use of TARGET_AR
Message-ID: <c660a7b063637aac507033475ec108ef27799fad.1293293852.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/lvm2/lvm2.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 9755392..77cbdc5 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -19,6 +19,8 @@ LVM2_BINS = \
 	vgexport vgextend vgimport vgmerge vgmknodes 	\
 	vgreduce vgremove vgrename vgs vgscan vgsplit
 
+LVM2_MAKE_OPT = AR="$(TARGET_AR)"
+
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner.
 LVM2_CONF_OPT += --enable-write_install
@@ -36,7 +38,7 @@ LVM2_CONF_OPT += --disable-readline
 endif
 
 ifeq ($(BR2_PACKAGE_LVM2_DMSETUP_ONLY),y)
-LVM2_MAKE_OPT = device-mapper
+LVM2_MAKE_OPT += device-mapper
 LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
 LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
 endif
-- 
1.7.3.2
