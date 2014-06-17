From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 16:16:00 -0300
Subject: [Buildroot] [PATCH] olsr: bump to version 0.6.6.2
Message-ID: <1403032560-30064-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also make the menu entry less melodramatic.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/olsr/Config.in | 2 +-
 package/olsr/olsr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index 0090643..707191a 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_OLSR
-	bool "OLSR mesh networking Daemon"
+	bool "olsrd"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index 3b7310e..1051d18 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OLSR_VERSION_MAJOR = 0.6
-OLSR_VERSION = $(OLSR_VERSION_MAJOR).6.1
+OLSR_VERSION = $(OLSR_VERSION_MAJOR).6.2
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
 OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
-- 
1.8.5.5
