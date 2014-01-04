From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:30 +0100
Subject: [Buildroot] [PATCH 01/36] xorg: New package xproto_presentproto
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP3392FC30020A7614B059A1DD9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/Config.in                            |    1 +
 package/x11r7/xproto_presentproto/Config.in        |    4 ++++
 .../xproto_presentproto/xproto_presentproto.mk     |   15 +++++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/x11r7/xproto_presentproto/Config.in
 create mode 100644 package/x11r7/xproto_presentproto/xproto_presentproto.mk

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
index 0000000..7237b19
--- /dev/null
+++ b/package/x11r7/xproto_presentproto/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_XPROTO_PRESENTPROTO
+	bool "presentproto"
+	help
+	  X.Org Present extension headers
diff --git a/package/x11r7/xproto_presentproto/xproto_presentproto.mk b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
new file mode 100644
index 0000000..b518e21
--- /dev/null
+++ b/package/x11r7/xproto_presentproto/xproto_presentproto.mk
@@ -0,0 +1,15 @@
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
+XPROTO_PRESENTPROTO_LICENSE_FILES = COPYING
+XPROTO_PRESENTPROTO_INSTALL_STAGING = YES
+XPROTO_PRESENTPROTO_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
-- 
1.7.9.5
