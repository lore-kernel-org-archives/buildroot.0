From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 29 Jan 2018 13:08:44 +0100
Subject: [Buildroot] [PATCH] package/turbolua: bump version to v2.1.2
Message-ID: <20180129120844.29817-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 ...er-Fix-typo-in-switch-FALLTHROUGH-comment.patch | 31 ----------------------
 package/turbolua/turbolua.hash                     |  2 +-
 package/turbolua/turbolua.mk                       |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch

diff --git a/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch b/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch
deleted file mode 100644
index bb27056ac6..0000000000
--- a/package/turbolua/0001-http-parser-Fix-typo-in-switch-FALLTHROUGH-comment.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 570db52d7fd3b4deffe785e60fb362e1496844ee Mon Sep 17 00:00:00 2001
-From: Marcin Niestroj <m.niestroj@grinn-global.com>
-Date: Tue, 26 Sep 2017 12:10:53 +0200
-Subject: [PATCH] http-parser: Fix typo in switch FALLTHROUGH comment
-
-This also suppresses -Wimplicit-fallthrough warning, which is enabled
-in gcc7 by default.
-
-PR for upstream: https://github.com/kernelsauce/turbo/pull/323
-
-Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
----
- deps/http-parser/http_parser.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/http-parser/http_parser.c b/deps/http-parser/http_parser.c
-index 8cf6fb0..2ff1073 100644
---- a/deps/http-parser/http_parser.c
-+++ b/deps/http-parser/http_parser.c
-@@ -2095,7 +2095,7 @@ http_parser_parse_url(
-       case s_req_server_with_at:
-         found_at = 1;
- 
--      /* FALLTROUGH */
-+      /* FALLTHROUGH */
-       case s_req_server:
-         uf = UF_HOST;
-         break;
--- 
-2.14.1
-
diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index dc718f8594..c2a6044498 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8b810aa531fcaf05020531fe904d449742fd0da85c31e925a7efa9816d1f8f88 turbolua-v2.1.0.tar.gz
+sha256 a2c30534706fb475545b17a017c63479e93e5e9bf1f5ed88c0db22bb4ea7b4b1 turbolua-v2.1.2.tar.gz
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index 49877fab68..49a5559eff 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = v2.1.0
+TURBOLUA_VERSION = v2.1.2
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
-- 
2.16.1
