From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Feb 2016 12:25:21 -0300
Subject: [Buildroot] [PATCH] fio: depends on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1454858721-3670-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/692/692fe7999efb63a2bffee02f84b9f636afcfe5f4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fio/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index b1f9045..89f54f9 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_FIO
 	bool "fio"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# fio uses posix_madvise(), which is not part of any official
 	# release of uClibc, but is part of uClibc Git, and backported
@@ -20,5 +21,6 @@ config BR2_PACKAGE_FIO
 
 comment "fio needs a toolchain w/ dynamic library, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
-- 
2.4.10
