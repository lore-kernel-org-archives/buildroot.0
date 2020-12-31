From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:41:32 +0100
Subject: [Buildroot] [git commit] package/openvpn: adds target install of
 systemd unit files
Message-ID: <20201231142408.05BE383ABF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7105e65cd6b8f857bab54e4c0a8c57da776b0564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Edmundo Ferreira <fc.edmundo@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/openvpn.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 3efc9e2354..741da9784c 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -79,4 +79,11 @@ define OPENVPN_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
 
+define OPENVPN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/distro/systemd/openvpn-client at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/openvpn-client at .service
+	$(INSTALL) -D -m 0644 $(@D)/distro/systemd/openvpn-server at .service \
+		$(TARGET_DIR)/usr/lib/systemd/system/openvpn-server at .service
+endef
+
 $(eval $(autotools-package))
