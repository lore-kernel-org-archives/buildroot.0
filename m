From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] memtester: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.C3FC6819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=856459aca6dad68eecd7d6557a8ecb5f57161f68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memtester/memtester.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index d12babc..802c1e4 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -13,11 +13,11 @@ MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
 define MEMTESTER_BUILD_CMDS
 	$(SED) "s,^cc,$(TARGET_CC)," $(@D)/conf-*
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define MEMTESTER_INSTALL_TARGET_CMDS
-	$(MAKE) $(MEMTESTER_TARGET_INSTALL_OPTS) -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) $(MEMTESTER_TARGET_INSTALL_OPTS) -C $(@D) install
 endef
 
 $(eval $(generic-package))
