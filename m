From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:56:04 +0200
Subject: [Buildroot] [git commit] connman: enable systemd service by default
Message-ID: <20150422205620.4BEDD7FBCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4aad18380255f7b8b4442323fa294d2a2107175d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/connman/connman.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 4b55392..016eff7 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -31,6 +31,11 @@ define CONNMAN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/connman/S45connman $(TARGET_DIR)/etc/init.d/S45connman
 endef
 
+define CONNMAN_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/connman.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/connman.service
+endef
 
 ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 CONNMAN_CONF_OPTS += --enable-client
