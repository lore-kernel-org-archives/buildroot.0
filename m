From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:01 +0100
Subject: [Buildroot] [PATCH 09/80 v1] package/libdrm: move tests programs to
	the bottom
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <615d2a24ba1ccf2837849b6f71e296b3c36fac6e.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tests programs are not that important; at least, they're probably less
important than the drivers selection.

Move it down to after the drivers selection.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libdrm/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 445a85b..ad015f8 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -9,11 +9,6 @@ config BR2_PACKAGE_LIBDRM
 
 if BR2_PACKAGE_LIBDRM
 
-config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
-	bool "Install test programs"
-	help
-	  This option allows to install the libdrm test programs.
-
 menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
@@ -71,6 +66,11 @@ config BR2_PACKAGE_LIBDRM_TEGRA
 
 endmenu
 
+config BR2_PACKAGE_LIBDRM_INSTALL_TESTS
+	bool "Install test programs"
+	help
+	  This option allows to install the libdrm test programs.
+
 endif
 
 comment "libdrm needs a toolchain w/ threads"
-- 
1.9.1
