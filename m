From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 14:37:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/dvbsnoop: fix musl build
Message-ID: <1453642679-29490-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/6fb/6fbe96af007803acfe9deacf26399cb19e5f2b47/
http://autobuild.buildroot.net/results/be6/be64a45ac158b9057fb3e7ef9b515250acc77187/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dvbsnoop/0001-musl-types-h.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/dvbsnoop/0001-musl-types-h.patch

diff --git a/package/dvbsnoop/0001-musl-types-h.patch b/package/dvbsnoop/0001-musl-types-h.patch
new file mode 100644
index 0000000..1149df0
--- /dev/null
+++ b/package/dvbsnoop/0001-musl-types-h.patch
@@ -0,0 +1,15 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr dvbsnoop-1.4.50.org/src/misc/helper.h dvbsnoop-1.4.50/src/misc/helper.h
+--- dvbsnoop-1.4.50.org/src/misc/helper.h	2006-01-02 20:04:56.000000000 +0100
++++ dvbsnoop-1.4.50/src/misc/helper.h	2016-01-24 14:35:02.000000000 +0100
+@@ -16,6 +16,7 @@
+ #ifndef __HELPER_H
+ #define __HELPER_H
+ 
++#include <sys/types.h>
+ 
+ u_long outBit_Sx (int verbosity, const char *text, u_char *buf, int startbit, int bitlen);
+ u_long outBit_Sx_NL (int verbosity, const char *text, u_char *buf, int startbit, int bitlen);
-- 
2.7.0.rc3
