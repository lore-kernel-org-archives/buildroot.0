From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest: add libspatialindex
	optional dependency
Message-ID: <20171021151212.5F9BD7FB6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f83601e74184bea01a61a16232992f38fae46676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minetest/minetest.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index 2d1a90d..a813a0d 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -16,7 +16,6 @@ MINETEST_CONF_OPTS = \
 	-DENABLE_GLES=OFF \
 	-DENABLE_LUAJIT=ON \
 	-DENABLE_CURSES=OFF \
-	-DENABLE_SPATIAL=OFF \
 	-DAPPLY_LOCALE_BLACKLIST=OFF \
 	-DENABLE_SYSTEM_GMP=ON \
 	-DENABLE_SYSTEM_JSONCPP=ON
@@ -69,6 +68,13 @@ else
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
