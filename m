From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 31 Oct 2019 23:13:59 -0600
Subject: [Buildroot] [PATCH 1/1] package/neard: enable dbus-org.neard.service
Message-ID: <20191101051359.62509-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is normally enabled by systemctl preset-all.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/neard/neard.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/neard/neard.mk b/package/neard/neard.mk
index a351469102..48af325ae2 100644
--- a/package/neard/neard.mk
+++ b/package/neard/neard.mk
@@ -29,4 +29,9 @@ define NEARD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S53neard
 endef
 
+define NEARD_INSTALL_INIT_SYSTEMD
+	ln -sf ../../../lib/systemd/system/neard.service \
+		$(TARGET_DIR)/etc/systemd/system/dbus-org.neard.service
+endef
+
 $(eval $(autotools-package))
-- 
2.20.1
