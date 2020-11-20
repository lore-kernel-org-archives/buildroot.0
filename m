From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 20 Nov 2020 23:09:49 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/abootimg: fix host build
Message-ID: <20201120220949.603454-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 05b11e24c3d4013d3caa0453d9bada9905795e35 wrongly added
ABOOTIMG_HOST_DEPENDENCIES instead of HOST_ABOOTIMG_DEPENDENCIES

Fixes:
 - http://autobuild.buildroot.org/results/c13b5424cec151cd3ad71b1cb38d6ad8ff68afa0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/abootimg/abootimg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/abootimg/abootimg.mk b/package/abootimg/abootimg.mk
index 64cee13c32..ab6c709318 100644
--- a/package/abootimg/abootimg.mk
+++ b/package/abootimg/abootimg.mk
@@ -11,7 +11,7 @@ ABOOTIMG_LICENSE_FILES = LICENSE
 
 # depends on libblkid from util-linux
 ABOOTIMG_DEPENDENCIES = util-linux
-ABOOTIMG_HOST_DEPENDENCIES = host-util-linux
+HOST_ABOOTIMG_DEPENDENCIES = host-util-linux
 
 define ABOOTIMG_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
2.29.2
