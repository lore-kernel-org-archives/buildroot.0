From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:50 +0100
Subject: [Buildroot] [PATCH 14/24] dado: new package
In-Reply-To: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
References: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1393227301-14874-15-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in      |    1 +
 package/dado/Config.in |    6 ++++++
 package/dado/dado.mk   |   10 ++++++++++
 3 files changed, 17 insertions(+)
 create mode 100644 package/dado/Config.in
 create mode 100644 package/dado/dado.mk

diff --git a/package/Config.in b/package/Config.in
index 0a1e891..f9124d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -368,6 +368,7 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/cosmo/Config.in"
 source "package/coxpcall/Config.in"
+source "package/dado/Config.in"
 source "package/lbase64/Config.in"
 source "package/ljlinenoise/Config.in"
 source "package/ljsyscall/Config.in"
diff --git a/package/dado/Config.in b/package/dado/Config.in
new file mode 100644
index 0000000..fb469f4
--- /dev/null
+++ b/package/dado/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DADO
+	bool "dado"
+	help
+	  Database Facilities for LuaSQL.
+
+	  http://www.ccpa.puc-rio.br/software/dado/
diff --git a/package/dado/dado.mk b/package/dado/dado.mk
new file mode 100644
index 0000000..3a58215
--- /dev/null
+++ b/package/dado/dado.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# dado
+#
+################################################################################
+
+DADO_VERSION = 1.5.2-1
+DADO_LICENSE = MIT
+
+$(eval $(luarocks-package))
-- 
1.7.9.5
