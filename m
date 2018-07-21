From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Jul 2018 16:16:45 +0200
Subject: [Buildroot] [PATCH v4 15/18] package/x11r7/xdriver_xf86-video-r128:
 add ustream patch to fix support for xserver_xorg-server 1.20.0
In-Reply-To: <20180721141648.29939-1-bernd.kuhls@t-online.de>
References: <20180721141648.29939-1-bernd.kuhls@t-online.de>
Message-ID: <20180721141648.29939-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-include-stdint-h.patch               | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch

diff --git a/package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch b/package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch
new file mode 100644
index 0000000000..4c15915b26
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-r128/0002-include-stdint-h.patch
@@ -0,0 +1,34 @@
+From c4c878d2ccb75fa75afe46e0e50ee9975c5c57fc Mon Sep 17 00:00:00 2001
+From: Stefan Dirsch <sndirsch@suse.de>
+Date: Mon, 25 Jun 2018 15:57:02 +0200
+Subject: Include <stdint.h> in order to declare uint32_t
+
+Apparently this is needed in src/atipcirename.h since xorg-server
+1.20 in order to still build this driver.
+
+Signed-off-by: Stefan Dirsch <sndirsch@suse.de>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Downloaded from upstream commit
+https://cgit.freedesktop.org/xorg/driver/xf86-video-r128/commit/?id=c4c878d2ccb75fa75afe46e0e50ee9975c5c57fc
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/atipcirename.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/atipcirename.h b/src/atipcirename.h
+index e65ae3c..3e7f686 100644
+--- a/src/atipcirename.h
++++ b/src/atipcirename.h
+@@ -34,6 +34,7 @@ enum region_type {
+     REGION_IO 
+ };
+ 
++#include <stdint.h>
+ #include "xf86Module.h"
+ 
+ #if GET_ABI_MAJOR(ABI_VIDEODRV_VERSION) >= 12
+-- 
+cgit v1.1
+
-- 
2.18.0
