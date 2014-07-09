From: David Bachelart <david.bachelart@bbright.com>
Date: Wed,  9 Jul 2014 13:55:38 +0200
Subject: [Buildroot] [PATCH 1/1] ccrypt: new package
Message-ID: <1404906938-7965-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ccrypt is a utility for encrypting and decrypting files and streams.

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
 package/Config.in        |    1 +
 package/ccrypt/Config.in |    6 ++++++
 package/ccrypt/ccrypt.mk |   12 ++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/ccrypt/Config.in
 create mode 100644 package/ccrypt/ccrypt.mk

diff --git a/package/Config.in b/package/Config.in
index f30c25f..c626968 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1094,6 +1094,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 comment "Utilities"
 	source "package/at/Config.in"
+	source "package/ccrypt/Config.in"
 	source "package/dialog/Config.in"
 	source "package/dtach/Config.in"
 	source "package/file/Config.in"
diff --git a/package/ccrypt/Config.in b/package/ccrypt/Config.in
new file mode 100644
index 0000000..99c4d47
--- /dev/null
+++ b/package/ccrypt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_CCRYPT
+        bool "ccrypt"
+        help
+          ccrypt is a utility for encrypting and decrypting files and streams.
+
+          http://ccrypt.sourceforge.net/
diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
new file mode 100644
index 0000000..a32f149
--- /dev/null
+++ b/package/ccrypt/ccrypt.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# ccrypt
+#
+################################################################################
+
+CCRYPT_VERSION = 1.10
+CCRYPT_SITE = http://ccrypt.sourceforge.net/download/
+
+CCRYPT_LICENSE = GPLv2+
+
+$(eval $(autotools-package))
-- 
1.7.10.4
