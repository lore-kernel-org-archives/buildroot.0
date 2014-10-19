From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 11:41:52 +0200
Subject: [Buildroot] [git commit] package/libplist: Bump version to 1.12
Message-ID: <20141019094156.31176B3DDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f5bba9854c07a6d564a5659bf7b66114383b715
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Quoting http://cgit.sukimashita.com/libplist.git/tree/NEWS
"  * Fix parallel build for autotools"

Therefore removed MAKE1, tested with -j90

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libplist/libplist.mk |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

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
