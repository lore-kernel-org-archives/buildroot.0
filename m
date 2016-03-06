From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Mar 2016 10:17:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: disable on mips
Message-ID: <1457255845-20770-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to the addition of the BR2_TOOLCHAIN_HAS_SYNC_8 dependency, then
there is no longer a need to have (BR2_mipsel &&
BR2_TOOLCHAIN_USES_GLIBC), since MIPS doesn't provide the 8 byte
__sync_*() intrinsics, and therefore BR2_TOOLCHAIN_HAS_SYNC_8 is false
on MIPS.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bd40ac3..950d5f9 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
-	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
+	default y if (BR2_arm || BR2_i386 || BR2_x86_64) \
 		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
 		&& BR2_TOOLCHAIN_HAS_SYNC_8
 
-- 
2.7.0
