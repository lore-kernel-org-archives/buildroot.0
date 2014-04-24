From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Apr 2014 00:29:56 +0200
Subject: [Buildroot] [PATCH 1/9] boot/syslinux: needs an ia32-capable
	compiler
In-Reply-To: <cover.1398378217.git.yann.morin.1998@free.fr>
References: <cover.1398378217.git.yann.morin.1998@free.fr>
Message-ID: <74ac3236bb1595c30d9fd230352e96ef29e0b3ad.1398378217.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Frank Hunleth <fhunleth@troodon-software.com>
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
