From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jul 2016 21:49:07 +0200
Subject: [Buildroot] [V2 1/2] host-autoconf2-13: new package
Message-ID: <1468698548-23876-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this obsolete version is required by Mozilla b2g

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/autoconf2-13/autoconf2-13.hash |  2 ++
 package/autoconf2-13/autoconf2-13.mk   | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 package/autoconf2-13/autoconf2-13.hash
 create mode 100644 package/autoconf2-13/autoconf2-13.mk

diff --git a/package/autoconf2-13/autoconf2-13.hash b/package/autoconf2-13/autoconf2-13.hash
new file mode 100644
index 0000000..9283646
--- /dev/null
+++ b/package/autoconf2-13/autoconf2-13.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e  autoconf-2.13.tar.gz
diff --git a/package/autoconf2-13/autoconf2-13.mk b/package/autoconf2-13/autoconf2-13.mk
new file mode 100644
index 0000000..69c0eef
--- /dev/null
+++ b/package/autoconf2-13/autoconf2-13.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# autoconf2-13
+#
+################################################################################
+
+AUTOCONF2_13_VERSION = 2.13
+AUTOCONF2_13_SOURCE = autoconf-$(AUTOCONF2_13_VERSION).tar.gz
+AUTOCONF2_13_SITE = $(BR2_GNU_MIRROR)/autoconf
+
+AUTOCONF2_13_LICENSE = GPLv2
+AUTOCONF2_13_LICENSE_FILES = COPYING
+
+HOST_AUTOCONF2_13_CONF_ENV = \
+	EMACS="no" \
+	ac_cv_path_M4=$(HOST_DIR)/usr/bin/m4 \
+	ac_cv_prog_gnu_m4_gnu=no
+
+HOST_AUTOCONF2_13_CONF_OPTS = \
+	--program-suffix=$(AUTOCONF2_13_VERSION) \
+
+HOST_AUTOCONF2_13_DEPENDENCIES = host-m4 host-libtool
+
+$(eval $(host-autotools-package))
-- 
2.7.4
