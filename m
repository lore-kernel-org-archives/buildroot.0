From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 22:16:41 +0100
Subject: [Buildroot] [git commit] linux: update the comment about thumb
 issue with Binutils 2.29 and 2.30
Message-ID: <20190314211546.050478EEE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4ba1be944674272872089cbad2d8d755db1b914
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f17334ae7c..856b53eec0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,9 +8,10 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
-comment "Linux kernel in thumb mode may be broken with binutils >= 2.29"
+# https://sourceware.org/bugzilla/show_bug.cgi?id=21458
+comment "Linux kernel in thumb mode may be broken with binutils 2.29 and 2.30"
 	depends on BR2_arm || BR2_armeb
-	depends on !BR2_BINUTILS_VERSION_2_28_X
+	depends on BR2_BINUTILS_VERSION_2_29_X || BR2_BINUTILS_VERSION_2_30_X
 
 # Packages that need to have a kernel with support for loadable modules,
 # but do not use the kernel-modules infrastructure, should select that
