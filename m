From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:15 -0300
Subject: [Buildroot] [PATCH 08/51] librtas: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-9-git-send-email-gustavo.zacarias@free-electrons.com>
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
index 6e1ebd1..0af47e0 100644
--- a/package/librtas/librtas.mk
+++ b/package/librtas/librtas.mk
@@ -15,11 +15,11 @@ define LIBRTAS_BUILD_CMDS
 endef
 
 define LIBRTAS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define LIBRTAS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
