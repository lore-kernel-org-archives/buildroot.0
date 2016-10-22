From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] wiringpi: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132039.8E5E67F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87cb3ed07e4c1da1a19cd599a19fb118abae947d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
