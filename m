From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Nov 2014 10:36:52 -0300
Subject: [Buildroot] [PATCH 6/7] debianutils: new package
In-Reply-To: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1415281013-1077-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                    |  1 +
 package/debianutils/Config.in        |  7 +++++++
 package/debianutils/debianutils.hash |  2 ++
 package/debianutils/debianutils.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/debianutils/Config.in
 create mode 100644 package/debianutils/debianutils.hash
 create mode 100644 package/debianutils/debianutils.mk

diff --git a/package/Config.in b/package/Config.in
index 0dbb788..278134d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1199,6 +1199,7 @@ endif
 	source "package/cpuload/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
+	source "package/debianutils/Config.in"
 endif
 	source "package/dsp-tools/Config.in"
 	source "package/ftop/Config.in"
diff --git a/package/debianutils/Config.in b/package/debianutils/Config.in
new file mode 100644
index 0000000..f865868
--- /dev/null
+++ b/package/debianutils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DEBIANUTILS
+	bool "debianutils"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Miscellaneous utilities specific to Debian.
+
+	  https://tracker.debian.org/pkg/debianutils
diff --git a/package/debianutils/debianutils.hash b/package/debianutils/debianutils.hash
new file mode 100644
index 0000000..089dd42
--- /dev/null
+++ b/package/debianutils/debianutils.hash
@@ -0,0 +1,2 @@
+# From http://ftp.de.debian.org/debian/pool/main/d/debianutils/debianutils_4.4.dsc
+sha256	190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6	debianutils_4.4.tar.gz
diff --git a/package/debianutils/debianutils.mk b/package/debianutils/debianutils.mk
new file mode 100644
index 0000000..43d7cf3
--- /dev/null
+++ b/package/debianutils/debianutils.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# debianutils
+#
+################################################################################
+
+DEBIANUTILS_VERSION = 4.4
+DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.gz
+DEBIANUTILS_SITE = http://snapshot.debian.org/archive/debian/20130728T034252Z/pool/main/d/debianutils
+DEBIANUTILS_CONF_OPTS = --exec-prefix=/
+DEBIANUTILS_LICENSE = GPLv2+, SMAIL (savelog)
+DEBIANUTILS_LICENSE_FILES = debian/copyright
+
+$(eval $(autotools-package))
-- 
2.0.4
