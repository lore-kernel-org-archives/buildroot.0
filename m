From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jul 2017 09:53:47 -0400
Subject: [Buildroot] [PATCH 6/9] fix help text wrapping for configs j
In-Reply-To: <20170731135350.9018-1-aduskett@gmail.com>
References: <20170731135350.9018-1-aduskett@gmail.com>
Message-ID: <20170731135350.9018-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter j in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/jansson/Config.in   |  4 ++--
 package/jemalloc/Config.in  |  5 +++--
 package/joe/Config.in       | 14 +++++++-------
 package/jq/Config.in        |  6 +++---
 package/jq/Config.in.host   | 10 +++++-----
 package/jquery-ui/Config.in |  4 ++--
 6 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/package/jansson/Config.in b/package/jansson/Config.in
index 960a7c4c3..18c8ce5df 100644
--- a/package/jansson/Config.in
+++ b/package/jansson/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_JANSSON
 	bool "jansson"
 	help
-	  Jansson is a C library for encoding, decoding and manipulating JSON
-	  data.
+	  Jansson is a C library for encoding, decoding and manipulating
+	  JSON data.
 
 	  http://www.digip.org/jansson/
diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index 85861407d..c3fd8e34b 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -14,8 +14,9 @@ config BR2_PACKAGE_JEMALLOC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
-	  This library providing a malloc(3) implementation that emphasizes
-	  fragmentation avoidance and scalable concurrency support.
+	  This library providing a malloc(3) implementation that
+	  emphasizes fragmentation avoidance and scalable concurrency
+	  support.
 
 	  http://jemalloc.net/
 
diff --git a/package/joe/Config.in b/package/joe/Config.in
index f335e057e..c9dd967b2 100644
--- a/package/joe/Config.in
+++ b/package/joe/Config.in
@@ -4,10 +4,10 @@ config BR2_PACKAGE_JOE
 	help
 	  Joe's Own Editor
 
-	  JOE is an easy-to-use, full featured terminal-based screen editor.
-	  Its behavior is a blending of WordStar and GNU-EMACS (but it does
-	  not use code from either program). It is a great editor for new
-	  users or as an alternative to vi.
+	  JOE is an easy-to-use, full featured terminal-based screen
+	  editor. Its behavior is a blending of WordStar and GNU-EMACS
+	  (but it does not use code from either program).
+	  It is a great editor for new users or as an alternative to vi.
 
 	  http://joe-editor.sf.net
 
@@ -16,6 +16,6 @@ config BR2_PACKAGE_JOE_FULL
 	default y
 	depends on BR2_PACKAGE_JOE
 	help
-	  Install all rc and syntax highlighting files. Without this option
-	  only the joe binary is installed, which contains a default
-	  configuration.
+	  Install all rc and syntax highlighting files. Without this
+	  option only the joe binary is installed, which contains a
+	  default configuration.
diff --git a/package/jq/Config.in b/package/jq/Config.in
index 9329b2fb3..321cbe8b5 100644
--- a/package/jq/Config.in
+++ b/package/jq/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_JQ
 	bool "jq"
 	help
-	  jq is like sed for JSON data - you can use it to slice and filter
-	  and map and transform structured data with the same ease that sed,
-	  awk, grep and friends let you play with text.
+	  jq is like sed for JSON data - you can use it to slice and
+	  filter and map and transform structured data with the same
+	  ease that sed, awk, grep and friends let you play with text.
 
 	  http://stedolan.github.io/jq/
diff --git a/package/jq/Config.in.host b/package/jq/Config.in.host
index a0aabc0b3..9fc0e9905 100644
--- a/package/jq/Config.in.host
+++ b/package/jq/Config.in.host
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_HOST_JQ
 	bool "host jq"
 	help
-	  jq is like sed for JSON data - you can use it to slice and filter
-	  and map and transform structured data with the same ease that sed,
-	  awk, grep and friends let you play with text.
+	  jq is like sed for JSON data - you can use it to slice and
+	  filter and map and transform structured data with the same
+	  ease that sed, awk, grep and friends let you play with text.
 
-	  As a host tool, jq can be useful to create/edit/merge/check JSON
-	  files from a post-build script.
+	  As a host tool, jq can be useful to create/edit/merge/check
+	  JSON files from a post-build script.
 
 	  http://stedolan.github.io/jq/
diff --git a/package/jquery-ui/Config.in b/package/jquery-ui/Config.in
index a7c0a6df5..fd38997ef 100644
--- a/package/jquery-ui/Config.in
+++ b/package/jquery-ui/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_JQUERY_UI
 	help
 	  jQuery UI provides abstractions for low-level interaction and
 	  animation, advanced effects and high-level, themeable widgets,
-	  built on top of the jQuery JavaScript Library, that you can use
-	  to build highly interactive web applications.
+	  built on top of the jQuery JavaScript Library, that you can
+	  use to build highly interactive web applications.
 
 	  http://jqueryui.com/
-- 
2.13.3
