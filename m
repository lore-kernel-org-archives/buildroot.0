From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 23:12:17 +0100
Subject: [Buildroot] [git commit] package/bluez_utils: fix build with c99
Message-ID: <20200110220318.DCCB68900D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d98d78d84a4efef92a40ab538d6204d13b354e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will fix a build failure with libsigrok

Fixes:
 - http://autobuild.buildroot.org/results/005a16e63518716c6e99c74c618d01be453c76d4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0007-fix-lib-bluetooth-h-with-c99.patch        | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch b/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch
new file mode 100644
index 0000000000..3738baf1f5
--- /dev/null
+++ b/package/bluez_utils/0007-fix-lib-bluetooth-h-with-c99.patch
@@ -0,0 +1,31 @@
+http://permalink.gmane.org/gmane.linux.bluez.kernel/22306
+
+[Retrieved from:
+https://428282.bugs.gentoo.org/attachment.cgi?id=319374]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff --git a/lib/bluetooth.h b/lib/bluetooth.h
+index 0541842..5b2153d 100644
+--- a/lib/bluetooth.h
++++ b/lib/bluetooth.h
+@@ -140,16 +140,16 @@ enum {
+ #define bt_get_unaligned(ptr)			\
+ ({						\
+ 	struct __attribute__((packed)) {	\
+-		typeof(*(ptr)) __v;		\
+-	} *__p = (typeof(__p)) (ptr);		\
++		__typeof__(*(ptr)) __v;		\
++	} *__p = (__typeof__(__p)) (ptr);	\
+ 	__p->__v;				\
+ })
+ 
+ #define bt_put_unaligned(val, ptr)		\
+ do {						\
+ 	struct __attribute__((packed)) {	\
+-		typeof(*(ptr)) __v;		\
+-	} *__p = (typeof(__p)) (ptr);		\
++		__typeof__(*(ptr)) __v;		\
++	} *__p = (__typeof__(__p)) (ptr);	\
+ 	__p->__v = (val);			\
+ } while(0)
+ 
