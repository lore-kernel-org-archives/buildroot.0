From: Pedro Sanchez <psanchez@fosstel.com>
Date: Wed, 10 Aug 2011 10:26:34 -0400
Subject: [Buildroot] [PATCH 1/1] New Package: Linphone
In-Reply-To: <87vcu6ig4c.fsf@macbook.be.48ers.dk>
References: <4E413EB9.6040504@fosstel.com>	<878vr2k3u8.fsf@macbook.be.48ers.dk>
 <4E417DC0.3060406@fosstel.com> <87vcu6ig4c.fsf@macbook.be.48ers.dk>
Message-ID: <4E42951A.9070300@fosstel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a package for the Linphone VoIP client, console mode operation 
only (linphonec).

Signed-off-by: Pedro Sanchez <psanchez@fosstel.com>
---
  package/Config.in            |    1 +
  package/linphone/Config.in   |   12 ++++++++++++
  package/linphone/linphone.mk |   24 ++++++++++++++++++++++++
  3 files changed, 37 insertions(+), 0 deletions(-)
  create mode 100644 package/linphone/Config.in
  create mode 100644 package/linphone/linphone.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..ebe583e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -417,6 +417,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
  source "package/lighttpd/Config.in"
  endif
  source "package/links/Config.in"
+source "package/linphone/Config.in"
  source "package/lrzsz/Config.in"
  source "package/mii-diag/Config.in"
  source "package/mrouted/Config.in"
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
new file mode 100644
index 0000000..60739cc
--- /dev/null
+++ b/package/linphone/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LINPHONE
+	bool "linphone"
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_SPEEX
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_LIBEXOSIP2
+	select BR2_PACKAGE_LIBOSIP2
+	help
+	  Install the linphone package, console mode (linphonec)
+
+          http://www.linphone.org
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
new file mode 100644
index 0000000..0945722
--- /dev/null
+++ b/package/linphone/linphone.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# linphone
+#
+#############################################################
+LINPHONE_VERSION = 3.4.3
+LINPHONE_SOURCE = linphone-$(LINPHONE_VERSION).tar.gz
+LINPHONE_SITE = 
http://download-mirror.savannah.gnu.org/releases/linphone/3.4.x/sources
+LINPHONE_INSTALL_STAGING = YES
+LINPHONE_DEPENDENCIES = alsa-lib speex ncurses readline libeXosip2 libosip2
+LINPHONE_CONF_OPT = --enable-gnome_ui=no \
+		    --enable-gtk_ui=no \
+		    --enable-alsa \
+		    --disable-manual \
+		    --disable-sdl \
+		    --disable-theora \
+		    --disable-x11 \
+		    --disable-shared \
+		    --disable-gsm \
+		    --disable-jack \
+		    --disable-libv4l \
+		    --disable-video
+
+$(eval $(call AUTOTARGETS,package,linphone))
-- 
1.7.0.4
