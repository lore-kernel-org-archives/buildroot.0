From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 15:08:15 +0200
Subject: [Buildroot] [git commit] package/terminology: new package
Message-ID: <20160724131401.ECE7881E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcc6b36169fe0ed1c9c6c8d797f529f5cc13a311
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - rewrap Config.in help text
 - fix license, it's BSD-2c, not just "BSD"
 - add dependency on host-pkgconf]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                    |  1 +
 package/terminology/Config.in        |  9 +++++++++
 package/terminology/terminology.hash |  2 ++
 package/terminology/terminology.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 46ad276..e341722 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1649,6 +1649,7 @@ comment "Utilities"
 	source "package/ranger/Config.in"
 	source "package/screen/Config.in"
 	source "package/sudo/Config.in"
+	source "package/terminology/Config.in"
 	source "package/time/Config.in"
 	source "package/tmux/Config.in"
 	source "package/which/Config.in"
diff --git a/package/terminology/Config.in b/package/terminology/Config.in
new file mode 100644
index 0000000..c574af7
--- /dev/null
+++ b/package/terminology/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TERMINOLOGY
+	bool "terminology"
+	depends on BR2_PACKAGE_EFL
+	select BR2_PACKAGE_ELEMENTARY
+	help
+	  Terminology is an EFL terminal emulator with some extra
+	  bells and whistles.
+
+	  https://www.enlightenment.org/about-terminology
diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
new file mode 100644
index 0000000..841ff94
--- /dev/null
+++ b/package/terminology/terminology.hash
@@ -0,0 +1,2 @@
+# From http://sourceforge.net/p/enlightenment/mailman/message/34472601/
+sha256	ecee7ae6ba2fa10bfc5b6531292157dec2373dbb7d248cc62eb53d0be74e9bcf	terminology-0.9.1.tar.xz
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
new file mode 100644
index 0000000..d6c41d7
--- /dev/null
+++ b/package/terminology/terminology.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# terminology
+#
+################################################################################
+
+TERMINOLOGY_VERSION = 0.9.1
+TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
+TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
+TERMINOLOGY_LICENSE = BSD-2c
+TERMINOLOGY_LICENSE_FILES = COPYING
+
+TERMINOLOGY_DEPENDENCIES = efl elementary host-pkgconf
+TERMINOLOGY_CONF_OPTS = --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+
+$(eval $(autotools-package))
