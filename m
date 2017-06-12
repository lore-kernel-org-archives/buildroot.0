From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 12 Jun 2017 22:54:01 +0200
Subject: [Buildroot] [PATCH v2 04/13] package/minetest: add libcurl optional
	dependency
In-Reply-To: <20170612205410.20230-1-romain.naour@gmail.com>
References: <20170612205410.20230-1-romain.naour@gmail.com>
Message-ID: <20170612205410.20230-4-romain.naour@gmail.com>
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
index 929016a..e9abb04 100644
--- a/package/minetest/minetest.mk
+++ b/package/minetest/minetest.mk
@@ -13,7 +13,6 @@ MINETEST_DEPENDENCIES = irrlicht gmp jpeg jsoncpp luajit sqlite zlib
 
 MINETEST_CONF_OPTS = \
 	-DDEFAULT_RUN_IN_PLACE=OFF \
-	-DENABLE_CURL=OFF \
 	-DENABLE_GETTEXT=OFF \
 	-DENABLE_SOUND=OFF \
 	-DENABLE_GLES=OFF \
@@ -41,4 +40,11 @@ else
 MINETEST_CONF_OPTS += -DBUILD_SERVER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+MINETEST_DEPENDENCIES += libcurl
+MINETEST_CONF_OPTS += -DENABLE_CURL=ON
+else
+MINETEST_CONF_OPTS += -DENABLE_CURL=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.9.4
