From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Mar 2016 07:18:25 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi-pvr-mediaportal-tvserver:
	remove patch applied upstream
In-Reply-To: <1456985905-5249-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456985905-5249-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1456985905-5249-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...epresentation-of-char_class_e-in-struct-t.patch | 42 ----------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 package/kodi-pvr-mediaportal-tvserver/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch

diff --git a/package/kodi-pvr-mediaportal-tvserver/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch b/package/kodi-pvr-mediaportal-tvserver/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
deleted file mode 100644
index 890c151..0000000
--- a/package/kodi-pvr-mediaportal-tvserver/0001-Sync-enum-representation-of-char_class_e-in-struct-t.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7b14e0657a1308e8e133991b778e2fdcb2eb6b9c Mon Sep 17 00:00:00 2001
-From: Balint Reczey <balint@balintreczey.hu>
-Date: Wed, 23 Dec 2015 12:55:00 +0100
-Subject: [PATCH] Sync enum representation of char_class_e in struct traits
- with definition
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[backport of upstream patch from master branch:
- https://github.com/kodi-pvr/pvr.mediaportal.tvserver/commit/7b14e0657a1308e8e133991b778e2fdcb2eb6b9c]
----
- src/uri.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/uri.h b/src/uri.h
-index d2cc949..415e917 100644
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
-     const char* begin_cstring;       ///< begin cstring (or 0 if none)
-     const char begin_char;           ///< begin char (or 0 if none)
-     const char end_char;             ///< end char (or 0 if none)
--    const char char_class[256];      ///< map of char to class
-+    const char_class_e_type char_class[256];      ///< map of char to class
-   };
- 
-   /**
-- 
2.7.0
