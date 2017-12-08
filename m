From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Dec 2017 17:54:51 +0100
Subject: [Buildroot] [git commit] glorytun: new package
Message-ID: <20171208164756.3448082875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3f11ec76430d835ec39a5ea1463c080e33cf93f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
[Thomas: add entry to DEVELOPERS file, add missing dependency on
host-pkgconf.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/glorytun/Config.in     |  7 +++++++
 package/glorytun/glorytun.hash |  2 ++
 package/glorytun/glorytun.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2782627..c81808f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -60,6 +60,9 @@ N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/libepoxy/
 F:	package/webkitgtk/
 
+N:	Adrien Gallou??t <adrien@gallouet.fr>
+F:	package/glorytun/
+
 N:	Aleksander Morgado <aleksander@aleksander.es>
 F:	package/libmbim/
 F:	package/libqmi/
diff --git a/package/Config.in b/package/Config.in
index 74e47f2..cb2141b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1654,6 +1654,7 @@ menu "Networking applications"
 	source "package/freeswitch/Config.in"
 	source "package/freeswitch-mod-bcg729/Config.in"
 	source "package/gesftpserver/Config.in"
+	source "package/glorytun/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/glorytun/Config.in b/package/glorytun/Config.in
new file mode 100644
index 0000000..82d248f
--- /dev/null
+++ b/package/glorytun/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GLORYTUN
+	bool "glorytun"
+	select BR2_PACKAGE_LIBSODIUM
+	help
+	  A small, simple and secure VPN.
+
+	  https://github.com/angt/glorytun
diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
new file mode 100644
index 0000000..891af20
--- /dev/null
+++ b/package/glorytun/glorytun.hash
@@ -0,0 +1,2 @@
+sha256 76849b1568119cf0834749db56d4882966863d31351c21c1b22f373f0c97a498  glorytun-0.0.93-mud.tar.gz
+sha256 bd418f8ef7d62f2c89e3aa1e5dc41c7d7a6212eb1cdb4d39a26a5bd333e1b4a3  LICENSE
diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
new file mode 100644
index 0000000..233e1fe
--- /dev/null
+++ b/package/glorytun/glorytun.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# glorytun
+#
+################################################################################
+
+GLORYTUN_VERSION = 0.0.93-mud
+GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
+GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
+GLORYTUN_LICENSE = BSD-2-clause
+GLORYTUN_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
