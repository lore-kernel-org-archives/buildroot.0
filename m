From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 22 Jul 2014 20:17:56 +0200
Subject: [Buildroot] [PATCH 4/4] perl-try-tiny: new package
In-Reply-To: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
References: <1406053076-25453-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1406053076-25453-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                      |  1 +
 package/perl-try-tiny/Config.in        |  6 ++++++
 package/perl-try-tiny/perl-try-tiny.mk | 14 ++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/perl-try-tiny/Config.in
 create mode 100644 package/perl-try-tiny/perl-try-tiny.mk

diff --git a/package/Config.in b/package/Config.in
index 40d8ba9..7c9f3ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -440,6 +440,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-path-tiny/Config.in"
+	source "package/perl-try-tiny/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax-base/Config.in"
diff --git a/package/perl-try-tiny/Config.in b/package/perl-try-tiny/Config.in
new file mode 100644
index 0000000..7bd5396
--- /dev/null
+++ b/package/perl-try-tiny/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_TRY_TINY
+	bool "perl-try-tiny"
+	help
+	  minimal try/catch with proper preservation of $@
+
+	  http://metacpan.org/release/Try-Tiny
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
new file mode 100644
index 0000000..2446cbd
--- /dev/null
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-try-tiny
+#
+################################################################################
+
+PERL_TRY_TINY_VERSION = 0.22
+PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
+PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY/
+PERL_TRY_TINY_DEPENDENCIES = perl
+PERL_TRY_TINY_LICENSE = mit
+PERL_TRY_TINY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.9.1
