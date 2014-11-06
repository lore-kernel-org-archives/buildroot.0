From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Nov 2014 10:36:49 -0300
Subject: [Buildroot] [PATCH 3/7] dhcpcd: install binary to /sbin
In-Reply-To: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415281013-1077-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Debian ifupdown expects dhcpcd to be in /sbin rather than /usr/sbin

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/dhcpcd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index f4b821a..60ac129 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -37,7 +37,7 @@ endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
-		$(TARGET_DIR)/usr/sbin/dhcpcd
+		$(TARGET_DIR)/sbin/dhcpcd
 	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
 		$(TARGET_DIR)/etc/dhcpcd.conf
 	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
-- 
2.0.4
