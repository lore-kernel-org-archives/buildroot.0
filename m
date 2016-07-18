From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:30:46 +0200
Subject: [Buildroot] [git commit] toolchain: use the
	<PKG>_TARGET_FINALIZE_HOOKS
Message-ID: <20160718213935.2FA2781E63@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbbd7ce201a35312c0288467a24601b2658c359f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Register toolchain-specific target-finalize hooks with the
newly-introduced <PKG>_TARGET_FINALIZE_HOOKS.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
