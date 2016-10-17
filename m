From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:52 -0300
Subject: [Buildroot] [PATCH 05/93] librtas: use $(TARGET_CONFIGURE_OPTS)
	when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-6-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/librtas/librtas.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
index 6e1ebd1..46c4cb4 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -15,11 +15,11 @@ define LIBRTAS_BUILD_CMDS
 endef
 
 define LIBRTAS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBRTAS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
