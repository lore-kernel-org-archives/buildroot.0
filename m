From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 24 Apr 2015 21:46:13 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xlib_libXp: new package
In-Reply-To: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
References: <1429904773-460-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1429904773-460-4-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although xlib_libXp is no longer provided with X.org
since 7.4 release [1], some packages may need it like
efl 1.13 package.

[1] http://www.x.org/wiki/Releases/ModuleVersions/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/x11r7/Config.in                  |  1 +
 package/x11r7/xlib_libXp/Config.in       |  8 ++++++++
 package/x11r7/xlib_libXp/xlib_libXp.hash |  2 ++
 package/x11r7/xlib_libXp/xlib_libXp.mk   | 19 +++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/x11r7/xlib_libXp/Config.in
 create mode 100644 package/x11r7/xlib_libXp/xlib_libXp.hash
 create mode 100644 package/x11r7/xlib_libXp/xlib_libXp.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 8c73b03..bd2ba81 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -40,6 +40,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libXi/Config.in
 		source package/x11r7/xlib_libXinerama/Config.in
 		source package/x11r7/xlib_libXmu/Config.in
+		source package/x11r7/xlib_libXp/Config.in
 		source package/x11r7/xlib_libXpm/Config.in
 		source package/x11r7/xlib_libXrandr/Config.in
 		source package/x11r7/xlib_libXrender/Config.in
diff --git a/package/x11r7/xlib_libXp/Config.in b/package/x11r7/xlib_libXp/Config.in
new file mode 100644
index 0000000..532d8ac
--- /dev/null
+++ b/package/x11r7/xlib_libXp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_XLIB_LIBXP
+	bool "libXp"
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXAU
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XPROTO_PRINTPROTO
+	help
+	  X.Org Xp library
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.hash b/package/x11r7/xlib_libXp/xlib_libXp.hash
new file mode 100644
index 0000000..1a0570b
--- /dev/null
+++ b/package/x11r7/xlib_libXp/xlib_libXp.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2015-February/002537.html
+sha256	7f360c9905849c3587d48efc0f0ecbc852c19f61a52b18530d6b005cb9148c57	libXp-1.0.3.tar.bz2
diff --git a/package/x11r7/xlib_libXp/xlib_libXp.mk b/package/x11r7/xlib_libXp/xlib_libXp.mk
new file mode 100644
index 0000000..ad577c9
--- /dev/null
+++ b/package/x11r7/xlib_libXp/xlib_libXp.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# xlib_libXp -- X.Org Xp library
+#
+################################################################################
+
+XLIB_LIBXP_VERSION = 1.0.3
+XLIB_LIBXP_SOURCE = libXp-$(XLIB_LIBXP_VERSION).tar.bz2
+XLIB_LIBXP_SITE = http://xorg.freedesktop.org/releases/individual/lib/
+XLIB_LIBXP_LICENSE = MIT
+XLIB_LIBXP_LICENSE_FILES = COPYING
+XLIB_LIBXP_INSTALL_STAGING = YES
+XLIB_LIBXP_DEPENDENCIES = host-pkgconf \
+	xlib_libX11 \
+	xlib_libXau \
+	xlib_libXext \
+	xproto_printproto
+
+$(eval $(autotools-package))
-- 
1.9.3
