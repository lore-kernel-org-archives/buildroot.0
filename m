From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:15 -0300
Subject: [Buildroot] [PATCH 88/93] wiringpi: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-89-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/wiringpi/wiringpi.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
index baa8753..87b1b6a 100644
--- a/package/wiringpi/wiringpi.mk
+++ b/package/wiringpi/wiringpi.mk
@@ -40,13 +40,13 @@ define WIRINGPI_BUILD_CMDS
 endef
 
 define WIRINGPI_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
-	$(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(STAGING_DIR) PREFIX=/usr LDCONFIG=true
 endef
 
 define WIRINGPI_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
-	$(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/wiringPi $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/devLib $(WIRINGPI_LIB_INSTALL_TARGETS) DESTDIR=$(TARGET_DIR) PREFIX=/usr LDCONFIG=true
 	$(INSTALL) -D -m 0755 $(@D)/gpio/gpio $(TARGET_DIR)/usr/bin/gpio
 	$(INSTALL) -D -m 0755 $(@D)/gpio/pintest $(TARGET_DIR)/usr/bin/pintest
 endef
-- 
2.7.3
