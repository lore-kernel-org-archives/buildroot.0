From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 15:14:20 +0100
Subject: [Buildroot] [git commit master 1/1] libreplaygain: new package
Message-ID: <20110120141843.83C708B533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e910b4b202b05fed17eceb8d209c90dc2f57ee64
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: add comment about why we need autoreconf]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in                      |    1 +
 package/multimedia/libreplaygain/Config.in        |    6 ++++++
 package/multimedia/libreplaygain/libreplaygain.mk |   14 ++++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libreplaygain/Config.in
 create mode 100644 package/multimedia/libreplaygain/libreplaygain.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 660675c..14057e9 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -21,6 +21,7 @@ source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libmpeg2/Config.in"
 source "package/multimedia/libogg/Config.in"
+source "package/multimedia/libreplaygain/Config.in"
 source "package/multimedia/libsamplerate/Config.in"
 source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"
diff --git a/package/multimedia/libreplaygain/Config.in b/package/multimedia/libreplaygain/Config.in
new file mode 100644
index 0000000..d0045b2
--- /dev/null
+++ b/package/multimedia/libreplaygain/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBREPLAYGAIN
+	bool "libreplaygain"
+	help
+	  Replay Gain library from Musepack
+
+	  http://www.musepack.net/
diff --git a/package/multimedia/libreplaygain/libreplaygain.mk b/package/multimedia/libreplaygain/libreplaygain.mk
new file mode 100644
index 0000000..c941092
--- /dev/null
+++ b/package/multimedia/libreplaygain/libreplaygain.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libreplaygain
+#
+################################################################################
+
+LIBREPLAYGAIN_VERSION =  r453
+LIBREPLAYGAIN_SITE = http://files.musepack.net/source
+LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
+# upstream doesn't ship configure
+LIBREPLAYGAIN_AUTORECONF = YES
+LIBREPLAYGAIN_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,libreplaygain))
-- 
1.7.3.4
