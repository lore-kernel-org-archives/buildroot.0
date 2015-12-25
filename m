From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:44 +0100
Subject: [Buildroot] [PATCH 15/84 RFC] package/libdrm: move tests programs
	to the bottom
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <a5a4ee71856c2e3b818148d68884a6631cc081bc.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tests programs are not that important; at least, they're probably less
important than the drivers selection.

Move it down to after the drivers selection.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
