From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 15 Sep 2019 09:32:30 -0300
Subject: [Buildroot] [PATCH] package/eudev: add missing user/groups "kvm"
 and "render"
Message-ID: <20190915123230.15954-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

They are required by the default udev rules.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12141

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/eudev/eudev.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 78d0ea670e..c5fbee8b9b 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -51,6 +51,8 @@ endef
 # Required by default rules for input devices
 define EUDEV_USERS
 	- - input -1 * - - - Input device group
+	- - render -1 * - - - DRI rendering nodes
+	- - kvm -1 * - - - kvm nodes
 endef
 
 $(eval $(autotools-package))
-- 
2.18.1
