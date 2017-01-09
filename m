From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Jan 2017 16:13:42 +0000
Subject: [Buildroot] [PATCH] openvpn: bump version to 2.4.0
Message-ID: <20170109161342.7853-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-password-save option has been removed
  https://github.com/OpenVPN/openvpn/commit/9ffd00e7541d83571b9eec087c6b3545ff68441f

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openvpn/Config.in    | 6 ------
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 8 +-------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 8ba4ea1..5fa191d 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -28,10 +28,4 @@ config BR2_PACKAGE_OPENVPN_SMALL
 	  You loose eurephia, debugging info, help messages and more.
 	  It saves around 100 KiB in binary file size.
 
-config BR2_PACKAGE_OPENVPN_PWSAVE
-	bool "Allow passwords in files"
-	help
-	  Allow --askpass and --auth-user-pass passwords to be read
-	  from a file.
-
 endif
diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index a21608a..600c250 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f3a0d0eaf8d544409f76a9f2a238a0cd3dde9e1a9c1f98ac732a8b572bcdee98  openvpn-2.3.14.tar.xz
+sha256 6f23ba49a1dbeb658f49c7ae17d9ea979de6d92c7357de3d55cd4525e1b2f87e  openvpn-2.4.0.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 1765fb4..5e3df59 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.3.14
+OPENVPN_VERSION = 2.4.0
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
@@ -42,12 +42,6 @@ else
 OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
-ifeq ($(BR2_PACKAGE_OPENVPN_PWSAVE),y)
-OPENVPN_CONF_OPTS += --enable-password-save
-else
-OPENVPN_CONF_OPTS += --disable-password-save
-endif
-
 define OPENVPN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
-- 
2.10.2
