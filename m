From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  1 Apr 2021 08:44:53 -0700
Subject: [Buildroot] [PATCH] package/mender: add nodbus to tags if dbus is
 not selected
In-Reply-To: <20210401154453.144605-1-aduskett@gmail.com>
References: <20210401154453.144605-1-aduskett@gmail.com>
Message-ID: <20210401154453.144605-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The README.md file suggests passing "nodbus" as a tag if dbus is not selected.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
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
-- 
2.30.2
