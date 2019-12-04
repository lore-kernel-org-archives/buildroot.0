From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  4 Dec 2019 09:33:50 +0100
Subject: [Buildroot] [PATCH 8/8] package/perl-http-date: bump to version 6.05
In-Reply-To: <20191204083351.6134-1-francois.perrad@gadz.org>
References: <20191204083351.6134-1-francois.perrad@gadz.org>
Message-ID: <20191204083351.6134-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

license lives now in its own file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-date/Config.in           | 5 +++--
 package/perl-http-date/perl-http-date.hash | 6 +++---
 package/perl-http-date/perl-http-date.mk   | 6 +++---
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/perl-http-date/Config.in b/package/perl-http-date/Config.in
index 12524e6da..c5151f2ec 100644
--- a/package/perl-http-date/Config.in
+++ b/package/perl-http-date/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_HTTP_DATE
 	bool "perl-http-date"
+	select BR2_PACKAGE_PERL_TIMEDATE # runtime
 	help
-	  date conversion routines.
+	  HTTP::Date - date conversion routines.
 
-	  https://metacpan.org/release/HTTP-Date
+	  https://github.com/libwww-perl/HTTP-Date
diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
index f74ca0cd8..7c1fa5b9c 100644
--- a/package/perl-http-date/perl-http-date.hash
+++ b/package/perl-http-date/perl-http-date.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    52b7a0d5982d61be1edb217751d7daba HTTP-Date-6.02.tar.gz
-sha256 e8b9941da0f9f0c9c01068401a5e81341f0e3707d1c754f8e11f42a7e629e333 HTTP-Date-6.02.tar.gz
+md5    2ecbb3aedf6aef062605191813ca3027 HTTP-Date-6.05.tar.gz
+sha256 365d6294dfbd37ebc51def8b65b81eb79b3934ecbc95a2ec2d4d827efe6a922b HTTP-Date-6.05.tar.gz
 
 # computed by scancpan
-sha256 fad3a7732ff63e3521b94baea45d82a300edf8e0a5cf571ef2661c894e196632 README
+sha256 305b71c4d2fd6380585689c5f1c620737a36a318ce0f9c772badce0fe293a44e LICENSE
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 5dc91f31d..43583be30 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_HTTP_DATE_VERSION = 6.02
+PERL_HTTP_DATE_VERSION = 6.05
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
-PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DATE_LICENSE = Artistic or GPL-1.0+
-PERL_HTTP_DATE_LICENSE_FILES = README
+PERL_HTTP_DATE_LICENSE_FILES = LICENSE
 PERL_HTTP_DATE_DISTNAME = HTTP-Date
 
 $(eval $(perl-package))
-- 
2.20.1
