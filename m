From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 21:08:40 +0200
Subject: [Buildroot] [PATCH 1/1] libgdiplus: bump to version 5.6
Message-ID: <20180430190840.11455-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- This version removed the COPYING file (put back upstream but content
  is now a redirection to LICENSE)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgdiplus/libgdiplus.hash | 3 ++-
 package/libgdiplus/libgdiplus.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
index 740fefd986..cc9188d96b 100644
--- a/package/libgdiplus/libgdiplus.hash
+++ b/package/libgdiplus/libgdiplus.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 ce31da0c6952c8fd160813dfa9bf4a9a871bfe7284e9e3abff9a8ee689acfe58 libgdiplus-5.4.tar.gz
+sha256 6a75e4a476695cd6a1475fd6b989423ecf73978fd757673669771d8a6e13f756 libgdiplus-5.6.tar.gz
+sha256 e8668765ba016692388bf2927435e3cd2bba5d2e11d5c67583f5290094b3a626 src/carbon-private.h
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index eb1858574d..914fc217e6 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-LIBGDIPLUS_VERSION = 5.4
+LIBGDIPLUS_VERSION = 5.6
 LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
 
 # Although there is a LICENSE file thas specifies LGPL or MPL-1.1,
 # looks like it is incorrect. The actual source files specify that
-# they're licensed under MIT, and so does the COPYING file (and they
-# all predate the addition of the LICENSE file).
+# they're licensed under MIT, and so does the original (before its
+# removal/update) COPYING file (and they all predate the addition of
+# the LICENSE file).
 LIBGDIPLUS_LICENSE = MIT
-LIBGDIPLUS_LICENSE_FILES = COPYING src/carbon-private.h
+LIBGDIPLUS_LICENSE_FILES = src/carbon-private.h
 
 LIBGDIPLUS_INSTALL_STAGING = YES
 
-- 
2.14.1
