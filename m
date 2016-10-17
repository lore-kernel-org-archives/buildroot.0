From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:31 -0300
Subject: [Buildroot] [PATCH 44/93] lm-sensors: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-45-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lm-sensors/lm-sensors.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index d2080d8..314d107 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -38,16 +38,16 @@ LM_SENSORS_MAKE_OPTS += BUILD_STATIC_LIB=1
 endif
 
 define LM_SENSORS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(LM_SENSORS_MAKE_OPTS) -C $(@D)
 endef
 
 define LM_SENSORS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 	rm -f $(addprefix $(STAGING_DIR)/usr/,$(LM_SENSORS_BINS_) $(LM_SENSORS_BINS_y))
 endef
 
 define LM_SENSORS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LM_SENSORS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 	rm -f $(addprefix $(TARGET_DIR)/usr/,$(LM_SENSORS_BINS_))
 endef
 
-- 
2.7.3
