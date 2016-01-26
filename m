From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:10:09 +0100
Subject: [Buildroot] [git commit] package/ptpd2: Fix musl build
Message-ID: <20160201224700.55B397F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=347fb8f88132a5a1f34bec16166f407cb61adca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The autobuilders did not catch the error yet because they failed
earlier with other packages, but I am continuing the build using
the defconfig from:
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ptpd2/0001-musl.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
