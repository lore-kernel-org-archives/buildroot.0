From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:08:02 +0200
Subject: [Buildroot] [git commit] Makefile: directories are not PHONY targets
Message-ID: <20150406093206.C1E5B800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0dd232e9c7dd89837dba72b475426b7f5ebd7ff6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The global .PHONY specification in the main Makefile is describing a
number of directory targets as being PHONY, which doesn't make much
sense. PHONY targets are targets that do not exist on the filesystem,
and which make should always consider as not being up-to-date, so that
the commands associated to these targets are always executed by make
when the command is invoked, even if a file with the same name exists
on the filesystem.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 65b60c2..bcb1f96 100644
--- a/Makefile
+++ b/Makefile
@@ -434,9 +434,7 @@ world: target-post-image
 	legal-info legal-info-prepare legal-info-clean printvars help \
 	list-defconfigs target-finalize target-post-image \
 	$(TARGETS) $(TARGETS_ROOTFS) \
-	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
-	$(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
-	$(HOST_DIR) $(BINARIES_DIR)
+	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO)
 
 ################################################################################
 #
