From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Thu, 5 Nov 2015 19:42:02 +0000
Subject: [Buildroot] [PATCH] toolchain/external: Fix gdbserver install with
 linaro 2015.08
Message-ID: <1446752522.4553.7.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's now in bin/gdbserver from the install dir of the toolchain.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 958ab18..843b1f8 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -645,7 +645,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
-		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
+		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ${TOOLCHAIN_EXTERNAL_INSTALL_DIR}; do \
 			if test -f $${d}/bin/gdbserver ; then \
 				install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
 				gdbserver_found=1 ; \
-- 
1.8.3.1
