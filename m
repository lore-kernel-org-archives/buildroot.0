From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Nov 2014 15:18:12 +0100
Subject: [Buildroot] [PATCHv3 24/74] openvpn: use <pkg>_INSTALL_INIT_SYSV
	mechanism
In-Reply-To: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1417357142-14307-25-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/openvpn.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e0dba35..68f7d97 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -50,6 +50,9 @@ endif
 define OPENVPN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
+endef
+
+define OPENVPN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/openvpn/S60openvpn \
 		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
-- 
2.1.0
