From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 22:07:50 +0100
Subject: [Buildroot] [git commit] i2c-tools: Add i2c-dev.h to staging
	directory for userspace i2c drivers.
Message-ID: <20140303211005.13EB69BCBE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff673f9a22b1467878f1a117f2c6198e9683d5c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jouko Nikula <jouko.nikula@espotel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/i2c-tools.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index c6a967d..450dba7 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -9,6 +9,7 @@ I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
 I2C_TOOLS_LICENSE_FILES = COPYING
+I2C_TOOLS_INSTALL_STAGING = YES
 
 define I2C_TOOLS_BUILD_CMDS
  $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
@@ -21,4 +22,8 @@ define I2C_TOOLS_INSTALL_TARGET_CMDS
 	done
 endef
 
+define I2C_TOOLS_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m644 $(@D)/include/linux/i2c-dev.h $(STAGING_DIR)/usr/include/linux/
+endef
+
 $(eval $(generic-package))
