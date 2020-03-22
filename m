From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 09:05:16 +0100
Subject: [Buildroot] [git commit] package/civetweb: bump to version 1.12
Message-ID: <20200322075239.0964D83CC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4ccc0ce4fc9a0adbe72e5e6207aa44f14e23f17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Drop -fPIC (not needed since
  https://github.com/civetweb/civetweb/commit/9518b502470d8be2d092266085056d6be4214b54)
- Update hash of license file (update in year and LuaXML):
  https://github.com/civetweb/civetweb/commit/e14dff167a790d3de39087d820f45bcb07f26a4f
  https://github.com/civetweb/civetweb/commit/6d87359d6c4db5b209a3a521701427b62c1c7a5d
- Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../civetweb/0001-modlua.ini-include-dlfcn.h.patch | 34 ----------------------
 package/civetweb/civetweb.hash                     |  4 +--
 package/civetweb/civetweb.mk                       |  3 +-
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/package/civetweb/0001-modlua.ini-include-dlfcn.h.patch b/package/civetweb/0001-modlua.ini-include-dlfcn.h.patch
deleted file mode 100644
index bd1b06aedf..0000000000
--- a/package/civetweb/0001-modlua.ini-include-dlfcn.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ca4325c6963e505d6fb628163abf2359427ea022 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 29 Nov 2018 21:43:28 +0100
-Subject: [PATCH] modlua.ini: include dlfcn.h
-
-dlfcn.h must be included to be able to use dlopen otherwise build will
-fail on:
-src/mod_lua.inl:2845:41: error: 'RTLD_LAZY' undeclared (first use in this function)
-  lib_handle_uuid = dlopen("libuuid.so", RTLD_LAZY);
-
-Fixes:
- - http://autobuild.buildroot.org/results/7a189f49c5a8b6f7b3d4c57cda5982adc65dbc19
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/civetweb/civetweb/pull/706]
----
- src/mod_lua.inl | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/mod_lua.inl b/src/mod_lua.inl
-index 97a5de1e..ce7a4b2e 100644
---- a/src/mod_lua.inl
-+++ b/src/mod_lua.inl
-@@ -2,6 +2,7 @@
-  * See https://github.com/civetweb/civetweb/
-  */
- 
-+#include <dlfcn.h>
- #include "civetweb_lua.h"
- #include "civetweb_private_lua.h"
- 
--- 
-2.14.1
-
diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index e6f60ff1dc..ae3c3c9510 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 de7d5e7a2d9551d325898c71e41d437d5f7b51e754b242af897f7be96e713a42  civetweb-1.11.tar.gz
-sha256 1cd00da00b8649b4005757f4019acfd3102ecd407f47998081697e8e9086f706  LICENSE.md
+sha256  8cab1e2ad8fb3e2e81fed0b2321a5afbd7269a644c44ed4c3607e0a212c6d9e1  civetweb-1.12.tar.gz
+sha256  291622dfbbf4fb35829726fbe97177b7227c0d4d6392b350660af73af4f86df8  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index f05b29f3cd..a6557561c5 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = 1.11
+CIVETWEB_VERSION = 1.12
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
@@ -61,7 +61,6 @@ endif
 ifeq ($(BR2_SHARED_LIBS)$(BR2_STATIC_SHARED_LIBS),y)
 CIVETWEB_BUILD_TARGETS += slib
 CIVETWEB_INSTALL_TARGETS += install-slib
-CIVETWEB_COPT += -fPIC
 endif
 
 endif # BR2_PACKAGE_CIVETWEB_LIB
