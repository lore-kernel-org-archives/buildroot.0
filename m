From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 21 Jan 2018 20:21:57 +0100
Subject: [Buildroot] [PATCH] uclibc-ng: enable NPTL for m68k/microblaze
Message-ID: <20180121192157.GA15314@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With 1.0.28 NPTL support for m68k was added. 
Microblaze is already supported for a while, enable it now to
benefit from it.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 90e2f30..0e24b25 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -48,7 +48,6 @@ choice
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
 	depends on BR2_USE_MMU
-	depends on !BR2_m68k && !BR2_microblaze
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-- 
2.1.4
