From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Apr 2017 17:35:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/rapidjson: switch to CMake
Message-ID: <20170409153516.896-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upcoming Kodi v18 depends on RapidJSON and detects it by using pkg-conf:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindRapidJSON.cmake#L13

Currently our package installs only the header files, but RapidJSON.pc
is also needed. Luckily this can be fixed by just switching to CMake
which does the job.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rapidjson/rapidjson.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
index d06f52962e..8173ac751e 100644
--- a/package/rapidjson/rapidjson.mk
+++ b/package/rapidjson/rapidjson.mk
@@ -13,8 +13,4 @@ RAPIDJSON_LICENSE_FILES = license.txt
 RAPIDJSON_INSTALL_TARGET = NO
 RAPIDJSON_INSTALL_STAGING = YES
 
-define RAPIDJSON_INSTALL_STAGING_CMDS
-	cp -dpfr $(@D)/include/* $(STAGING_DIR)/usr/include
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.11.0
