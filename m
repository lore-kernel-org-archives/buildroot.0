From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:21 +0200
Subject: [Buildroot] [PATCH 10/83 v2] package/ncftp: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <d263bff3c1e8642610ed59ca47588e7386f89434.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes RFC -> v1:
  - drop the comment  (Arnout)
---
 package/ncftp/Config.in | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 57586e7..2569dc5 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_NCFTP
+menuconfig BR2_PACKAGE_NCFTP
 	bool "ncftp"
 	# fork()
 	depends on BR2_USE_MMU
@@ -10,8 +10,6 @@ config BR2_PACKAGE_NCFTP
 
 if BR2_PACKAGE_NCFTP
 
-menu "ncFTP tools selection"
-
 config BR2_PACKAGE_NCFTP_GET
 	bool "NcFTPGet - command-line utility program"
 	default y
@@ -32,6 +30,4 @@ config BR2_PACKAGE_NCFTP_BOOKMARKS
 	bool "NcFTPBookmarks - ncurses based Bookmark Editor"
 	select BR2_PACKAGE_NCURSES
 
-endmenu
-
 endif
-- 
2.7.4
