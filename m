From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 22 Jul 2014 20:17:55 +0200
Subject: [Buildroot] [PATCH 3/4] perl-path-tiny: new package
In-Reply-To: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
References: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1406053076-25453-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                        |  1 +
 package/perl-path-tiny/Config.in         |  6 ++++++
 package/perl-path-tiny/perl-path-tiny.mk | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/perl-path-tiny/Config.in
 create mode 100644 package/perl-path-tiny/perl-path-tiny.mk

diff --git a/package/Config.in b/package/Config.in
index b89a98e..40d8ba9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -439,6 +439,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
+	source "package/perl-path-tiny/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax-base/Config.in"
diff --git a/package/perl-path-tiny/Config.in b/package/perl-path-tiny/Config.in
new file mode 100644
index 0000000..f85e792
--- /dev/null
+++ b/package/perl-path-tiny/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_PATH_TINY
+	bool "perl-path-tiny"
+	help
+	  File path utility
+
+	  https://github.com/dagolden/Path-Tiny
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
new file mode 100644
index 0000000..7da112d
--- /dev/null
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-path-tiny
+#
+################################################################################
+
+PERL_PATH_TINY_VERSION = 0.055
+PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
+PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN/
+PERL_PATH_TINY_DEPENDENCIES = perl
+PERL_PATH_TINY_LICENSE = apache_2_0
+PERL_PATH_TINY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.9.1
