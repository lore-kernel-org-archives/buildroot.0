From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2019 22:52:48 +0200
Subject: [Buildroot] [PATCH 1/2 v3] toolchain: allow architectures to
 enforce compilation flags
In-Reply-To: <cover.1563483157.git.yann.morin.1998@free.fr>
References: <cover.1563483157.git.yann.morin.1998@free.fr>
Message-ID: <7233f8dd44ca0a85012dfc3419872e8f2551fb94.1563483157.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
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
