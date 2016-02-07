From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:23:52 +0100
Subject: [Buildroot] [git commit] fio: depends on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20160207212359.8FB6C7FB37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5ad2ce5a35a7909307de806b9606c560b5cb85d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/692/692fe7999efb63a2bffee02f84b9f636afcfe5f4/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
