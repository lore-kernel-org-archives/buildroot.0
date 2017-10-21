From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest: add postgresql optional
	dependency
Message-ID: <20171021151212.375168110E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fd4e2d23a09efeb5f6d2cecc5cbbce2ce02cb7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
