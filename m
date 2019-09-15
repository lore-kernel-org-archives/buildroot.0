From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:57:13 +0200
Subject: [Buildroot] [git commit] package/eudev: add missing user/groups
 "kvm" and "render"
Message-ID: <20190915135229.BD0E78E3DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aa66343184676482b0d77446614e332ee5ccd99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

They are required by the default udev rules.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12141

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
