From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:41 +0200
Subject: [Buildroot] [PATCH 12/14] package/minetest: add leveldb optional
	dependency
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-12-romain.naour@gmail.com>
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
index 2b46401..1560592 100644
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
2.9.3
