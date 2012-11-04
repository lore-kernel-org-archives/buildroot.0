From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  4 Nov 2012 18:34:29 +0100
Subject: [Buildroot] [PATCH 21/21] toolchain-external: assume that by
	default, glibc toolchains have RPC support
In-Reply-To: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352050008.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8c77c933bce9ac229c015bb8bb489c3a41458ea3.1352050008.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 5811494..f04ced6 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -751,6 +751,7 @@ endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Select this option if your external toolchain supports
 	  RPC. If you don't know, leave the default value, Buildroot
-- 
1.7.9.5
