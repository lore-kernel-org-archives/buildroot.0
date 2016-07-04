From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:51 +0200
Subject: [Buildroot] [PATCH 40/83 v2] package/gnuradio: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <e2322e5cb5daeb60a0402431eb9ad878db5339df.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gnuradio has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gnuradio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 50f5e7f..9efe9d3 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -3,7 +3,7 @@ comment "gnuradio needs a toolchain w/ C++, NPTL, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
-config BR2_PACKAGE_GNURADIO
+menuconfig BR2_PACKAGE_GNURADIO
 	bool "gnuradio"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
-- 
2.7.4
