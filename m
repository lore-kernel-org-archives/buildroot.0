From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Mar 2013 15:22:32 -0300
Subject: [Buildroot] [PATCHv2] ser2net: bump to version 2.8
Message-ID: <1362766952-24065-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump ser2net to version 2.8.

Exclude for nommu (uses fork).
Version 2.7 also did, guess the autobuilders never caught it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ser2net/Config.in  | 4 ++++
 package/ser2net/ser2net.mk | 5 ++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 7eb3a6a..e3b8870 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INET_IPV6
 	help
 	  Ser2net provides a way for a user to connect from a network
 	  connection to a serial port..
 
 	  http://ser2net.sourceforge.net
 
+comment "ser2net requires a toolchain with IPV6 support"
+	depends on !BR2_INET_IPV6
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index e4ad340..378dc06 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,9 +4,8 @@
 #
 #############################################################
 
-SER2NET_VERSION = 2.7
-SER2NET_SOURCE = ser2net-$(SER2NET_VERSION).tar.gz
-SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net/$(SER2NET_VERSION)
+SER2NET_VERSION = 2.8
+SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
 
-- 
1.8.1.5
