From: Edmundo Ferreira <fc.edmundo@gmail.com>
Date: Tue, 15 Dec 2020 17:36:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvpn: adds target install of
 systemd unit files
Message-ID: <20201215163610.12070-1-edmundo.ferreira@esa.int>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Edmundo Ferreira <fc.edmundo@gmail.com>

Signed-off-by: Edmundo Ferreira <fc.edmundo@gmail.com>
---
 package/openvpn/openvpn.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3efc9e2354..399cbf7a85 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -79,4 +79,12 @@ define OPENVPN_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
 
+define OPENVPN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/distro/systemd/openvpn-client at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/openvpn-client at .service
+
+	$(INSTALL) -D -m 0644 $(@D)/distro/systemd/openvpn-server at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/openvpn-server at .service
+endef
+
 $(eval $(autotools-package))
-- 
2.17.1
