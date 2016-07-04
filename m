From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 22:42:16 +0200
Subject: [Buildroot] [git commit] package/libdrm: move tests programs to the
	bottom
Message-ID: <20160704204225.1740281E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f8ce328673812d7ad9c57b8c21564283703d2ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tests programs are not that important; at least, they're probably less
important than the drivers selection.

Move it down to after the drivers selection.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 7c2a828..7bc73fd 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -18,11 +18,6 @@ config BR2_PACKAGE_LIBDRM_ENABLE_ATOMIC
 	bool
 	select BR2_PACKAGE_LIBATOMIC_OPS if !BR2_TOOLCHAIN_HAS_SYNC_4
 
-config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
-	bool "Install test programs"
-	help
-	  This option allows to install the libdrm test programs.
-
 menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
@@ -99,6 +94,11 @@ config BR2_PACKAGE_LIBDRM_VC4
 
 endmenu
 
+config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
+	bool "Install test programs"
+	help
+	  This option allows to install the libdrm test programs.
+
 endif
 
 comment "libdrm needs a toolchain w/ threads"
