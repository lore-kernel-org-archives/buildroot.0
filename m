From: guoren at kernel.org <guoren@kernel.org>
Date: Wed,  8 May 2019 16:58:29 +0800
Subject: [Buildroot] [PATCH V2 3/9] arch/csky: Add toolchain build framework.
In-Reply-To: <1557305915-11247-1-git-send-email-guoren@kernel.org>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
Message-ID: <1557305915-11247-3-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

Enable csky buildroot build toolchain in framework.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in      | 1 -
 package/Makefile.in | 9 +++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index d82803c..db1199c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,7 +77,6 @@ config BR2_aarch64_be
 
 config BR2_csky
 	bool "csky"
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	help
 	  csky is processor IP from china.
diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2..f05b9cc 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -70,6 +70,15 @@ ABI := $(ABI)hf
 endif
 endif
 
+# For C-SKY abiv1 & abiv2
+ifeq ($(BR2_csky),y)
+ifeq ($(BR2_ck610),y)
+ABI = abiv1
+else
+ABI = abiv2
+endif
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
 ABI = spe
-- 
2.7.4
