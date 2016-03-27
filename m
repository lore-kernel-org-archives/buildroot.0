From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Mar 2016 00:31:47 +0200
Subject: [Buildroot] [PATCH] package/ti-gfx: needs ia32 libraries
Message-ID: <1459117907-9225-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The installer is a 32-bit executable, so we need the 32-bit libraries on
the host to be able to execute it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ti-gfx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index de4e9cb..1481534 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TI_GFX
 	bool "ti-gfx"
 	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
-- 
1.9.1
