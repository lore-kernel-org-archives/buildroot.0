From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:42 +0200
Subject: [Buildroot] [PATCH 13/14] package/minetest: add libspatialindex
	optional dependency
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-13-romain.naour@gmail.com>
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
index 1560592..292050c 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -15,7 +15,6 @@ MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
-	-DENABLE_SPATIAL=OFF \
 	-DAPPLY_LOCALE_BLACKLIST=OFF \
 	-DENABLE_SYSTEM_GMP=ON \
 	-DENABLE_SYSTEM_JSONCPP=ON
@@ -82,6 +81,13 @@ else
 MINETEST_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSPATIALINDEX),y)
+MINETEST_DEPENDENCIES += libspatialindex
+MINETEST_CONF_OPTS += -DENABLE_SPATIAL=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_SPATIAL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 MINETEST_DEPENDENCIES += postgresql
 MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=ON
-- 
2.9.3
