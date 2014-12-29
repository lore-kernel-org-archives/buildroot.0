From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 14:08:54 +0100
Subject: [Buildroot] [PATCH 1/2] libsigsegv: rename patches to the new
	convention and convert to Git format
In-Reply-To: <1419858535-26614-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419858535-26614-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419858535-26614-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit renames the libsigsegv patches to the new convention, and
converts them to Git formatted patches. Along the way, it also aligns
the description of the different patches, in a preparation for
upstream submission.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ack-direction-for-the-AVR32-architecture.patch} | 19 +++++++++++---
 ...k-direction-for-the-AArch64-architecture.patch} | 17 ++++++-------
 ...direction-for-the-Microblaze-architecture.patch | 26 +++++++++++++++++++
 ...k-direction-for-the-Blackfin-architecture.patch | 29 ++++++++++++++++++++++
 .../libsigsegv-0003-fix-microblaze-build.patch     | 16 ------------
 .../libsigsegv-0004-fix-bfin-build.patch           | 19 --------------
 6 files changed, 78 insertions(+), 48 deletions(-)
 rename package/libsigsegv/{libsigsegv-0001-fix-avr32-build.patch => 0001-Add-stack-direction-for-the-AVR32-architecture.patch} (51%)
 rename package/libsigsegv/{libsigsegv-0002-fix-aarch64-build.patch => 0002-Add-stack-direction-for-the-AArch64-architecture.patch} (58%)
 create mode 100644 package/libsigsegv/0003-Add-stack-direction-for-the-Microblaze-architecture.patch
 create mode 100644 package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
 delete mode 100644 package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
 delete mode 100644 package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch

diff --git a/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch b/package/libsigsegv/0001-Add-stack-direction-for-the-AVR32-architecture.patch
similarity index 51%
rename from package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
rename to package/libsigsegv/0001-Add-stack-direction-for-the-AVR32-architecture.patch
index f585764..ba388c6 100644
--- a/package/libsigsegv/libsigsegv-0001-fix-avr32-build.patch
+++ b/package/libsigsegv/0001-Add-stack-direction-for-the-AVR32-architecture.patch
@@ -1,3 +1,8 @@
+From 60d329bb2b20a67323152501969ff1db6a43e467 Mon Sep 17 00:00:00 2001
+From: Simon Dawson <spdawson@gmail.com>
+Date: Mon, 29 Dec 2014 13:53:51 +0100
+Subject: [PATCH 1/5] Add stack direction for the AVR32 architecture
+
 The libsigsegv configure step fails to correctly figure out the direction of
 stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
 build failures such as the following.
@@ -5,10 +10,15 @@ build failures such as the following.
   http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33
 
 Signed-off-by: Simon Dawson <spdawson@gmail.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ m4/stack-direction.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff -Nurp a/m4/stack-direction.m4 b/m4/stack-direction.m4
---- a/m4/stack-direction.m4	2009-11-21 12:22:45.000000000 +0000
-+++ b/m4/stack-direction.m4	2013-11-04 09:29:27.558036038 +0000
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 00e0445..39c1a28 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
 @@ -16,7 +16,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
        alpha* | \
        arc | \
@@ -18,3 +28,6 @@ diff -Nurp a/m4/stack-direction.m4 b/m4/stack-direction.m4
        c1 | c2 | c32 | c34 | c38 | \
        clipper | \
        cris | \
+-- 
+2.1.0
+
diff --git a/package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch b/package/libsigsegv/0002-Add-stack-direction-for-the-AArch64-architecture.patch
similarity index 58%
rename from package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch
rename to package/libsigsegv/0002-Add-stack-direction-for-the-AArch64-architecture.patch
index a916e9d..a3b03a0 100644
--- a/package/libsigsegv/libsigsegv-0002-fix-aarch64-build.patch
+++ b/package/libsigsegv/0002-Add-stack-direction-for-the-AArch64-architecture.patch
@@ -1,21 +1,18 @@
-From 2a2dac797cc41fb3f106c4186fc68d3e15b4ea47 Mon Sep 17 00:00:00 2001
+From 790e8f620f06834f3fd03c310cbecd1416536987 Mon Sep 17 00:00:00 2001
 From: Will Newton <will.newton@linaro.org>
 Date: Tue, 28 May 2013 18:31:46 +0100
-Subject: [PATCH] m4/stack-direction.m4: AArch64 stack grows down.
+Subject: [PATCH 2/5] Add stack direction for the AArch64 architecture
 
-Submitted-Upstream: https://lists.gnu.org/archive/html/bug-libsigsegv/2013-05/msg00001.html
+On this architecture, the stack grows downward.
 
-ChangeLog:
-
-2013-05-28  Will Newton  <will.newton@linaro.org>
-
-	* m4/stack-direction.m4: AArch64 stack grows down.
+Signed-off-by: Will Newton <will.newton@linaro.org>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  m4/stack-direction.m4 | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
-index 00e0445..890b77e 100644
+index 39c1a28..3f70530 100644
 --- a/m4/stack-direction.m4
 +++ b/m4/stack-direction.m4
 @@ -13,6 +13,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
@@ -27,5 +24,5 @@ index 00e0445..890b77e 100644
        arc | \
        arm* | strongarm* | xscale* | \
 -- 
-1.8.1.4
+2.1.0
 
diff --git a/package/libsigsegv/0003-Add-stack-direction-for-the-Microblaze-architecture.patch b/package/libsigsegv/0003-Add-stack-direction-for-the-Microblaze-architecture.patch
new file mode 100644
index 0000000..d3795d3
--- /dev/null
+++ b/package/libsigsegv/0003-Add-stack-direction-for-the-Microblaze-architecture.patch
@@ -0,0 +1,26 @@
+From f4395ff932758884416753f88f5d98f33ec67479 Mon Sep 17 00:00:00 2001
+From: Spenser Gilliland <spenser@gillilanding.com>
+Date: Mon, 29 Dec 2014 13:54:54 +0100
+Subject: [PATCH 3/5] Add stack direction for the Microblaze architecture
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 3f70530..53f4216 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -32,6 +32,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       m68* | \
+       m88k | \
+       mcore | \
++      microblaze | \
+       mips* | \
+       mmix | \
+       mn10200 | \
+-- 
+2.1.0
+
diff --git a/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch b/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
new file mode 100644
index 0000000..e5f3c49
--- /dev/null
+++ b/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
@@ -0,0 +1,29 @@
+From 55a707283dbb3b2fdcaaa4e177d050e122cfc2a0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 29 Dec 2014 13:55:16 +0100
+Subject: [PATCH 4/5] Add stack direction for the Blackfin architecture
+
+The stack grows downward on Blackfin, see
+https://sourceware.org/binutils/docs/as/Blackfin-Syntax.html: "The
+stack grows by decrementing the stack pointer.".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 53f4216..1a97d5a 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -18,6 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       arc | \
+       arm* | strongarm* | xscale* | \
+       avr | avr32 | \
++      bfin | \
+       c1 | c2 | c32 | c34 | c38 | \
+       clipper | \
+       cris | \
+-- 
+2.1.0
+
diff --git a/package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch b/package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
deleted file mode 100644
index 4d96a83..0000000
--- a/package/libsigsegv/libsigsegv-0003-fix-microblaze-build.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Add microblaze support
-
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
-
-Index: libsigsegv-2.10/m4/stack-direction.m4
-===================================================================
---- libsigsegv-2.10.orig/m4/stack-direction.m4	2014-01-08 10:15:43.149509801 -0600
-+++ libsigsegv-2.10/m4/stack-direction.m4	2014-01-08 10:16:57.249511153 -0600
-@@ -32,6 +32,7 @@
-       m68* | \
-       m88k | \
-       mcore | \
-+      microblaze | \
-       mips* | \
-       mmix | \
-       mn10200 | \
diff --git a/package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch b/package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch
deleted file mode 100644
index 42900ea..0000000
--- a/package/libsigsegv/libsigsegv-0004-fix-bfin-build.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Add stack direction for Blackfin
-
-The stack grows downward on Blackfin, see
-https://sourceware.org/binutils/docs/as/Blackfin-Syntax.html: "The
-stack grows by decrementing the stack pointer.".
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Index: b/m4/stack-direction.m4
-===================================================================
---- a/m4/stack-direction.m4
-+++ b/m4/stack-direction.m4
-@@ -18,6 +18,7 @@
-       arc | \
-       arm* | strongarm* | xscale* | \
-       avr | avr32 | \
-+      bfin | \
-       c1 | c2 | c32 | c34 | c38 | \
-       clipper | \
-       cris | \
-- 
2.1.0
