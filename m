From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:24 +0200
Subject: [Buildroot] [PATCH 20/20] perl-plack: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-21-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/perl-plack/Config.in       | 20 ++++++++++++++++++++
 package/perl-plack/perl-plack.hash |  6 ++++++
 package/perl-plack/perl-plack.mk   | 14 ++++++++++++++
 4 files changed, 41 insertions(+)
 create mode 100644 package/perl-plack/Config.in
 create mode 100644 package/perl-plack/perl-plack.hash
 create mode 100644 package/perl-plack/perl-plack.mk

diff --git a/package/Config.in b/package/Config.in
index b33fd82d8..9734ef576 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -742,6 +742,7 @@ menu "Perl libraries/modules"
 	source "package/perl-package-stash/Config.in"
 	source "package/perl-params-util/Config.in"
 	source "package/perl-path-tiny/Config.in"
+	source "package/perl-plack/Config.in"
 	source "package/perl-posix-strftime-compiler/Config.in"
 	source "package/perl-stream-buffered/Config.in"
 	source "package/perl-sub-install/Config.in"
diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
new file mode 100644
index 000000000..b7f5ecf1c
--- /dev/null
+++ b/package/perl-plack/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_PERL_PLACK
+	bool "perl-plack"
+	select BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER
+	select BR2_PACKAGE_PERL_COOKIE_BAKER
+	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE
+	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE_ASHTML
+	select BR2_PACKAGE_PERL_FILE_SHAREDIR
+	select BR2_PACKAGE_PERL_FILESYS_NOTIFY_SIMPLE
+	select BR2_PACKAGE_PERL_HTTP_ENTITY_PARSER
+	select BR2_PACKAGE_PERL_HTTP_HEADERS_FAST
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE
+	select BR2_PACKAGE_PERL_HASH_MULTIVALUE
+	select BR2_PACKAGE_PERL_STREAM_BUFFERED
+	select BR2_PACKAGE_PERL_TRY_TINY
+	select BR2_PACKAGE_PERL_URI
+	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED
+	help
+	  Perl Superglue for Web frameworks and Web Servers (PSGI toolkit)
+
+	  https://github.com/plack/Plack
diff --git a/package/perl-plack/perl-plack.hash b/package/perl-plack/perl-plack.hash
new file mode 100644
index 000000000..7324b726a
--- /dev/null
+++ b/package/perl-plack/perl-plack.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9d37086aec1b29bab52a9575687e3557 Plack-1.0047.tar.gz
+sha256 322c93f5acc0a0f0e11fd4a76188f978bdc14338a9f1df3ae535227017046561 Plack-1.0047.tar.gz
+
+# computed by scancpan
+sha256 fb67655b5d1adedef83aed2c79bf4f89c68d8595a7060815520173f663a3631d LICENSE
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
new file mode 100644
index 000000000..38c3d34ac
--- /dev/null
+++ b/package/perl-plack/perl-plack.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-plack
+#
+################################################################################
+
+PERL_PLACK_VERSION = 1.0047
+PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
+PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
+PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install perl-apache-logformat-compiler perl-cookie-baker perl-devel-stacktrace perl-devel-stacktrace-ashtml perl-file-sharedir perl-filesys-notify-simple perl-http-entity-parser perl-http-headers-fast perl-http-message perl-hash-multivalue perl-stream-buffered perl-try-tiny perl-uri perl-www-form-urlencoded
+PERL_PLACK_LICENSE = Artistic or GPL-1.0+
+PERL_PLACK_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.17.1
