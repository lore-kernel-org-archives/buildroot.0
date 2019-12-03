From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 16:46:44 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/am33x-cm3:
 disable PIE
Message-ID: <20191203154046.6EA738644A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=adefcaae13939637c796b7d8e4f67f41579bb470
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Fixes:
 - http://autobuild.buildroot.org/results/418a40b995e91bc66e692dfbc4b0521db3fa5fbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 584312d16ffc0b19c820cadd71bb406822174ab4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0003-Makefile-unconditionally-disable-PIE.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/am33x-cm3/0003-Makefile-unconditionally-disable-PIE.patch b/package/am33x-cm3/0003-Makefile-unconditionally-disable-PIE.patch
new file mode 100644
index 0000000000..6be157932d
--- /dev/null
+++ b/package/am33x-cm3/0003-Makefile-unconditionally-disable-PIE.patch
@@ -0,0 +1,33 @@
+From 0e8c3c4851ce64268a8ae1810ef72594251d917d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 10 Nov 2019 21:57:12 +0100
+Subject: [PATCH] Makefile: unconditionally disable PIE
+
+Though -nostdlib is passed in $(CFLAGS), -fno-pie must also be passed to
+avoid linking errors related to overlapping sections if toolchain
+enforces PIE.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/418a40b995e91bc66e692dfbc4b0521db3fa5fbb
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 5226006..fe3d844 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,7 +17,7 @@ CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
+ 	-Werror-implicit-function-declaration -Wstrict-prototypes \
+ 	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
+ 	-Wempty-body -fno-strict-overflow -fno-stack-protector \
+-	-g -I$(INCLUDES) -O2
++	-fno-pie -g -I$(INCLUDES) -O2
+ LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
+ 
+ EXECUTABLE=am335x-pm-firmware.elf
+-- 
+2.23.0
+
