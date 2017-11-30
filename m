From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 30 Nov 2017 06:58:54 +0100
Subject: [Buildroot] [PATCH next 1/3] uclibc: enable NPTL for or1k
Message-ID: <20171130055853.GA24600@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With 1.0.27 NPTL for or1k is improved and can be used
by default.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3b4f91da91..47f25b5c1b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -48,7 +48,7 @@ choice
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
 	depends on BR2_USE_MMU
-	depends on !BR2_m68k && !BR2_microblaze && !BR2_or1k
+	depends on !BR2_m68k && !BR2_microblaze
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-- 
2.11.0
