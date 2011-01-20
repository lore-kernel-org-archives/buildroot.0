From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 15:14:20 +0100
Subject: [Buildroot] [git commit master 1/1] wavpack: new package
Message-ID: <20110120141843.599348A58E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f873d28f9276d17c8c82bb27147d0070da516dcc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in          |    1 +
 package/multimedia/wavpack/Config.in  |    8 ++++++++
 package/multimedia/wavpack/wavpack.mk |   16 ++++++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/wavpack/Config.in
 create mode 100644 package/multimedia/wavpack/wavpack.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 4f98b10..660675c 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -35,4 +35,5 @@ source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
 source "package/multimedia/vlc/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
+source "package/multimedia/wavpack/Config.in"
 endmenu
diff --git a/package/multimedia/wavpack/Config.in b/package/multimedia/wavpack/Config.in
new file mode 100644
index 0000000..1ef3e42
--- /dev/null
+++ b/package/multimedia/wavpack/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_WAVPACK
+	bool "wavpack"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  WavPack is a completely open audio compression format providing
+	  lossless, high-quality lossy, and a unique hybrid compression mode.
+
+	  http://www.wavpack.com/
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
new file mode 100644
index 0000000..035963a
--- /dev/null
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# wavpack
+#
+################################################################################
+
+WAVPACK_VERSION = 4.60.1
+WAVPACK_SITE = http://www.wavpack.com
+WAVPACK_SOURCE = wavpack-$(WAVPACK_VERSION).tar.bz2
+WAVPACK_INSTALL_STAGING = YES
+
+ifneq ($(BR2_ENABLE_LOCALE),y)
+WAVPACK_DEPENDENCIES += libiconv
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,wavpack))
-- 
1.7.3.4
