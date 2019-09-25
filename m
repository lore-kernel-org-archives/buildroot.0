From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:48:06 +0200
Subject: [Buildroot] [git commit branch/2019.08.x] package/eudev: add
 missing user/groups "kvm" and "render"
Message-ID: <20190925200318.D2B518F5E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=357af4853b7e509cfa89a3a91a911e099f5f4bcf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

They are required by the default udev rules.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=12141

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0aa66343184676482b0d77446614e332ee5ccd99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
