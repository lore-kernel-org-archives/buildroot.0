From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 17 Oct 2016 09:33:41 -0200
Subject: [Buildroot] [PATCH 1/1] util-linux: select libsmartcols when partx
	is selected
Message-ID: <1476704021-1030-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/be2/be2e81b27a21355d7a453316d9df1cd4b0da2106/

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 38d68ca..0c33919 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -259,6 +259,7 @@ config BR2_PACKAGE_UTIL_LINUX_PARTX
 	bool "partition utilities"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Partition utilities (addpart, delpart, partx)
-- 
2.7.4
