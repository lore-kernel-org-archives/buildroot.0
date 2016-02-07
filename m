From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 12:26:27 +0100
Subject: [Buildroot] [git commit] package/libndp: fix musl build
Message-ID: <20160207112631.010D5817D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b9eaff0006ffba1559f532534c3c9e5f55ad114
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/d42/d42bebe51bbec38f131840b6bbefdc162f0ad194/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libndp/0001-ndptool.c-Fix-musl-build.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libndp/0001-ndptool.c-Fix-musl-build.patch b/package/libndp/0001-ndptool.c-Fix-musl-build.patch
new file mode 100644
index 0000000..547598c
--- /dev/null
+++ b/package/libndp/0001-ndptool.c-Fix-musl-build.patch
@@ -0,0 +1,30 @@
+From 561f80b9a848be923f37bf1afedbecf92da3b2e7 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 30 Jan 2016 16:36:39 +0100
+Subject: [PATCH 1/1] ndptool.c: Fix musl build
+
+Fixes a build issue with the musl C library
+http://autobuild.buildroot.net/results/d42/d42bebe51bbec38f131840b6bbefdc162f0ad194/build-end.log
+
+Patch sent upstream: https://github.com/jpirko/libndp/pull/7
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ utils/ndptool.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/ndptool.c b/utils/ndptool.c
+index 04ec4e1..c6ef48c 100644
+--- a/utils/ndptool.c
++++ b/utils/ndptool.c
+@@ -27,6 +27,7 @@
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <errno.h>
++#include <sys/select.h>
+ #include <ndp.h>
+ 
+ enum verbosity_level {
+-- 
+2.7.0.rc3
+
