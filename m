From: Martin Bark <martin@barkynet.com>
Date: Wed, 23 Dec 2015 12:16:05 +0000
Subject: [Buildroot] [PATCH v3 4/7] package/nodejs: fixed comment for mips
	soft float
In-Reply-To: <1450872968-5834-1-git-send-email-martin@barkynet.com>
References: <1450872968-5834-1-git-send-email-martin@barkynet.com>
Message-ID: <1450872968-5834-4-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nodejs is only selected for mips hard float however the comment is
displayed for hard and soft float.  Correct this by adding the missing
!BR2_MIPS_SOFT_FLOAT to the comment.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Changes v2 -> v3
 - New in v3.
 - Note: See commit 8e7dacf766f13011d208b927260b78c56070a7fe when the
   !BR2_MIPS_SOFT_FLOAT requirement was added
---
 package/nodejs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index ce35452..eb3aeec 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_NODEJS
 comment "nodejs needs a toolchain w/ C++, dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on !BR2_MIPS_SOFT_FLOAT
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
2.5.0
