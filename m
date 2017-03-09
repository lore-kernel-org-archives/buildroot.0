From: Daniel Black <daniel.black@au1.ibm.com>
Date: Thu, 9 Mar 2017 11:56:47 +1100
Subject: [Buildroot] [PATCH 1/1] package/libaio: Power64 support AIO
Message-ID: <a59aa9d1-5e8c-c6e1-e5ed-cc1ad1c4a6e8@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Power64{,le} architecture supports AIO.

Signed-off-by: Daniel Black <daniel.black@au.ibm.com>
Acked-by: Cyril Bur <cyrilbur@gmail.com>
---
 package/libaio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index 3031c89..d656697 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
 		BR2_m68k || BR2_mips || BR2_mipsel || BR2_powerpc || \
+		BR2_powerpc64 || BR2_powerpc64le || \
 		BR2_sparc || BR2_x86_64
  config BR2_PACKAGE_LIBAIO
-- 
2.7.4
