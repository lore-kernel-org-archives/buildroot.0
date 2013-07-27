From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Jul 2013 11:32:04 -0300
Subject: [Buildroot] [PATCH] eglibc: defaults to SSP
Message-ID: <1374935524-5259-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And it doesn't seem to do anything when disabling it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in.2 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in.2 b/toolchain/toolchain-buildroot/Config.in.2
index bf27e6b..f42d776 100644
--- a/toolchain/toolchain-buildroot/Config.in.2
+++ b/toolchain/toolchain-buildroot/Config.in.2
@@ -19,6 +19,7 @@ comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
 
 config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 	bool "Enable stack protection support"
+	depends on !BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	help
 	  Enable stack smashing protection support using GCCs
 	  -fstack-protector-all option.
-- 
1.8.1.5
