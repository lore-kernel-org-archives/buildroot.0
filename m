From: Chih-Min Chao <cmchao@gmail.com>
Date: Fri, 11 Mar 2011 16:13:33 +0800
Subject: [Buildroot] [PATCH 7/9] libopenal : new package. Cross-platform
	audio library
In-Reply-To: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
References: <1299831215-26466-1-git-send-email-cmchao@gmail.com>
Message-ID: <1299831215-26466-7-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/multimedia/Config.in              |    1 +
 package/multimedia/libopenal/Config.in    |    8 ++++++++
 package/multimedia/libopenal/libopenal.mk |   10 ++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libopenal/Config.in
 create mode 100644 package/multimedia/libopenal/libopenal.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index b8a0f21..0f5ac4e 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -26,6 +26,7 @@ source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libmpeg2/Config.in"
 source "package/multimedia/libogg/Config.in"
+source "package/multimedia/libopenal/Config.in"
 source "package/multimedia/libreplaygain/Config.in"
 source "package/multimedia/libsamplerate/Config.in"
 source "package/multimedia/libsndfile/Config.in"
diff --git a/package/multimedia/libopenal/Config.in b/package/multimedia/libopenal/Config.in
new file mode 100644
index 0000000..7262708
--- /dev/null
+++ b/package/multimedia/libopenal/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBOPENAL
+	bool "libopenal"
+	help
+	  OpenAL is a cross-platform 3D audio API appropriate
+	  for use with gaming applications and many other types
+	  of audio applications
+
+	  http://connect.creativelabs.com/openal/default.aspx
diff --git a/package/multimedia/libopenal/libopenal.mk b/package/multimedia/libopenal/libopenal.mk
new file mode 100644
index 0000000..79de855
--- /dev/null
+++ b/package/multimedia/libopenal/libopenal.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# libopenal
+#
+################################################################################
+LIBOPENAL_VERSION=1.13
+LIBOPENAL_SITE=http://kcat.strangesoft.net/openal-releases
+LIBOPENAL_SOURCE=openal-soft-$(LIBOPENAL_VERSION).tar.bz2
+
+$(eval $(call CMAKETARGETS,package/multimedia,libopenal))
-- 
1.7.0.4
