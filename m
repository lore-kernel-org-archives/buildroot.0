From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:32 -0300
Subject: [Buildroot] [PATCH 25/51] pppd: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-26-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/pppd/pppd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 92897be..e2d4a19 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -50,7 +50,7 @@ define PPPD_CONFIGURE_CMDS
 endef
 
 define PPPD_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
 		-C $(@D) $(PPPD_MAKE_OPTS)
 endef
 
@@ -104,7 +104,7 @@ define PPPD_INSTALL_TARGET_CMDS
 endef
 
 define PPPD_INSTALL_STAGING_CMDS
-	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
+	$(TARGET_MAKE_ENV) $(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
