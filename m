From: Trent Piepho <tpiepho@kymetacorp.com>
Date: Thu, 5 Nov 2015 20:12:32 +0000
Subject: [Buildroot] [PATCH v2] toolchain/external:: Fix gdbserver install
 with linaro 2015.08
In-Reply-To: <20151105195529.GC3781@free.fr>
References: <1446752721.4553.8.camel@rtred1test09.kymeta.local>
 <20151105195529.GC3781@free.fr>
Message-ID: <1446754352.4553.10.camel@rtred1test09.kymeta.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's now in bin/gdbserver from the install dir of the toolchain.

Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 958ab18..613ce50 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -645,7 +645,10 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
 		$(call MESSAGE,"Copying gdbserver") ; \
 		gdbserver_found=0 ; \
-		for d in $${ARCH_SYSROOT_DIR}/usr $${ARCH_SYSROOT_DIR}/../debug-root/usr $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} ; do \
+		for d in $${ARCH_SYSROOT_DIR}/usr \
+			 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
+			 $${ARCH_SYSROOT_DIR}/usr/$${ARCH_LIB_DIR} \
+			 $(TOOLCHAIN_EXTERNAL_INSTALL_DIR); do \
 			if test -f $${d}/bin/gdbserver ; then \
 				install -m 0755 -D $${d}/bin/gdbserver $(TARGET_DIR)/usr/bin/gdbserver ; \
 				gdbserver_found=1 ; \
-- 
1.8.3.1
