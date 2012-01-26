From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:22 -0300
Subject: [Buildroot] [PATCH 03/13] libraw1394: bump to version 2.0.7
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libraw1394/Config.in     |    9 +++------
 package/libraw1394/libraw1394.mk |    8 ++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/libraw1394/Config.in b/package/libraw1394/Config.in
index 49399e3..0b7e280 100644
--- a/package/libraw1394/Config.in
+++ b/package/libraw1394/Config.in
@@ -1,10 +1,7 @@
 config BR2_PACKAGE_LIBRAW1394
 	bool "libraw1394"
 	help
-		Library for direct access to IEEE 1394 bus.
+		libraw1394 provides direct access to the IEEE 1394 bus through
+		the Linux 1394 subsystem's raw1394 user space interface. 
 
-		Through libraw1394/raw1394, applications can directly
-		send to and receive from other nodes without requiring
-		a kernel driver for the protocol in question.
-
-		http://www.linux1394.org/
+		http://sourceforge.net/projects/libraw1394/
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
-- 
1.7.3.4
