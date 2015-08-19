From: giovanni.zantedeschi <giovanni.zantedeschi@datacom.ind.br>
Date: Wed, 19 Aug 2015 17:47:06 -0300
Subject: [Buildroot] [PATCH 1/1] libpam-tacplus: new package
Message-ID: <1440017226-14463-1-git-send-email-giovanni.zantedeschi@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Giovanni Zantedeschi" <giovanni.zantedeschi@datacom.ind.br>

Signed-off-by: Giovanni Zantedeschi <giovanni.zantedeschi@datacom.ind.br>
---
 package/Config.in                        |  1 +
 package/libpam-tacplus/Config.in         |  5 +++++
 package/libpam-tacplus/libpam-tacplus.mk | 18 ++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 package/libpam-tacplus/Config.in
 create mode 100644 package/libpam-tacplus/libpam-tacplus.mk

diff --git a/package/Config.in b/package/Config.in
index 47d14d7..9e92023 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1074,6 +1074,7 @@ menu "Other"
 	source "package/libical/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libnspr/Config.in"
+	source "package/libpam-tacplus/Config.in"
 	source "package/libpfm4/Config.in"
 	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
diff --git a/package/libpam-tacplus/Config.in b/package/libpam-tacplus/Config.in
new file mode 100644
index 0000000..88d10ff
--- /dev/null
+++ b/package/libpam-tacplus/Config.in
@@ -0,0 +1,5 @@
+ config BR2_PACKAGE_LIBPAM_TACPLUS
+        bool "libpam-tacplus"
+        help
+          Lib needed to use pam-tacplus
+
diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
new file mode 100644
index 0000000..f788f47
--- /dev/null
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libpam-tacplus
+#
+################################################################################
+
+LIBPAM_TACPLUS_VERSION = 1.3.9
+LIBPAM_TACPLUS_SITE = https://github.com/jeroennijhof/pam_tacplus.git
+LIBPAM_TACPLUS_SITE_METHOD = git
+
+LIBPAM_TACPLUS_INSTALL_STAGING = YES
+LIBPAM_TACPLUS_AUTORECONF = YES
+LIBPAM_TACPLUS_CONF_OPTS = CC="$(TARGET_CC)" LD="$(TARGET_LD)"
+LIBPAM_TACPLUS_AUTORECONF_OPTS = -I m4
+LIBPAM_TACPLUS_LICENSE = GPLv2+
+LIBPAM_TACPLUS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
1.9.1
