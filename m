From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:33 -0000
Subject: [Buildroot] [git commit] package/uredir: new package
Message-ID: <20200902161634.78B1085EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d752c79473e98254f06476f191f0d800939ce82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/uredir/Config.in   |  9 +++++++++
 package/uredir/uredir.hash |  4 ++++
 package/uredir/uredir.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 516e259831..eb6df1ae7e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2063,6 +2063,7 @@ F:	package/qt5/
 F:	package/quotatool/
 F:	package/racehound/
 F:	package/redir/
+F:	package/uredir/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
diff --git a/package/Config.in b/package/Config.in
index 6bd2699354..d8d9b7617f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2235,6 +2235,7 @@ endif
 	source "package/uhttpd/Config.in"
 	source "package/ulogd/Config.in"
 	source "package/unbound/Config.in"
+	source "package/uredir/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
diff --git a/package/uredir/Config.in b/package/uredir/Config.in
new file mode 100644
index 0000000000..99206cfe47
--- /dev/null
+++ b/package/uredir/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UREDIR
+	bool "uredir"
+	select BR2_PACKAGE_LIBUEV
+	help
+	  A small Linux daemon to redirect UDP connections. It can be
+	  used to forward connections on small and embedded systems that
+	  do not have (or want to use) iptables.
+
+	  https://github.com/troglobit/uredir
diff --git a/package/uredir/uredir.hash b/package/uredir/uredir.hash
new file mode 100644
index 0000000000..00c816c2dd
--- /dev/null
+++ b/package/uredir/uredir.hash
@@ -0,0 +1,4 @@
+# From https://github.com/troglobit/uredir/releases/download/v3.3/uredir-3.3.tar.gz.md5
+md5  a42ee27e84de2e08e35ee733508bb6ea  uredir-3.3.tar.gz
+# License files
+sha256  e4b8fd3375ce44e5e03be199724a8785510ea5fa58ed92a7a34fd0ccbd35db10  LICENSE
diff --git a/package/uredir/uredir.mk b/package/uredir/uredir.mk
new file mode 100644
index 0000000000..6ca394730e
--- /dev/null
+++ b/package/uredir/uredir.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# uredir
+#
+################################################################################
+
+UREDIR_VERSION = 3.3
+UREDIR_SOURCE = uredir-$(UREDIR_VERSION).tar.gz
+UREDIR_SITE = https://github.com/troglobit/uredir/releases/download/v$(UREDIR_VERSION)
+UREDIR_LICENSE = ISC
+UREDIR_LICENSE_FILES = LICENSE
+UREDIR_DEPENDENCIES = host-pkgconf libuev
+
+$(eval $(autotools-package))
