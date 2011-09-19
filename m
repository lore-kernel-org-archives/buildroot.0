From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:53:20 +0200
Subject: [Buildroot] [PATCH 17/21] whetstone: use the <pkg>_EXTRACT_CMDS
	mechanism
In-Reply-To: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7ac0cd3f95c114a85fb40478646be687626baad3.1316464690.git.thomas.petazzoni@free-electrons.com>
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
