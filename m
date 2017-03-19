From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:09:37 +0100
Subject: [Buildroot] [git commit] package/pkg-toolchain-external:
	indentation cleanup
Message-ID: <20170319131838.1188180AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b2e216ee0cb6894b0012316c20da9291ce14458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 11a1bf5..77b7bbb 100644
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
