From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest: add freetype optional
	dependency
Message-ID: <20171021151212.1530181148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcb53e87a28f6669669642fa5d5da4445d4a3d84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
