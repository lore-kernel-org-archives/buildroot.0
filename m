From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jun 2018 13:08:50 +0200
Subject: [Buildroot] [PATCH v3 19/22] package/x11r7/xdriver_xf86-video-r128:
 add patch to fix support for xserver_xorg-server 1.20.0
In-Reply-To: <20180630110853.29339-1-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
Message-ID: <20180630110853.29339-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-xorg-xserver120.patch                | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/x11r7/xdriver_xf86-video-r128/0002-xorg-xserver120.patch

diff --git a/package/x11r7/xdriver_xf86-video-r128/0002-xorg-xserver120.patch b/package/x11r7/xdriver_xf86-video-r128/0002-xorg-xserver120.patch
new file mode 100644
index 0000000000..d4d91daecd
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-r128/0002-xorg-xserver120.patch
@@ -0,0 +1,21 @@
+Fix build error with xserver_xorg-server 1.20.0
+
+atipcirename.h:52:15: error: unknown type name 'uint32_t'
+ static inline uint32_t
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/x11-drivers/xf86-video-r128/files/xf86-video-r128-6.10.2-fix-stdint_h.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/src/atipcirename.h
++++ b/src/atipcirename.h
+@@ -29,6 +29,8 @@
+ #ifndef ATIPCIRENAME_H
+ #define ATIPCIRENAME_H
+ 
++#include <stdint.h>
++
+ enum region_type {
+     REGION_MEM,
+     REGION_IO 
-- 
2.17.1
