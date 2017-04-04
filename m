From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 21:59:13 +0200
Subject: [Buildroot] [git commit] Revert "odroid-mali: mark package as
	BROKEN"
Message-ID: <20170404195954.A804A7F9C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b08b84df54adec1c94e81335f608564c33282f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit e2ac546c1951ba8a3e88965d3023eb38a9493f28.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odroid-mali/Config.in | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
index 5a6af75..e5c07f2 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-mali/Config.in
@@ -5,16 +5,6 @@ config BR2_PACKAGE_ODROID_MALI
 	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_aarch64 || BR2_ARM_EABIHF
-	# The version of the khrplatform.h header bundled with
-	# odroid-mali has a definition of the khronos_intptr_t and
-	# khronos_ssize_t that doesn't match the official Khronos
-	# registry headers or the Mesa3D headers. Due to this, it
-	# causes conflicts with some packages that redefines those
-	# types (with the correct definitions), such as libepoxy.
-	#
-	# Issue reported upstream at:
-	# https://github.com/mdrjr/c2_mali/issues/1
-	depends on BROKEN
 	help
 	  Install the ARM Mali drivers for odroidc2 based systems.
 
