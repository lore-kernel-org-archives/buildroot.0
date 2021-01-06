From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Wed,  6 Jan 2021 21:52:06 +0100
Subject: [Buildroot] [PATCH] package/simple-mail: new package
Message-ID: <20210106205206.433749-1-zgyarmati@zgyarmati.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/simple-mail/Config.in        |  9 +++++++++
 package/simple-mail/simple-mail.hash |  5 +++++
 package/simple-mail/simple-mail.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/simple-mail/Config.in
 create mode 100644 package/simple-mail/simple-mail.hash
 create mode 100644 package/simple-mail/simple-mail.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 258a51a14c..334b8f76db 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2821,4 +2821,5 @@ F:	package/python-iniparse/
 F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
+F:	package/simple-mail/
 F:	package/tinc/
diff --git a/package/Config.in b/package/Config.in
index 7264198001..c4d950b438 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -348,6 +348,7 @@ comment "QT libraries and helper libraries"
 	source "package/qjson/Config.in"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
+	source "package/simple-mail/Config.in"
 endif
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
diff --git a/package/simple-mail/Config.in b/package/simple-mail/Config.in
new file mode 100644
index 0000000000..681a8410db
--- /dev/null
+++ b/package/simple-mail/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SIMPLE_MAIL
+	bool "simple-mail"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_OPENSSL
+	help
+	  An SMTP library written in C++ for Qt.
+
+	  https://github.com/cutelyst/simple-mail
diff --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple-mail.hash
new file mode 100644
index 0000000000..6126d786c5
--- /dev/null
+++ b/package/simple-mail/simple-mail.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  56e258612620af41d77eb7294aed84fbdd8eea42b0cf00e8620b1ee0059144d5  simple-mail-2.2.0.tar.gz
+
+# Hash for license file
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
new file mode 100644
index 0000000000..61a806e1ed
--- /dev/null
+++ b/package/simple-mail/simple-mail.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# simple-mail
+#
+################################################################################
+
+SIMPLE_MAIL_VERSION = 2.2.0
+SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
+SIMPLE_MAIL_INSTALL_STAGING = YES
+SIMPLE_MAIL_LICENSE = LGPL-2.1+
+SIMPLE_MAIL_LICENSE_FILES = LICENSE
+SIMPLE_MAIL_DEPENDENCIES = qt5base
+
+$(eval $(cmake-package))
-- 
2.25.1
