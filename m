From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 17:41:42 +0200
Subject: [Buildroot] [git commit] gcc/libmudflap: also unavailable for gcc
	6.x
Message-ID: <20160531154338.042EF81EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=019b22f8fa9742c80144b7d7970d319ae798c5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmudflap was removed in gcc 4.9:
https://gcc.gnu.org/wiki/Mudflap_Pointer_Debugging

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
