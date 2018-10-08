From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:45:15 +0200
Subject: [Buildroot] [git commit] perl-plack: new package
Message-ID: <20181008145331.576088E37B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96143601de72fa5efb20a898370dac8280060e6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: split too long DEPENDENCIES line.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                  |  1 +
 package/perl-plack/Config.in       | 20 ++++++++++++++++++++
 package/perl-plack/perl-plack.hash |  6 ++++++
 package/perl-plack/perl-plack.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b2c24c2116..19ee391b3b 100644
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
index 0000000000..b7f5ecf1c6
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
index 0000000000..7324b726ae
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
index 0000000000..380848dc83
--- /dev/null
+++ b/package/perl-plack/perl-plack.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# perl-plack
+#
+################################################################################
+
+PERL_PLACK_VERSION = 1.0047
+PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
+PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
+PERL_PLACK_DEPENDENCIES = \
+	host-perl-file-sharedir-install \
+	perl-apache-logformat-compiler \
+	perl-cookie-baker \
+	perl-devel-stacktrace \
+	perl-devel-stacktrace-ashtml \
+	perl-file-sharedir \
+	perl-filesys-notify-simple \
+	perl-http-entity-parser \
+	perl-http-headers-fast \
+	perl-http-message \
+	perl-hash-multivalue \
+	perl-stream-buffered \
+	perl-try-tiny perl-uri \
+	perl-www-form-urlencoded
+PERL_PLACK_LICENSE = Artistic or GPL-1.0+
+PERL_PLACK_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
