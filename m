From: Brock Williams <brock@cottonwoodcomputer.com>
Date: Fri, 25 Aug 2017 17:33:58 -0600
Subject: [Buildroot] [PATCH 1/1] add package for pdmenu
Message-ID: <20170825173358.7fd6f8bc@brock-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Brock Williams <brock@cottonwoodcomputer.com>
---
 package/Config.in        | 1 +
 package/pdmenu/Config.in | 9 +++++++++
 package/pdmenu/pdmenu.mk | 9 +++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/pdmenu/Config.in
 create mode 100644 package/pdmenu/pdmenu.mk

diff --git a/package/Config.in b/package/Config.in
index a512827..8df01a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1847,6 +1847,7 @@ comment "Utilities"
        source "package/which/Config.in"
        source "package/xmlstarlet/Config.in"
        source "package/xxhash/Config.in"
+       source "package/pdmenu/Config.in"
 endmenu
 
 menu "System tools"
diff --git a/package/pdmenu/Config.in b/package/pdmenu/Config.in
new file mode 100644
index 0000000..df78c23
--- /dev/null
+++ b/package/pdmenu/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PDMENU
+       bool "pdmenu"
+       depends on BR2_PACKAGE_SLANG
+       help
+               Pdmenu is a full screen menuing system for Unix. It is designed to be easy to use, and is suitable as a login shell for inexperienced users, or it can just be ran at the command line as a handy menu.
+
+               Pdmenu features color support and GPM mouse support at the Linux console. It was developed on Linux, and has now been compiled on many other unixes without problems.
+
+               https://joeyh.name/code/pdmenu/
diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
new file mode 100644
index 0000000..29ab510
--- /dev/null
+++ b/package/pdmenu/pdmenu.mk
@@ -0,0 +1,9 @@
+PDMENU_VERSION = 1.3.4
+PDMENU_SOURCE = pdmenu_$(PDMENU_VERSION).tar.gz
+PDMENU_SITE = http://http.debian.net/debian/pool/main/p/pdmenu
+PDMENU_LICENSE = GPL-2.0+
+PDMENU_LICENSE_FILES = COPYING.GPLv2
+PDMENU_DEPENDENCIES = slang
+PDMENU_INSTALL_TARGET_OPTS = INSTALL_PREFIX=$(TARGET_DIR) install
+
+$(eval $(autotools-package))
-- 
2.7.4
