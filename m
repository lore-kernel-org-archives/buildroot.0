From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Oct 2016 09:54:48 +0300
Subject: [Buildroot] [PATCH] kexec: fix build for arm
Message-ID: <73d400d1c401d240e0f37e41a68ea095f10975bb.1477032888.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch equivalent to upstream commit 1574ff1aae4 (arm: include
phys_to_virt.h and iomem.h in distribution).

Fixes:
http://autobuild.buildroot.net/results/bf9/bf939477cce6a5c333ee579006b9aa4856acd604/
http://autobuild.buildroot.net/results/8a7/8a7407afcf47326aadbce0b9157442dae9558ded/
http://autobuild.buildroot.net/results/ec2/ec26f1dd97f1e861e401d2709a243ae55bd6f022/

Cc: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0002-arm-add-phys_to_virt.h-and-iomem.patch    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch

diff --git a/package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch b/package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch
new file mode 100644
index 000000000000..748acbde18ec
--- /dev/null
+++ b/package/kexec/0002-arm-add-phys_to_virt.h-and-iomem.patch
@@ -0,0 +1,35 @@
+arm: add iomem.h and phys_to_virt.h
+
+Fixes build for arm.
+
+This patch is equivalent to upstream commit 1574ff1aae4f3 (arm: include
+phys_to_virt.h and iomem.h in distribution) when applied to the tarball.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+---
+diff -Nuar kexec-tools-2.0.13-orig/kexec/arch/arm/iomem.h kexec-tools-2.0.13/kexec/arch/arm/iomem.h
+--- kexec-tools-2.0.13-orig/kexec/arch/arm/iomem.h	1970-01-01 02:00:00.000000000 +0200
++++ kexec-tools-2.0.13/kexec/arch/arm/iomem.h	2016-10-21 09:45:27.495689269 +0300
+@@ -0,0 +1,9 @@
++#ifndef IOMEM_H
++#define IOMEM_H
++
++#define SYSTEM_RAM		"System RAM\n"
++#define SYSTEM_RAM_BOOT		"System RAM (boot alias)\n"
++#define CRASH_KERNEL		"Crash kernel\n"
++#define CRASH_KERNEL_BOOT	"Crash kernel (boot alias)\n"
++
++#endif
+diff -Nuar kexec-tools-2.0.13-orig/kexec/arch/arm/phys_to_virt.h kexec-tools-2.0.13/kexec/arch/arm/phys_to_virt.h
+--- kexec-tools-2.0.13-orig/kexec/arch/arm/phys_to_virt.h	1970-01-01 02:00:00.000000000 +0200
++++ kexec-tools-2.0.13/kexec/arch/arm/phys_to_virt.h	2016-10-21 09:45:27.495689269 +0300
+@@ -0,0 +1,8 @@
++#ifndef PHYS_TO_VIRT_H
++#define PHYS_TO_VIRT_H
++
++#include <stdint.h>
++
++extern uint64_t phys_offset;
++
++#endif
-- 
2.9.3
