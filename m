From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest: add hiredis optional
	dependency
Message-ID: <20171021151212.4862E7FB6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0446c413ddbddd09507fd49cfc75d4bace9b4f74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
