From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 22:39:53 +0100
Subject: [Buildroot] [git commit] Add hypervisor consoles (hvc)
Message-ID: <20131216214008.B05DE9C0AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae6e4febf6e9a853f0a4158649731bfe52a1d0e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add /dev/hvc* devices, and add them to securetty. These
are required for ppc64 virtual consoles.

Signed-off-by: Anton Blanchard <anton@samba.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/device_table_dev.txt   |    1 +
 system/skeleton/etc/securetty |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/system/device_table_dev.txt b/system/device_table_dev.txt
index 9507939..91ed769 100644
--- a/system/device_table_dev.txt
+++ b/system/device_table_dev.txt
@@ -36,6 +36,7 @@
 /dev/ttyPSC	c	666	0	0	204	148	0	1	4
 /dev/ttyUL	c	666	0	0	204	187	0	1	4
 /dev/ttymxc	c	666	0	0	207	16	0	1	4
+/dev/hvc	c	640	0	0	229	0	0	1	4
 
 # Input stuff
 /dev/input		d	755	0	0	-	-	-	-	-
diff --git a/system/skeleton/etc/securetty b/system/skeleton/etc/securetty
index 5a3d0c6..0722677 100644
--- a/system/skeleton/etc/securetty
+++ b/system/skeleton/etc/securetty
@@ -51,3 +51,7 @@ ttySC5
 ttySC6
 ttySC7
 ttyGS0
+hvc0
+hvc1
+hvc2
+hvc3
