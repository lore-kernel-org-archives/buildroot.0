From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 14:54:46 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.23
Message-ID: <20180508125444.9CD268B8B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce58ae893d7dc2c6209abb6353b96376e137c261
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use += for the SUDO_CONF_ENV conditional assignment to avoid override of
SUDO_CONF_ENV assignments that might be added in the future.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sudo/sudo.hash | 4 +++-
 package/sudo/sudo.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 80448ff792..3f20ccb15e 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,4 @@
 # From: http://www.sudo.ws/download.html
-sha256 74c5746cd33a814e2431c39faf0d76f7f8a697379bd073862e3b156cf0d76368  sudo-1.8.21p2.tar.gz
+sha256 d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679  sudo-1.8.23.tar.gz
+# Locally calculated
+sha256 b6625a7b58e9469a7adfd1732960579a19fe84b3508030f9a31641283e2250b8  doc/LICENSE
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 77a95bd65e..136b6c6915 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.21p2
+SUDO_VERSION = 1.8.23
 SUDO_SITE = https://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
@@ -45,7 +45,7 @@ SUDO_CONF_OPTS += --with-ldap
 # it will fail with "undefined reference" errors.
 ifeq ($(BR2_STATIC_LIBS)$(BR2_PACKAGE_OPENSSL),yy)
 SUDO_DEPENDENCIES += host-pkgconf
-SUDO_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
+SUDO_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`"
 endif
 else
 SUDO_CONF_OPTS += --without-ldap
