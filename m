From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 12 Jun 2017 22:54:08 +0200
Subject: [Buildroot] [PATCH v2 11/13] package/minetest: add leveldb optional
	dependency
In-Reply-To: <20170612205410.20230-1-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
Message-ID: <20170612205410.20230-11-romain.naour@gmail.com>
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
index 40df470..ba8b2a1 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -15,7 +15,6 @@ MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
-	-DENABLE_LEVELDB=OFF \
 	-DENABLE_SPATIAL=OFF \
 	-DAPPLY_LOCALE_BLACKLIST=OFF \
 	-DENABLE_SYSTEM_GMP=ON \
@@ -62,6 +61,13 @@ else
 MINETEST_CONF_OPTS += -DENABLE_GETTEXT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LEVELDB),y)
+MINETEST_DEPENDENCIES += leveldb
+MINETEST_CONF_OPTS += -DENABLE_LEVELDB=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_LEVELDB=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 MINETEST_DEPENDENCIES += libgles
 MINETEST_CONF_OPTS += -DENABLE_GLES=ON
-- 
2.9.4
