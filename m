From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 22:10:48 +0200
Subject: [Buildroot] [PATCH] libmbus: fix upstream location
Message-ID: <1399925448-11644-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libmbus tarball is no longer available at
http://www.freescada.com/public-dist. Apparently, the new upstream is
at http://www.rscada.se/libmbus/ and tarballs are at
http://www.rscada.se/public-dist/. Without this patch, the current
download of libmbus-0.8.0.tar.gz downloads an HTML document with an
error, which cannot be extracted, obviously.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmbus/Config.in  | 2 +-
 package/libmbus/libmbus.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbus/Config.in b/package/libmbus/Config.in
index 1e2a8de..8614069 100644
--- a/package/libmbus/Config.in
+++ b/package/libmbus/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBMBUS
 	  It supports TCP and RS232 M-bus gateways.
 	  (M-bus standard: http://www.m-bus.com/)
 
-	  http://www.freescada.com/libmbus
+	  http://www.rscada.se/libmbus/
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index e1b02e0..93fe95f 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMBUS_VERSION = 0.8.0
-LIBMBUS_SITE = http://www.freescada.com/public-dist
+LIBMBUS_SITE = http://www.rscada.se/public-dist/
 LIBMBUS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
-- 
1.9.2
