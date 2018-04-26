From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 26 Apr 2018 16:10:37 +0200
Subject: [Buildroot] [PATCH] package/corkscrew: new package
Message-ID: <1524751837-32018-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Corkscrew is a tool for tunneling SSH through HTTP proxies

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/Config.in                |  1 +
 package/corkscrew/Config.in      |  7 +++++++
 package/corkscrew/corkscrew.hash |  2 ++
 package/corkscrew/corkscrew.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/corkscrew/Config.in
 create mode 100644 package/corkscrew/corkscrew.hash
 create mode 100644 package/corkscrew/corkscrew.mk

diff --git a/package/Config.in b/package/Config.in
index 3f1211b..defc5c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1686,6 +1686,7 @@ menu "Networking applications"
 	source "package/connman/Config.in"
 	source "package/connman-gtk/Config.in"
 	source "package/conntrack-tools/Config.in"
+	source "package/corkscrew/Config.in"
 	source "package/crda/Config.in"
 	source "package/ctorrent/Config.in"
 	source "package/cups/Config.in"
diff --git a/package/corkscrew/Config.in b/package/corkscrew/Config.in
new file mode 100644
index 0000000..1266f86
--- /dev/null
+++ b/package/corkscrew/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CORKSCREW
+	bool "corkscrew"
+	help
+	  Corkscrew is a tool for tunneling SSH through HTTP proxies,
+	  but... you might find another use for it.
+
+	  https://github.com/bryanpkc/corkscrew
diff --git a/package/corkscrew/corkscrew.hash b/package/corkscrew/corkscrew.hash
new file mode 100644
index 0000000..5ffeb0a
--- /dev/null
+++ b/package/corkscrew/corkscrew.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256  ba28a7d123fe607b87ff9d399b33e7549d9ef1a13ae3b61e8f61982e8ae5571d  corkscrew-a94f745b40077172b8fe7d77e2d583b9cf900281.tar.gz
diff --git a/package/corkscrew/corkscrew.mk b/package/corkscrew/corkscrew.mk
new file mode 100644
index 0000000..13612d4
--- /dev/null
+++ b/package/corkscrew/corkscrew.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# corkscrew
+#
+################################################################################
+
+CORKSCREW_VERSION = a94f745b40077172b8fe7d77e2d583b9cf900281
+CORKSCREW_SITE = $(call github,bryanpkc,corkscrew,$(CORKSCREW_VERSION))
+CORKSCREW_LICENSE = GPL-2.0
+CORKSCREW_LICENSE_FILES = COPYING
+CORKSCREW_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.7.4
