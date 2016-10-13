From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:57 -0300
Subject: [Buildroot] [PATCH 50/51] ocrad: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-51-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/ocrad/ocrad.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 8a038e2..d0fbd4c 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -17,15 +17,15 @@ define OCRAD_CONFIGURE_CMDS
 endef
 
 define OCRAD_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define OCRAD_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
 endef
 
 define OCRAD_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
