From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 26 Mar 2017 22:17:44 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: remove sha1 external dependency
Message-ID: <20170326201744.12202-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--with-sha1 option was removed since mesa 1.17.0 by commit [1].

[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=d1efa09d342bff3e5def2978a0bef748d74f9c82

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e780dfb..0c6dd9f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -33,17 +33,6 @@ MESA3D_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
 MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MESA3D_DEPENDENCIES += openssl
-MESA3D_CONF_OPTS += --with-sha1=libcrypto
-else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-MESA3D_DEPENDENCIES += libgcrypt
-MESA3D_CONF_OPTS += --with-sha1=libgcrypt
-else ifeq ($(BR2_PACKAGE_LIBSHA1),y)
-MESA3D_DEPENDENCIES += libsha1
-MESA3D_CONF_OPTS += --with-sha1=libsha1
-endif
-
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_DEPENDENCIES += \
 	xproto_xf86driproto \
-- 
2.9.3
