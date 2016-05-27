From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 May 2016 11:32:03 +0300
Subject: [Buildroot] [PATCH] tinyalsa: fix musl build
Message-ID: <6d0482c749131f39bcdfe130d4e8ec169fc25921.1464337923.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch adding missing header include.

Fixes:
http://autobuild.buildroot.net/results/042/04259ddbdf24afc507b0f21e1f5ba8738ec492b1/
http://autobuild.buildroot.net/results/371/371a1eab885d1a6b5b06bdab6c2280b20593eed4/
http://autobuild.buildroot.net/results/377/37743b3e73fcb0df9fd50113e082eac712c25e35/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...clude-time.h-to-get-struct-timespec-proto.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch

diff --git a/package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch b/package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch
new file mode 100644
index 000000000000..1b5d43cec543
--- /dev/null
+++ b/package/tinyalsa/0002-asound.h-include-time.h-to-get-struct-timespec-proto.patch
@@ -0,0 +1,33 @@
+From c8333f8c7a4e4b9549abeef7530b2cd20a18e537 Mon Sep 17 00:00:00 2001
+From: rofl0r <retnyg@gmx.net>
+Date: Mon, 12 Oct 2015 12:57:09 +0100
+Subject: [PATCH] asound.h: include <time.h> to get struct timespec prototype
+
+without including it, we get
+In file included from mixer.c:44:0:
+include/sound/asound.h:337:18: error: field 'trigger_tstamp' has incomplete type
+include/sound/asound.h:338:18: error: field 'tstamp' has incomplete type
+etc.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit c8333f8c7a4e
+
+ include/sound/asound.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/sound/asound.h b/include/sound/asound.h
+index a041628ec28e..7c6de81673f5 100644
+--- a/include/sound/asound.h
++++ b/include/sound/asound.h
+@@ -12,6 +12,7 @@
+ #ifndef __SOUND_ASOUND_H
+ #define __SOUND_ASOUND_H
+ 
++#include <time.h>
+ #include <linux/types.h>
+ 
+ #define SNDRV_PROTOCOL_VERSION(major, minor, subminor) (((major)<<16)|((minor)<<8)|(subminor))
+-- 
+2.8.1
+
-- 
2.8.1
