From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Dec 2016 15:13:53 +0100
Subject: [Buildroot] [PATCH v2,1/1] lxc: install also in staging
Message-ID: <1482070433-17578-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Install also lxc in staging directory, this will be needed for the
incoming integration of lxd package. Moreover, other packages could
find useful to integrate with liblxc instead of using lxc-xxx binaries.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update commit message

 package/lxc/lxc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index b9e3a43..2d04919 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -9,6 +9,7 @@ LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = libcap host-pkgconf
+LXC_INSTALL_STAGING = YES
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-python --disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
-- 
2.5.0
