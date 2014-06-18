From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 13:54:13 +0200
Subject: [Buildroot] [git commit] olsr: bump to version 0.6.6.2
Message-ID: <20140618123419.8708C9CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb1dc21152108f4d606ea9d3aa5e581c84d1cd79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also make the menu entry less melodramatic.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/olsr/Config.in |    2 +-
 package/olsr/olsr.mk   |    2 +-
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
