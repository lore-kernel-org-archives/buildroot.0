From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:30:22 +0200
Subject: [Buildroot] [git commit] package/mender: add nodbus to tags if dbus
 is not selected
Message-ID: <20210403070536.96B0B8AF32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=028a210f668dcc7d5bda435ff58b72ca833e9dd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The README.md file suggests passing "nodbus" as a tag if dbus is not selected.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mender/mender.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 1ebd5a2e83..c2bee71d93 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -93,6 +93,8 @@ define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
 endef
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
+else
+MENDER_TAGS += nodbus
 endif
 
 define MENDER_INSTALL_INIT_SYSTEMD
