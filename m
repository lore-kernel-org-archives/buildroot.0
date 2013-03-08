From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Mar 2013 14:43:59 -0300
Subject: [Buildroot] [PATCH] ser2net: bump to version 2.8
Message-ID: <1362764639-9623-1-git-send-email-gustavo@zacarias.com.ar>
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
 package/ser2net/Config.in  | 1 +
 package/ser2net/ser2net.mk | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 7eb3a6a..007853a 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SER2NET
 	bool "ser2net"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Ser2net provides a way for a user to connect from a network
 	  connection to a serial port..
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
