From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 11:16:43 +0200
Subject: [Buildroot] [git commit] crosstool-ng: fixup after
	copy_toolchain_lib_root api changes
Message-ID: <20120509091952.D72CA96C81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03578ce8b64e6e052d7839063c32e51b96c13112
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0729b544b3 (Improve external toolchain logic to support IA32
Sourcery CodeBench toolchain) and e1f0804cc (external-toolchain: add
support for recent Linaro toolchains) changed the interface of
copy_toolchain_lib_root, but ctng wasn't updated so libraries weren't
copied to the target.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index a316cdd..eb9e963 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -68,10 +68,10 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 	    echo "CTNG_SYSROOT='$${CTNG_SYSROOT}'";                         \
 	    echo "Copy external toolchain libraries to target...";          \
 	    for libs in $(CTNG_LIBS_LIB); do                                \
-	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/lib); \
+	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},,lib,$$libs,/lib); \
 	    done;                                                           \
 	    for libs in $(CTNG_LIBS_USR_LIB); do                            \
-	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},$$libs,/usr/lib); \
+	        $(call copy_toolchain_lib_root,$${CTNG_SYSROOT},,lib,$$libs,/usr/lib); \
 	    done;
 	$(Q)touch $@
 
