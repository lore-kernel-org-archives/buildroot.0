From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:38:51 +0100
Subject: [Buildroot] [PATCH 19/51] gpsd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/gpsd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 7dc27e8..f0045e0 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -206,6 +206,9 @@ define GPSD_INSTALL_TARGET_CMDS
 		$(SCONS) \
 		$(GPSD_SCONS_OPTS) \
 		install)
+endef
+
+define GPSD_INSTALL_INIT_SYSV
 	if [ ! -f $(TARGET_DIR)/etc/init.d/S50gpsd ]; then \
 		$(INSTALL) -m 0755 -D package/gpsd/S50gpsd $(TARGET_DIR)/etc/init.d/S50gpsd; \
 		$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd; \
-- 
2.1.0
