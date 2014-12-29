From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 14:08:55 +0100
Subject: [Buildroot] [PATCH 2/2] libsigsegv: add support for Nios II
In-Reply-To: <1419858535-26614-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419858535-26614-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419858535-26614-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a patch to libsigsegv that indicates the stack
direction on Nios II, which is needed for libsigsegv to build properly
on this architecture.

Fixes:

  http://autobuild.buildroot.org/results/943/9436c3208cfeee9bd3bc211df007e745fe13c2c2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ck-direction-for-the-Nios-II-architecture.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libsigsegv/0005-Add-stack-direction-for-the-Nios-II-architecture.patch

diff --git a/package/libsigsegv/0005-Add-stack-direction-for-the-Nios-II-architecture.patch b/package/libsigsegv/0005-Add-stack-direction-for-the-Nios-II-architecture.patch
new file mode 100644
index 0000000..ee4778e
--- /dev/null
+++ b/package/libsigsegv/0005-Add-stack-direction-for-the-Nios-II-architecture.patch
@@ -0,0 +1,31 @@
+From 24bac122bf4ffe437bb4f6ca633ad08f31a23d73 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 29 Dec 2014 13:56:54 +0100
+Subject: [PATCH 5/5] Add stack direction for the Nios II architecture
+
+According to Altera Application Binary Interface document for the Nios
+II architecture
+(http://www.altera.com/literature/hb/nios2/n2cpu_nii51016.pdf):
+
+ "The stack grows downward (i.e. towards lower addresses). ".
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 1a97d5a..d9c5157 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -38,6 +38,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       mmix | \
+       mn10200 | \
+       mn10300 | \
++      nios2 | \
+       ns32k | \
+       pdp11 | \
+       pj* | \
+-- 
+2.1.0
+
-- 
2.1.0
