From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 13:17:34 +0100
Subject: [Buildroot] [git commit] dhcpcd: install dhcpcd as /usr/sbin/dhcpcd.
Message-ID: <20140109122318.1F0DE9C409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4c1e0d77a88f791be1bf6f9e186929ca0c84559
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNU/Linux distributions usually install dhcpcd in /usr/sbin.
NetworkManager will look for it in this directory.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 8037706..01ced3a 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -32,7 +32,7 @@ endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
-		$(TARGET_DIR)/usr/bin/dhcpcd
+		$(TARGET_DIR)/usr/sbin/dhcpcd
 	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
 		$(TARGET_DIR)/etc/dhcpcd.conf
 	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
