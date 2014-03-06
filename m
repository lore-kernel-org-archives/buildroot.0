From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 22:50:42 +0100
Subject: [Buildroot] [git commit] webkit: fix mmu reverse dependency moving
	it to %_ARCH_SUPPORTS
Message-ID: <20140306215147.106AD9BDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b08cddec48d27105b8413ed2c89393658d01f642
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because mmu dependency was not propagated move it to
BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS to automatically propagate it.
It can ben moved to BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS because like
target architecture dependencies it doesn't modify the comment string.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 2b0addc..5ba2eb3 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 		!(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_sh || BR2_sparc || BR2_x86_64
+	depends on BR2_USE_MMU # libgail -> pango -> libglib2
 
 # disabled on powerpc due to bug https://bugs.webkit.org/show_bug.cgi?id=113638
 
@@ -13,7 +14,6 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # enchant -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
-	depends on BR2_USE_MMU # libgail -> pango -> libglib2
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
