From: James Knight <james.d.knight@live.com>
Date: Tue, 6 Mar 2018 02:22:15 +0000
Subject: [Buildroot] [PATCH 1/2] inotify-tools: bump to version 3.20.1
Message-ID: <BN6PR2001MB0948A3CA973163DBC6D80EBFA0D90@BN6PR2001MB0948.namprd20.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping this package to the most recent stable version. Drops the
need for the GCC 6.x patch as a related fix has been merged in [1].

[1]: https://github.com/rvoicilas/inotify-tools/pull/65

Signed-off-by: James Knight <james.d.knight@live.com>
---
 package/inotify-tools/0001-gcc6.patch    | 49 --------------------------------
 package/inotify-tools/inotify-tools.hash |  2 +-
 package/inotify-tools/inotify-tools.mk   |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/inotify-tools/0001-gcc6.patch

diff --git a/package/inotify-tools/0001-gcc6.patch b/package/inotify-tools/0001-gcc6.patch
deleted file mode 100644
index aae622ebf5..0000000000
--- a/package/inotify-tools/0001-gcc6.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5fe3ba82134d8b85adc69cf1d6c5742b4bde20b4 Mon Sep 17 00:00:00 2001
-From: James Knight <james.d.knight@live.com>
-Date: Thu, 16 Jun 2016 00:00:57 -0400
-Subject: [PATCH] correct code alignment
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The following replaces the indented section of code from spaces to tabs.
-No functional changes. Aside from consistency, this resolves a GCC 6
-build issue with the flag `-Werror=misleading-indentation` enabled:
-
-    inotifywait.c: In function ?output_event_csv?:
-    inotifywait.c:126:5: error: this ?if? clause does not guard...
-                                [-Werror=misleading-indentation]
-         if (filename != NULL)
-         ^~
-    inotifywait.c:129:2: note: ...this statement, but the latter is
-                               misleadingly indented as if it is guarded
-                               by the ?if?
-      printf("%s,", csv_escape( inotifytools_event_to_str( event->mask )
-                                                                    ) );
-      ^~~~~~
-
-Signed-off-by: James Knight <james.d.knight@live.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(downloaded from upstream pull request
- https://github.com/rvoicilas/inotify-tools/pull/65)
----
- src/inotifywait.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/inotifywait.c b/src/inotifywait.c
-index c5ce5e3..404a85b 100644
---- a/src/inotifywait.c
-+++ b/src/inotifywait.c
-@@ -122,9 +122,9 @@ void validate_format( char * fmt ) {
- 
- 
- void output_event_csv( struct inotify_event * event ) {
--    char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
--    if (filename != NULL)
--        printf("%s,", filename);
-+	char *filename = csv_escape(inotifytools_filename_from_wd(event->wd));
-+	if (filename != NULL)
-+		printf("%s,", filename);
- 
- 	printf("%s,", csv_escape( inotifytools_event_to_str( event->mask ) ) );
- 	if ( event->len > 0 )
diff --git a/package/inotify-tools/inotify-tools.hash b/package/inotify-tools/inotify-tools.hash
index 0993dc44c4..83ad5b9212 100644
--- a/package/inotify-tools/inotify-tools.hash
+++ b/package/inotify-tools/inotify-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 628b8efabb65a739dd747fe43b73b29a609b5cfa9628caa127764ed77766a6e1 inotify-tools-1df9af4d6cd0f4af4b1b19254bcf056aed4ae395.tar.gz
+sha256 a433cc1dedba851078276db69b0e97f9fe41e4ba3336d2971adfca4b3a6242ac inotify-tools-3.20.1.tar.gz
diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
index e8b1498e6f..407aefb69f 100644
--- a/package/inotify-tools/inotify-tools.mk
+++ b/package/inotify-tools/inotify-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INOTIFY_TOOLS_VERSION = 1df9af4d6cd0f4af4b1b19254bcf056aed4ae395
+INOTIFY_TOOLS_VERSION = 3.20.1
 INOTIFY_TOOLS_SITE = $(call github,rvoicilas,inotify-tools,$(INOTIFY_TOOLS_VERSION))
 INOTIFY_TOOLS_LICENSE = GPL
 INOTIFY_TOOLS_LICENSE_FILES = COPYING
-- 
2.16.2.windows.1
