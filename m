From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 22:21:16 +0100
Subject: [Buildroot] [git commit] toolchain-external/blackfin: drop
	--hard-dereference
Message-ID: <20151103223523.943FE7FFBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbdc241d6a476855f6548ba282dfd18382245745
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, for the blackfin external toolchains, we tell tar to
extract files with the --hard-dereference. However, --hard-dereference
is only meaningful when creating an archive, not when extracting
it. Therefore, let's drop this option.

[Thomas: rework commit title and commit log, after some suggestions
from Arnout.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 0f818b4..77c51a3 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -468,9 +468,9 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_
 define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
 	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
-		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+		$(TAR) --strip-components=3 -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
-		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
+		$(TAR) --strip-components=3 -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
 endef
 else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
 # Normal handling of toolchain tarball extraction.
