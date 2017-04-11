From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:39 +0200
Subject: [Buildroot] [PATCH 10/14] package/minetest: add postgresql optional
	dependency
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-10-romain.naour@gmail.com>
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
index 29f804e..93b99fa 100644
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
2.9.3
