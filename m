From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Jul 2017 16:35:51 +0200
Subject: [Buildroot] [PATCH 2/3 v3] package/ifupdown-scripts: not needed for
	systemd-networkd
In-Reply-To: <cover.1499006091.git.yann.morin.1998@free.fr>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
Message-ID: <0a4f1d3dfcc2e8e58a07131e4f5d2519eb209e65.1499006091.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/ifupdown-scripts/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 629ee6a5bd..7086253a03 100644
--- a/package/ifupdown-scripts/Config.in
+++ b/package/ifupdown-scripts/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IFUPDOWN_SCRIPTS
 	bool
 	depends on BR2_ROOTFS_SKELETON_DEFAULT
+	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
 	default y
 	help
 	  Set of scripts used by ifupdown (either the standalone one, or the
-- 
2.11.0
