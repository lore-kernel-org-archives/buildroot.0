From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 15:12:59 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/mjpg-streamer: Fix musl build
In-Reply-To: <1453644779-7961-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453644779-7961-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453644779-7961-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/74c/74c6006c4d7a97fa69c6feee204631861daffea9/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/mjpg-streamer/0001-musl_compatibility.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/mjpg-streamer/0001-musl_compatibility.patch

diff --git a/package/mjpg-streamer/0001-musl_compatibility.patch b/package/mjpg-streamer/0001-musl_compatibility.patch
new file mode 100644
index 0000000..faebd58
--- /dev/null
+++ b/package/mjpg-streamer/0001-musl_compatibility.patch
@@ -0,0 +1,20 @@
+Fix musl build
+
+Patch downloaded from
+https://github.com/openwrt/packages/blob/master/multimedia/mjpg-streamer/patches/005-musl_compatibility.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/mjpg_streamer.h
++++ b/mjpg_streamer.h
+@@ -29,6 +29,10 @@
+ #define MAX_OUTPUT_PLUGINS 10
+ #define MAX_PLUGIN_ARGUMENTS 32
+ 
++#define __NEED_pthread_t
++#define __NEED_pthread_mutex_t
++#define __NEED_pthread_cond_t
++
+ #include <linux/types.h>          /* for videodev2.h */
+ #include <linux/videodev2.h>
+ 
-- 
2.7.0.rc3
