From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Mar 2018 22:03:51 +0200
Subject: [Buildroot] [PATCH] package/libss7: propagate dependency from
 dahdi-tools
Message-ID: <20180325200351.6022-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libss7/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libss7/Config.in b/package/libss7/Config.in
index b99c578182..bdf5fbe3a8 100644
--- a/package/libss7/Config.in
+++ b/package/libss7/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSS7
 	bool "libss7"
+	depends on BR2_USE_MMU # dahdi-tools <- perl
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_DAHDI_LINUX
-- 
2.14.1
