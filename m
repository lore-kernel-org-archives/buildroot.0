From: Rodrigo Rebello <rprebello@gmail.com>
Date: Tue,  1 Dec 2015 15:24:57 -0200
Subject: [Buildroot] [PATCH 1/2] vnstat: bump to version 1.14
Message-ID: <1448990698-31684-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add new dependency on BR2_USE_WCHAR (version 1.14 uses mbstowcs())
and rewrap help text to 72 characters.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 package/vnstat/Config.in   | 15 ++++++++++-----
 package/vnstat/vnstat.hash |  2 +-
 package/vnstat/vnstat.mk   |  2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/vnstat/Config.in b/package/vnstat/Config.in
index 0df4982..ed86701 100644
--- a/package/vnstat/Config.in
+++ b/package/vnstat/Config.in
@@ -1,11 +1,16 @@
 config BR2_PACKAGE_VNSTAT
 	bool "vnstat"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR # mbstowcs()
 	help
-	  vnStat is a console-based network traffic monitor that keeps a log of
-	  network traffic for the selected interface(s). It uses the network
-	  interface statistics provided by the kernel as information source.
-	  This means that vnStat won't actually be sniffing any traffic and also
-	  ensures light use of system resources.
+	  vnStat is a console-based network traffic monitor that keeps a
+	  log of network traffic for the selected interface(s). It uses
+	  the network interface statistics provided by the kernel as
+	  information source. This means that vnStat won't actually be
+	  sniffing any traffic and also ensures light use of system
+	  resources.
 
 	  http://humdi.net/vnstat
+
+comment "vnstat needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
index a3334d6..43438a7 100644
--- a/package/vnstat/vnstat.hash
+++ b/package/vnstat/vnstat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	af1050d9c1b22d4b9742fe0d1818de9eb1037b8e7f9ba67b962e108d8527be69	vnstat-1.12.tar.gz
+sha256	f8462a47d85d0890493dc9eaeafbc725ae631aa5b103fb7f8af4ddb2314e8386	vnstat-1.14.tar.gz
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index e0a64d5..8512d2d 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VNSTAT_VERSION = 1.12
+VNSTAT_VERSION = 1.14
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPLv2
 VNSTAT_LICENSE_FILES = COPYING
-- 
2.1.4
