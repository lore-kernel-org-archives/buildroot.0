From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 14:13:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: fix musl build
Message-ID: <1453554802-9952-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/6cc/6cc0f8c067e07deea688b9b97284601a596b898c/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/0003-fixmusl.patch | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 package/libdrm/0003-fixmusl.patch

diff --git a/package/libdrm/0003-fixmusl.patch b/package/libdrm/0003-fixmusl.patch
new file mode 100644
index 0000000..5c7cc79
--- /dev/null
+++ b/package/libdrm/0003-fixmusl.patch
@@ -0,0 +1,18 @@
+Fix musl build
+
+Patch inspired by upstream bug report:
+https://bugs.freedesktop.org/show_bug.cgi?id=93764
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libdrm-2.4.66.org/tests/kms/kms-steal-crtc.c libdrm-2.4.66/tests/kms/kms-steal-crtc.c
+--- libdrm-2.4.66.org/tests/kms/kms-steal-crtc.c	2015-12-27 20:40:57.000000000 +0100
++++ libdrm-2.4.66/tests/kms/kms-steal-crtc.c	2016-01-23 11:33:26.000000000 +0100
+@@ -31,6 +31,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <sys/select.h>
+ 
+ #include <drm_fourcc.h>
+ 
-- 
2.7.0.rc3
