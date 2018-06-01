From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jun 2018 21:43:06 +0200
Subject: [Buildroot] [git commit] linux: reword binutils 2.29+ comment
Message-ID: <20180601194225.E4E4683732@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d937f908f12f80349089e60e418afbb714e86f7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This issue only applies to kernels built with CONFIG_THUMB2=y, so reword the
comment to make that more clear.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index c29b1f6c88..58d2286685 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,7 +8,7 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
-comment "Linux kernel may fail to boot with binutils >= 2.29"
+comment "Linux kernel in thumb mode may be broken with binutils >= 2.29"
 	depends on BR2_arm || BR2_armeb
 	depends on !BR2_BINUTILS_VERSION_2_28_X
 
