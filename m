From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 17 Jul 2016 22:36:21 +0200
Subject: [Buildroot] [PATCH] package/terminology: new package
Message-ID: <1468787781-5576-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/Config.in                    |  1 +
 package/terminology/Config.in        |  9 +++++++++
 package/terminology/terminology.hash |  2 ++
 package/terminology/terminology.mk   | 17 +++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/terminology/Config.in
 create mode 100644 package/terminology/terminology.hash
 create mode 100644 package/terminology/terminology.mk

diff --git a/package/Config.in b/package/Config.in
index 009b828..deafb53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1644,6 +1644,7 @@ comment "Utilities"
 	source "package/ranger/Config.in"
 	source "package/screen/Config.in"
 	source "package/sudo/Config.in"
+	source "package/terminology/Config.in"
 	source "package/time/Config.in"
 	source "package/tmux/Config.in"
 	source "package/which/Config.in"
diff --git a/package/terminology/Config.in b/package/terminology/Config.in
new file mode 100644
index 0000000..75fe1f5
--- /dev/null
+++ b/package/terminology/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_TERMINOLOGY
+	bool "terminology"
+	depends on BR2_PACKAGE_EFL
+	select BR2_PACKAGE_ELEMENTARY
+	help
+	  Terminology is an EFL terminal emulator with some extra bells
+	  and whistles.
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
index 0000000..f28ed1e
--- /dev/null
+++ b/package/terminology/terminology.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# terminology
+#
+################################################################################
+
+TERMINOLOGY_VERSION = 0.9.1
+TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
+TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
+TERMINOLOGY_LICENSE = BSD
+TERMINOLOGY_LICENSE_FILES = COPYING
+
+TERMINOLOGY_DEPENDENCIES = efl elementary
+
+TERMINOLOGY_CONF_OPTS += --with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc
+
+$(eval $(autotools-package))
-- 
2.5.5
