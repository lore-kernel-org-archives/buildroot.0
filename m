From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:03 +0100
Subject: [Buildroot] [PATCHv3 15/74] ifplugd: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ifplugd/ifplugd.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 398cff4..3d0736a 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -29,12 +29,15 @@ define IFPLUGD_INSTALL_FIXUP
 		$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.action \
 			$(TARGET_DIR)/etc/ifplugd/ifplugd.action ; \
 	fi
+endef
+
+IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
+
+define IFPLUGD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 $(@D)/conf/ifplugd.init \
 		$(TARGET_DIR)/etc/init.d/S45ifplugd
 	# don't use bash for init script
 	$(SED) 's^/bin/bash^/bin/sh^g' $(TARGET_DIR)/etc/init.d/S45ifplugd
 endef
 
-IFPLUGD_POST_INSTALL_TARGET_HOOKS += IFPLUGD_INSTALL_FIXUP
-
 $(eval $(autotools-package))
-- 
2.1.0
