From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  3 Jan 2015 17:25:07 +0100
Subject: [Buildroot] [PATCH] package/upx: needs zlib
Message-ID: <1420302307-12399-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build issues like, observed on a stripped-down build system:
    compress.cpp:32:18: fatal error: zlib.h: No such file or directory
     #include <zlib.h>
                  ^
    compilation terminated.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/upx/upx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index 30bb03b..400d283 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -10,7 +10,7 @@ UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.bz2
 UPX_LICENSE = GPLv2+
 UPX_LICENSE_FILES = COPYING
 
-HOST_UPX_DEPENDENCIES = host-ucl
+HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 
 # We need to specify all, otherwise the default target only prints a message
 # stating to "please choose a target for 'make'"... :-(
-- 
1.9.1
