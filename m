From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:59 -0300
Subject: [Buildroot] [PATCH 72/93] mii-diag: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-73-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
