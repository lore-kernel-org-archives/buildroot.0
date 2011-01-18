From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:37 -0300
Subject: [Buildroot] [PATCH 07/10] libreplaygain: new package
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in                      |    1 +
 package/multimedia/libreplaygain/Config.in        |    6 ++++++
 package/multimedia/libreplaygain/libreplaygain.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libreplaygain/Config.in
 create mode 100644 package/multimedia/libreplaygain/libreplaygain.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 60105fc..cbbf40e 100644
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
index 0000000..3fec2c3
--- /dev/null
+++ b/package/multimedia/libreplaygain/libreplaygain.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libreplaygain
+#
+################################################################################
+
+LIBREPLAYGAIN_VERSION =  r453
+LIBREPLAYGAIN_SITE = http://files.musepack.net/source
+LIBREPLAYGAIN_SOURCE = libreplaygain_$(LIBREPLAYGAIN_VERSION).tar.gz
+LIBREPLAYGAIN_AUTORECONF = YES
+LIBREPLAYGAIN_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,libreplaygain))
-- 
1.7.3.4
