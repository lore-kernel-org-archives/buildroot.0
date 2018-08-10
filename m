From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:46 -0700
Subject: [Buildroot] [PATCH 02/18] perl-astro-suntime: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-3-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                                  |  1 +
 package/perl-astro-suntime/Config.in               |  6 ++++++
 package/perl-astro-suntime/perl-astro-suntime.hash |  6 ++++++
 package/perl-astro-suntime/perl-astro-suntime.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-astro-suntime/Config.in
 create mode 100644 package/perl-astro-suntime/perl-astro-suntime.hash
 create mode 100644 package/perl-astro-suntime/perl-astro-suntime.mk

diff --git a/package/Config.in b/package/Config.in
index 8b80276fb1..97a108535b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -666,6 +666,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
+	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
diff --git a/package/perl-astro-suntime/Config.in b/package/perl-astro-suntime/Config.in
new file mode 100644
index 0000000000..22e2cb1aa2
--- /dev/null
+++ b/package/perl-astro-suntime/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_ASTRO_SUNTIME
+	bool "perl-astro-suntime"
+	help
+	  A functional module for calculating sunrise/sunset times
+
+	  https://metacpan.org/release/Astro-SunTime
diff --git a/package/perl-astro-suntime/perl-astro-suntime.hash b/package/perl-astro-suntime/perl-astro-suntime.hash
new file mode 100644
index 0000000000..e75293d4fb
--- /dev/null
+++ b/package/perl-astro-suntime/perl-astro-suntime.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    42cb8c94de8a111ed652196925c22a45 Astro-SunTime-0.06.tar.gz
+sha256 b4a44fddfc055cc42ee67bfd8939354793da7512ea04f30578d42dc6a701112a Astro-SunTime-0.06.tar.gz
+
+# computed by scancpan
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE
diff --git a/package/perl-astro-suntime/perl-astro-suntime.mk b/package/perl-astro-suntime/perl-astro-suntime.mk
new file mode 100644
index 0000000000..a35291b1db
--- /dev/null
+++ b/package/perl-astro-suntime/perl-astro-suntime.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-astro-suntime
+#
+################################################################################
+
+PERL_ASTRO_SUNTIME_VERSION = 0.06
+PERL_ASTRO_SUNTIME_SOURCE = Astro-SunTime-$(PERL_ASTRO_SUNTIME_VERSION).tar.gz
+PERL_ASTRO_SUNTIME_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
+PERL_ASTRO_SUNTIME_DEPENDENCIES = host-perl-module-build
+PERL_ASTRO_SUNTIME_LICENSE = gpl_3
+PERL_ASTRO_SUNTIME_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4
