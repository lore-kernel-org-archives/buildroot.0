From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 01:11:59 +0100
Subject: [Buildroot] [git commit] b43-fwcutter: new package
Message-ID: <20121216001447.6DCB39A02E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a63d01f1564397deb97ee679ab97e0bc60d41541
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

b43-fwcutter is an open-source tool (BSD-2c) that extracts the
firmwares from the Broadcom proprietary drivers. Those firmwares can
then be used by the open-source b43 and b43-legacy drivers of the
Linux kernel.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/b43-fwcutter/b43-fwcutter.mk |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/b43-fwcutter/b43-fwcutter.mk b/package/b43-fwcutter/b43-fwcutter.mk
new file mode 100644
index 0000000..b48eb45
--- /dev/null
+++ b/package/b43-fwcutter/b43-fwcutter.mk
@@ -0,0 +1,21 @@
+#############################################################
+#
+# b43-fwcutter
+#
+#############################################################
+
+B43_FWCUTTER_VERSION = 015
+B43_FWCUTTER_SITE = http://bues.ch/b43/fwcutter/
+B43_FWCUTTER_SOURCE = b43-fwcutter-$(B43_FWCUTTER_VERSION).tar.bz2
+B43_FWCUTTER_LICENSE = BSD-2c
+B43_FWCUTTER_LICENSE_FILES = COPYING
+
+define HOST_B43_FWCUTTER_BUILD_CMDS
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+endef
+
+define HOST_B43_FWCUTTER_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/b43-fwcutter $(HOST_DIR)/usr/bin/b43-fwcutter
+endef
+
+$(eval $(host-generic-package))
