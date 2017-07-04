From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 23:38:18 +0200
Subject: [Buildroot] [git commit] package/ifupdown-scripts: allow use with a
	custom skeleton
Message-ID: <20170704213508.A3BB681E68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac41572e666b583052766799b543188e530bb130
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifupdown-scripts/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 7086253..7064d58 100644
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
