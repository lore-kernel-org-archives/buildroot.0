From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:55:53 +0200
Subject: [Buildroot] [git commit] ofono: enable systemd service by default
Message-ID: <20150422205620.45D0C80797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a510faf846413729968b130c77d822eaa924b758
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mike Williams <mike@mikebwilliams.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ofono/ofono.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 98e2fbc..f1a63e2 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -26,6 +26,12 @@ define OFONO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/ofono/S46ofono $(TARGET_DIR)/etc/init.d/S46ofono
 endef
 
+define OFONO_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/systemd/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/ofono.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+endef
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 OFONO_CONF_OPTS += --enable-udev
 OFONO_DEPENDENCIES += udev
