From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Feb 2020 22:29:34 +0100
Subject: [Buildroot] [git commit] infra: don't be verbose when calling the
 instrumentation steps
Message-ID: <20200222211754.C2E008E745@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea8dd081aa27b99db49adc058aadf6866c0da784
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 509db3b88a added calls to (parts of) the instrumentation steps.
However, those calls are echoed, unlike the other places where we call
them (in the package infra).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 3e9debfd26..9e38e2cae3 100644
--- a/Makefile
+++ b/Makefile
@@ -807,12 +807,12 @@ endif # merged /usr
 # AFTER ALL FILE-CHANGING ACTIONS:
 # Update timestamps in internal file list to fix attribution of files
 # to packages on subsequent builds
-	$(call step_pkg_size_file_list,$(TARGET_DIR))
-	$(call step_pkg_size_finalize)
-	$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
-	$(call step_pkg_size_finalize,-staging)
-	$(call step_pkg_size_file_list,$(HOST_DIR),-host)
-	$(call step_pkg_size_finalize,-host)
+	@$(call step_pkg_size_file_list,$(TARGET_DIR))
+	@$(call step_pkg_size_finalize)
+	@$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
+	@$(call step_pkg_size_finalize,-staging)
+	@$(call step_pkg_size_file_list,$(HOST_DIR),-host)
+	@$(call step_pkg_size_finalize,-host)
 
 .PHONY: target-post-image
 target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
