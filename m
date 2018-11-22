From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 22 Nov 2018 19:22:15 +0100
Subject: [Buildroot] [PATCH] perl-time-hires: remove it
Message-ID: <20181122182215.17910-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this is a core module (ie. included in the Perl distribution)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/perl-time-hires/Config.in            | 10 ----------
 package/perl-time-hires/perl-time-hires.hash |  6 ------
 package/perl-time-hires/perl-time-hires.mk   | 14 --------------
 5 files changed, 32 deletions(-)
 delete mode 100644 package/perl-time-hires/Config.in
 delete mode 100644 package/perl-time-hires/perl-time-hires.hash
 delete mode 100644 package/perl-time-hires/perl-time-hires.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 53467da48..6f687d748 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -351,7 +351,6 @@ F:	package/perl-mime-base64/
 F:	package/perl-net-dns/
 F:	package/perl-net-http/
 F:	package/perl-netaddr-ip/
-F:	package/perl-time-hires/
 F:	package/perl-timedate/
 F:	package/perl-uri/
 F:	package/perl-www-robotrules/
diff --git a/package/Config.in b/package/Config.in
index b60e7700a..038ddf6b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -756,7 +756,6 @@ menu "Perl libraries/modules"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-sys-mmap/Config.in"
-	source "package/perl-time-hires/Config.in"
 	source "package/perl-time-parsedate/Config.in"
 	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
diff --git a/package/perl-time-hires/Config.in b/package/perl-time-hires/Config.in
deleted file mode 100644
index db2ca039c..000000000
--- a/package/perl-time-hires/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PERL_TIME_HIRES
-	bool "perl-time-hires"
-	depends on !BR2_STATIC_LIBS
-	help
-	  High resolution alarm, sleep, gettimeofday, interval timers.
-
-	  https://metacpan.org/release/Time-HiRes
-
-comment "perl-time-hires needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/perl-time-hires/perl-time-hires.hash b/package/perl-time-hires/perl-time-hires.hash
deleted file mode 100644
index 426076668..000000000
--- a/package/perl-time-hires/perl-time-hires.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    8f998cb60966c86e24c500016e4d1ce8 Time-HiRes-1.9758.tar.gz
-sha256 5bfa145bc11e70a8e337543b1084a293743a690691b568493455dedf58f34b1e Time-HiRes-1.9758.tar.gz
-
-# computed by scancpan
-sha256 ecc20782bd6c34d2d632356020f9ad0150c7ae1803ae9560258d76d4533030da README
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
deleted file mode 100644
index 03322c3fb..000000000
--- a/package/perl-time-hires/perl-time-hires.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# perl-time-hires
-#
-################################################################################
-
-PERL_TIME_HIRES_VERSION = 1.9758
-PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
-PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JH/JHI
-PERL_TIME_HIRES_LICENSE = Artistic or GPL-1.0+
-PERL_TIME_HIRES_LICENSE_FILES = README
-PERL_TIME_HIRES_DISTNAME = Time-HiRes
-
-$(eval $(perl-package))
-- 
2.17.1
