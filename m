From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:27 +0200
Subject: [Buildroot] [PATCH 14/20] perl-http-cookies: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-15-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                |    1 +
 package/perl-http-cookies/Config.in              |    7 +++++++
 package/perl-http-cookies/perl-http-cookies.hash |    3 +++
 package/perl-http-cookies/perl-http-cookies.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/perl-http-cookies/Config.in
 create mode 100644 package/perl-http-cookies/perl-http-cookies.hash
 create mode 100644 package/perl-http-cookies/perl-http-cookies.mk

diff --git a/package/Config.in b/package/Config.in
index 4725c23..4b43207 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -512,6 +512,7 @@ menu "Perl libraries/modules"
 	source "package/perl-gdtextutil/Config.in"
 	source "package/perl-html-parser/Config.in"
 	source "package/perl-html-tagset/Config.in"
+	source "package/perl-http-cookies/Config.in"
 	source "package/perl-http-date/Config.in"
 	source "package/perl-http-message/Config.in"
 	source "package/perl-io-html/Config.in"
diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
new file mode 100644
index 0000000..4dd2fd9
--- /dev/null
+++ b/package/perl-http-cookies/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_HTTP_COOKIES
+	bool "perl-http-cookies"
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE
+	help
+	  Objects that represent a "cookie jar"
+
+	  http://github.com/gisle/http-cookies
diff --git a/package/perl-http-cookies/perl-http-cookies.hash b/package/perl-http-cookies/perl-http-cookies.hash
new file mode 100644
index 0000000..94e5f31
--- /dev/null
+++ b/package/perl-http-cookies/perl-http-cookies.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    ecfd0eeb88512033352c2f13c9580f03 HTTP-Cookies-6.01.tar.gz
+sha256 f5d3ade383ce6389d80cb0d0356b643af80435bb036afd8edce335215ec5eb20 HTTP-Cookies-6.01.tar.gz
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
new file mode 100644
index 0000000..b3bfa2c
--- /dev/null
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-http-cookies
+#
+################################################################################
+
+PERL_HTTP_COOKIES_VERSION = 6.01
+PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
+PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_COOKIES_DEPENDENCIES = perl-http-message
+PERL_HTTP_COOKIES_LICENSE = Artistic or GPLv1+
+PERL_HTTP_COOKIES_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4
