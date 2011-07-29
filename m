From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jul 2011 13:38:49 +0200
Subject: [Buildroot] [git commit] util-linux: mount/fsck needs libblkid
Message-ID: <20110729114226.DD5B88B55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1050bf67c7f4fd10c31ab7fa687b5609094681a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/util-linux/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 45b0a82..f4be2b7 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -18,8 +18,10 @@ if BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "build mount utilties"
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 
 config BR2_PACKAGE_UTIL_LINUX_FSCK
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	bool "build \"fsck\""
 
 config BR2_PACKAGE_UTIL_LINUX_LIBUUID
-- 
1.7.3.4
