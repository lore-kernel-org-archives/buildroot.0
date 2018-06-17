From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:53:26 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] linux: reword binutils
 2.29+ comment
Message-ID: <20180617150241.5F8AA81213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbdad97e18e6c65ec9e19a329dc4cddc1f4a51e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This issue only applies to kernels built with CONFIG_THUMB2=y, so reword the
comment to make that more clear.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d937f908f12f80349089e60e418afbb714e86f7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 8007271cb7..6f5c0ea694 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,7 +8,7 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
-comment "Linux kernel may fail to boot with binutils >= 2.29"
+comment "Linux kernel in thumb mode may be broken with binutils >= 2.29"
 	depends on BR2_arm || BR2_armeb
 	depends on !BR2_BINUTILS_VERSION_2_28_X
 
