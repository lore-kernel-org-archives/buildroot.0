From: Chris Packham <judge.packham@gmail.com>
Date: Sat, 19 Jan 2019 20:19:47 +1300
Subject: [Buildroot] [PATCH 2/2] Revert "package/syslog-ng: depend on
 !BR2_STATIC_LIBS"
In-Reply-To: <20190119071947.5472-1-judge.packham@gmail.com>
References: <20190119071947.5472-1-judge.packham@gmail.com>
Message-ID: <20190119071947.5472-2-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 44dbd2907c5995b0b0c56cb2274dc60415205dd8. Now that
upstream has different fix for the build issues with a static libc we
can re-enable syslog-ng on these systems.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index 6407645974..fbc236221a 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
@@ -16,8 +15,7 @@ config BR2_PACKAGE_SYSLOG_NG
 
 	  https://syslog-ng.org/
 
-comment "syslog-ng needs a toolchain w/ dynamic library, wchar, threads"
+comment "syslog-ng needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-- 
2.20.1
