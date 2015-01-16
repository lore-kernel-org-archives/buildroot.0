From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 16 Jan 2015 22:09:54 +0100
Subject: [Buildroot] [PATCH 5/6] lua-messagepack: bump to version 0.3.2
In-Reply-To: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
References: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1421442595-27575-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-messagepack/lua-messagepack.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/lua-messagepack/lua-messagepack.mk b/package/lua-messagepack/lua-messagepack.mk
index c367d75..92f7c1f 100644
--- a/package/lua-messagepack/lua-messagepack.mk
+++ b/package/lua-messagepack/lua-messagepack.mk
@@ -4,8 +4,12 @@
 #
 ################################################################################
 
-LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.1
+LUA_MESSAGEPACK_VERSION_UPSTREAM = 0.3.2
+ifeq ($(BR2_PACKAGE_LUA_5_3),y)
+LUA_MESSAGEPACK_VERSION = lua53-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
+else
 LUA_MESSAGEPACK_VERSION = $(LUA_MESSAGEPACK_VERSION_UPSTREAM)-1
+endif
 LUA_MESSAGEPACK_SUBDIR = lua-MessagePack-$(LUA_MESSAGEPACK_VERSION_UPSTREAM)
 LUA_MESSAGEPACK_LICENSE = MIT
 LUA_MESSAGEPACK_LICENSE_FILES = $(LUA_MESSAGEPACK_SUBDIR)/COPYRIGHT
-- 
2.1.0
