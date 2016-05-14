From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 14 May 2016 11:16:36 -0300
Subject: [Buildroot] [PATCH] mali-t76x: depends on mesa3d-headers
Message-ID: <1463235396-17533-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It selects them, but doesn't depend on them, and since the package only
provides binaries there's a complete lack of headers. When some other
package pulls in the egl/gles provider this doesn't result in headers
being pulled in, hence the API is completely missing. Fixes:
http://autobuild.buildroot.net/results/dab/dab91372b7bfde57796a7e3de7e823dc44adfb76/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mali-t76x/mali-t76x.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mali-t76x/mali-t76x.mk b/package/mali-t76x/mali-t76x.mk
index 702f583..387685c 100644
--- a/package/mali-t76x/mali-t76x.mk
+++ b/package/mali-t76x/mali-t76x.mk
@@ -7,7 +7,7 @@
 MALI_T76X_VERSION = r5p0-06rel0
 MALI_T76X_SOURCE = mali-t76x_$(MALI_T76X_VERSION)_linux_1+fbdev.tar.gz
 MALI_T76X_SITE = http://malideveloper.arm.com/downloads/drivers/binary/$(MALI_T76X_VERSION)
-
+MALI_T76X_DEPENDENCIES = mesa3d-headers
 MALI_T76X_INSTALL_STAGING = YES
 MALI_T76X_PROVIDES = libegl libgles
 
-- 
2.7.3
