From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Feb 2011 23:32:49 +0100
Subject: [Buildroot] [git commit master 1/1] nfs-utils: needs largefile
	support
Message-ID: <20110220223307.03DC88F610@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=846e5eaebbb053b513b80a664bf9ef315f757ea4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though ./configure has a --disable-largefile, functions like
statfs64 is used in several places, breaking the build on toolchains
without largefile support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nfs-utils/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 22b42dc..774395b 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_INET_RPC
+	depends on BR2_LARGEFILE
 	help
 	  The NFS Linux kernel server.
 	  Warning: We do not force largefile support on here on purpose.
@@ -8,8 +9,8 @@ config BR2_PACKAGE_NFS_UTILS
 
 	  http://sourceforge.net/projects/nfs
 
-comment "nfs-utils requires a toolchain with 'Enable RPC' selected"
-	depends on !BR2_INET_RPC
+comment "nfs-utils requires a toolchain with RPC and LARGEFILE support"
+	depends on !BR2_INET_RPC || !BR2_LARGEFILE
 
 menu "NFS utilities selection"
 	depends on BR2_PACKAGE_NFS_UTILS
-- 
1.7.3.4
