From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 10:44:24 +0200
Subject: [Buildroot] [PATCH 2/6] toolchain: use the
	<PKG>_TARGET_FINALIZE_HOOKS
In-Reply-To: <cover.1468744792.git.yann.morin.1998@free.fr>
References: <cover.1468744792.git.yann.morin.1998@free.fr>
Message-ID: <c147ef54ea80186f8a9e2582da525fb1ec457b5b.1468744792.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Register toolchain-specific target-finalize hooks with the
newly-introduced <PKG>_TARGET_FINALIZE_HOOKS.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain.mk b/toolchain/toolchain.mk
index 0a35909..59fc905 100644
--- a/toolchain/toolchain.mk
+++ b/toolchain/toolchain.mk
@@ -10,7 +10,7 @@ define GLIBC_COPY_NSSWITCH_FILE
 		$(INSTALL) -D -m 0644 package/glibc/nsswitch.conf $(TARGET_DIR)/etc/nsswitch.conf ; \
 	fi
 endef
-TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
+TOOLCHAIN_TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
 endif
 
 # Install the gconv modules
@@ -52,5 +52,5 @@ define COPY_GCONV_LIBS
 			>$(TARGET_DIR)/usr/lib/gconv/gconv-modules; \
 	fi
 endef
-TARGET_FINALIZE_HOOKS += COPY_GCONV_LIBS
+TOOLCHAIN_TARGET_FINALIZE_HOOKS += COPY_GCONV_LIBS
 endif
-- 
2.7.4
