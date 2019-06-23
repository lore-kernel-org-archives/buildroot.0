From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Jun 2019 17:08:47 +0200
Subject: [Buildroot] [git commit] package/util-linux: minix needs MMU
Message-ID: <20190623151817.534AB814B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97fc2cb9c7732f99ab42438e782318f0607a8721
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/87801e1a3c628e00ccb0c57afc2b46cc735c6018

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index acde9e5474..39eb2c03a0 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -217,6 +217,7 @@ config BR2_PACKAGE_UTIL_LINUX_MESG
 
 config BR2_PACKAGE_UTIL_LINUX_MINIX
 	bool "minix"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Minix filesystem support
 
