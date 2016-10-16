From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 13:08:21 +0200
Subject: [Buildroot] [git commit] toolchain/external: remove unused Linaro
	symlink hook
Message-ID: <20161016111151.C17F180195@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70f76e05b90e39a92b95393c2e8ad6aeb3ed2ad6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This hook was needed by 1014.09 Linaro toolchains.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 39c5734..141dd10 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -257,14 +257,6 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 TOOLCHAIN_EXTERNAL_DEPENDENCIES += musl-compat-headers
 endif
 
-# The Linaro toolchain expects the libraries in
-# {/usr,}/lib/<tuple>, but Buildroot copies them to
-# {/usr,}/lib, so we need to create a symbolic link.
-define TOOLCHAIN_EXTERNAL_LINARO_SYMLINK
-	ln -snf . $(TARGET_DIR)/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
-	ln -snf . $(TARGET_DIR)/usr/lib/$(TOOLCHAIN_EXTERNAL_PREFIX)
-endef
-
 # The Codescape toolchain uses a sysroot layout that places them
 # side-by-side instead of nested like multilibs. A symlink is needed
 # much like for the nested sysroots which are handled in
