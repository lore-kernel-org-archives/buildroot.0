From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:44 +0200
Subject: [Buildroot] [git commit] package/perl-http-date: New package
Message-ID: <20150419114640.32C047FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22915566173a90b92c02df5aabef64883628ea0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/perl-http-date/Config.in           |    7 +++++++
 package/perl-http-date/perl-http-date.hash |    3 +++
 package/perl-http-date/perl-http-date.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fa42afb..f091923 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -511,6 +511,7 @@ menu "Perl libraries/modules"
 	source "package/perl-gdtextutil/Config.in"
 	source "package/perl-html-parser/Config.in"
 	source "package/perl-html-tagset/Config.in"
+	source "package/perl-http-date/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-http-date/Config.in b/package/perl-http-date/Config.in
new file mode 100644
index 0000000..c45335f
--- /dev/null
+++ b/package/perl-http-date/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_HTTP_DATE
+	bool "perl-http-date"
+	help
+	  This module provides functions that deal the date formats used by the
+	  HTTP protocol (and then some more)
+
+	  https://github.com/gisle/http-date
diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
new file mode 100644
index 0000000..db85cd0
--- /dev/null
+++ b/package/perl-http-date/perl-http-date.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    52b7a0d5982d61be1edb217751d7daba HTTP-Date-6.02.tar.gz
+sha256 e8b9941da0f9f0c9c01068401a5e81341f0e3707d1c754f8e11f42a7e629e333 HTTP-Date-6.02.tar.gz
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
new file mode 100644
index 0000000..6de95b6
--- /dev/null
+++ b/package/perl-http-date/perl-http-date.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-http-date
+#
+################################################################################
+
+PERL_HTTP_DATE_VERSION = 6.02
+PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
+PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_DATE_DEPENDENCIES = perl
+PERL_HTTP_DATE_LICENSE = Artistic or GPLv1+
+PERL_HTTP_DATE_LICENSE_FILES = README
+
+$(eval $(perl-package))
