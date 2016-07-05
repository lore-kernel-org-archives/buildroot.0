From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 5 Jul 2016 12:12:55 +0200
Subject: [Buildroot] [PATCH] uclibc: enable Linuxthreads for Blackfin
Message-ID: <20160705101255.GA1150@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable Linuxthreads, a small binutils patch from upstream is
required.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index c0cb602..7c99195 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -59,7 +59,7 @@ choice
 	config BR2_PTHREADS
 		bool "linuxthreads"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
+		depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_arm || BR2_armeb || BR2_xtensa
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
-- 
2.1.4
