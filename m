From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue,  8 Apr 2008 20:41:42 +0100
Subject: [Buildroot] [PATCH] U-BOOT: A patch to fix the fw_printenv
	compilation
In-Reply-To: <1207683703-14842-3-git-send-email-buildroot.atmel.com@pollet.net>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
	<1207683703-14842-2-git-send-email-buildroot.atmel.com@pollet.net>
	<1207683703-14842-3-git-send-email-buildroot.atmel.com@pollet.net>
Message-ID: <1207683703-14842-4-git-send-email-buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michel <michel.git@pollet.net>

Signed-off-by: Michel <michel.git@pollet.net>
---
 ...oot-1.3.0-env-110-fw_printenv_compile_fix.patch |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 target/u-boot/u-boot-1.3.0-env-110-fw_printenv_compile_fix.patch

diff --git a/target/u-boot/u-boot-1.3.0-env-110-fw_printenv_compile_fix.patch b/target/u-boot/u-boot-1.3.0-env-110-fw_printenv_compile_fix.patch
new file mode 100644
index 0000000..268a6ff
--- /dev/null
+++ b/target/u-boot/u-boot-1.3.0-env-110-fw_printenv_compile_fix.patch
@@ -0,0 +1,12 @@
+diff -ruN u-boot-1.3.0/tools/env/fw_env.c u-boot-1.3.0.new/tools/env/fw_env.c
+--- u-boot-1.3.0/tools/env/fw_env.c	2007-11-19 21:20:24.000000000 +0000
++++ u-boot-1.3.0.new/tools/env/fw_env.c	2008-04-07 15:34:51.000000000 +0100
+@@ -31,7 +31,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+-#include <linux/mtd/mtd.h>
++#include <mtd/mtd-user.h>
+ #include "fw_env.h"
+ 
+ typedef unsigned char uchar;
-- 
1.5.4.3
