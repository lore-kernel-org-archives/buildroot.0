From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:21:20 +0100
Subject: [Buildroot] [git commit] libraw1394: bump to version 2.0.7
Message-ID: <20120126212542.1085D9058C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39820e507df144c1af8b2dd90e9051fafd170966
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup whitespace]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libraw1394/Config.in     |    9 +++------
 package/libraw1394/libraw1394.mk |    8 ++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/libraw1394/Config.in b/package/libraw1394/Config.in
index 49399e3..7a64959 100644
--- a/package/libraw1394/Config.in
+++ b/package/libraw1394/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_LIBRAW1394
 	bool "libraw1394"
 	help
-		Library for direct access to IEEE 1394 bus.
+	  libraw1394 provides direct access to the IEEE 1394 bus through
+	  the Linux 1394 subsystem's raw1394 user space interface.
 
-		Through libraw1394/raw1394, applications can directly
-		send to and receive from other nodes without requiring
-		a kernel driver for the protocol in question.
-
-		http://www.linux1394.org/
+	  http://sourceforge.net/projects/libraw1394/
diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
index b7c844c..2f77a48 100644
--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -3,9 +3,9 @@
 # libraw1394
 #
 #############################################################
-LIBRAW1394_VERSION:=1.2.1
-LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
-LIBRAW1394_SITE:=http://www.kernel.org/pub/linux/libs/ieee1394/
-LIBRAW1394_INSTALL_STAGING=YES
+
+LIBRAW1394_VERSION = 2.0.7
+LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
+LIBRAW1394_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
