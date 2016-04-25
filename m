From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 22:48:58 +0200
Subject: [Buildroot] [git commit] toolchain-external: rename Blackfin
	related special variables
Message-ID: <20160425211729.99A5D81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12584c2c701fab1478da547dc85b69c3377e6d25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Arnout, this commit renames:

 - TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC to
   TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC

 - TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT to
   TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT

Which makes it clear that those variables are installing libraries to
the target, and make their naming more consistent with the naming of
other variables in the file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3553745..94ec0da 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -691,7 +691,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
 	fi ; \
 	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
 endef
-define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
 	for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$$libs); \
@@ -706,7 +706,7 @@ endif
 # according to the index in name "libN.so". Index 1 is reserved for
 # the standard C library. Customer libraries can use 4 and above.
 ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
-define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT
+define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
 	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...") ; \
 	FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
 	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
@@ -789,8 +789,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(TOOLCHAIN_EXTERNAL_CREATE_TARGET_LIB_SYMLINK)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
-	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC)
+	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT)
 	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
