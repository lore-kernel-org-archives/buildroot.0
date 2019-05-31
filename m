From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:59:57 +0200
Subject: [Buildroot] [git commit branch/next] arch/csky: add support for the
 ck860 core
Message-ID: <20190531210133.B4A208D48D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20d6e092d8be6b08c2a010c4c7354d8932079aa9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ck860 is newest CPU core of C-SKY with high performance & SMP
supported.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 5 ++++-
 arch/arch.mk.csky   | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index ebde7fe476..4bdfbfae4b 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -13,11 +13,14 @@ config BR2_ck807
 config BR2_ck810
 	bool "ck810"
 
+config BR2_ck860
+	bool "ck860"
+
 endchoice
 
 config BR2_CSKY_FPU
 	bool "Enable FPU coprocessor"
-	depends on BR2_ck810 || BR2_ck807
+	depends on BR2_ck810 || BR2_ck807 || BR2_ck860
 	help
 	  You can say N here if your C-SKY CPU doesn't have a
 	  Floating-Point Coprocessor or if you don't need FPU support
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
index f2c90eb206..fb59ae22fd 100644
--- a/arch/arch.mk.csky
+++ b/arch/arch.mk.csky
@@ -11,6 +11,8 @@ else ifeq ($(BR2_ck807),y)
 GCC_TARGET_CPU := ck807
 else ifeq ($(BR2_ck810),y)
 GCC_TARGET_CPU := ck810
+else ifeq ($(BR2_ck860),y)
+GCC_TARGET_CPU := ck860
 endif
 
 ifeq ($(BR2_CSKY_FPU),y)
