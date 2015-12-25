From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:47 +0100
Subject: [Buildroot] [PATCH 18/84 RFC] package/ncftp: use 'menuconfig'
	instad of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <b86fde686f1e225f3fe4ec4fac5e8980a346bede.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ncftp/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/ncftp/Config.in b/package/ncftp/Config.in
index 57586e7..736bea5 100644
--- a/package/ncftp/Config.in
+++ b/package/ncftp/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_NCFTP
+menuconfig BR2_PACKAGE_NCFTP
 	bool "ncftp"
 	# fork()
 	depends on BR2_USE_MMU
@@ -10,7 +10,7 @@ config BR2_PACKAGE_NCFTP
 
 if BR2_PACKAGE_NCFTP
 
-menu "ncFTP tools selection"
+comment "tools selection"
 
 config BR2_PACKAGE_NCFTP_GET
 	bool "NcFTPGet - command-line utility program"
@@ -32,6 +32,4 @@ config BR2_PACKAGE_NCFTP_BOOKMARKS
 	bool "NcFTPBookmarks - ncurses based Bookmark Editor"
 	select BR2_PACKAGE_NCURSES
 
-endmenu
-
 endif
-- 
1.9.1
