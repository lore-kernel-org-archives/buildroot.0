From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Apr 2018 17:43:46 +0200
Subject: [Buildroot] [git commit] package: declare target variant before
 host variant
Message-ID: <20180430154404.F33FA8A4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7528c47523b0e261aec8d0f34b6f242d72b2c111
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our package infrastructure uses inheritance of a number of values from
the target package to the host package, which assumes the target
package is defined before the host package. In addition, future
changes are going to make this requirement even more important.

Therefore, let's fix the android-tools, gauche, lcms2,
linux-syscall-support and pngquant packages, so that they declare
their target variant before their host variant, like all other
packages in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/android-tools/android-tools.mk                 | 2 +-
 package/gauche/gauche.mk                               | 2 +-
 package/lcms2/lcms2.mk                                 | 2 +-
 package/linux-syscall-support/linux-syscall-support.mk | 2 +-
 package/pngquant/pngquant.mk                           | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
index 11e0a15a7f..879d788e3a 100644
--- a/package/android-tools/android-tools.mk
+++ b/package/android-tools/android-tools.mk
@@ -81,5 +81,5 @@ define ANDROID_TOOLS_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(TARGET_DIR)/usr/bin/$(t)$(sep))
 endef
 
-$(eval $(host-generic-package))
 $(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 1e1ee390af..0b4185f5bf 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -29,5 +29,5 @@ endif
 # here.
 GAUCHE_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
-$(eval $(host-autotools-package))
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 29f8ac8dee..f61563dea4 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -31,5 +31,5 @@ else
 LCMS2_CONF_OPTS += --without-zlib
 endif
 
-$(eval $(host-autotools-package))
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/linux-syscall-support/linux-syscall-support.mk b/package/linux-syscall-support/linux-syscall-support.mk
index b8145de496..050c5058ab 100644
--- a/package/linux-syscall-support/linux-syscall-support.mk
+++ b/package/linux-syscall-support/linux-syscall-support.mk
@@ -25,5 +25,5 @@ define HOST_LINUX_SYSCALL_SUPPORT_INSTALL_CMDS
 		$(HOST_DIR)/include/linux_syscall_support.h
 endef
 
-$(eval $(host-generic-package))
 $(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/pngquant/pngquant.mk b/package/pngquant/pngquant.mk
index 1ce8359d40..f181d6fb47 100644
--- a/package/pngquant/pngquant.mk
+++ b/package/pngquant/pngquant.mk
@@ -51,5 +51,5 @@ define HOST_PNGQUANT_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-$(eval $(host-generic-package))
 $(eval $(generic-package))
+$(eval $(host-generic-package))
