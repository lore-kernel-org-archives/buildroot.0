From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 16:31:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/ftop: Fix broken download URL
Message-ID: <20170528143135.14428-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also use bz2 tarball and provide md5 & sha256 hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ftop/Config.in | 2 +-
 package/ftop/ftop.hash | 7 +++++--
 package/ftop/ftop.mk   | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/ftop/Config.in b/package/ftop/Config.in
index 1f5ebbbbf..aefe4f515 100644
--- a/package/ftop/Config.in
+++ b/package/ftop/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_FTOP
 	  Ftop is to files what top is to processes.
 	  The progress of all open files and file systems can be monitored.
 
-	  https://code.google.com/p/ftop/
+	  https://sourceforge.net/projects/ftop/
diff --git a/package/ftop/ftop.hash b/package/ftop/ftop.hash
index 06f2fb1f4..ca8dc827e 100644
--- a/package/ftop/ftop.hash
+++ b/package/ftop/ftop.hash
@@ -1,2 +1,5 @@
-# From https://code.google.com/p/ftop/downloads/detail?name=ftop-1.0.tar.gz&can=2&q=
-sha1	a0523862dd63ed3bec14846b6e05afcfdebb15c2	ftop-1.0.tar.gz
+# From https://sourceforge.net/projects/ftop/files/ftop/1.0/
+md5 57c68b6e7431f4219d9eddaebcb395da ftop-1.0.tar.bz2
+sha1 d3ef1b74825f50c7c442d299b29d23c2478f199b ftop-1.0.tar.bz2
+# Locally computed
+sha256 3a705f4f291384344cd32c3dd5f5f6a7cd7cea7624c83cb7e923966dbcd47f82  ftop-1.0.tar.bz2
diff --git a/package/ftop/ftop.mk b/package/ftop/ftop.mk
index d10e9cd0c..5498fb524 100644
--- a/package/ftop/ftop.mk
+++ b/package/ftop/ftop.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FTOP_VERSION = 1.0
-FTOP_SITE = http://ftop.googlecode.com/files
+FTOP_SOURCE = ftop-$(FTOP_VERSION).tar.bz2
+FTOP_SITE = https://sourceforge.net/projects/ftop/files/ftop/$(FTOP_VERSION)
 FTOP_DEPENDENCIES = ncurses
 FTOP_LICENSE = GPL-3.0+
 FTOP_LICENSE_FILES = COPYING
-- 
2.11.0
