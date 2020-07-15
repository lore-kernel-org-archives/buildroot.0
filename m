From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:41:52 +0200
Subject: [Buildroot] [git commit] package/mender: set the default script
 version to 3
Message-ID: <20200715214305.AD7108189B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0fd581a3a8e5a6b98739cc6bc7e32179d4170fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 3 scripts have been supported since version 2.0 and should be the
default.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index cd840b1e3f..2faf3fe980 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -39,7 +39,7 @@ MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
 
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
-	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version
+	echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
 
 	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
