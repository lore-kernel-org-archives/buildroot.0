From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:38 -0300
Subject: [Buildroot] [PATCH 51/93] rs485conf: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-52-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.7.3
