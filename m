From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jan 2011 16:33:24 +0100
Subject: [Buildroot] [git commit master 1/1] vorbis-tools: new package
Message-ID: <20110111153759.DEA0D8A40D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d0f607c47ad5a90bede8f2db314d9f4355e97877
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                    |    1 +
 package/multimedia/vorbis-tools/Config.in       |   12 ++++++++++++
 package/multimedia/vorbis-tools/vorbis-tools.mk |   20 ++++++++++++++++++++
 3 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/vorbis-tools/Config.in
 create mode 100644 package/multimedia/vorbis-tools/vorbis-tools.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 5c1111d..6d2cbc7 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -32,4 +32,5 @@ source "package/multimedia/festival/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
 source "package/multimedia/vlc/Config.in"
+source "package/multimedia/vorbis-tools/Config.in"
 endmenu
diff --git a/package/multimedia/vorbis-tools/Config.in b/package/multimedia/vorbis-tools/Config.in
new file mode 100644
index 0000000..6092e01
--- /dev/null
+++ b/package/multimedia/vorbis-tools/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_VORBIS_TOOLS
+	bool "vorbis-tools"
+	select BR2_PACKAGE_LIBAO
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Standalone player, encoder and decoder for Ogg format files.
+
+	  Works also as a streaming player.
+
+	  http://www.vorbis.com/
diff --git a/package/multimedia/vorbis-tools/vorbis-tools.mk b/package/multimedia/vorbis-tools/vorbis-tools.mk
new file mode 100644
index 0000000..6fd6c2a
--- /dev/null
+++ b/package/multimedia/vorbis-tools/vorbis-tools.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# vorbis-tools
+#
+#############################################################
+
+VORBIS_TOOLS_VERSION = 1.4.0
+VORBIS_TOOLS_SITE = http://downloads.xiph.org/releases/vorbis
+VORBIS_TOOLS_DEPENDENCIES = libao libogg libvorbis libcurl
+VORBIS_TOOLS_CONF_OPT = --program-transform-name=''
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+VORBIS_TOOLS_DEPENDENCIES += flac
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+VORBIS_TOOLS_DEPENDENCIES += speex
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,vorbis-tools))
-- 
1.7.2.2
