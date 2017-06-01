From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:30:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/ftop: Fix broken
	download URL
Message-ID: <20170601144623.F208A8296D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bfb0dda700f4d0f47312ace9ad1de588c03d2c44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Also use bz2 tarball and provide md5 & sha256 hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d35b447f09b5bd766a7627b596869b8f8b3f91ba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ftop/Config.in | 2 +-
 package/ftop/ftop.hash | 7 +++++--
 package/ftop/ftop.mk   | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/ftop/Config.in b/package/ftop/Config.in
index 1f5ebbb..aefe4f5 100644
--- a/package/ftop/Config.in
+++ b/package/ftop/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_FTOP
 	  Ftop is to files what top is to processes.
 	  The progress of all open files and file systems can be monitored.
 
-	  https://code.google.com/p/ftop/
+	  https://sourceforge.net/projects/ftop/
diff --git a/package/ftop/ftop.hash b/package/ftop/ftop.hash
index 06f2fb1..ca8dc82 100644
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
index c8d0f93..a751560 100644
--- a/package/ftop/ftop.mk
+++ b/package/ftop/ftop.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 FTOP_VERSION = 1.0
-FTOP_SITE = http://ftop.googlecode.com/files
+FTOP_SOURCE = ftop-$(FTOP_VERSION).tar.bz2
+FTOP_SITE = https://sourceforge.net/projects/ftop/files/ftop/$(FTOP_VERSION)
 FTOP_DEPENDENCIES = ncurses
 FTOP_LICENSE = GPLv3+
 FTOP_LICENSE_FILES = COPYING
