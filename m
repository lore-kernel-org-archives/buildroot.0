From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 12 Sep 2017 10:42:39 +0200
Subject: [Buildroot] [PATCH] libmbim: add COPYING.LIB to LICENSE_FILES
Message-ID: <20170912084239.6017-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mbimcli and mbim-network are GPLv2+ (COPYING file applies) and
libmbim-glib is LGPLv2.1+ (COPYING.LIB file applies).

Also, setup hashes of the license files, for a correct
"make legal-info".

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libmbim/libmbim.hash | 2 ++
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index 02efc6c95..664513e5c 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256  22cafe6b8432433aa58bedcf7db71111522ce6531bfe24e8e9b6058412cd31cf  libmbim-1.14.2.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index b8dfa832d..b67905a7f 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -8,7 +8,7 @@ LIBMBIM_VERSION = 1.14.2
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-LIBMBIM_LICENSE_FILES = COPYING
+LIBMBIM_LICENSE_FILES = COPYING COPYING.LIB
 LIBMBIM_INSTALL_STAGING = YES
 
 LIBMBIM_DEPENDENCIES = libglib2
-- 
2.13.1
