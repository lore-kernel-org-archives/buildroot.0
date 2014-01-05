From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2014 12:39:19 +0100
Subject: [Buildroot] [git commit] xorg: New package xproto_presentproto
Message-ID: <20140105230941.D12FE9C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d08fec8f2741b62e8b2f7a2005615f2cb2050d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix license file, add host-pkgconf / xutil_util-macros dependencies]
Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xproto_presentproto/Config.in        |    5 +++++
 .../xproto_presentproto/xproto_presentproto.mk     |   16 ++++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index fe0674c..5eff2df 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -236,6 +236,7 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xproto_glproto/Config.in
 		source package/x11r7/xproto_inputproto/Config.in
 		source package/x11r7/xproto_kbproto/Config.in
+		source package/x11r7/xproto_presentproto/Config.in
 		source package/x11r7/xproto_randrproto/Config.in
 		source package/x11r7/xproto_recordproto/Config.in
 		source package/x11r7/xproto_renderproto/Config.in
diff --git a/package/x11r7/xproto_presentproto/Config.in b/package/x11r7/xproto_presentproto/Config.in
new file mode 100644
index 0000000..586008d
--- /dev/null
+++ b/package/x11r7/xproto_presentproto/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_XPROTO_PRESENTPROTO
+	bool "presentproto"
+	select BR2_PACKAGE_XUTIL_UTIL_MACROS
+	help
+	  X.Org Present extension headers
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.mk b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
new file mode 100644
index 0000000..6fea0a2
--- /dev/null
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# xproto_presentproto
+#
+################################################################################
+
+XPROTO_PRESENTPROTO_VERSION = 1.0
+XPROTO_PRESENTPROTO_SOURCE = presentproto-$(XPROTO_PRESENTPROTO_VERSION).tar.bz2
+XPROTO_PRESENTPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
+XPROTO_PRESENTPROTO_LICENSE = MIT
+XPROTO_PRESENTPROTO_LICENSE_FILES = presentproto.h
+XPROTO_PRESENTPROTO_DEPENDENCIES = host-pkgconf xutil_util-macros
+XPROTO_PRESENTPROTO_INSTALL_STAGING = YES
+XPROTO_PRESENTPROTO_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
