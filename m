From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 23:27:38 +0200
Subject: [Buildroot] [git commit branch/next] package/eudev: add libselinux
	dependency
Message-ID: <20150808105652.3E8057FE0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4feec7405f2284e1bb468751e663574c28db4d1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 87bce3e..f587acd 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -44,6 +44,13 @@ else
 EUDEV_CONF_OPTS += --disable-gudev
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+EUDEV_CONF_OPTS += --enable-selinux
+EUDEV_DEPENDENCIES += libselinux
+else
+EUDEV_CONF_OPTS += --disable-selinux
+endif
+
 define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
