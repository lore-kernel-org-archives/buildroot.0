From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:34 -0300
Subject: [Buildroot] [PATCH 04/10] wavpack: new package
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new wavpack package, another lossless codec like flac.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in          |    1 +
 package/multimedia/wavpack/Config.in  |   10 ++++++++++
 package/multimedia/wavpack/wavpack.mk |   12 ++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/wavpack/Config.in
 create mode 100644 package/multimedia/wavpack/wavpack.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 6d2cbc7..ba6c927 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -33,4 +33,5 @@ source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
 source "package/multimedia/vlc/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
+source "package/multimedia/wavpack/Config.in"
 endmenu
diff --git a/package/multimedia/wavpack/Config.in b/package/multimedia/wavpack/Config.in
new file mode 100644
index 0000000..e18e6e7
--- /dev/null
+++ b/package/multimedia/wavpack/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_WAVPACK
+	bool "wavpack"
+	help
+	  WavPack is a completely open audio compression format providing
+	  lossless, high-quality lossy, and a unique hybrid compression mode.
+
+	  Works on softfloat but it's not recommended since it uses
+	  a big deal of CPU power.
+
+	  http://www.wavpack.com/
diff --git a/package/multimedia/wavpack/wavpack.mk b/package/multimedia/wavpack/wavpack.mk
new file mode 100644
index 0000000..28e2c31
--- /dev/null
+++ b/package/multimedia/wavpack/wavpack.mk
@@ -0,0 +1,12 @@
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
+$(eval $(call AUTOTARGETS,package/multimedia,wavpack))
-- 
1.7.3.4
