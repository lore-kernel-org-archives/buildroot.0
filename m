From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2011 21:57:49 +0200
Subject: [Buildroot] [PATCH 13/15] whetstone: use the <pkg>_EXTRACT_CMDS
	mechanism
In-Reply-To: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
References: <cover.1317325743.git.thomas.petazzoni@free-electrons.com>
Message-ID: <aaa277751d952e1184021da2f22bd6c2d4288039.1317325743.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/whetstone/whetstone.mk |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/whetstone/whetstone.mk b/package/whetstone/whetstone.mk
index 48a3adf..048f4de 100644
--- a/package/whetstone/whetstone.mk
+++ b/package/whetstone/whetstone.mk
@@ -8,6 +8,10 @@ WHETSTONE_VERSION = 1.2
 WHETSTONE_SOURCE = whetstone.c
 WHETSTONE_SITE = http://www.netlib.org/benchmark/
 
+define WHETSTONE_EXTRACT_CMDS
+	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
+endef
+
 define WHETSTONE_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) LDLIBS="-lm" -C $(@D) whetstone
 endef
@@ -25,9 +29,3 @@ define WHETSTONE_UNINSTALL_TARGET_CMDS
 endef
 
 $(eval $(call GENTARGETS))
-
-$(BUILD_DIR)/whetstone-$(WHETSTONE_VERSION)/.stamp_extracted:
-	@$(call MESSAGE,"Extracting")
-	$(Q)mkdir -p $(@D)
-	$(Q)cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/
-	$(Q)touch $@
-- 
1.7.4.1
