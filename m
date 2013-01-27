From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jan 2013 16:35:11 +0100
Subject: [Buildroot] [PATCH 1/2] olsr: reindent commands with tabs
Message-ID: <1359300912-25118-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.mk |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index a43a90c..a93312e 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -16,18 +16,18 @@ OLSR_PLUGINS = dot_draw dyn_gw secure
 OLSR_TARGET_PLUGIN = usr/lib/
 
 define OLSR_BUILD_CMDS
- $(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd $(OLSR_PLUGINS)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd $(OLSR_PLUGINS)
 endef
 
 define OLSR_INSTALL_TARGET_CMDS
- cp -dpf $(@D)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
- cp -R $(@D)/lib/*/olsrd_*.so* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
- mkdir -p $(TARGET_DIR)/etc/init.d
- cp -dpf package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/
- test -r $(TARGET_DIR)/etc/olsrd.conf || \
-   cp -dpf $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
- -$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so*
- $(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+	cp -dpf $(@D)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
+	cp -R $(@D)/lib/*/olsrd_*.so* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
+	mkdir -p $(TARGET_DIR)/etc/init.d
+	cp -dpf package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/
+	test -r $(TARGET_DIR)/etc/olsrd.conf || \
+		cp -dpf $(@D)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so*
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
 endef
 
 define OLSR_CLEAN_CMDS
-- 
1.7.9.5
