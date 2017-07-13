From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 14:40:49 +0200
Subject: [Buildroot] [PATCH v3 07/10] package/minetest: add hiredis optional
	dependency
In-Reply-To: <20170713124052.13708-1-romain.naour@gmail.com>
References: <20170713124052.13708-1-romain.naour@gmail.com>
Message-ID: <20170713124052.13708-7-romain.naour@gmail.com>
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
index ba0bf24..583bb56 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -17,7 +17,6 @@ MINETEST_CONF_OPTS = \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
 	-DENABLE_LEVELDB=OFF \
-	-DENABLE_REDIS=OFF \
 	-DENABLE_SPATIAL=OFF \
 	-DAPPLY_LOCALE_BLACKLIST=OFF \
 	-DENABLE_SYSTEM_GMP=ON \
@@ -50,6 +49,13 @@ else
 MINETEST_CONF_OPTS += -DENABLE_FREETYPE=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+MINETEST_DEPENDENCIES += hiredis
+MINETEST_CONF_OPTS += -DENABLE_REDIS=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_REDIS=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 MINETEST_DEPENDENCIES += libcurl
 MINETEST_CONF_OPTS += -DENABLE_CURL=ON
-- 
2.9.4
