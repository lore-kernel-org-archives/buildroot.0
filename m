From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 16 Dec 2014 15:47:58 +0100
Subject: [Buildroot] [PATCH 1/1] add new package tinc
Message-ID: <1418741278-32077-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/Config.in      |  1 +
 package/tinc/Config.in | 11 +++++++++++
 package/tinc/tinc.mk   | 13 +++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/tinc/Config.in
 create mode 100644 package/tinc/tinc.mk

diff --git a/package/Config.in b/package/Config.in
index 48be2df..a2cbfb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1139,6 +1139,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/tftpd/Config.in"
 endif
 	source "package/thttpd/Config.in"
+	source "package/tinc/Config.in"
 	source "package/tinyhttpd/Config.in"
 	source "package/tn5250/Config.in"
 	source "package/transmission/Config.in"
diff --git a/package/tinc/Config.in b/package/tinc/Config.in
new file mode 100644
index 0000000..538d396
--- /dev/null
+++ b/package/tinc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_TINC
+	bool "tinc"
+	select BR2_PACKAGE_LZO
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  tinc is a Virtual Private Network (VPN) daemon that uses tunnelling and
+	  encryption to create a secure private network between hosts on the
+	  Internet.
+
+	  http://www.tinc-vpn.org/
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
new file mode 100644
index 0000000..246b2f5
--- /dev/null
+++ b/package/tinc/tinc.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# tinc
+#
+################################################################################
+
+TINC_VERSION = 1.0.24
+TINC_SITE = http://www.tinc-vpn.org/packages
+TINC_DEPENDENCIES = lzo openssl zlib
+TINC_LICENSE = GPLv2
+TINC_LICENSE_FILES = COPYING COPYING.README
+
+$(eval $(autotools-package))
-- 
2.1.0
