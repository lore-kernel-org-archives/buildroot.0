From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Aug 2013 00:35:33 +0200
Subject: [Buildroot] [PATCH] package/libbsd: further reduce the set of
	supported archs
Message-ID: <1376951733-31803-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Support for a,out on ARM will be dropped in Linux 3.11 (and is already
missing in the -rc).

m68k is marked BROKEN in Buildroot, so it is never ever tested.

The x86 familly is the only one left with support for a.out, now.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbsd/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 1fa9497..bae5700 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	# libbsd requires a.out.h, which is only available for those
 	# architectures: arm, m68k, x86 (and alpha, but we don't care.)
-	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )
+	depends on ( BR2_i386 || BR2_x86_64 )
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  This library provides useful functions commonly found on BSD
@@ -14,5 +14,5 @@ config BR2_PACKAGE_LIBBSD
 	  http://libbsd.freedesktop.org/
 
 comment "libbsd requires a toolchain with thread support"
-	depends on ( BR2_arm || BR2_armeb || BR2_m68k || BR2_i386 || BR2_x86_64 )
+	depends on ( BR2_i386 || BR2_x86_64 )
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.2
