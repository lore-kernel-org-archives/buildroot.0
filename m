From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 13 Jul 2017 14:40:48 +0200
Subject: [Buildroot] [PATCH v3 06/10] package/minetest: add postgresql
	optional dependency
In-Reply-To: <20170713124052.13708-1-romain.naour@gmail.com>
References: <20170713124052.13708-1-romain.naour@gmail.com>
Message-ID: <20170713124052.13708-6-romain.naour@gmail.com>
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
index 44a28ce..ba0bf24 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -16,7 +16,6 @@ MINETEST_CONF_OPTS = \
 	-DENABLE_GLES=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
-	-DENABLE_POSTGRESQL=OFF \
 	-DENABLE_LEVELDB=OFF \
 	-DENABLE_REDIS=OFF \
 	-DENABLE_SPATIAL=OFF \
@@ -58,6 +57,13 @@ else
 MINETEST_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+MINETEST_DEPENDENCIES += postgresql
+MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=OFF
+endif
+
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 MINETEST_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
 MINETEST_CONF_OPTS += -DENABLE_GETTEXT=ON
-- 
2.9.4
