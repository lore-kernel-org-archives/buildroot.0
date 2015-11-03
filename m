From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:41:53 +0100
Subject: [Buildroot] [git commit] core: remove .br-external on distclean
Message-ID: <20151103224159.BA1AA803C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8c0e45d3236c8005b30d12a7f49c225603dad96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

distclean is supposed to return the current directory, whether in-tree
or out-of-tree, into pristine conditions, which means we should also
forget about any br2-external tree on distclean.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index caf4a91..fbc6115 100644
--- a/Makefile
+++ b/Makefile
@@ -844,7 +844,7 @@ ifeq ($(O),output)
 	rm -rf $(O)
 endif
 	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
-		$(CONFIG_DIR)/.auto.deps
+		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
 
 help:
 	@echo 'Cleaning:'
