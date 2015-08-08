From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:29 -0000
Subject: [Buildroot] [git commit branch/next] systemd: fix some coding style
	issues
Message-ID: <20150808105628.B83017FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5c763c490dc1ef42149468910aaaacf4710f049
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

[Thomas: adjust commit title, some additioanl coding style fixes.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |   15 +++++++--------
 1 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0a1f00f..7eb7abe 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -72,16 +72,14 @@ SYSTEMD_CONF_OPTS += --disable-seccomp
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_ALL_EXTRAS),y)
-SYSTEMD_DEPENDENCIES += \
-	xz 		\
-	libgcrypt
-SYSTEMD_CONF_OPTS += 	\
-	--enable-xz 	\
+SYSTEMD_DEPENDENCIES += xz libgcrypt
+SYSTEMD_CONF_OPTS += \
+	--enable-xz \
 	--enable-gcrypt	\
 	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
 else
-SYSTEMD_CONF_OPTS += 	\
-	--disable-xz 	\
+SYSTEMD_CONF_OPTS += \
+	--disable-xz \
 	--disable-gcrypt
 endif
 
@@ -143,7 +141,8 @@ define SYSTEMD_INSTALL_INIT_HOOK
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/poweroff
 	ln -fs ../bin/systemctl $(TARGET_DIR)/sbin/reboot
 
-	ln -fs ../../../lib/systemd/system/multi-user.target $(TARGET_DIR)/etc/systemd/system/default.target
+	ln -fs ../../../lib/systemd/system/multi-user.target \
+		$(TARGET_DIR)/etc/systemd/system/default.target
 endef
 
 define SYSTEMD_INSTALL_MACHINEID_HOOK
