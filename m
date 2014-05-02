From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  2 May 2014 19:10:27 +0200
Subject: [Buildroot] [PATCH 01/12] boot/syslinux: needs an ia32-capable
	compiler
In-Reply-To: <cover.1399050467.git.yann.morin.1998@free.fr>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
Message-ID: <30fe3eb3a07f61c27d1f6ddcd4f97ec30f84305e.1399050467.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The pxelinux and isolionux images are 32-bit binaries, so we need a
compiler that can generate them (ie. a compiler that understands -m32).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Tested-by: Frank Hunleth <fhunleth@troodon-software.com>
Tested-by: Romain Naour <romain.naour@openwide.fr>

---
Changes v1 -> v2:
  - explain why we need it  (Arnout)
---
 boot/syslinux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/syslinux/Config.in b/boot/syslinux/Config.in
index 2c39e65..5b1122d 100644
--- a/boot/syslinux/Config.in
+++ b/boot/syslinux/Config.in
@@ -1,6 +1,7 @@
 config BR2_TARGET_SYSLINUX
 	bool "syslinux"
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER
 	help
 	  The syslinux bootloader for x86 systems.
 	  This includes: syslinux, pxelinux, extlinux.
-- 
1.8.3.2
