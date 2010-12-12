From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 00:42:03 +0100
Subject: [Buildroot] [git commit master 1/1] i2c-tools: ensure binaries are
	installed in the right place
Message-ID: <20101212234309.862768E0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=41a1a92095d2addc55f7050a67ce18d98781fa36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And remove unneeded explicit stripping of target binaries

[Peter: use install -D]
Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                        |    2 +-
 package/i2c-tools/i2c-tools.mk |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2c24609..11c2bec 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 	compilation, and cache is stored in ~/.buildroot-ccache.
 
 	Updated/fixed packages: busybox, dbus, cloop, gdk-pixbuf,
-	hostapd, libconfig, m4, openssh, openssl, qt, usbutils, xz,
+	hostapd, i2c-tools, libconfig, m4, openssh, openssl, qt, usbutils, xz,
 	zlib
 
 	New packages: dhrystone, lsuio, rsh-redone, whetstone
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index d419524..58dde05 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -14,8 +14,7 @@ endef
 define I2C_TOOLS_INSTALL_TARGET_CMDS
 	for i in i2cdump i2cget i2cset i2cdetect; \
 	do \
-		$(INSTALL) -m 755 $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
-		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/$$i; \
+		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
 	done
 endef
 
-- 
1.7.2.2
