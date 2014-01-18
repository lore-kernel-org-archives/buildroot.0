From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 18 Jan 2014 09:31:45 +0100
Subject: [Buildroot] [PATCH 1/1] host-pkgconf: Link pkg-config to
	$(TARGET_CROSS)pkg-config
Message-ID: <BLU0-SMTP164ACFAA7CA060FF57A950ED9BB0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes ffmpeg configure warning

WARNING: /home/test/buildroot/output/host/usr/bin/nios2-linux-gnu-pkg-config not found, library detection may fail

found in
http://autobuild.buildroot.net/results/c66/c663a518f65e786895d9ad8866193f70cbd6e96d/

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/pkgconf/pkgconf.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index f3f6526..f467d66 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -22,6 +22,7 @@ define HOST_PKGCONF_INSTALL_WRAPPER
 	$(SED) 's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,' \
 		-e 's, at STAGING_DIR@,$(STAGING_DIR),' \
 		$(HOST_DIR)/usr/bin/pkg-config
+	ln -sf pkg-config $(TARGET_CROSS)pkg-config
 endef
 
 PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
-- 
1.7.9.5
