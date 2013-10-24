From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 24 Oct 2013 10:24:25 -0500
Subject: [Buildroot] [RFC 1/2] host-xxd: new package
In-Reply-To: <1382628266-22635-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1382628266-22635-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1382628266-22635-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/Config.in.host     |    1 +
 package/xxd/Config.in.host |    6 ++++++
 package/xxd/xxd.mk         |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/xxd/Config.in.host
 create mode 100644 package/xxd/xxd.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index 5fd2570..a80aee7 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,5 +13,6 @@ source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/sunxi-tools/Config.in.host"
 source "package/uboot-tools/Config.in.host"
+source "package/xxd/Config.in.host"
 
 endmenu
diff --git a/package/xxd/Config.in.host b/package/xxd/Config.in.host
new file mode 100644
index 0000000..c2cddde
--- /dev/null
+++ b/package/xxd/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_XXD
+	bool "host xxd"
+	help
+	  xxd creates a hex dump of a given file or standard input
+
+	  http://linux.die.net/man/1/xxd
diff --git a/package/xxd/xxd.mk b/package/xxd/xxd.mk
new file mode 100644
index 0000000..a960f86
--- /dev/null
+++ b/package/xxd/xxd.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# xxd
+#
+################################################################################
+
+XXD_VERSION = 1.10
+XXD_SITE    = http://grail.cba.csuohio.edu/~somos
+XXD_LICENSE = Public Domain
+XXD_LICENSE_FILES = xxd.c
+
+define HOST_XXD_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_XXD_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/xxd $(HOST_DIR)/usr/bin/xxd
+endef
+
+$(eval $(host-generic-package))
-- 
1.7.1
