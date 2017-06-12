From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 12 Jun 2017 22:54:06 +0200
Subject: [Buildroot] [PATCH v2 09/13] package/minetest: add postgresql
	optional dependency
In-Reply-To: <20170612205410.20230-1-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
Message-ID: <20170612205410.20230-9-romain.naour@gmail.com>
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
index 42c8888..742b2d1 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -15,7 +15,6 @@ MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
-	-DENABLE_POSTGRESQL=OFF \
 	-DENABLE_LEVELDB=OFF \
 	-DENABLE_REDIS=OFF \
 	-DENABLE_SPATIAL=OFF \
@@ -71,4 +70,11 @@ else
 MINETEST_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+MINETEST_DEPENDENCIES += postgresql
+MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_POSTGRESQL=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.9.4
