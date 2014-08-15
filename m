From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 22:49:46 +0200
Subject: [Buildroot] [PATCH] package/webkit: select cairo,
	since we select one of its options
Message-ID: <1408135786-1195-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When selecting an option of a package, that package must also be
selected, otherwise the package is not built.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
This is for master, not next.
---
 package/webkit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index b7f903c..8cd1a36 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
+	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_HARFBUZZ
-- 
1.9.1
