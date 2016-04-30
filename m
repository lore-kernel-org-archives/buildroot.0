From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:17 +0200
Subject: [Buildroot] [PATCH 21/34] hddtemp: add
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-21-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in            |  1 +
 package/hddtemp/Config.in    |  8 ++++++++
 package/hddtemp/hddtemp.hash |  2 ++
 package/hddtemp/hddtemp.mk   | 19 +++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/hddtemp/Config.in
 create mode 100644 package/hddtemp/hddtemp.hash
 create mode 100644 package/hddtemp/hddtemp.mk

diff --git a/package/Config.in b/package/Config.in
index bdc3063..76665e6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1458,6 +1458,7 @@ comment "Utilities"
 	source "package/file/Config.in"
 	source "package/gnupg/Config.in"
 	source "package/gnupg2/Config.in"
+	source "package/hddtemp/Config.in"
 	source "package/inotify-tools/Config.in"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
diff --git a/package/hddtemp/Config.in b/package/hddtemp/Config.in
new file mode 100644
index 0000000..0d28250
--- /dev/null
+++ b/package/hddtemp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HDDTEMP
+	bool "hddtemp"
+	help
+	  hddtemp is a small utility that gives you the temperature of your
+	  hard drive by reading S.M.A.R.T. informations, for drives that
+	  support this feature. 
+
+	  http://www.guzu.net/linux/hddtemp.php
diff --git a/package/hddtemp/hddtemp.hash b/package/hddtemp/hddtemp.hash
new file mode 100644
index 0000000..c308989
--- /dev/null
+++ b/package/hddtemp/hddtemp.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	618541584054093d53be8a2d9e81c97174f30f00af91cb8700a97e442d79ef5b  hddtemp-0.3-beta15.tar.bz2
diff --git a/package/hddtemp/hddtemp.mk b/package/hddtemp/hddtemp.mk
new file mode 100644
index 0000000..a51548d
--- /dev/null
+++ b/package/hddtemp/hddtemp.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# hddtemp
+#
+################################################################################
+
+HDDTEMP_VERSION = 0.3-beta15
+HDDTEMP_SOURCE = hddtemp-$(HDDTEMP_VERSION).tar.bz2
+HDDTEMP_SITE = http://download.savannah.gnu.org/releases/hddtemp
+HDDTEMP_LICENSE = GPLv2
+HDDTEMP_LICENSE_FILES = GPL-2
+
+define HDDTEMP_REMOVE_MAN
+	rm -rf $(TARGET_DIR)/usr/man
+endef
+
+HDDTEMP_POST_INSTALL_TARGET_HOOKS += HDDTEMP_REMOVE_MAN
+
+$(eval $(autotools-package))
-- 
2.7.4
