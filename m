From: Mircea GLIGA <mgliga@bitdefender.com>
Date: Fri, 21 May 2021 16:41:22 +0300
Subject: [Buildroot] [PATCH v2] package/uclibc: enable linuxthreads for all
 supported architectures
In-Reply-To: <20210521095924.52527-1-mgliga@bitdefender.com>
References: <20210521095924.52527-1-mgliga@bitdefender.com>
Message-ID: <20210521134122.122426-1-mgliga@bitdefender.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Synchronize the list of architectures that have LinuxThreads support
with the ones from uClibc-ng.

Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
---
Changes v1 -> v2:
  - enable linuxthreads for all supported architectures,
    not just MIPS (suggested by Yann E. MORIN)
---
 package/uclibc/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index e59fef3c69..2091166b62 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -53,7 +53,8 @@ config BR2_PTHREADS_NATIVE
 
 config BR2_PTHREADS
 	bool "linuxthreads"
-	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
+	depends on !BR2_aarch64 && !BR2_aarch64_be
+	depends on !BR2_RISCV_64
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
-- 
2.31.1
