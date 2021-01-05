From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 20:52:21 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/openvpn: adds
 target install of systemd unit files
Message-ID: <20210105194047.9EDB282A9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15a36ea1e3ffb3ded1af884dd27e713649bd681d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Signed-off-by: Edmundo Ferreira <fc.edmundo@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7105e65cd6b8f857bab54e4c0a8c57da776b0564)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1008c47b5a..caec41e2a5 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -82,4 +82,11 @@ define OPENVPN_INSTALL_INIT_SYSV
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
