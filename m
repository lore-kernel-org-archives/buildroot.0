From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:24:20 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/util-linux: minix
 needs MMU
Message-ID: <20200307202445.CEF368FBC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5c727c83291130c7b62ad7ef420b8d7d05bd821
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.org/results/87801e1a3c628e00ccb0c57afc2b46cc735c6018

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 97fc2cb9c7732f99ab42438e782318f0607a8721)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
