From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jun 2019 22:33:50 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: allow architectures to enforce
 compilation flags
In-Reply-To: <cover.1559421222.git.yann.morin.1998@free.fr>
References: <cover.1559421222.git.yann.morin.1998@free.fr>
Message-ID: <f0402014099dc18144166238a89a982002edc546.1559421222.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
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
 
-- 
2.20.1
