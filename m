From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:31 +0200
Subject: [Buildroot] [PATCH 18/20] perl-www-robotrules: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-19-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                    |    1 +
 package/perl-www-robotrules/Config.in                |    8 ++++++++
 package/perl-www-robotrules/perl-www-robotrules.hash |    3 +++
 package/perl-www-robotrules/perl-www-robotrules.mk   |   14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-www-robotrules/Config.in
 create mode 100644 package/perl-www-robotrules/perl-www-robotrules.hash
 create mode 100644 package/perl-www-robotrules/perl-www-robotrules.mk

diff --git a/package/Config.in b/package/Config.in
index 3e421c5..3b73934 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -530,6 +530,7 @@ menu "Perl libraries/modules"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-uri/Config.in"
+	source "package/perl-www-robotrules/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax/Config.in"
diff --git a/package/perl-www-robotrules/Config.in b/package/perl-www-robotrules/Config.in
new file mode 100644
index 0000000..83dbcfb
--- /dev/null
+++ b/package/perl-www-robotrules/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_WWW_ROBOTRULES
+	bool "perl-www-robotrules"
+	select PERL_URI
+	help
+	  This module provides functions that deal the date formats used by the
+	  HTTP protocol (and then some more)
+
+	  http://github.com/gisle/www-robotrules
diff --git a/package/perl-www-robotrules/perl-www-robotrules.hash b/package/perl-www-robotrules/perl-www-robotrules.hash
new file mode 100644
index 0000000..9091a29
--- /dev/null
+++ b/package/perl-www-robotrules/perl-www-robotrules.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b7186e8b8b3701e70c22abf430742403 WWW-RobotRules-6.02.tar.gz
+sha256 46b502e7a288d559429891eeb5d979461dd3ecc6a5c491ead85d165b6e03a51e WWW-RobotRules-6.02.tar.gz
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
new file mode 100644
index 0000000..0c68b98
--- /dev/null
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-www-robotrules
+#
+################################################################################
+
+PERL_WWW_ROBOTRULES_VERSION = 6.02
+PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
+PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_WWW_ROBOTRULES_DEPENDENCIES = perl-uri
+PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPLv1+
+PERL_WWW_ROBOTRULES_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4
