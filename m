From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:38 -0300
Subject: [Buildroot] [PATCH 08/10] musepack: new package
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in            |    1 +
 package/multimedia/musepack/Config.in   |   11 +++++++++++
 package/multimedia/musepack/musepack.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/musepack/Config.in
 create mode 100644 package/multimedia/musepack/musepack.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index cbbf40e..e73e47d 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -29,6 +29,7 @@ source "package/multimedia/libvorbis/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
+source "package/multimedia/musepack/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
 source "package/multimedia/festival/Config.in"
diff --git a/package/multimedia/musepack/Config.in b/package/multimedia/musepack/Config.in
new file mode 100644
index 0000000..2a966a4
--- /dev/null
+++ b/package/multimedia/musepack/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_MUSEPACK
+	bool "musepack"
+	select BR2_PACKAGE_LIBCUEFILE
+	select BR2_PACKAGE_LIBREPLAYGAIN
+	help
+	  Musepack is an audio compression format with a strong emphasis
+	  on high quality. It's not lossless, but it is designed
+	  for transparency, so that you won't be able to hear differences
+	  between the original wave file and the much smaller MPC file.
+
+	  http://www.musepack.net/
diff --git a/package/multimedia/musepack/musepack.mk b/package/multimedia/musepack/musepack.mk
new file mode 100644
index 0000000..34581b6
--- /dev/null
+++ b/package/multimedia/musepack/musepack.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# musepack
+#
+################################################################################
+
+MUSEPACK_VERSION =  r435
+MUSEPACK_SITE = http://files.musepack.net/source
+MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
+MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
+MUSEPACK_AUTORECONF = YES
+MUSEPACK_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,musepack))
-- 
1.7.3.4
