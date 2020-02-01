From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Feb 2020 09:55:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/libplist: bump version to 2.1.0
Message-ID: <20200201085553.302990-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to github, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libplist/libplist.hash | 3 ++-
 package/libplist/libplist.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 63c2515062..8b36daceab 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 3a7e9694c2d9a85174ba1fa92417cfabaea7f6d19631e544948dc7e17e82f602  libplist-2.0.0.tar.bz2
+sha256 4b33f9af3f9208d54a3c3e1a8c149932513f451c98d1dd696fe42c06e30b7f03  libplist-2.1.0.tar.gz
+sha256 7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 09fc8168e4..d07fb5dd2e 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 2.0.0
-LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
-LIBPLIST_SITE = http://www.libimobiledevice.org/downloads
+LIBPLIST_VERSION = 2.1.0
+LIBPLIST_SITE = $(call github,libimobiledevice,libplist,$(LIBPLIST_VERSION))
 LIBPLIST_INSTALL_STAGING = YES
 LIBPLIST_LICENSE = LGPL-2.1+
 LIBPLIST_LICENSE_FILES = COPYING
+# github tarball does not include configure
+LIBPLIST_AUTORECONF = YES
 
 # Disable building Python bindings, because it requires host-cython, which
 # is not packaged in Buildroot at all.
-- 
2.20.1
