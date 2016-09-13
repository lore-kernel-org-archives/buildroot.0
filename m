From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 13 Sep 2016 13:45:03 -0700
Subject: [Buildroot] [PATCH 1/2] xen: Disable -Werror when building
Message-ID: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...1-Remove-hardcoded-strict-Werror-checking.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch

diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
new file mode 100644
index 0000000..ca772dd
--- /dev/null
+++ b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
@@ -0,0 +1,26 @@
+From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Tue, 13 Sep 2016 10:48:31 -0700
+Subject: [PATCH] Remove hardcoded strict -Werror checking
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ Config.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Config.mk b/Config.mk
+index bd991c6..e7ac662 100644
+--- a/Config.mk
++++ b/Config.mk
+@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
+ SHELL     ?= /bin/sh
+ 
+ # Tools to run on system hosting the build
+-HOSTCFLAGS  = -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointer
++HOSTCFLAGS  = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
+ HOSTCFLAGS += -fno-strict-aliasing
+ 
+ DISTDIR     ?= $(XEN_ROOT)/dist
+-- 
+2.7.4
+
-- 
2.7.4
