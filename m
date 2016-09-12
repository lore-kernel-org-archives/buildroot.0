From: Ryan Coe <bluemrp9@gmail.com>
Date: Sun, 11 Sep 2016 18:04:26 -0700
Subject: [Buildroot] [PATCH 1/1] syslinux: add patch to disable pie
Message-ID: <20160912010426.16874-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ubuntu 16.10 has pie enable by default. This causes a build failure with
syslinux.

https://bugs.launchpad.net/ubuntu/+source/syslinux/+bug/1579023

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 boot/syslinux/0002-disable-pie.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 boot/syslinux/0002-disable-pie.patch

diff --git a/boot/syslinux/0002-disable-pie.patch b/boot/syslinux/0002-disable-pie.patch
new file mode 100644
index 0000000..0f11e66
--- /dev/null
+++ b/boot/syslinux/0002-disable-pie.patch
@@ -0,0 +1,15 @@
+Description: Disable PIE to avoid FTBFS on amd64
+Bug-Ubuntu: https://bugs.launchpad.net/bugs/1579023
+Author: Graham Inggs <ginggs@ubuntu.com>
+Last-Update: 2016-05-06
+--- a/gpxe/src/Makefile
++++ b/gpxe/src/Makefile
+@@ -4,7 +4,7 @@
+ #
+
+ CLEANUP		:=
+-CFLAGS		:=
++CFLAGS		:= -fno-PIE
+ ASFLAGS		:=
+ LDFLAGS		:=
+ MAKEDEPS	:= Makefile
-- 
2.9.3
