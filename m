From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 May 2014 19:16:14 -0300
Subject: [Buildroot] [PATCH 2/3] glibc: doesn't build for PowerPC SPE
In-Reply-To: <1400796975-17647-1-git-send-email-gustavo@zacarias.com.ar>
References: <1400796975-17647-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1400796975-17647-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 216f9db..0d34f1d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -66,6 +66,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_x86_64 || BR2_microblaze
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our glibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
1.8.5.5
