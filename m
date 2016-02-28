From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:32:49 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-argustv: Fix compile
	error with gcc5
Message-ID: <20160228213340.D3F3680AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45d4ead2257b545a55c5a619714eced541afbc71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/dac/dacc3bd00ab2346d7655c0a1fb99f6c50b9da08b/
http://autobuild.buildroot.net/results/a6d/a6d3b510681f54f5625908930b4da73bf9edccf7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...epresentation-of-char_class_e-in-struct-t.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/kodi-pvr-argustv/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch b/package/kodi-pvr-argustv/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
new file mode 100644
index 0000000..596be61
--- /dev/null
+++ b/package/kodi-pvr-argustv/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
@@ -0,0 +1,45 @@
+From 2c15b3931410669f281cd7e183c81e550b7e7221 Mon Sep 17 00:00:00 2001
+From: Balint Reczey <balint@balintreczey.hu>
+Date: Wed, 23 Dec 2015 12:55:00 +0100
+Subject: [PATCH 01/19] Sync enum representation of char_class_e in struct
+ traits with definition
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[backport of upstream patch from master branch:
+ https://github.com/kodi-pvr/pvr.argustv/commit/2c15b3931410669f281cd7e183c81e550b7e7221]
+---
+ src/uri.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/uri.h b/src/uri.h
+index 0b2afcd..c20600f 100644
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
+     CVAL = 0, ///< valid any position
+     CVA2 = 1, ///< valid anywhere but 1st position
+-  };
++  } char_class_e_type;
+ 
+   /// Traits used for parsing and encoding components.
+   struct traits
+@@ -35,7 +35,7 @@ namespace uri
+     char* begin_cstring; ///< begin cstring (or 0 if none)
+     char begin_char; ///< begin char (or 0 if none)
+     char end_char; ///< end char (or 0 if none)
+-    char char_class[256]; ///< map of char to class
++    char_class_e_type char_class[256]; ///< map of char to class
+   };
+ 
+   /**
+-- 
+2.7.0
+
