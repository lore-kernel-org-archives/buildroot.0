From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 18:04:49 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/mender/mender.mk:
 use MENDER_PKGDIR variable
Message-ID: <20210403154203.285EE8392E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1580a578577e76a5010e8719eb11c3b572eacabf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Currently there is a mix of calls to package/mender and $(MENDER_PKGDIR) in the
mender.mk file. Standardize the calls to only $(MENDER_PKGDIR).

Signed-off-by: Adam Duskett <Aduskett@rivian.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e6c2e3a86928c490e9977c23f6ed781a186176d0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender/mender.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ca24b853b5..1807ccfee0 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -60,10 +60,10 @@ define MENDER_INSTALL_CONFIG_FILES
 			$(TARGET_DIR)/usr/share/mender/inventory/mender-inventory-$(f)
 	)
 
-	$(INSTALL) -D -m 0755 package/mender/artifact_info \
+	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/artifact_info \
 			$(TARGET_DIR)/etc/mender/artifact_info
 
-	$(INSTALL) -D -m 0755 package/mender/device_type \
+	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
 	mkdir -p $(TARGET_DIR)/var/lib
@@ -82,7 +82,7 @@ define MENDER_INSTALL_INIT_SYSTEMD
 endef
 
 define MENDER_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/mender/S42mender \
+	$(INSTALL) -D -m 755 $(MENDER_PKGDIR)/S42mender \
 		$(TARGET_DIR)/etc/init.d/S42mender
 endef
 
