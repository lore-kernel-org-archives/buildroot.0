From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 16 Jan 2014 09:09:30 +0100
Subject: [Buildroot] [PATCH 1/1] package: fix white spaces
Message-ID: <1389859770-31118-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 fs/cramfs/cramfs.mk                    |    4 ++--
 fs/iso9660/iso9660.mk                  |    2 +-
 package/alsa-lib/alsa-lib.mk           |    6 +++---
 package/gadgetfs-test/gadgetfs-test.mk |    2 +-
 package/matchbox/matchbox.mk           |    2 +-
 package/trace-cmd/trace-cmd.mk         |    2 +-
 package/zsh/zsh.mk                     |    4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/cramfs/cramfs.mk b/fs/cramfs/cramfs.mk
index 402d19f..9fbb7dd 100644
--- a/fs/cramfs/cramfs.mk
+++ b/fs/cramfs/cramfs.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 ifeq ($(BR2_ENDIAN),"BIG")
-CRAMFS_OPTS=-b
+CRAMFS_OPTS = -b
 else
-CRAMFS_OPTS=-l
+CRAMFS_OPTS = -l
 endif
 
 define ROOTFS_CRAMFS_CMD
diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
index aa17904..a6a9c95 100644
--- a/fs/iso9660/iso9660.mk
+++ b/fs/iso9660/iso9660.mk
@@ -47,5 +47,5 @@ rootfs-iso9660: $(BINARIES_DIR)/rootfs.iso9660
 #
 ################################################################################
 ifeq ($(BR2_TARGET_ROOTFS_ISO9660),y)
-TARGETS+=rootfs-iso9660
+TARGETS += rootfs-iso9660
 endif
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 1b6ea6f..d7aacb6 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -10,7 +10,7 @@ ALSA_LIB_SITE = http://alsa.cybermirror.org/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
 ALSA_LIB_LICENSE_FILES = COPYING
 ALSA_LIB_INSTALL_STAGING = YES
-ALSA_LIB_CFLAGS=$(TARGET_CFLAGS)
+ALSA_LIB_CFLAGS = $(TARGET_CFLAGS)
 ALSA_LIB_AUTORECONF = YES
 ALSA_LIB_CONF_OPT = --with-alsa-devdir=$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_DEVDIR)) \
 		    --with-pcm-plugins="$(call qstrip,$(BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS))" \
@@ -54,14 +54,14 @@ ALSA_LIB_CONF_OPT += --enable-debug
 endif
 
 ifeq ($(BR2_avr32),y)
-ALSA_LIB_CFLAGS+=-DAVR32_INLINE_BUG
+ALSA_LIB_CFLAGS += -DAVR32_INLINE_BUG
 endif
 
 ifeq ($(BR2_PACKAGE_ALSA_LIB_PYTHON),y)
 ALSA_LIB_CONF_OPT += \
 	--with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
 	--with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-ALSA_LIB_CFLAGS+=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
+ALSA_LIB_CFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 ALSA_LIB_DEPENDENCIES = python
 else
 ALSA_LIB_CONF_OPT += --disable-python
diff --git a/package/gadgetfs-test/gadgetfs-test.mk b/package/gadgetfs-test/gadgetfs-test.mk
index d3b5be0..fe6296b 100644
--- a/package/gadgetfs-test/gadgetfs-test.mk
+++ b/package/gadgetfs-test/gadgetfs-test.mk
@@ -11,7 +11,7 @@ GADGETFS_TEST_MAKEOPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(
 
 ifeq ($(BR2_PACKAGE_GADGETFS_TEST_USE_AIO),y)
 GADGETFS_TEST_DEPENDENCIES = libaio
-GADGETFS_TEST_MAKEOPTS+=USE_AIO=y
+GADGETFS_TEST_MAKEOPTS += USE_AIO=y
 endif
 
 define GADGETFS_TEST_BUILD_CMDS
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index fff4add..aec57c0 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -1,4 +1,4 @@
 ifeq ($(BR2_PACKAGE_MATCHBOX),y)
 include $(sort $(wildcard package/matchbox/*/*.mk))
-TARGETS+=matchbox-lib matchbox-wm
+TARGETS += matchbox-lib matchbox-wm
 endif
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 69e0e69..6a732db 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -25,7 +25,7 @@ endif
 
 # trace-cmd already defines _LARGEFILE64_SOURCE when necessary,
 # redefining it on the command line causes build problems.
-TRACE_CMD_CFLAGS=$(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
+TRACE_CMD_CFLAGS = $(filter-out -D_LARGEFILE64_SOURCE,$(TARGET_CFLAGS)) -D_GNU_SOURCE
 
 define TRACE_CMD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 70b2fb1..8bd2fb0 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZSH_VERSION=5.0.5
-ZSH_SITE=http://downloads.sourceforge.net/project/zsh/zsh/$(ZSH_VERSION)
+ZSH_VERSION = 5.0.5
+ZSH_SITE = http://downloads.sourceforge.net/project/zsh/zsh/$(ZSH_VERSION)
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 
-- 
1.7.9.5
