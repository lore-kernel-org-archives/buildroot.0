From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:24 +0100
Subject: [Buildroot] [PATCH 32/80 v1] package/boost: use 'menuconfig'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <00b1c743121f8befcad001527b4686faf611a8ce.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/boost/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 03935e8..c000773 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	bool
 	default y if !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 
-config BR2_PACKAGE_BOOST
+menuconfig BR2_PACKAGE_BOOST
 	bool "boost"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-- 
1.9.1
