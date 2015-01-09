From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri,  9 Jan 2015 08:14:02 +0100
Subject: [Buildroot] [PATCH v4 1/2] netsurf-buildsystem: new package
In-Reply-To: <1420787643-6167-1-git-send-email-fabio.porcedda@gmail.com>
References: <1420787643-6167-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1420787643-6167-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the NetSurf project shared build system, used by various NetSurf
sub-projects like the libsvgtiny project.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/netsurf-buildsystem/netsurf-buildsystem.mk | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/netsurf-buildsystem/netsurf-buildsystem.mk

diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.mk b/package/netsurf-buildsystem/netsurf-buildsystem.mk
new file mode 100644
index 0000000..fb6c39e
--- /dev/null
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# netsurf-buildsystem
+#
+################################################################################
+
+NETSURF_BUILDSYSTEM_VERSION = 7574b41345968b5f7e9ca5875faccb1478ce0555
+NETSURF_BUILDSYSTEM_SITE = http://git.netsurf-browser.org/buildsystem.git
+NETSURF_BUILDSYSTEM_SITE_METHOD = git
+NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3c (for llvm/* files)
+NETSURF_BUILDSYSTEM_LICENSE_FILES = llvm/LICENSE.TXT
+
+NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/usr/share/netsurf-buildsystem
+
+define HOST_NETSURF_BUILDSYSTEM_INSTALL_CMDS
+	mkdir -p $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
+	cp -r $(@D)/* $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
+endef
+
+$(eval $(host-generic-package))
-- 
2.2.1
