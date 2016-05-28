From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 May 2016 21:01:56 +0200
Subject: [Buildroot] [PATCH 1/1] gcc/libmudflap: also unavailable for gcc 6.x
Message-ID: <1464462116-28780-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libmudflap was removed in gcc 4.9:
https://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 8cf2d56..ee4d0eb 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -153,6 +153,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	depends on !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
 	depends on !BR2_GCC_VERSION_4_9_X
 	depends on !BR2_GCC_VERSION_5_X
+	depends on !BR2_GCC_VERSION_6_X
 	help
 	  libmudflap is a gcc library used for the mudflap pointer
 	  debugging functionality. It is only needed if you intend to
-- 
2.8.1
