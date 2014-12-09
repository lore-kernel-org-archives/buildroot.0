From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  9 Dec 2014 16:14:31 +0100
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
Message-ID: <1418138071-9219-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 fs/common.mk               |    2 +-
 package/omniorb/omniorb.mk |    2 +-
 package/xenomai/xenomai.mk |    6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/common.mk b/fs/common.mk
index d40f5ae..13bf4ad 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -106,7 +106,7 @@ endif
 endef
 
 define ROOTFS_TARGET
-$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
+	$(call ROOTFS_TARGET_INTERNAL,$(1),$(call UPPERCASE,$(1)))
 endef
 
 include $(sort $(wildcard fs/*/*.mk))
diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index 25d3b73..82d6807 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -37,7 +37,7 @@ HOST_OMNIORB_CONF_OPTS += --disable-longdouble
 # required.  The tools however are host related and should never
 # be required on target.
 define OMNIORB_ENABLE_EXTRA_APPS
-$(SED) 's:SUBDIRS += lib:SUBDIRS += lib appl services:g' $(@D)/src/dir.mk
+	$(SED) 's:SUBDIRS += lib:SUBDIRS += lib appl services:g' $(@D)/src/dir.mk
 endef
 
 ifeq ($(BR2_PACKAGE_OMNIORB_WITH_APPS),y)
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index ccbae35..8f08939 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -88,9 +88,9 @@ endef
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_SKINS
 
 define XENOMAI_DEVICES
-/dev/rtheap  c  666  0  0  10  254  0  0  -
-/dev/rtscope c  666  0  0  10  253  0  0  -
-/dev/rtp     c  666  0  0  150 0    0  1  32
+	/dev/rtheap  c  666  0  0  10  254  0  0  -
+	/dev/rtscope c  666  0  0  10  253  0  0  -
+	/dev/rtp     c  666  0  0  150 0    0  1  32
 endef
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-- 
1.7.9.5
