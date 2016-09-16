From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Sat, 17 Sep 2016 00:28:47 +0530
Subject: [Buildroot] [PATCH 2/2] blktrace: needs MMU support
In-Reply-To: <1474052327-16663-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1474052327-16663-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1474052327-16663-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

iowatcher/main.c uses system() which uses fork().

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
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
-- 
2.6.2
