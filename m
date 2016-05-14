From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 16:20:07 +0200
Subject: [Buildroot] [git commit] mali-t76x: depends on mesa3d-headers
Message-ID: <20160514142027.6442A81926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e7d9a73b91881e2f08a7e493ca9ca6efb33d78e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It selects them, but doesn't depend on them, and since the package only
provides binaries there's a complete lack of headers. When some other
package pulls in the egl/gles provider this doesn't result in headers
being pulled in, hence the API is completely missing. Fixes:
http://autobuild.buildroot.net/results/dab/dab91372b7bfde57796a7e3de7e823dc44adfb76/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
