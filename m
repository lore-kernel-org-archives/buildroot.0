From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:12:57 +0200
Subject: [Buildroot] [git commit] eudev: add input group
Message-ID: <20141022201338.A39B5B0429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ca94a0a56983fe062b8c9e857283fbf98f6fc9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's used by 50-default-udev.rules for input-class devices.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index fd935a7..3cd22be 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -42,4 +42,9 @@ define EUDEV_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
+# Required by default rules for input devices
+define EUDEV_USERS
+	- - input -1 * - - - Input device group
+endef
+
 $(eval $(autotools-package))
