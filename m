From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Feb 2016 01:15:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-nextpvr: Fix compile error
	with gcc5
Message-ID: <1456618525-19280-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/eea/eea7be8691bad11546fbc9b8d3f1c0528ffd2619/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...epresentation-of-char_class_e-in-struct-t.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch

diff --git a/package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch b/package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
new file mode 100644
index 0000000..18e5995
--- /dev/null
+++ b/package/kodi-pvr-nextpvr/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
@@ -0,0 +1,48 @@
+From 2698ac4eeca3a82967ff83386460c070ce387ead Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 28 Feb 2016 01:07:52 +0100
+Subject: [PATCH] Sync enum representation of char_class_e in struct traits
+ with definition
+
+Copied from
+https://github.com/kodi-pvr/pvr.mediaportal.tvserver/pull/28
+https://github.com/kodi-pvr/pvr.mediaportal.tvserver/pull/35
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Patch sent upstream: https://github.com/kodi-pvr/pvr.nextpvr/pull/42]
+---
+ src/uri.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/uri.h b/src/uri.h
+index 2757cf0..3dbca88 100644
+--- a/src/uri.h
++++ b/src/uri.h
+@@ -21,13 +21,13 @@
+ namespace uri
+ {
+   /// Char class.
+-  enum char_class_e
++  typedef enum char_class_e : signed char
+   {
+     CINV = -2, ///< invalid
+     CEND = -1, ///< end delimitor
+     CVAL = 0,  ///< valid any position
+     CVA2 = 1,  ///< valid anywhere but 1st position
+-  };
++  } char_class_e_type;
+ 
+   /// Traits used for parsing and encoding components.
+   struct traits
+@@ -35,7 +35,7 @@ namespace uri
+     const char* begin_cstring; ///< begin cstring (or 0 if none)
+     const char begin_char;     ///< begin char (or 0 if none)
+     const char end_char;       ///< end char (or 0 if none)
+-    char char_class[256];      ///< map of char to class
++    const char_class_e_type char_class[256];      ///< map of char to class
+   };
+ 
+   /**
+-- 
+2.7.0
+
-- 
2.7.0
