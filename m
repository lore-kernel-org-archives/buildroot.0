From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 21:47:47 +0100
Subject: [Buildroot] [git commit] package/libplist: bump to version 2.2.0
Message-ID: <20210314202540.CF5A487659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eca5c438357131d3d97da9edd63c3c7f682bcff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use official tarball and so drop autoreconf

Extract from
https://github.com/libimobiledevice/libplist/releases/tag/2.2.0:

"Rename library and all related files by adding an API version resulting
in libplist-2.0 and libplist++-2.0"

The only user of libplist in buildroot is kodi which is comptatible with
libplist 2.2.0 since its version 19.0-Matrix and
https://github.com/xbmc/xbmc/commit/22ab58e8f958980c070a46cabe197b3557dda0a3
which has been commited in 148e695e37561fe45d4726cb68f6454464d17797

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libplist/libplist.hash | 2 +-
 package/libplist/libplist.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 58054d0b84..4dab755e5d 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4b33f9af3f9208d54a3c3e1a8c149932513f451c98d1dd696fe42c06e30b7f03  libplist-2.1.0.tar.gz
+sha256  4a5517e5377ec421df84c586ba85bb4e1d26f11ad203d7d450a907c0156fbd9a  libplist-2.2.0.tar.bz2
 sha256  7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 42da4fac0f..e7cecb612d 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 2.1.0
-LIBPLIST_SITE = $(call github,libimobiledevice,libplist,$(LIBPLIST_VERSION))
+LIBPLIST_VERSION = 2.2.0
+LIBPLIST_SOURCE = libplist-$(LIBPLIST_VERSION).tar.bz2
+LIBPLIST_SITE = https://github.com/libimobiledevice/libplist/releases/download/$(LIBPLIST_VERSION)
 LIBPLIST_INSTALL_STAGING = YES
 LIBPLIST_LICENSE = LGPL-2.1+
 LIBPLIST_LICENSE_FILES = COPYING
 LIBPLIST_CPE_ID_VENDOR = libimobiledevice
-# github tarball does not include configure
-LIBPLIST_AUTORECONF = YES
 
 # Disable building Python bindings, because it requires host-cython, which
 # is not packaged in Buildroot at all.
