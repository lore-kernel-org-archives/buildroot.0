From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:00:13 +0200
Subject: [Buildroot] [git commit] package/dstat: bump to 0.7.4 which allows
 to run on Python3
Message-ID: <20191026165405.BCFE7814A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05484f621c1c2f80b2d735b2f4694996baad4a61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dstat/Config.in  | 2 +-
 package/dstat/dstat.hash | 2 +-
 package/dstat/dstat.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 110aee844b..81f53e74b7 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_DSTAT
 	depends on BR2_USE_MMU # python
 	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 	depends on !BR2_STATIC_LIBS # python
-	select BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON if !BR2_PACKAGE_PYTHON3
 	help
 	  Dstat, written in Python, is a versatile replacement for
 	  vmstat, iostat, netstat and ifstat. Dstat overcomes some of
diff --git a/package/dstat/dstat.hash b/package/dstat/dstat.hash
index a4dbcc9819..1f1f769cc5 100644
--- a/package/dstat/dstat.hash
+++ b/package/dstat/dstat.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 46e63821857b69fbc60cb2c7d893ccdd6f31cd9ef24b8bb0b68951e1c7374898  dstat-0.7.3.tar.gz
+sha256 4fbd58f3461c86d09a3ab97472aa204de37aa33d31a0493a3e5ed86a2045abea  dstat-0.7.4.tar.gz
diff --git a/package/dstat/dstat.mk b/package/dstat/dstat.mk
index 9c4b44576b..6f01a37131 100644
--- a/package/dstat/dstat.mk
+++ b/package/dstat/dstat.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DSTAT_VERSION = 0.7.3
-DSTAT_SITE = $(call github,dagwieers,dstat,$(DSTAT_VERSION))
+DSTAT_VERSION = 0.7.4
+DSTAT_SITE = $(call github,dagwieers,dstat,v$(DSTAT_VERSION))
 DSTAT_LICENSE = GPL-2.0
 DSTAT_LICENSE_FILES = COPYING
 
