From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:14 +0200
Subject: [Buildroot] [PATCH 03/83 v2] package/collectd: use 'menuconfig'
	instead of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <46b7f0adce308bf807e169fa8c8348c4f349a4b2.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Keep the existing sub-menus, because there are a lot of entries in those
sub-menus. Using comments to separate them is not a totally satifactory
solution.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.7.4
