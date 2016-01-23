From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jan 2016 00:40:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/ptpd2: Fix musl build
In-Reply-To: <1453592419-15454-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453592419-15454-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1453592419-15454-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build using
the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ptpd2/0001-musl.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/ptpd2/0001-musl.patch

diff --git a/package/ptpd2/0001-musl.patch b/package/ptpd2/0001-musl.patch
new file mode 100644
index 0000000..2e214b2
--- /dev/null
+++ b/package/ptpd2/0001-musl.patch
@@ -0,0 +1,15 @@
+Fix musl build
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr ptpd-ptpd-2.3.1.org/src/dep/net.c ptpd-ptpd-2.3.1/src/dep/net.c
+--- ptpd-ptpd-2.3.1.org/src/dep/net.c	2015-06-29 17:13:29.000000000 +0200
++++ ptpd-ptpd-2.3.1/src/dep/net.c	2016-01-24 00:35:44.509860065 +0100
+@@ -82,7 +82,6 @@
+ #ifdef SO_TIMESTAMPING
+ #include <linux/net_tstamp.h>
+ #include <linux/sockios.h>
+-#include <linux/ethtool.h>
+ #endif /* SO_TIMESTAMPING */
+ 
+ /**
-- 
2.7.0.rc3
