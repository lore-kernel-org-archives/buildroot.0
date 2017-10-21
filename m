From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 17:19:32 +0200
Subject: [Buildroot] [git commit] package/minetest: add NLS optional
	dependency
Message-ID: <20171021151212.0C2C77FB6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=936ef5dc26cef37ad50dc3b7ce48cdc14bf8d048
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minetest/minetest.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/minetest/minetest.mk b/package/minetest/minetest.mk
index de4e3f0..316bd9b 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -13,7 +13,6 @@ MINETEST_DEPENDENCIES = gmp irrlicht jsoncpp luajit sqlite zlib
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
-	-DENABLE_GETTEXT=OFF \
 	-DENABLE_SOUND=OFF \
 	-DENABLE_GLES=OFF \
 	-DENABLE_FREETYPE=OFF \
@@ -47,4 +46,11 @@ else
 MINETEST_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+MINETEST_DEPENDENCIES += $(TARGET_NLS_DEPENDENCIES)
+MINETEST_CONF_OPTS += -DENABLE_GETTEXT=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_GETTEXT=OFF
+endif
+
 $(eval $(cmake-package))
