From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 23:02:31 +0200
Subject: [Buildroot] [git commit] package/matchbox-common: move one
	directory higher
Message-ID: <20150609211052.51E527FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b468acbb4ec2aca748fc022ff0d53a530b3264b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We usually do not have a sub-directory for a family of related
packages, so move matchbox packages one directory higher, so they
all are in packages/

Also re-order packages alphabetically.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/{matchbox => }/matchbox-common/Config.in   |    0
 .../matchbox-common/matchbox-common.hash           |    0
 .../matchbox-common/matchbox-common.mk             |    0
 package/{matchbox => }/matchbox-desktop/Config.in  |    0
 .../matchbox-desktop/matchbox-desktop.hash         |    0
 .../matchbox-desktop/matchbox-desktop.mk           |    0
 package/{matchbox => }/matchbox-fakekey/Config.in  |    0
 .../matchbox-fakekey/matchbox-fakekey.hash         |    0
 .../matchbox-fakekey/matchbox-fakekey.mk           |    0
 package/{matchbox => }/matchbox-keyboard/Config.in |    0
 .../matchbox-keyboard/matchbox-keyboard.hash       |    0
 .../matchbox-keyboard/matchbox-keyboard.mk         |    2 +-
 .../matchbox-keyboard/mb-applet-kbd-wrapper.sh     |    0
 .../matchbox-lib/0001-index-is-legacy.patch        |    0
 .../matchbox-lib/0002-libpng15.patch               |    0
 .../matchbox-lib/0003-include-setjmp-h.patch       |    0
 package/{matchbox => }/matchbox-lib/Config.in      |    0
 .../{matchbox => }/matchbox-lib/matchbox-lib.hash  |    0
 .../{matchbox => }/matchbox-lib/matchbox-lib.mk    |    0
 .../matchbox-panel/0001-index-is-legacy.patch      |    0
 .../matchbox-panel/0002-mb-applet-wireless.patch   |    0
 package/{matchbox => }/matchbox-panel/Config.in    |    0
 .../matchbox-panel/matchbox-panel.hash             |    0
 .../matchbox-panel/matchbox-panel.mk               |    0
 .../matchbox-startup-monitor/0001-true-false.patch |    0
 .../matchbox-startup-monitor/Config.in             |    0
 .../matchbox-startup-monitor.hash                  |    0
 .../matchbox-startup-monitor.mk                    |    0
 package/matchbox/Config.in                         |   14 +++++++-------
 package/matchbox/matchbox.mk                       |    3 ---
 30 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/matchbox/matchbox-common/Config.in b/package/matchbox-common/Config.in
similarity index 100%
rename from package/matchbox/matchbox-common/Config.in
rename to package/matchbox-common/Config.in
diff --git a/package/matchbox/matchbox-common/matchbox-common.hash b/package/matchbox-common/matchbox-common.hash
similarity index 100%
rename from package/matchbox/matchbox-common/matchbox-common.hash
rename to package/matchbox-common/matchbox-common.hash
diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox-common/matchbox-common.mk
similarity index 100%
rename from package/matchbox/matchbox-common/matchbox-common.mk
rename to package/matchbox-common/matchbox-common.mk
diff --git a/package/matchbox/matchbox-desktop/Config.in b/package/matchbox-desktop/Config.in
similarity index 100%
rename from package/matchbox/matchbox-desktop/Config.in
rename to package/matchbox-desktop/Config.in
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.hash b/package/matchbox-desktop/matchbox-desktop.hash
similarity index 100%
rename from package/matchbox/matchbox-desktop/matchbox-desktop.hash
rename to package/matchbox-desktop/matchbox-desktop.hash
diff --git a/package/matchbox/matchbox-desktop/matchbox-desktop.mk b/package/matchbox-desktop/matchbox-desktop.mk
similarity index 100%
rename from package/matchbox/matchbox-desktop/matchbox-desktop.mk
rename to package/matchbox-desktop/matchbox-desktop.mk
diff --git a/package/matchbox/matchbox-fakekey/Config.in b/package/matchbox-fakekey/Config.in
similarity index 100%
rename from package/matchbox/matchbox-fakekey/Config.in
rename to package/matchbox-fakekey/Config.in
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.hash b/package/matchbox-fakekey/matchbox-fakekey.hash
similarity index 100%
rename from package/matchbox/matchbox-fakekey/matchbox-fakekey.hash
rename to package/matchbox-fakekey/matchbox-fakekey.hash
diff --git a/package/matchbox/matchbox-fakekey/matchbox-fakekey.mk b/package/matchbox-fakekey/matchbox-fakekey.mk
similarity index 100%
rename from package/matchbox/matchbox-fakekey/matchbox-fakekey.mk
rename to package/matchbox-fakekey/matchbox-fakekey.mk
diff --git a/package/matchbox/matchbox-keyboard/Config.in b/package/matchbox-keyboard/Config.in
similarity index 100%
rename from package/matchbox/matchbox-keyboard/Config.in
rename to package/matchbox-keyboard/Config.in
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.hash b/package/matchbox-keyboard/matchbox-keyboard.hash
similarity index 100%
rename from package/matchbox/matchbox-keyboard/matchbox-keyboard.hash
rename to package/matchbox-keyboard/matchbox-keyboard.hash
diff --git a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk b/package/matchbox-keyboard/matchbox-keyboard.mk
similarity index 88%
rename from package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
rename to package/matchbox-keyboard/matchbox-keyboard.mk
index 2017730..fcdd8b1 100644
--- a/package/matchbox/matchbox-keyboard/matchbox-keyboard.mk
+++ b/package/matchbox-keyboard/matchbox-keyboard.mk
@@ -15,7 +15,7 @@ MATCHBOX_KEYBOARD_DEPENDENCIES = host-pkgconf matchbox-lib matchbox-fakekey expa
 MATCHBOX_KEYBOARD_CONF_ENV = expat=yes
 
 define MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
-	$(INSTALL) -D -m 0755 package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/mb-applet-kbd-wrapper.sh
+	$(INSTALL) -D -m 0755 package/matchbox-keyboard/mb-applet-kbd-wrapper.sh $(TARGET_DIR)/usr/bin/mb-applet-kbd-wrapper.sh
 endef
 
 MATCHBOX_KEYBOARD_POST_INSTALL_TARGET_HOOKS += MATCHBOX_KEYBOARD_POST_INSTALL_FIXES
diff --git a/package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh b/package/matchbox-keyboard/mb-applet-kbd-wrapper.sh
similarity index 100%
rename from package/matchbox/matchbox-keyboard/mb-applet-kbd-wrapper.sh
rename to package/matchbox-keyboard/mb-applet-kbd-wrapper.sh
diff --git a/package/matchbox/matchbox-lib/0001-index-is-legacy.patch b/package/matchbox-lib/0001-index-is-legacy.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/0001-index-is-legacy.patch
rename to package/matchbox-lib/0001-index-is-legacy.patch
diff --git a/package/matchbox/matchbox-lib/0002-libpng15.patch b/package/matchbox-lib/0002-libpng15.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/0002-libpng15.patch
rename to package/matchbox-lib/0002-libpng15.patch
diff --git a/package/matchbox/matchbox-lib/0003-include-setjmp-h.patch b/package/matchbox-lib/0003-include-setjmp-h.patch
similarity index 100%
rename from package/matchbox/matchbox-lib/0003-include-setjmp-h.patch
rename to package/matchbox-lib/0003-include-setjmp-h.patch
diff --git a/package/matchbox/matchbox-lib/Config.in b/package/matchbox-lib/Config.in
similarity index 100%
rename from package/matchbox/matchbox-lib/Config.in
rename to package/matchbox-lib/Config.in
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
similarity index 100%
rename from package/matchbox/matchbox-lib/matchbox-lib.hash
rename to package/matchbox-lib/matchbox-lib.hash
diff --git a/package/matchbox/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
similarity index 100%
rename from package/matchbox/matchbox-lib/matchbox-lib.mk
rename to package/matchbox-lib/matchbox-lib.mk
diff --git a/package/matchbox/matchbox-panel/0001-index-is-legacy.patch b/package/matchbox-panel/0001-index-is-legacy.patch
similarity index 100%
rename from package/matchbox/matchbox-panel/0001-index-is-legacy.patch
rename to package/matchbox-panel/0001-index-is-legacy.patch
diff --git a/package/matchbox/matchbox-panel/0002-mb-applet-wireless.patch b/package/matchbox-panel/0002-mb-applet-wireless.patch
similarity index 100%
rename from package/matchbox/matchbox-panel/0002-mb-applet-wireless.patch
rename to package/matchbox-panel/0002-mb-applet-wireless.patch
diff --git a/package/matchbox/matchbox-panel/Config.in b/package/matchbox-panel/Config.in
similarity index 100%
rename from package/matchbox/matchbox-panel/Config.in
rename to package/matchbox-panel/Config.in
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.hash b/package/matchbox-panel/matchbox-panel.hash
similarity index 100%
rename from package/matchbox/matchbox-panel/matchbox-panel.hash
rename to package/matchbox-panel/matchbox-panel.hash
diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox-panel/matchbox-panel.mk
similarity index 100%
rename from package/matchbox/matchbox-panel/matchbox-panel.mk
rename to package/matchbox-panel/matchbox-panel.mk
diff --git a/package/matchbox/matchbox-startup-monitor/0001-true-false.patch b/package/matchbox-startup-monitor/0001-true-false.patch
similarity index 100%
rename from package/matchbox/matchbox-startup-monitor/0001-true-false.patch
rename to package/matchbox-startup-monitor/0001-true-false.patch
diff --git a/package/matchbox/matchbox-startup-monitor/Config.in b/package/matchbox-startup-monitor/Config.in
similarity index 100%
rename from package/matchbox/matchbox-startup-monitor/Config.in
rename to package/matchbox-startup-monitor/Config.in
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.hash b/package/matchbox-startup-monitor/matchbox-startup-monitor.hash
similarity index 100%
rename from package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.hash
rename to package/matchbox-startup-monitor/matchbox-startup-monitor.hash
diff --git a/package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk b/package/matchbox-startup-monitor/matchbox-startup-monitor.mk
similarity index 100%
rename from package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk
rename to package/matchbox-startup-monitor/matchbox-startup-monitor.mk
diff --git a/package/matchbox/Config.in b/package/matchbox/Config.in
index 7d06bb2..3d771d3 100644
--- a/package/matchbox/Config.in
+++ b/package/matchbox/Config.in
@@ -18,12 +18,12 @@ config BR2_PACKAGE_MATCHBOX
 
 if BR2_PACKAGE_MATCHBOX
 
-source "package/matchbox/matchbox-lib/Config.in"
-source "package/matchbox/matchbox-panel/Config.in"
-source "package/matchbox/matchbox-desktop/Config.in"
-source "package/matchbox/matchbox-common/Config.in"
-source "package/matchbox/matchbox-fakekey/Config.in"
-source "package/matchbox/matchbox-keyboard/Config.in"
-source "package/matchbox/matchbox-startup-monitor/Config.in"
+source "package/matchbox-common/Config.in"
+source "package/matchbox-desktop/Config.in"
+source "package/matchbox-fakekey/Config.in"
+source "package/matchbox-keyboard/Config.in"
+source "package/matchbox-lib/Config.in"
+source "package/matchbox-panel/Config.in"
+source "package/matchbox-startup-monitor/Config.in"
 
 endif
diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
index 100a633..29e240e 100644
--- a/package/matchbox/matchbox.mk
+++ b/package/matchbox/matchbox.mk
@@ -36,6 +36,3 @@ MATCHBOX_CONF_OPTS += --disable-startup-notification
 endif
 
 $(eval $(autotools-package))
-
-# After we called a package infra, we can include more files
-include $(sort $(wildcard package/matchbox/*/*.mk))
