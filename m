From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 12:56:36 +0200
Subject: [Buildroot] [git commit branch/2015.08.x] package/eudev: fix
	install command
Message-ID: <20150904105751.84FD181F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccda2ae98d5dbf2cb30d73d42a1ac8739a9e44b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/2015.08.x

The directory $(TARGET_DIR)/etc/init.d/ must exist before installing
S10udev init script.
Add the missing "-D" option to create the "init.d" directory.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1037475b9b9e1ec8092e4f90c3e33f9c485867ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/eudev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index b916acd..1aa74b3 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -57,7 +57,7 @@ EUDEV_CONF_OPTS += --disable-selinux
 endif
 
 define EUDEV_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	$(INSTALL) -D -m 0755 package/eudev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
 endef
 
 # Required by default rules for input devices
