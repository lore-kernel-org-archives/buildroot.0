From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  5 Feb 2019 15:16:41 +0100
Subject: [Buildroot] [PATCH] package/mender: fixing init script naming
Message-ID: <1549376201-16547-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installed systemv script should be name S42mender and not S04mender.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/mender/mender.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 0d71938..ae5bcb8 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -70,8 +70,8 @@ define MENDER_INSTALL_INIT_SYSTEMD
 endef
 
 define MENDER_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/mender/S04mender \
-		$(TARGET_DIR)/etc/init.d/S04mender
+	$(INSTALL) -D -m 755 package/mender/S42mender \
+		$(TARGET_DIR)/etc/init.d/S42mender
 endef
 
 $(eval $(golang-package))
-- 
2.7.4
