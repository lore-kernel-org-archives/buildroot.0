From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Dec 2016 12:56:25 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: add dependency on gnutls
Message-ID: <1482062185-97871-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lxc can use gnutls for various checksumming so add a dependency on it if
package is selected (there is no --enable-gnutls in configure)

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/lxc/lxc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 2d04919..b910612 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -14,6 +14,10 @@ LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LXC_DEPENDENCIES += gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 LXC_CONF_OPTS += --enable-seccomp
 LXC_DEPENDENCIES += libseccomp
-- 
2.5.0
