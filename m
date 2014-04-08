From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Apr 2014 23:50:16 +0200
Subject: [Buildroot] [PATCH 2/2] package/webkit: threads are also needed for
	icu
In-Reply-To: <cover.1396993575.git.yann.morin.1998@free.fr>
References: <cover.1396993575.git.yann.morin.1998@free.fr>
Message-ID: <e160bc7dcf441eeda54db0df12a31e7e95337d5b.1396993575.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Add icu to the comment-list of packages requiring threads.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/webkit/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 5ba2eb3..4112287 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_WEBKIT
 	bool "webkit"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # enchant -> libglib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # enchant -> libglib2; icu
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
-- 
1.8.3.2
