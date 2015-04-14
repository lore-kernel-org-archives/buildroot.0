From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:16:14 +0200
Subject: [Buildroot] [git commit] Makefile: targets are now declared phony
	by the appropriate infrastructures
Message-ID: <20150414081954.D7BB47F9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93f911f1bacc3e6fb668d20219060129bc6555f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main Makefile was declaring a subset of the per-package targets as
being PHONY, but not all of them. Now that the pkg-generic package
infrastructure is taking care of that in a much more systematic
fashion, this commit gets rid of the unneeded code from the main
Makefile.

[Thomas: re-add list-defconfigs to the list of PHONY targets, as
noticed by Yann.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f011918..bd60c2e 100644
--- a/Makefile
+++ b/Makefile
@@ -390,7 +390,6 @@ include fs/common.mk
 include $(BR2_EXTERNAL)/external.mk
 
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
-TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
 # host-* dependencies have to be handled specially, as those aren't
 # visible in Kconfig and hence not added to a variable like TARGETS.
@@ -426,9 +425,7 @@ world: target-post-image
 
 .PHONY: all world toolchain dirs clean distclean source outputmakefile \
 	legal-info legal-info-prepare legal-info-clean printvars help \
-	list-defconfigs target-finalize target-post-image \
-	$(TARGETS) $(TARGETS_ROOTFS) \
-	$(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO)
+	list-defconfigs target-finalize target-post-image
 
 ################################################################################
 #
