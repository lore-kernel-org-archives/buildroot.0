From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Jul 2015 16:05:29 +0200
Subject: [Buildroot] [git commit] upmpdcli: systemd support
Message-ID: <20150705140616.4F5828175F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2154063a38cffbcf189af3bb7fec2288cdc6fe82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Usable .service file is provided in the package.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/upmpdcli/upmpdcli.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 5e4d6a8..69a0ab3 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -31,6 +31,14 @@ define UPMPDCLI_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/S99upmpdcli
 endef
 
+define UPMPDCLI_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/systemd/upmpdcli.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/upmpdcli.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /usr/lib/systemd/system/upmpdcli.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/upmpdcli.service
+endef
+
 define UPMPDCLI_INSTALL_CONF_FILE
 	$(INSTALL) -D -m 0755 $(@D)/src/upmpdcli.conf $(TARGET_DIR)/etc/upmpdcli.conf
 endef
