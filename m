From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:36:13 +0100
Subject: [Buildroot] [git commit] package/dvbsnoop: fix musl build
Message-ID: <20160201224702.37A587F87D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d04649348671f947f5eb680e9269c157c0f8d33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/6fb/6fbe96af007803acfe9deacf26399cb19e5f2b47/
http://autobuild.buildroot.net/results/be6/be64a45ac158b9057fb3e7ef9b515250acc77187/
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dvbsnoop/0001-musl-types-h.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
