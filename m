From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 22:50:51 +0100
Subject: [Buildroot] [git commit] package/rauc: add systemd service file hook
Message-ID: <20191118214334.EA1948F25B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61d35fb72790739d9b4f50b88e447bcfc85a2bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rauc/rauc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index a49a580781..f3434e9c9a 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -30,6 +30,12 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 RAUC_DEPENDENCIES += systemd
 endif
 
+define RAUC_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/rauc.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rauc.service
+endef
+
 HOST_RAUC_DEPENDENCIES = \
 	host-pkgconf \
 	host-openssl \
