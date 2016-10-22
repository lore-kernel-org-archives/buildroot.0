From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] mii-diag: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.2603E819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=781808d6d79dd72b83f12c7d84f78140915a7188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mii-diag/mii-diag.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index ae8defd..6efd5be 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -22,11 +22,11 @@ endef
 MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
 
 define MII_DIAG_BUILD_CMDS
-	$(MAKE) $(MII_DIAG_MAKE_OPTS) -C $(@D) mii-diag
+	$(TARGET_MAKE_ENV) $(MAKE) $(MII_DIAG_MAKE_OPTS) -C $(@D) mii-diag
 endef
 
 define MII_DIAG_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-mii-diag
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install-mii-diag
 endef
 
 $(eval $(generic-package))
