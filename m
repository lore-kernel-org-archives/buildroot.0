From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Jan 2011 13:52:23 +0100
Subject: [Buildroot] [git commit master 1/1] faad2: new package
Message-ID: <20110120130801.C5B2D8B533@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=22647782d7d3c8b17dc5d06648d6e04f3062c7d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in       |    1 +
 package/multimedia/faad2/Config.in |    6 ++++++
 package/multimedia/faad2/faad2.mk  |   11 +++++++++++
 3 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/faad2/Config.in
 create mode 100644 package/multimedia/faad2/faad2.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 22c2d03..4f98b10 100644
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
