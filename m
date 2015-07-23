From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 23 Jul 2015 18:47:19 +0200
Subject: [Buildroot] [PATCH 04/15] perl-http-cookies: fix dependencies
In-Reply-To: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1437670050-27014-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-cookies/Config.in            | 1 +
 package/perl-http-cookies/perl-http-cookies.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index 4dd2fd9..cb5a3c1 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_COOKIES
 	bool "perl-http-cookies"
+	select BR2_PACKAGE_PERL_HTTP_DATE
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	help
 	  Objects that represent a "cookie jar"
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index b3bfa2c..fa3a15a 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_COOKIES_VERSION = 6.01
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_COOKIES_DEPENDENCIES = perl-http-message
+PERL_HTTP_COOKIES_DEPENDENCIES = perl perl-http-date perl-http-message
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPLv1+
 PERL_HTTP_COOKIES_LICENSE_FILES = README
 
-- 
2.1.4
