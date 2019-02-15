From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 22:58:20 +0100
Subject: [Buildroot] [git commit] package/mender: fix missing /var/lib
Message-ID: <20190215215703.F3D6B885E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd97b055b11b8708438974555d1746a18924ceba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mender needs /var/lib directory to be available: on some configurations
/var/lib is not available and thus the mender package installation fails.
This patch does a mkdir to ensure the /var/lib directory is always
available.

Fixes:

  http://autobuild.buildroot.net/results/d2237083a13ab7688dd2b6dc8dbcd4226ed5651a/

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index cd18c0055a..07f6e5e5f9 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -57,6 +57,7 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0755 package/mender/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
+	mkdir -p $(TARGET_DIR)/var/lib
 	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
 endef
 
