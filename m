From: Gerhard Heift <gerhard@heift.name>
Date: Fri, 15 Jan 2016 12:13:17 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix for linux 4.4
Message-ID: <1452856397-21566-1-git-send-email-Gerhard@Heift.Name>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since linux 4.4 <mtd/mtd-user.h> does not include <stdint.h> any more, so it
had to be included explicitly.

See commit 137d36af4a53858b8db7ca83c8480247118b8bdf of the linux kernel.

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=137d36af4a53858b8db7ca83c8480247118b8bdf

Signed-off-by: Gerhard Heift <Gerhard@Heift.Name>
---
 ...stdint.h-where-mtd-mtd-user.h-is-included.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/uboot-tools/0003-include-stdint.h-where-mtd-mtd-user.h-is-included.patch

diff --git a/package/uboot-tools/0003-include-stdint.h-where-mtd-mtd-user.h-is-included.patch b/package/uboot-tools/0003-include-stdint.h-where-mtd-mtd-user.h-is-included.patch
new file mode 100644
index 0000000..f114221
--- /dev/null
+++ b/package/uboot-tools/0003-include-stdint.h-where-mtd-mtd-user.h-is-included.patch
@@ -0,0 +1,44 @@
+From: Gerhard Heift <Gerhard@Heift.Name>
+Date: Fri, 15 Jan 2016 10:34:46 +0100
+Subject: [PATCH] include stdint.h where mtd/mtd-user.h is included
+
+Since linux 4.4 mtd/mtd-user.h does not include stdint.h any more, so it
+has to be included explicitly.
+
+See commit 137d36af4a53858b8db7ca83c8480247118b8bdf of the linux kernel.
+
+https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=137d36af4a53858b8db7ca83c8480247118b8bdf
+
+Signed-off-by: Gerhard Heift <Gerhard@Heift.Name>
+---
+ tools/env/fw_env.c               | 1 +
+ tools/palmtreo680/flash_u-boot.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
+index 39f7333..098c7c7 100644
+--- a/tools/env/fw_env.c
++++ b/tools/env/fw_env.c
+@@ -29,6 +29,7 @@
+ # include <linux/mtd/mtd.h>
+ #else
+ # define  __user	/* nothing */
++# include <stdint.h>
+ # include <mtd/mtd-user.h>
+ #endif
+ 
+diff --git a/tools/palmtreo680/flash_u-boot.c b/tools/palmtreo680/flash_u-boot.c
+index 3d8296f..7a9b37d 100644
+--- a/tools/palmtreo680/flash_u-boot.c
++++ b/tools/palmtreo680/flash_u-boot.c
+@@ -28,6 +28,7 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <stdint.h>
+ #include <mtd/mtd-user.h>
+ #include "libmtd.h"
+ 
+-- 
+2.7.0.rc3
+
-- 
2.7.0.rc3
