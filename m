From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  5 Sep 2015 08:36:05 +0200
Subject: [Buildroot] [PATCH 1/2] perl: bump to version 5.22.0
Message-ID: <1441434966-29518-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash   | 10 +++++-----
 package/perl/perl.mk     |  8 ++++----
 support/scripts/scancpan |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 0ee587e..2e3af95 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.20.2.tar.bz2.{md5,sha1,sha256}.txt
-md5    21062666f1c627aeb6dbff3c6952738b                                 perl-5.20.2.tar.bz2
-sha1   63126c683b4c79c35008a47d56f7beae876c569f                         perl-5.20.2.tar.bz2
-sha256 e5a4713bc65e1da98ebd833dce425c000768bfe84d17ec5183ec5ca249db71ab perl-5.20.2.tar.bz2
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.22.0.tar.bz2.{md5,sha1,sha256}.txt
+md5    f67b152160431b3180fb766bdc2d02e2                                 perl-5.22.0.tar.bz2
+sha1   400338c91c56420d98142cbfcb84d418cae2c98c                         perl-5.22.0.tar.bz2
+sha256 3689fdb519133d039f49e12834764ff4c1de8f8d925dea44a952ca110d0ac9f7 perl-5.22.0.tar.bz2
 
 # No upstream hashes for the following
-sha256 36cabbc937cc66e59c8ae414d7753190d54a022cae0012c09ee5bbee78bc0aa0 perl-5.20.2-cross-0.9.7.tar.gz
+sha256 92ac19149eacfeb5dbddae229fecabdc1bef7ad130da2ea6c05a166167ac696a perl-5.22.0-cross-1.0.0.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 1e6a054..b9f90e4 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-PERL_VERSION_MAJOR = 20
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION_MAJOR = 22
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.9.7
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_CROSS_VERSION = 1.0.0
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
 PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 947d248..8268c36 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -471,7 +471,7 @@ unshift @INC, sub {
 } # END OF FATPACK CODE
 
 
-use 5.020;      # same major version as target perl
+use 5.022;      # same major version as target perl
 use strict;
 use warnings;
 use Fatal qw(open close);
-- 
2.1.4
