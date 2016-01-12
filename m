From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 22:27:50 +0100
Subject: [Buildroot] [git commit] perl: bump to version 5.22.1
Message-ID: <20160112214906.DC6BE81E9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d8cb15c4e822f87d9fbdb3a797d6ff51557857a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 10 +++++-----
 package/perl/perl.mk   |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 76e959c..3f1bd1a 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.22.0.tar.bz2.{md5,sha1,sha256}.txt
-md5    f67b152160431b3180fb766bdc2d02e2                                 perl-5.22.0.tar.bz2
-sha1   400338c91c56420d98142cbfcb84d418cae2c98c                         perl-5.22.0.tar.bz2
-sha256 3689fdb519133d039f49e12834764ff4c1de8f8d925dea44a952ca110d0ac9f7 perl-5.22.0.tar.bz2
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.22.1.tar.bz2.{md5,sha1,sha256}.txt
+md5    67242b9bd642b458bec884ed2a040910                                 perl-5.22.1.tar.bz2
+sha1   29f9b320b0299577a3e1d02e9e8ef8f26f160332                         perl-5.22.1.tar.bz2
+sha256 e98e4075a3167fa40524abe447c30bcca10c60e02a54ee1361eff278947a1221 perl-5.22.1.tar.bz2
 
 # No upstream hashes for the following
-sha256 2f972534820b028da92400e25dfcaab155232e3b118e2f91a5b63c624b49f5e8 perl-5.22.0-cross-1.0.1.tar.gz
+sha256 250ab6e6c034a8b7ae447fa2b453fa0b61ebb7db4d039eba60c52e44ab5899bd perl-5.22.1-cross-1.0.2.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index f3b7b2b..0bd10ad 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,17 +5,17 @@
 ################################################################################
 
 PERL_VERSION_MAJOR = 22
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.0.1
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_CROSS_VERSION = 1.0.2
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
 # DO NOT refactor with the github helper (the result is not the same)
-PERL_CROSS_SITE = http://raw.github.com/arsv/perl-cross/releases
+PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 
