From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:40 +0200
Subject: [Buildroot] [PATCH 11/14] package/minetest: add hiredis optional
	dependency
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-11-romain.naour@gmail.com>
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
index 93b99fa..2b46401 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -16,7 +16,6 @@ MINETEST_CONF_OPTS = \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
 	-DENABLE_LEVELDB=OFF \
-	-DENABLE_REDIS=OFF \
 	-DENABLE_SPATIAL=OFF \
 	-DAPPLY_LOCALE_BLACKLIST=OFF \
 	-DENABLE_SYSTEM_GMP=ON \
@@ -49,6 +48,13 @@ else
 MINETEST_CONF_OPTS += -DENABLE_FREETYPE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+MINETEST_DEPENDENCIES += hiredis
+MINETEST_CONF_OPTS += -DENABLE_REDIS=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_REDIS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
 MINETEST_DEPENDENCIES += gettext
 MINETEST_CONF_OPTS += -DENABLE_GETTEXT=ON
-- 
2.9.3
