From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 12:35:17 +0200
Subject: [Buildroot] [git commit] blktrace: needs MMU support
Message-ID: <20160917103536.01F5D81E7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1d86b826bcba132a919bd5a3531d8ae05f4954a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iowatcher/main.c uses system() which uses fork().

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blktrace/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/blktrace/Config.in b/package/blktrace/Config.in
index 684157c..dedfa03 100644
--- a/package/blktrace/Config.in
+++ b/package/blktrace/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_BLKTRACE
 	bool "blktrace"
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
+	depends on BR2_USE_MMU # system()
 	select BR2_PACKAGE_LIBAIO
 	help
 	  blktrace is a block layer IO tracing mechanism which provides
@@ -11,5 +12,6 @@ config BR2_PACKAGE_BLKTRACE
 	  http://git.kernel.dk/?p=blktrace.git;a=summary
 
 comment "blktrace needs a toolchain w/ NPTL"
+	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
