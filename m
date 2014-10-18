From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Oct 2014 21:05:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/libplist: Bump version to 1.12
Message-ID: <1413659138-11363-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting http://cgit.sukimashita.com/libplist.git/tree/NEWS
"  * Fix parallel build for autotools"

Therefore removed MAKE1, tested with -j90

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplist/libplist.mk |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 1185370..b87c5ba 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 1.11
+LIBPLIST_VERSION = 1.12
 LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
 LIBPLIST_DEPENDENCIES = libxml2 host-pkgconf
 LIBPLIST_INSTALL_STAGING = YES
@@ -14,9 +14,6 @@ LIBPLIST_LICENSE_FILES = COPYING
 # Straight out of the git tree:
 LIBPLIST_AUTORECONF = YES
 
-# Does not build in parallel
-LIBPLIST_MAKE = $(MAKE1)
-
 # Disable building Python bindings, because it requires host-cython, which
 # is not packaged in Buildroot at all.
 LIBPLIST_CONF_OPTS = --without-cython
-- 
1.7.10.4
