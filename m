From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:46 +0100
Subject: [Buildroot] [PATCH 10/24] cosmo: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-11-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in       |    1 +
 package/cosmo/Config.in |    7 +++++++
 package/cosmo/cosmo.mk  |   10 ++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/cosmo/Config.in
 create mode 100644 package/cosmo/cosmo.mk

diff --git a/package/Config.in b/package/Config.in
index a7df716..29a0245 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -366,6 +366,7 @@ if BR2_PACKAGE_HAS_LUA_INTERPRETER
 menu "Lua libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
+source "package/cosmo/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljlinenoise/Config.in"
diff --git a/package/cosmo/Config.in b/package/cosmo/Config.in
new file mode 100644
index 0000000..1b5b622
--- /dev/null
+++ b/package/cosmo/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_COSMO
+	bool "cosmo"
+	select BR2_PACKAGE_LPEG
+	help
+	  Cosmo is a "safe templates" engine for Lua.
+
+	  http://mascarenhas.github.io/cosmo/
diff --git a/package/cosmo/cosmo.mk b/package/cosmo/cosmo.mk
new file mode 100644
index 0000000..2592f62
--- /dev/null
+++ b/package/cosmo/cosmo.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# cosmo
+#
+################################################################################
+
+COSMO_VERSION = 13.01.30-1
+COSMO_LICENSE = MIT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
