From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 Nov 2012 00:54:49 +0100
Subject: [Buildroot] [PATCH 50/51] package/qemu: move sub-options into a
	sub-menu
In-Reply-To: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1354146890-27380-51-git-send-email-yann.morin.1998@free.fr>
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
index 68d3464..4cc0ca3 100644
--- a/package/qemu/Config.in
+++ b/package/qemu/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_QEMU_AVAILABLE
 comment "QEMU requires a toolchain with threads"
 	depends on !BR2_PACKAGE_QEMU_AVAILABLE
 
-config BR2_PACKAGE_QEMU
+menuconfig BR2_PACKAGE_QEMU
 	bool "QEMU"
 	depends on BR2_PACKAGE_QEMU_AVAILABLE
 	select BR2_PACKAGE_ZLIB
-- 
1.7.2.5
