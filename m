From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:48:18 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/eudev: add
 missing user/groups "kvm" and "render"
Message-ID: <20190925200311.3F5E08F5C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dbf9b709da5213bf80250622f334628a0a2a742
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
index d88e010c28..58a9590289 100644
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
