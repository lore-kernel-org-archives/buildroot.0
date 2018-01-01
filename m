From: Baruch Siach <baruch@tkos.co.il>
Date: Mon,  1 Jan 2018 21:24:42 +0200
Subject: [Buildroot] [PATCH] sysstat: bump to version 11.6.1
Message-ID: <6a909e7705ea5ef23e992b3dbdb6c1671f6bc8fb.1514834682.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The isag tool has been removed in version 11.5.5; no need to avoid its
installation anymore.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sysstat/sysstat.hash | 5 +++--
 package/sysstat/sysstat.mk   | 6 +-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.hash
index 8d4ecf48c13a..a35631076a5e 100644
--- a/package/sysstat/sysstat.hash
+++ b/package/sysstat/sysstat.hash
@@ -1,4 +1,5 @@
 # From: http://sebastien.godard.pagesperso-orange.fr/download.html
-sha1 0e4950da333ff4e68826d58a6f43cb8048d85e9c  sysstat-11.4.4.tar.xz
+sha1 2eb3d20016084c9e6ff94c9b2f3b2ada7e8d26c6  sysstat-11.6.1.tar.xz
 # Locally calculated
-sha256 6585f08e24347d2d6462aee6ef97e80fe4cc869605193184500df0f80fa61cc8  sysstat-11.4.4.tar.xz
+sha256 4b2a2cfa8c8fe6ae0155e168ed9a7066caebc3ecb903b0e64a9ede28ecb68fcb  sysstat-11.6.1.tar.xz
+sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
index e4ba66264356..bdc0610ea3a6 100644
--- a/package/sysstat/sysstat.mk
+++ b/package/sysstat/sysstat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSSTAT_VERSION = 11.4.4
+SYSSTAT_VERSION = 11.6.1
 SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.xz
 SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard
 SYSSTAT_CONF_OPTS = --disable-file-attr --disable-sensors
@@ -13,8 +13,4 @@ SYSSTAT_LICENSE = GPL-2.0+
 SYSSTAT_LICENSE_FILES = COPYING
 SYSSTAT_MAKE_OPTS += LFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 
-# The isag tool is a post processing script that depends on tcl/tk
-# among other things. So we don't install it.
-SYSSTAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n install
-
 $(eval $(autotools-package))
-- 
2.15.1
