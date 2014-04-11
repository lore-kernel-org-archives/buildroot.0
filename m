From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Apr 2014 20:57:27 +0200
Subject: [Buildroot] [git commit] kmod: bump version
Message-ID: <20140411185800.6052A9C6D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4a021d63cd56a991dff8fa4617c81ed4d4c8289
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add optional support for the python bindings.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 46c8ea9..3987407 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 16
+KMOD_VERSION = 17
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
@@ -32,6 +32,11 @@ KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPT += --with-xz
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+KMOD_DEPENDENCIES += python
+KMOD_CONF_OPT += --enable-python
+endif
+
 # --gc-sections triggers a bug in the current Xtensa binutils
 ifeq ($(BR2_xtensa),y)
 KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=no
