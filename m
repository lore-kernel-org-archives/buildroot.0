From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:48 -0300
Subject: [Buildroot] [PATCH 61/93] memtester: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-62-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
