From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jul 2019 22:54:28 +0200
Subject: [Buildroot] [git commit] toolchain: allow architectures to enforce
 compilation flags
Message-ID: <20190718205327.56F9C80DE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4281288d2d568d5ce748a0e66e0872f54fbe956c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-wrapper.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
index ca66fa7ba4..8f872506ec 100644
--- a/toolchain/toolchain-wrapper.mk
+++ b/toolchain/toolchain-wrapper.mk
@@ -17,6 +17,7 @@ TOOLCHAIN_WRAPPER_ARGS = $($(PKG)_TOOLCHAIN_WRAPPER_ARGS)
 TOOLCHAIN_WRAPPER_ARGS += -DBR_SYSROOT='"$(STAGING_SUBDIR)"'
 
 TOOLCHAIN_WRAPPER_OPTS = \
+	$(ARCH_TOOLCHAIN_WRAPPER_OPTS) \
 	$(call qstrip,$(BR2_SSP_OPTION)) \
 	$(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
