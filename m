From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Sep 2014 18:26:30 +0200
Subject: [Buildroot] [PATCH 4/4] package/vde2: does not build on static only,
	needs dlopen()
In-Reply-To: <cover.1411921550.git.yann.morin.1998@free.fr>
References: <cover.1411921550.git.yann.morin.1998@free.fr>
Message-ID: <6d21f6468575ab79a003b9f8542f23251b459123.1411921550.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.net/results/f9d/f9d23455a138e2214546922486c03c9d3c35b04a/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/vde2/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/vde2/Config.in b/package/vde2/Config.in
index 2bbd822..18ff2e4 100644
--- a/package/vde2/Config.in
+++ b/package/vde2/Config.in
@@ -1,9 +1,14 @@
 config BR2_PACKAGE_VDE2
 	bool "vde2"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_PREFER_STATIC_LIB # dlopen()
 	help
 	  VDE is an ethernet compliant virtual network that can be
 	  spawned over a set of physical computers over the Internet.
 	  VDE is part of the virtualsquare project.
 
 	  http://vde.sourceforge.net/
+
+comment "vde2 needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PREFER_STATIC_LIB
-- 
1.9.1
