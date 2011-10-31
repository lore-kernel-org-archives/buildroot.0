From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 31 Oct 2011 09:02:18 -0300
Subject: [Buildroot] [PATCH] busybox: add 1.19.3 getty and modinfo fixes
Message-ID: <1320062538-26714-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../busybox-1.19.3/busybox-1.19.3-getty.patch      |   12 ++++++++++++
 .../busybox-1.19.3/busybox-1.19.3-modinfo.patch    |   10 ++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
 create mode 100644 package/busybox/busybox-1.19.3/busybox-1.19.3-modinfo.patch

diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
new file mode 100644
index 0000000..84dad6f
--- /dev/null
+++ b/package/busybox/busybox-1.19.3/busybox-1.19.3-getty.patch
@@ -0,0 +1,12 @@
+--- busybox-1.19.3/loginutils/getty.c
++++ busybox-1.19.3-getty/loginutils/getty.c
+@@ -271,7 +271,9 @@ static void termios_init(int speed)
+ #ifdef CMSPAR
+ 		| CMSPAR  /* mark or space parity */
+ #endif
++#ifdef CBAUD
+ 		| CBAUD   /* (output) baud rate */
++#endif
+ #ifdef CBAUDEX
+ 		| CBAUDEX /* (output) baud rate */
+ #endif
diff --git a/package/busybox/busybox-1.19.3/busybox-1.19.3-modinfo.patch b/package/busybox/busybox-1.19.3/busybox-1.19.3-modinfo.patch
new file mode 100644
index 0000000..9dd5c10
--- /dev/null
+++ b/package/busybox/busybox-1.19.3/busybox-1.19.3-modinfo.patch
@@ -0,0 +1,10 @@
+--- busybox-1.19.3/modutils/modinfo.c
++++ busybox-1.19.3-modinfo/modutils/modinfo.c
+@@ -13,6 +13,7 @@
+ //config:config MODINFO
+ //config:	bool "modinfo"
+ //config:	default y
++//config:	select PLATFORM_LINUX
+ //config:	help
+ //config:	  Show information about a Linux Kernel module
+ 
-- 
1.7.3.4
