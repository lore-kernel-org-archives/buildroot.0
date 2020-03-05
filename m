From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu,  5 Mar 2020 07:54:48 -0300
Subject: [Buildroot] [PATCH] package/busybox: add BUSYBOX_INSTALL_INIT_OPENRC
Message-ID: <20200305105448.26383-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Install the sysvinit scripts, for the moment, but not S02sysctl, since
openrc provides /etc/init.d/sysctl.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/busybox/busybox.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9eeb784d2a..41a8b98183 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -374,6 +374,15 @@ define BUSYBOX_INSTALL_TARGET_CMDS
 	$(BUSYBOX_INSTALL_MDEV_CONF)
 endef
 
+# Install the sysvinit scripts, for the moment, but not S02sysctl, since
+# openrc provides /etc/init.d/sysctl.
+define BUSYBOX_INSTALL_INIT_OPENRC
+	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
+	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
+	$(BUSYBOX_INSTALL_WATCHDOG_SCRIPT)
+	$(BUSYBOX_INSTALL_TELNET_SCRIPT)
+endef
+
 define BUSYBOX_INSTALL_INIT_SYSV
 	$(BUSYBOX_INSTALL_MDEV_SCRIPT)
 	$(BUSYBOX_INSTALL_LOGGING_SCRIPT)
-- 
2.18.2
