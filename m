From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 22:47:19 +0200
Subject: [Buildroot] [git commit] package/collectd: use 'menuconfig' instead
	of 'config'+'menu'
Message-ID: <20160704204726.A1AC38080F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86440f59148c374853d58014e90806d0e73220be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Keep the existing sub-menus, because there are a lot of entries in those
sub-menus. Using comments to separate them is not a totally satifactory
solution.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 71301ec..6405af6 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_COLLECTD
+menuconfig BR2_PACKAGE_COLLECTD
 	bool "collectd"
 	# Uses fork()
 	depends on BR2_USE_MMU
@@ -39,6 +39,7 @@ config BR2_PACKAGE_COLLECTD_VALUE
 	bool "value"
 	help
 	  Select values by their data sources' values.
+
 endmenu
 
 menu "misc plugins"
