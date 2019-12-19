From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu, 19 Dec 2019 11:01:35 -0800
Subject: [Buildroot] [PATCH 1/1] package/openrc: install sysv-rcs file
Message-ID: <20191219190135.7013-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

package/openrc has the file sysv-rcs which starts sysvinit services
not written for openrc. However, currently it is not installed to
the target.

Install this file to $(TARGET_DIR)/etc/init.d during the
target_install step.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 package/openrc/openrc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 387962d4d5..c7c8b0461a 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -35,6 +35,8 @@ endef
 
 define OPENRC_INSTALL_TARGET_CMDS
 	$(MAKE) $(OPENRC_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D) install
+	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
+		$(TARGET_DIR)/etc/init.d/
 endef
 
 ifeq ($(BR2_PACKAGE_NETIFRC),y)
-- 
2.24.1
