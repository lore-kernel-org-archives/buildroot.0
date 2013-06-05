From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 10:42:04 +0200
Subject: [Buildroot] [git commit] kmod: adjust license info based on kmod
	tools selection
Message-ID: <20130605090357.7ADE39A8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a13afc11456e38ccbb49d3e70297118e8e9f8cae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libkmod is licensed as LGPL, while the kmod tools are GPL.
We always install libkmod, but conditionally install the tools.
This patch adjusts the license variables accordingly.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 5c733b9..2fe9942 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -7,11 +7,13 @@
 KMOD_VERSION = 13
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
-KMOD_LICENSE = GPLv2+ LGPLv2.1+
-KMOD_LICENSE_FILES = COPYING libkmod/COPYING
 KMOD_INSTALL_STAGING = YES
 KMOD_DEPENDENCIES = host-pkgconf
 
+# license info for libkmod only, conditionally add more below
+KMOD_LICENSE = LGPLv2.1+
+KMOD_LICENSE_FILES = libkmod/COPYING
+
 ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 KMOD_CONF_OPT += --disable-manpages
 endif
@@ -27,6 +29,11 @@ KMOD_CONF_OPT += --with-xz
 endif
 
 ifeq ($(BR2_PACKAGE_KMOD_TOOLS),y)
+
+# add license info for kmod tools
+KMOD_LICENSE += GPLv2+
+KMOD_LICENSE_FILES += COPYING
+
 # take precedence over busybox / module-init-tools implementations
 KMOD_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_BUSYBOX),busybox) \
