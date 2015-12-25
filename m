From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:41 +0100
Subject: [Buildroot] [PATCH 72/84 RFC] package/lighttpd: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <173180480a3d7e53d9921d3d77014048d3183a2d.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lighttpd has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
1.9.1
