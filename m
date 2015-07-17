From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Jul 2015 11:31:14 -0300
Subject: [Buildroot] [PATCH 2/2] gcc/libmudflap: also unavailable for gcc 5.x
In-Reply-To: <1437143474-9187-1-git-send-email-gustavo@zacarias.com.ar>
References: <1437143474-9187-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1437143474-9187-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6a4086e..9dd60a0 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -144,6 +144,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	# which mudflap is not supported.
 	depends on !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
 	depends on !BR2_GCC_VERSION_4_9_X
+	depends on !BR2_GCC_VERSION_5_X
 	help
 	  libmudflap is a gcc library used for the mudflap pointer
 	  debugging functionality. It is only needed if you intend to
-- 
2.3.6
