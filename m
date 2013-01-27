From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Jan 2013 17:22:28 +0100
Subject: [Buildroot] [git commit] olsr: reindent commands with tabs
Message-ID: <20130127162359.72FB09A82E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f99c2a82fa1a2aa94072a5d2066828fd589075f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/olsr/olsr.mk |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

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
