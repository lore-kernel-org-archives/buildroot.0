From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 21:04:31 +0100
Subject: [Buildroot] [git commit] package: extend usage of github download
	helper
Message-ID: <20140103200436.7640B9C381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad0d02b740703f7903f309d0d17f71191b1725ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lcdapi/lcdapi.mk                         |    2 +-
 package/lua-msgpack-native/lua-msgpack-native.mk |    2 +-
 package/ti-utils/ti-utils.mk                     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index 1104151..d90511d 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LCDAPI_VERSION = v0.4
-LCDAPI_SITE = http://github.com/spdawson/lcdapi/tarball/$(LCDAPI_VERSION)
+LCDAPI_SITE = $(call github,spdawson,lcdapi,$(LCDAPI_VERSION))
 LCDAPI_LICENSE = LGPLv2.1+
 LCDAPI_LICENSE_FILES = COPYING
 
diff --git a/package/lua-msgpack-native/lua-msgpack-native.mk b/package/lua-msgpack-native/lua-msgpack-native.mk
index 3718405..496f8a8 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.mk
+++ b/package/lua-msgpack-native/lua-msgpack-native.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LUA_MSGPACK_NATIVE_VERSION = 41cce91ab6b54e4426c6d626a0ac41a02ec2096d
-LUA_MSGPACK_NATIVE_SITE = http://github.com/kengonakajima/lua-msgpack-native/tarball/$(LUA_MSGPACK_NATIVE_VERSION)
+LUA_MSGPACK_NATIVE_SITE = $(call github,kengonakajima,lua-msgpack-native,$(LUA_MSGPACK_NATIVE_VERSION))
 LUA_MSGPACK_NATIVE_DEPENDENCIES = lua
 LUA_MSGPACK_NATIVE_LICENSE = Apache-2.0
 LUA_MSGPACK_NATIVE_LICENSE_FILES = LICENSE.txt
diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 8f7aad6..1d1c1e6 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TI_UTILS_VERSION = 06dbdb2727354b5f3ad7c723897f40051fddee49
-TI_UTILS_SITE = http://github.com/gxk/ti-utils/tarball/$(TI_UTILS_VERSION)
+TI_UTILS_SITE = $(call github,gxk,ti-utils,$(TI_UTILS_VERSION))
 TI_UTILS_DEPENDENCIES = libnl
 
 define TI_UTILS_BUILD_CMDS
