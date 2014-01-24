From: Anders Darander <anders@chargestorm.se>
Date: Fri, 24 Jan 2014 12:29:50 +0100
Subject: [Buildroot] [PATCH v2 2/4] am33x-cm3: update to latest version
In-Reply-To: <1390562992-9267-1-git-send-email-anders@chargestorm.se>
References: <1390562992-9267-1-git-send-email-anders@chargestorm.se>
Message-ID: <1390562992-9267-3-git-send-email-anders@chargestorm.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This goes hand-in-hand with the kernel update.
The version is taken from meta-ti.

The new kernel version, 3.12, requires a newer PM FW.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 package/am33x-cm3/am33x-cm3-0001-fix-makefile.patch | 16 ++++++++++------
 package/am33x-cm3/am33x-cm3.mk                      |  2 +-
 2 files changed, 11 insertions(+), 7 deletions(-)

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
index 929c4a5..9f9932c 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AM33X_CM3_VERSION = AM335xPSP_04.06.00.10-rc1
+AM33X_CM3_VERSION = v05.00.00.01
 AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
 AM33X_CM3_SITE_METHOD = git
 AM33X_CM3_LICENSE = TI Publicly Available Software License
-- 
1.8.5.3
