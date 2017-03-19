From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sun, 19 Mar 2017 10:59:52 +0100
Subject: [Buildroot] [PATCH 5/5] package/pkg-toolchain-external: indentation
	cleanup
In-Reply-To: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1489917592-12454-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1489917592-12454-5-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 11a1bf5..2574c2c 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -445,19 +445,19 @@ endef
 #
 # $1: destination directory (TARGET_DIR / STAGING_DIR)
 create_lib_symlinks = \
-       $(Q)DESTDIR="$(strip $1)" ; \
-       ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-       if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
-               ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
-               ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
-       fi
+	$(Q)DESTDIR="$(strip $1)" ; \
+	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
+	if [ ! -e "$${DESTDIR}/$${ARCH_LIB_DIR}" -a ! -e "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ]; then \
+		ln -snf lib "$${DESTDIR}/$${ARCH_LIB_DIR}" ; \
+		ln -snf lib "$${DESTDIR}/usr/$${ARCH_LIB_DIR}" ; \
+	fi
 
 define TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK
-       $(call create_lib_symlinks,$(STAGING_DIR))
+	$(call create_lib_symlinks,$(STAGING_DIR))
 endef
 
 define TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK
-       $(call create_lib_symlinks,$(TARGET_DIR))
+	$(call create_lib_symlinks,$(TARGET_DIR))
 endef
 
 #
-- 
1.9.1
