From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Jul 2009 21:23:34 +0200
Subject: [Buildroot] [git commit] ctorrent: new package
Message-ID: <20090727193324.361C977820@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=52dbe0711956ae5cd8e1d9f9776511db44266436
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #243.

CTorrent is a BitTorrent client implemented in C++
to be lightweight and quick.
This is the enhanced version from
http://www.rahul.net/dholmes/ctorrent/

[Peter: minor kconfig tweaks]

Signed-off-by: Olaf Rempel <razzor@kopf-tisch.de>
Tested-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    1 +
 package/Config.in            |    1 +
 package/ctorrent/Config.in   |   13 +++++++++++++
 package/ctorrent/ctorrent.mk |   11 +++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/ctorrent/Config.in
 create mode 100644 package/ctorrent/ctorrent.mk

diff --git a/CHANGES b/CHANGES
index 0d6ac97..010aa5a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,7 @@
 	#83: liblockfile fails to compile due to eaccess redefinition
 	#163: Xtensa architecture port
 	#241: device mapper + lvm2: build together
+	#243: ctorrent: new package
 	#271: Library 'libgcc_s.so.1' not installed in search path
 	#287: New package libnl
 	#331: Update MPlayer to version 1.0rc2
diff --git a/package/Config.in b/package/Config.in
index 6cc825d..bd15b62 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -135,6 +135,7 @@ endif
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
+source "package/ctorrent/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
 endif
diff --git a/package/ctorrent/Config.in b/package/ctorrent/Config.in
new file mode 100644
index 0000000..5e26c12
--- /dev/null
+++ b/package/ctorrent/Config.in
@@ -0,0 +1,13 @@
+comment "ctorrent requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_CTORRENT
+	bool "ctorrent"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CTorrent is a BitTorrent client implemented in C++
+	  to be lightweight and quick.
+	  http://ctorrent.sourceforge.net/
+
+	  This is the enhanced version from
+	  http://www.rahul.net/dholmes/ctorrent/
diff --git a/package/ctorrent/ctorrent.mk b/package/ctorrent/ctorrent.mk
new file mode 100644
index 0000000..2560881
--- /dev/null
+++ b/package/ctorrent/ctorrent.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# enhanced ctorrent
+#
+#############################################################
+CTORRENT_VERSION:=dnh3.3.2
+CTORRENT_SOURCE:=ctorrent-$(CTORRENT_VERSION).tar.gz
+CTORRENT_SITE:=http://www.rahul.net/dholmes/ctorrent/
+CTORRENT_CONF_OPT:=--with-ssl=no
+
+$(eval $(call AUTOTARGETS,package,ctorrent))
-- 
1.6.3.3
