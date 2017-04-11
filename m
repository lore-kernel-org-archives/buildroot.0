From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:37 +0200
Subject: [Buildroot] [PATCH 08/14] package/minetest: add gles optional
	dependency
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/minetest/minetest.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 9cffc78..fe6e015 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -14,7 +14,6 @@ MINETEST_DEPENDENCIES = irrlicht gmp jpeg jsoncpp luajit sqlite zlib
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
 	-DENABLE_SOUND=OFF \
-	-DENABLE_GLES=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
 	-DENABLE_POSTGRESQL=OFF \
@@ -52,6 +51,13 @@ else
 MINETEST_CONF_OPTS += -DENABLE_GETTEXT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+MINETEST_DEPENDENCIES += libgles
+MINETEST_CONF_OPTS += -DENABLE_GLES=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_GLES=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 MINETEST_DEPENDENCIES += libcurl
 MINETEST_CONF_OPTS += -DENABLE_CURL=ON
-- 
2.9.3
