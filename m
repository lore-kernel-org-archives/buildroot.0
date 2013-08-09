From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Aug 2013 16:23:41 -0300
Subject: [Buildroot] [PATCH 3/3] eglibc: needs MMU
In-Reply-To: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1376076221-28066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1376076221-28066-3-git-send-email-gustavo@zacarias.com.ar>
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
index 396a434..7a26441 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,6 +22,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
 		   BR2_x86_64
+	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_USES_GLIBC
 	# our eglibc.mk enables RPC support
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
1.8.1.5
