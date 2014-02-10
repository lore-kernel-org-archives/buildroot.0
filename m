From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 19:42:43 +0100
Subject: [Buildroot] [git commit] am33x-cm3: update to latest version
Message-ID: <20140210184610.598839C74E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d2b96aae38c2a5bd789c62ebb412365bd958ff2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This goes hand-in-hand with the kernel update.
The version is taken from meta-ti.

The new kernel version, 3.12, requires a newer PM FW.

This should correspond to v05.00.00.02, though that tag
has not been pushed...

Signed-off-by: Anders Darander <anders@chargestorm.se>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../am33x-cm3/am33x-cm3-0001-fix-makefile.patch    |   16 ++++++++++------
 package/am33x-cm3/am33x-cm3.mk                     |    3 ++-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch b/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
index 77ba11c..f3cdb5e 100644
--- a/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
+++ b/package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch
@@ -11,16 +11,20 @@ Fix this by explicitly indicating -march=armv7-m.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
+Updated the patch to the latest version of the Makefile
+
+Signed-off-by: Anders Darander <anders@chargestorm.se>
+
 Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -13,7 +13,7 @@
+@@ -13,7 +13,7 @@ SRCDIR = src
  BINDIR = bin
  
  INCLUDES = $(SRCDIR)/include
--CFLAGS =-mcpu=cortex-m3 -mthumb -nostdlib -Wall -g -I$(INCLUDES)
-+CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -g -I$(INCLUDES)
- LDFLAGS =-nostartfiles -fno-exceptions -Tfirmware.ld
- 
- EXECUTABLE=am335x-pm-firmware.elf
+-CFLAGS =-mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
++CFLAGS =-march=armv7-m -mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
+ 	-Werror-implicit-function-declaration -Wstrict-prototypes \
+ 	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
+ 	-Wempty-body -fno-strict-overflow  -g -I$(INCLUDES) -O2
diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 929c4a5..01cb9a0 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-AM33X_CM3_VERSION = AM335xPSP_04.06.00.10-rc1
+# This should correpsond to v05.00.00.02
+AM33X_CM3_VERSION = 11107db2f1e9e58ee75d4fe9cc38423c9a6e4365
 AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
 AM33X_CM3_SITE_METHOD = git
 AM33X_CM3_LICENSE = TI Publicly Available Software License
