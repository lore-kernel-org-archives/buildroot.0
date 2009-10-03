From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 09:21:45 +0200
Subject: [Buildroot] [git commit master] directfb: fix tabs instead of spaces
Message-ID: <20091003072318.9178477728@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f9775c914859aa8b34e45c7c4a2d2a077c4b0858
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0eca108b738acf9d3 (directfb: add host-directfb target
for directfb-csource) had tabs replaced by spaces, causing stuff
to break - Fixed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |   56 +++++++++++++++++++++---------------------
 1 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 4175753..b611c92 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -158,47 +158,47 @@ DIRECTFB_HOST_DIR:=$(BUILD_DIR)/directfb-$(DIRECTFB_VERSION)-host
 DIRECTFB_HOST_BINARY:=$(HOST_DIR)/usr/bin/directfb-csource
 
 $(DL_DIR)/$(DIRECTFB_SOURCE):
-        $(call DOWNLOAD,$(DIRECTFB_SITE),$(DIRECTFB_SOURCE))
+	$(call DOWNLOAD,$(DIRECTFB_SITE),$(DIRECTFB_SOURCE))
 
 $(STAMP_DIR)/host_directfb_unpacked: $(DL_DIR)/$(DIRECTFB_SOURCE)
-        mkdir -p $(DIRECTFB_HOST_DIR)
-        $(INFLATE$(suffix $(DIRECTFB_SOURCE))) $< | \
-                $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DIRECTFB_HOST_DIR) $(TAR_OPTIONS) -
-        touch $@
+	mkdir -p $(DIRECTFB_HOST_DIR)
+	$(INFLATE$(suffix $(DIRECTFB_SOURCE))) $< | \
+		$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(DIRECTFB_HOST_DIR) $(TAR_OPTIONS) -
+	touch $@
 
 $(STAMP_DIR)/host_directfb_configured: $(STAMP_DIR)/host_directfb_unpacked $(STAMP_DIR)/host_pkgconfig_installed
-        (cd $(DIRECTFB_HOST_DIR); rm -rf config.cache; \
-                $(HOST_CONFIGURE_OPTS) \
-                CFLAGS="$(HOST_CFLAGS)" \
-                LDFLAGS="$(HOST_LDFLAGS)" \
-                ./configure \
-                --prefix="$(HOST_DIR)/usr" \
-                --sysconfdir="$(HOST_DIR)/etc" \
-                --enable-shared \
-                --disable-static \
-                --disable-debug \
-                --disable-multi \
-                --with-gfxdrivers=none \
-                --with-inputdrivers=none \
-        )
-        touch $@
+	(cd $(DIRECTFB_HOST_DIR); rm -rf config.cache; \
+		$(HOST_CONFIGURE_OPTS) \
+		CFLAGS="$(HOST_CFLAGS)" \
+		LDFLAGS="$(HOST_LDFLAGS)" \
+		./configure \
+		--prefix="$(HOST_DIR)/usr" \
+		--sysconfdir="$(HOST_DIR)/etc" \
+		--enable-shared \
+		--disable-static \
+		--disable-debug \
+		--disable-multi \
+		--with-gfxdrivers=none \
+		--with-inputdrivers=none \
+	)
+	touch $@
 
 $(STAMP_DIR)/host_directfb_compiled: $(STAMP_DIR)/host_directfb_configured
-        $(MAKE) -C $(DIRECTFB_HOST_DIR)/tools directfb-csource
-        touch $@
+	$(MAKE) -C $(DIRECTFB_HOST_DIR)/tools directfb-csource
+	touch $@
 
 $(STAMP_DIR)/host_directfb_installed: $(STAMP_DIR)/host_directfb_compiled
-        $(INSTALL) -m 0755 $(DIRECTFB_HOST_DIR)/tools/directfb-csource $(HOST_DIR)/usr/bin
-        touch $@
+	$(INSTALL) -m 0755 $(DIRECTFB_HOST_DIR)/tools/directfb-csource $(HOST_DIR)/usr/bin
+	touch $@
 
 host-directfb: $(STAMP_DIR)/host_directfb_installed
 
 host-directfb-source: directfb-source
 
 host-directfb-clean:
-        rm -f $(addprefix $(STAMP_DIR)/host_directfb_,unpacked configured compiled installed)
-        rm -f $(HOST_DIR)/usr/bin/directfb-csource
-        -$(MAKE) -C $(DIRECTFB_HOST_DIR)/tools clean
+	rm -f $(addprefix $(STAMP_DIR)/host_directfb_,unpacked configured compiled installed)
+	rm -f $(HOST_DIR)/usr/bin/directfb-csource
+	-$(MAKE) -C $(DIRECTFB_HOST_DIR)/tools clean
 
 host-directfb-dirclean:
-        rm -rf $(DIRECTFB_HOST_DIR)
+	rm -rf $(DIRECTFB_HOST_DIR)
-- 
1.6.3.3
