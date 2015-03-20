From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:13:54 -0400
Subject: [Buildroot] [PATCH v2 03/25] openvmtools: move systemd service to
	/usr/lib
In-Reply-To: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
References: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <1426878856-15747-4-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
---
 package/openvmtools/openvmtools.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index e0ec6d6..f8230b2 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -67,9 +67,9 @@ endef
 
 define OPENVMTOOLS_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/openvmtools/vmtoolsd.service \
-		$(TARGET_DIR)/etc/systemd/system/vmtoolsd.service
+		$(TARGET_DIR)/usr/lib/systemd/system/vmtoolsd.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../vmtoolsd.service \
+	ln -fs ../../../../usr/lib/systemd/system/vmtoolsd.service \
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/vmtoolsd.service
 endef
 
-- 
2.1.0
