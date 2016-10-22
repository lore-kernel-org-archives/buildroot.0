From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] rs485conf: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.67F357F925@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a819d69f5981ab83490629e8947ad333a374aa4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rs485conf/rs485conf.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rs485conf/rs485conf.mk b/package/rs485conf/rs485conf.mk
index 7fda39c..8749268 100644
--- a/package/rs485conf/rs485conf.mk
+++ b/package/rs485conf/rs485conf.mk
@@ -10,11 +10,11 @@ RS485CONF_LICENSE = BSD-3c
 RS485CONF_LICENSE_FILES = LICENSE
 
 define RS485CONF_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define RS485CONF_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
 $(eval $(generic-package))
