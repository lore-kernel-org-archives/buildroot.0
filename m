From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 30 Aug 2015 20:36:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/bootutils: fix musl compilation
	issue
Message-ID: <1440963380-6449-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/389/38914a0a7ff0aa79acbbbe6c46ab701325dfceb8/
http://autobuild.buildroot.net/results/c0d/c0d09f5dd0e26c0d2454ebb2ea5317db1135db89/

musl requires strict inclusion of <sys/types.h> for makedev(3).

note - upstream project appears dead since 2009.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 .../0001-fix-musl-compilation-issue.patch          | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/bootutils/0001-fix-musl-compilation-issue.patch

diff --git a/package/bootutils/0001-fix-musl-compilation-issue.patch b/package/bootutils/0001-fix-musl-compilation-issue.patch
new file mode 100644
index 0000000..ccb6ef6
--- /dev/null
+++ b/package/bootutils/0001-fix-musl-compilation-issue.patch
@@ -0,0 +1,31 @@
+From e4c2c18b9d1d7a6dc17d8f7705b26fc2e2efc5a9 Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Sun, 30 Aug 2015 20:12:40 +0100
+Subject: [PATCH 1/1] fix musl compilation issue
+
+makedev(3) requires sys/types.h to be included.
+
+Note upstream has not issued releases since 2009. No mailing list activity
+since January 2010, and even before then it seems to be mostly spam.
+
+Upstream-Status: dormant
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ raidscan.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/raidscan.c b/raidscan.c
+index fab3b02..3cb1a0d 100644
+--- a/raidscan.c
++++ b/raidscan.c
+@@ -22,6 +22,7 @@
+ #include "config.h"
+ 
+ #include <sys/stat.h>
++#include <sys/types.h>
+ #include <fcntl.h>
+ #include <sys/ioctl.h>
+ #include <linux/major.h>
+-- 
+2.4.3
+
-- 
2.4.3
