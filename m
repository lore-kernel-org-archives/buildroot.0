From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:15 +0100
Subject: [Buildroot] [PATCH 22/22] erlang-p1-iconv: Remove package
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-23-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package was a dependency to ejabberd-18.09. It is not anymore
use by any package nor maintain upstream, so remove it.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                            |  1 -
 package/erlang-p1-iconv/Config.in            |  8 --------
 package/erlang-p1-iconv/erlang-p1-iconv.hash |  2 --
 package/erlang-p1-iconv/erlang-p1-iconv.mk   | 19 -------------------
 4 files changed, 30 deletions(-)
 delete mode 100644 package/erlang-p1-iconv/Config.in
 delete mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.hash
 delete mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.mk

diff --git a/package/Config.in b/package/Config.in
index 436216338a..296dbe49d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,7 +585,6 @@ menu "Erlang libraries/modules"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-acme/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
-	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-mqtree/Config.in"
 	source "package/erlang-p1-oauth2/Config.in"
 	source "package/erlang-p1-pkix/Config.in"
diff --git a/package/erlang-p1-iconv/Config.in b/package/erlang-p1-iconv/Config.in
deleted file mode 100644
index cec17d0605..0000000000
--- a/package/erlang-p1-iconv/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_ERLANG_P1_ICONV
-	bool "erlang-p1-iconv"
-	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  Erlang interface to libiconv
-
-	  https://github.com/processone/eiconv
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
deleted file mode 100644
index 31bcf40731..0000000000
--- a/package/erlang-p1-iconv/erlang-p1-iconv.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 8a9ff8a3dd983284caa964f118b5782ef1c0c662995608b2ca4f4a5f285605a9 erlang-p1-iconv-1.0.10.tar.gz
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
deleted file mode 100644
index 79d8efe16f..0000000000
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# erlang-p1-iconv
-#
-################################################################################
-
-ERLANG_P1_ICONV_VERSION = 1.0.10
-ERLANG_P1_ICONV_SITE = $(call github,processone,iconv,$(ERLANG_P1_ICONV_VERSION))
-ERLANG_P1_ICONV_LICENSE = Apache-2.0
-ERLANG_P1_ICONV_LICENSE_FILES = LICENSE.txt
-ERLANG_P1_ICONV_DEPENDENCIES = erlang-p1-utils
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-ERLANG_P1_ICONV_DEPENDENCIES += libiconv
-endif
-
-ERLANG_P1_ICONV_USE_AUTOCONF = YES
-
-$(eval $(rebar-package))
-- 
2.20.1
