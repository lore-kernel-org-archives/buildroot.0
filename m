From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  7 Jul 2016 09:12:26 +0300
Subject: [Buildroot] [PATCH] hostapd: Install default hostapd.conf on target
Message-ID: <1467871946-14568-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For convenience it's nice to have default hostapd.conf installed
on target automatically as a good starting point.

Otherwise user has to create it manually from scratch.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>i
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hostapd/hostapd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index dca07c1..5aa2b9a 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -86,6 +86,8 @@ define HOSTAPD_INSTALL_TARGET_CMDS
 		$(TARGET_DIR)/usr/sbin/hostapd
 	$(INSTALL) -m 0755 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
 		$(TARGET_DIR)/usr/bin/hostapd_cli
+	$(INSTALL) -m 0644 -D $(@D)/$(HOSTAPD_SUBDIR)/hostapd.conf \
+		$(TARGET_DIR)/etc/hostapd.conf
 endef
 
 $(eval $(generic-package))
-- 
2.5.5
