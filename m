From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:21:33 +0200
Subject: [Buildroot] [git commit] package/perl: security bump to version
 5.30.3
Message-ID: <20200604212152.17B367F9B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13ceb980a236eff32661cef2e54e4828f598dc80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

[CVE-2020-10543] Buffer overflow caused by a crafted regular
                 expression

[CVE-2020-10878] Integer overflow via malformed bytecode produced by a
                 crafted regular expression

[CVE-2020-12723] Buffer overflow caused by a crafted regular
                 expression

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 21704a8bb4..ba3a39d433 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,10 +1,10 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.30.2.tar.xz.{md5,sha1,sha256}.txt
-md5  4bfa12b528522a50de0470b8b70b9b3b  perl-5.30.2.tar.xz
-sha1  d82cdaa610a3e749e821fc77004b1b4bfd5ebd28  perl-5.30.2.tar.xz
-sha256  a1aa88bd6fbbdc2e82938afbb76c408b0ea847317737b712dc196cc7907a5259  perl-5.30.2.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.30.3.tar.xz.{md5,sha1,sha256}.txt
+md5  0af2ab0f01ec13e37cc13a27de930936  perl-5.30.3.tar.xz
+sha1  1003c6aa71d8966501038178459a9fa4e9aba747  perl-5.30.3.tar.xz
+sha256  6967595f2e3f3a94544c35152f9a25e0cb8ea24ae45f4bf1882f2e33f4a400f4  perl-5.30.3.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.3/perl-cross-1.3.3.hash
-sha256  3cea71d443cd28c6aa3c3c79d6db38267303cfac8e54b8a6d7ef8d448deefb25  perl-cross-1.3.3.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.hash
+sha256  755aa0ca8141a942188a269564f86c3c82349f82c346ed5c992495d7f35138ba  perl-cross-1.3.4.tar.gz
 
 # Locally calculated
 sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 64d453cada..2f82e1d6d5 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,14 +6,14 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 30
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.3.3
+PERL_CROSS_VERSION = 1.3.4
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
