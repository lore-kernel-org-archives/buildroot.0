From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:45 +0200
Subject: [Buildroot] [git commit] package/perl-www-robotrules: New package
Message-ID: <20150419114640.9FD517FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4c24d19b25929c3c21efa58409164d8878b4781
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/perl-www-robotrules/Config.in              |    8 ++++++++
 .../perl-www-robotrules/perl-www-robotrules.hash   |    3 +++
 package/perl-www-robotrules/perl-www-robotrules.mk |   14 ++++++++++++++
 4 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b3c87d6..530add8 100644
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
