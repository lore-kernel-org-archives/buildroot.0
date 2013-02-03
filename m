From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Feb 2013 15:07:04 +0100
Subject: [Buildroot] [PATCH 27/29] package/qemu: move sub-options into a
	sub-menu
In-Reply-To: <cover.1359899108.git.yann.morin.1998@free.fr>
References: <cover.1359899108.git.yann.morin.1998@free.fr>
Message-ID: <dc570038dd4a09bc3f32339bbda097a39e318c71.1359899108.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As there are now quite a few options to QEMU, move them into their own
sub-menu, so it looks a bit less crowded in the 'misc' menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qemu/Config.in b/package/qemu/Config.in
index e0d5825..65fec49 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -2,7 +2,7 @@ comment "QEMU requires a toolchain with threads"
 	depends on !BR2_i386 && !BR2_x86_64
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_QEMU
+menuconfig BR2_PACKAGE_QEMU
 	bool "QEMU"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
1.7.2.5
