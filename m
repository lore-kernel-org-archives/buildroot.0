From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 08:16:54 -0400
Subject: [Buildroot] [PATCH 1/1] libwebsockets: bump to version 2.2.1
Message-ID: <20170615121654.1967-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove patch, as it was committed upstream.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libwebsockets/libwebsockets.hash | 3 +--
 package/libwebsockets/libwebsockets.mk   | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 7976a69..4901397 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,2 @@
 # Locally computed:
-sha256	96183cbdfcd6e6a3d9465e854a924b7bfde6c8c6d3384d6159ad797c2e823b4d  libwebsockets-v2.1.1.tar.gz
-sha256	49ae9f959394686d469f960951ece3ad1101655afe64df28ea5b1a61c1d124f0  f9f5a5760782b68fba190fb46d306f7c08f027c0.patch
+sha256	e7f9eaef258e003c9ada0803a9a5636757a5bc0a58927858834fb38a87d18ad2  libwebsockets-v2.2.1.tar.gz
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 511359c..b29a2f1 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = v2.1.1
+LIBWEBSOCKETS_VERSION = v2.2.1
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = LGPL-2.1 with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
@@ -12,8 +12,6 @@ LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
 
-LIBWEBSOCKETS_PATCH = https://github.com/warmcat/libwebsockets/commit/f9f5a5760782b68fba190fb46d306f7c08f027c0.patch
-
 # If LWS_MAX_SMP=1, then there is no code related to pthreads compiled
 # in the library. If unset, LWS_MAX_SMP defaults to 32 and a small
 # amount of pthread mutex code is built into the library.
-- 
2.9.4
