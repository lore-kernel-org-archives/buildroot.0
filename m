From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Mar 2019 00:08:36 +0100
Subject: [Buildroot] [PATCH 2/5] linux: update the comment about thumb issue
 with Binutils 2.29 and 2.30
In-Reply-To: <20190312230839.23307-1-romain.naour@gmail.com>
References: <20190312230839.23307-1-romain.naour@gmail.com>
Message-ID: <20190312230839.23307-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.14.5
