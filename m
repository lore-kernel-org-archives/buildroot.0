From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 14:40:46 +0200
Subject: [Buildroot] [PATCH v3 04/10] package/minetest: add freetype
	optional dependency
In-Reply-To: <20170713124052.13708-1-romain.naour@gmail.com>
References: <20170713124052.13708-1-romain.naour@gmail.com>
Message-ID: <20170713124052.13708-4-romain.naour@gmail.com>
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
index 316bd9b..528f140 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -15,7 +15,6 @@ MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
 	-DENABLE_SOUND=OFF \
 	-DENABLE_GLES=OFF \
-	-DENABLE_FREETYPE=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
 	-DENABLE_POSTGRESQL=OFF \
@@ -39,6 +38,13 @@ else
 MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+MINETEST_DEPENDENCIES += freetype
+MINETEST_CONF_OPTS += -DENABLE_FREETYPE=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_FREETYPE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 MINETEST_DEPENDENCIES += libcurl
 MINETEST_CONF_OPTS += -DENABLE_CURL=ON
-- 
2.9.4
