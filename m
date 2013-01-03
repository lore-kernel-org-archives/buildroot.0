From: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
Date: Thu, 3 Jan 2013 13:21:44 +0530
Subject: [Buildroot] [PATCH 3/3] Add perf tools support: this is the kernel
 patch to be applied to the kernel for kernel compile to go through;
 it basically adds a typedef.
Message-ID: <CAPDLWs99Xx5ncxuCuFErsGzOnbs1br3VDcCFZooozWrHU+B=SQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add perf tools support: this is the kernel patch to be applied to the
kernel for kernel  compile to go through; it basically adds a typedef.

Signed-off-by: Kaiwan Billimoria <kaiwan.billimoria@gmail.com>
---
 linux/perf.patch |   26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 linux/perf.patch

diff --git a/linux/perf.patch b/linux/perf.patch
new file mode 100644
index 0000000..0fba468
--- /dev/null
+++ b/linux/perf.patch
@@ -0,0 +1,26 @@
+--- linux-3.2.21.orig//tools/perf/util/gelf.h 2013-01-01
16:01:11.736902336 +0530
++++ linux-3.2.21/tools/perf/util/gelf.h	2013-01-01 16:03:58.076895032 +0530
+@@ -0,0 +1,10 @@
++#ifndef __GELF_NHDR__
++#include <libelf.h>
++#include <gelf.h>
++
++#if __LIBELF64
++typedef Elf64_Nhdr GElf_Nhdr;
++#else
++typedef Elf32_Nhdr GElf_Nhdr;
++#endif
++#endif
+Index: linux-3.2.21/tools/perf/util/symbol.h
+======================================================
+--- linux-3.2.21.orig//tools/perf/util/symbol.h	2013-01-01
16:01:11.836902336 +0530
++++ linux-3.2.21/tools/perf/util/symbol.h 2013-01-01 16:03:58.176895032 +0530
+@@ -7,6 +7,7 @@
+ #include "map.h"
+ #include <linux/list.h>
+ #include <linux/rbtree.h>
++#include "gelf.h"
+ #include <stdio.h>
+
+ #ifdef HAVE_CPLUS_DEMANGLE
+
-- 
1.7.10.4
