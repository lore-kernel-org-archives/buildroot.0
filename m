From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:39 -0300
Subject: [Buildroot] [PATCH 09/10] faad2: new package
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in       |    1 +
 package/multimedia/faad2/Config.in |    6 ++++++
 package/multimedia/faad2/faad2.mk  |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/faad2/Config.in
 create mode 100644 package/multimedia/faad2/faad2.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index e73e47d..14c4145 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -2,6 +2,7 @@ menu "Audio and video libraries and applications"
 source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
diff --git a/package/multimedia/faad2/Config.in b/package/multimedia/faad2/Config.in
new file mode 100644
index 0000000..5b7fc1c
--- /dev/null
+++ b/package/multimedia/faad2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FAAD2
+	bool "faad2"
+	help
+	  FAAD2 is an open source MPEG-4 and MPEG-2 AAC decoder,
+
+	  http://www.audiocoding.com/faad2.html
diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
new file mode 100644
index 0000000..04aee18
--- /dev/null
+++ b/package/multimedia/faad2/faad2.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# faad2
+#
+################################################################################
+
+FAAD2_VERSION = 2.7
+FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faac
+FAAD2_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package/multimedia,faad2))
-- 
1.7.3.4
