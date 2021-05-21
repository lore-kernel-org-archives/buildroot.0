From: Mircea GLIGA <mgliga@bitdefender.com>
Date: Fri, 21 May 2021 12:59:24 +0300
Subject: [Buildroot] [PATCH 1/1] package/uclibc: enable linuxthreads for MIPS
Message-ID: <20210521095924.52527-1-mgliga@bitdefender.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Required for systems that do not have FUTEX support in kernel.
Native POSIX Thread Library (NPTL) relies on futexes, so we need
to use LinuxThreads instead on that systems.

Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index e59fef3c69..ae27bc18fb 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -53,7 +53,7 @@ config BR2_PTHREADS_NATIVE
 
 config BR2_PTHREADS
 	bool "linuxthreads"
-	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
+	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa || BR2_mips || BR2_mipsel
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
-- 
2.31.1
