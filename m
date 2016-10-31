From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 31 Oct 2016 15:56:54 +0100
Subject: [Buildroot] [PATCH v3 05/24] toolchain-external: use $(call) for
	all remaining macros for consistency
In-Reply-To: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
References: <1477925833-27204-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1477925833-27204-6-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TOOLCHAIN_WRAPPER_INSTALL, TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT and
TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO are the remaining macros
called without parameters. Use $(call) for consistency with other
functions.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v3: changes suggested by Yann.
---
 toolchain/toolchain-external/toolchain-external.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 06b8105..16d0094 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -816,12 +816,12 @@ endef
 TOOLCHAIN_EXTERNAL_BUILD_CMDS = $(TOOLCHAIN_WRAPPER_BUILD)
 
 define TOOLCHAIN_EXTERNAL_INSTALL_STAGING_CMDS
-	$(TOOLCHAIN_WRAPPER_INSTALL)
+	$(call TOOLCHAIN_WRAPPER_INSTALL)
 	$(call TOOLCHAIN_EXTERNAL_CREATE_STAGING_LIB_SYMLINK,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER,$(TOOLCHAIN_EXTERNAL_CROSS))
-	$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
+	$(call TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
 # Even though we're installing things in both the staging, the host
@@ -833,7 +833,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS),$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC,$(TOOLCHAIN_EXTERNAL_LIBS))
 	$(call TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT,$(TOOLCHAIN_EXTERNAL_CC),$(TOOLCHAIN_EXTERNAL_CFLAGS))
-	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
+	$(call TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
 endef
 
 $(eval $(generic-package))
-- 
2.5.5
