From: user <zettelmeyerj@gmail.com>
Date: Sun,  8 Feb 2015 19:23:34 +0000
Subject: [Buildroot] [PATCH 1/1] batctl: new package
Message-ID: <1423423414-31871-1-git-send-email-zettelmeyerj@goooglemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: user <zettelmeyerj@goooglemail.com>
---
 package/Config.in          |  1 +
 package/batctl/Config.in   | 29 +++++++++++++++++++++++++++++
 package/batctl/batctl.hash |  2 ++
 package/batctl/batctl.mk   | 43 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 package/batctl/Config.in
 create mode 100644 package/batctl/batctl.hash
 create mode 100644 package/batctl/batctl.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..b9d6753 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1055,6 +1055,7 @@ menu "Networking applications"
 	source "package/avahi/Config.in"
 	source "package/axel/Config.in"
 	source "package/bandwidthd/Config.in"
+	source "package/batctl/Config.in"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
 	source "package/bluez_utils/Config.in"
diff --git a/package/batctl/Config.in b/package/batctl/Config.in
new file mode 100644
index 0000000..fed4c4d
--- /dev/null
+++ b/package/batctl/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_BATCTL
+	bool "batctl"
+<<<<<<< HEAD
+<<<<<<< HEAD
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
+	help
+	  Batctl is the configuration and debugging tool for batman-adv.
+	  
+	  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl
+=======
+	depends on BR2_USE_MMU # needs fork()
+=======
+>>>>>>> eb3c5ae... Change build according to advises from Yann E. MORIN
+	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
+	help
+<<<<<<< HEAD
+	  batman-adv controll utility
+
+	  http://www.open-mesh.org/projects/open-mesh/wiki
+>>>>>>> f570503... Add build for B.A.T.M.A.N. Advanced control utility
+=======
+	  Batctl is the configuration and debugging tool for batman-adv.
+	  
+	  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl
+>>>>>>> eb3c5ae... Change build according to advises from Yann E. MORIN
diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
new file mode 100644
index 0000000..663e602
--- /dev/null
+++ b/package/batctl/batctl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	77509ed70232ebc0b73e2fa9471ae13b12d6547d167dda0a82f7a7fad7252c36  batctl-2014.4.0.tar.gz
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
new file mode 100644
index 0000000..3823e63
--- /dev/null
+++ b/package/batctl/batctl.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# batman-adv control
+#
+################################################################################
+
+BATCTL_VERSION = 2014.4.0
+BATCTL_SOURCE = batctl-$(BATCTL_VERSION).tar.gz
+BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
+<<<<<<< HEAD
+<<<<<<< HEAD
+BATCTL_LICENSE = GPLv2
+BATCTL_DEPENDENCIES += libnl
+
+define BATCTL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
+	LDFLAGS="$(TARGET_LDFLAGS)"
+=======
+BATCTL_LICENSE = GPLv2+
+=======
+BATCTL_LICENSE = GPLv2
+>>>>>>> eb3c5ae... Change build according to advises from Yann E. MORIN
+BATCTL_DEPENDENCIES += libnl
+
+define BATCTL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
+<<<<<<< HEAD
+		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
+        DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
+>>>>>>> f570503... Add build for B.A.T.M.A.N. Advanced control utility
+=======
+	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
+	LDFLAGS="$(TARGET_LDFLAGS)"
+>>>>>>> eb3c5ae... Change build according to advises from Yann E. MORIN
+endef
+
+define BATCTL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/batctl $(TARGET_DIR)/usr/sbin/batctl
+endef
+
+$(eval $(generic-package))
-- 
2.0.5
