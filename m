From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 May 2014 06:59:51 -0300
Subject: [Buildroot] [PATCH 2/2] inadyn: install initscript in
	INSTALL_INIT_SYSV hook
In-Reply-To: <1400579991-3808-1-git-send-email-gustavo@zacarias.com.ar>
References: <1400579991-3808-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1400579991-3808-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/inadyn/inadyn.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 463eaa8..3886390 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -17,6 +17,9 @@ define INADYN_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/src/inadyn $(TARGET_DIR)/usr/sbin/inadyn
 	$(INSTALL) -D -m 0600 package/inadyn/inadyn.conf \
 		$(TARGET_DIR)/etc/inadyn.conf
+endef
+
+define INADYN_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/inadyn/S70inadyn \
 		$(TARGET_DIR)/etc/init.d/S70inadyn
 endef
-- 
1.8.5.5
