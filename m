From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:29:07 +0200
Subject: [Buildroot] [git commit] package/mender/mender.mk: use
 MENDER_PKGDIR variable
Message-ID: <20210330200845.13C138A57F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6c2e3a86928c490e9977c23f6ed781a186176d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently there is a mix of calls to package/mender and $(MENDER_PKGDIR) in the
mender.mk file. Standardize the calls to only $(MENDER_PKGDIR).

Signed-off-by: Adam Duskett <Aduskett@rivian.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index bb37f2d8ed..3e82f556fb 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -62,10 +62,10 @@ define MENDER_INSTALL_CONFIG_FILES
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
 
-	$(INSTALL) -D -m 0755 package/mender/artifact_info \
+	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/artifact_info \
 			$(TARGET_DIR)/etc/mender/artifact_info
 
-	$(INSTALL) -D -m 0755 package/mender/device_type \
+	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
 	mkdir -p $(TARGET_DIR)/var/lib
@@ -84,7 +84,7 @@ define MENDER_INSTALL_INIT_SYSTEMD
 endef
 
 define MENDER_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/mender/S42mender \
+	$(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender \
 		$(TARGET_DIR)/etc/init.d/S42mender
 endef
 
