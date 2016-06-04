From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 18:45:56 +0200
Subject: [Buildroot] [PATCH 1/1] gcc/libmudflap: unavailable for gcc >= 4.9
Message-ID: <1465058756-9612-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rework gcc dependency for mudflap as suggested by Arnout and Peter:
http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/149813

libmudflap was removed in gcc 4.9:
https://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gcc/Config.in.host | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cfb0958..529f8da 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -151,9 +151,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	# There are architectures, or specific configurations for
 	# which mudflap is not supported.
 	depends on !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
-	depends on !BR2_GCC_VERSION_4_9_X
-	depends on !BR2_GCC_VERSION_5_X
-	depends on !BR2_GCC_VERSION_6_X
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  libmudflap is a gcc library used for the mudflap pointer
 	  debugging functionality. It is only needed if you intend to
-- 
2.8.1
