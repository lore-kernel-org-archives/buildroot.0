From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:25 +0100
Subject: [Buildroot] [PATCHv3 37/74] rp-pppoe: bail out of installation fails
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-38-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an "|| exit 1" in the installation loop, otherwise if one of the
file fails to install, the build doesn't abort.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rp-pppoe/rp-pppoe.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index 6827628..4e17f2d 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -19,7 +19,7 @@ RP_PPPOE_CONF_ENV = \
 
 define RP_PPPOE_INSTALL_TARGET_CMDS
 	for ff in $(RP_PPPOE_TARGET_FILES); do \
-		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff; \
+		$(INSTALL) -m 0755 $(@D)/src/$$ff $(TARGET_DIR)/usr/sbin/$$ff || exit 1; \
 	done
 endef
 
-- 
2.1.0
