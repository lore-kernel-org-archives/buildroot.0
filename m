From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  2 Dec 2014 09:48:41 +0200
Subject: [Buildroot] [PATCH] live555: fix shared library build on x86
Message-ID: <bb64ba65fded8d92e398aa63b022707ae673782d.1417506520.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-fPIC is required for shared libraries on x86.

Fixes:
http://autobuild.buildroot.net/results/6e7/6e78d3e29856c25d233f1629c31bc15f7ecb2f89/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/live555/live555.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 7dbded3522cd..064450546fc2 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -19,6 +19,7 @@ LIVE555_LIBRARY_LINK = $(TARGET_AR) cr
 else
 LIVE555_CONFIG_TARGET = linux-with-shared-libraries
 LIVE555_LIBRARY_LINK = $(TARGET_CC) -o
+LIVE555_CFLAGS += -fPIC
 endif
 
 ifndef ($(BR2_ENABLE_LOCALE),y)
-- 
2.1.3
