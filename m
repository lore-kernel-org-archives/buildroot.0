From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 24 Apr 2016 16:16:27 +0200
Subject: [Buildroot] [PATCH] package/mono: Disabling for sparc32
Message-ID: <1461507387-2966-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mono cannot be compiled for sparc32 (v8/leon) so disabling it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/mono/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/Config.in b/package/mono/Config.in
index cf18a03..a42b14b 100644
--- a/package/mono/Config.in
+++ b/package/mono/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MONO_ARCH_SUPPORTS
 	bool
 	default y if (BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		      BR2_mipsel || BR2_powerpc || BR2_sparc || BR2_x86_64)
+		      BR2_mipsel || BR2_powerpc || BR2_sparc64 || BR2_x86_64)
 
 config BR2_PACKAGE_MONO
 	bool "mono"
-- 
1.9.1
