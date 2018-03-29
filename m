From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Thu, 29 Mar 2018 13:33:40 +0200
Subject: [Buildroot] [PATCH v4 05/11] package/llvm: enable ARM
In-Reply-To: <20180329113346.10367-1-valentin.korenblit@smile.fr>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
Message-ID: <20180329113346.10367-6-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds LLVM support for ARM

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---

Tested llvmpipe running glmark2-es2 on Raspberry Pi 2 and 3(32-bit)

 package/llvm/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/llvm/Config.in b/package/llvm/Config.in
index 7f36bc802b..e695017da3 100644
--- a/package/llvm/Config.in
+++ b/package/llvm/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	bool
+	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
 	depends on BR2_HOST_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_LLVM_TARGET_ARCH
 	string
+	default "ARM" if BR2_arm || BR2_armeb
 	default "X86" if BR2_i386 || BR2_x86_64
 
 config BR2_PACKAGE_LLVM
-- 
2.14.3
