From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:03 +0200
Subject: [Buildroot] [PATCH 52/83 v2] package/lighttpd: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <c47878050b9fdc7ca5940d3d1392bdcaef3a7d4c.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lighttpd has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lighttpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index f62ccb9..6672ec1 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -2,7 +2,7 @@ comment "lighttpd needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
 
-config BR2_PACKAGE_LIGHTTPD
+menuconfig BR2_PACKAGE_LIGHTTPD
 	bool "lighttpd"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
-- 
2.7.4
