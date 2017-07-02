From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Jul 2017 16:35:52 +0200
Subject: [Buildroot] [PATCH 3/3 v3] package/ifupdown-scripts: allow use with
	a custom skeleton
In-Reply-To: <cover.1499006091.git.yann.morin.1998@free.fr>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
Message-ID: <7af4e1b5c5c358fd2a41e609ea250138a5565c18.1499006091.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/ifupdown-scripts/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 7086253a03..7064d58fec 100644
--- a/package/ifupdown-scripts/Config.in
+++ b/package/ifupdown-scripts/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_IFUPDOWN_SCRIPTS
-	bool
-	depends on BR2_ROOTFS_SKELETON_DEFAULT
+	bool "ifupdown scripts"
 	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
-	default y
+	default y if BR2_ROOTFS_SKELETON_DEFAULT
 	help
 	  Set of scripts used by ifupdown (either the standalone one, or the
 	  busybox one) to bring network up, or tear it down.
-- 
2.11.0
