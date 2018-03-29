From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:41 +0200
Subject: [Buildroot] [PATCH v4 06/11] package/llvm: enable AArch64
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-7-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds LLVM support for AArch64

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---

Tested llvmpipe running glmark2-es2 on Raspberry Pi 3(64-bit)

 package/llvm/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index e695017da3..dc631dad83 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -1,11 +1,13 @@
 config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	bool
+	default y if BR2_aarch64
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_LLVM_TARGET_ARCH
 	string
+	default "AArch64" if BR2_aarch64
 	default "ARM" if BR2_arm || BR2_armeb
 	default "X86" if BR2_i386 || BR2_x86_64
 
-- 
2.14.3
