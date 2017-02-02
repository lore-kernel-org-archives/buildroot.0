From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  2 Feb 2017 08:27:40 +0100
Subject: [Buildroot] [PATCH 22/38] package/kodi-pvr-nextpvr: bump version to
	2.4.11
In-Reply-To: <20170202072756.6624-1-bernd.kuhls@t-online.de>
References: <20170202072756.6624-1-bernd.kuhls@t-online.de>
Message-ID: <20170202072756.6624-22-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/kodi-pvr/pvr.nextpvr/commit/9e042807f1ce18df6937312cb0abded24d09bfb7

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...epresentation-of-char_class_e-in-struct-t.patch | 48 ----------------------
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash     |  2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk       |  4 +-
 3 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch

diff --git a/package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch b/package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
deleted file mode 100644
index 18e59951c..000000000
--- a/package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 2698ac4eeca3a82967ff83386460c070ce387ead Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 28 Feb 2016 01:07:52 +0100
-Subject: [PATCH] Sync enum representation of char_class_e in struct traits
- with definition
-
-Copied from
-https://github.com/kodi-pvr/pvr.mediaportal.tvserver/pull/28
-https://github.com/kodi-pvr/pvr.mediaportal.tvserver/pull/35
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Patch sent upstream: https://github.com/kodi-pvr/pvr.nextpvr/pull/42]
----
- src/uri.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/uri.h b/src/uri.h
-index 2757cf0..3dbca88 100644
---- a/src/uri.h
-+++ b/src/uri.h
-@@ -21,13 +21,13 @@
- namespace uri
- {
-   /// Char class.
--  enum char_class_e
-+  typedef enum char_class_e : signed char
-   {
-     CINV = -2, ///< invalid
-     CEND = -1, ///< end delimitor
-     CVAL = 0,  ///< valid any position
-     CVA2 = 1,  ///< valid anywhere but 1st position
--  };
-+  } char_class_e_type;
- 
-   /// Traits used for parsing and encoding components.
-   struct traits
-@@ -35,7 +35,7 @@ namespace uri
-     const char* begin_cstring; ///< begin cstring (or 0 if none)
-     const char begin_char;     ///< begin char (or 0 if none)
-     const char end_char;       ///< end char (or 0 if none)
--    char char_class[256];      ///< map of char to class
-+    const char_class_e_type char_class[256];      ///< map of char to class
-   };
- 
-   /**
--- 
-2.7.0
-
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 64c09cfe6..4deb22081 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 8c4a36c21dc65cc358b34e5c2db849997f0add2501c3f787f99df3ae0ea850c5 kodi-pvr-nextpvr-2055105c93e18e04e73c87578bece3edf7525e14.tar.gz
+sha256 5b0839141c9bdd1150442ef06974755bccb381b2998ddffa584eb234a83b7af5  kodi-pvr-nextpvr-2.4.11-Krypton.tar.gz
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index a8b823543..aa40f021c 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-# This cset is on the branch 'Jarvis'
+# This cset is on the branch 'Krypton'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_NEXTPVR_VERSION = 2055105c93e18e04e73c87578bece3edf7525e14
+KODI_PVR_NEXTPVR_VERSION = 2.4.11-Krypton
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPLv2+
 KODI_PVR_NEXTPVR_LICENSE_FILES = src/client.h
-- 
2.11.0
