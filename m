From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:54:53 +0200
Subject: [Buildroot] [git commit] util-linux: select libsmartcols when partx
	is selected
Message-ID: <20161020195500.18FA981946@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1854018b01df9cbb24911f617753b8ebe217b965
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/be2/be2e81b27a21355d7a453316d9df1cd4b0da2106/

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
