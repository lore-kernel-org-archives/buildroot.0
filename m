From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Nov 2019 17:53:30 +0100
Subject: [Buildroot] [PATCH] package/perl: bump to version 5.30.1
Message-ID: <20191122165330.22208-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...01-fix-the-generated-subdirectory-Makefiles.patch |  2 ++
 package/perl/perl.hash                               | 12 ++++++------
 package/perl/perl.mk                                 |  6 +++---
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
index 178c7baa5..ae1ce0699 100644
--- a/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
+++ b/package/perl/0001-fix-the-generated-subdirectory-Makefiles.patch
@@ -7,6 +7,8 @@ all variables used by BR must be propagated
 
 similar to https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/commit/98e8532fffe5afa8186329acc44fb957427f1823
 
+see https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/pull/331, merged in EU-MM v7.35_08
+
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm | 2 +-
diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 4604d2715..344e04446 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.28.2.tar.xz.{md5,sha1,sha256}.txt
-md5    6bb75770e9ba085b32bf13e4be71e4ac                                 perl-5.28.2.tar.xz
-sha1   e7be78eca9ac5596783e6abcf957408050a7b650                         perl-5.28.2.tar.xz
-sha256 0b0189bfa4b2da20e899b4bdd746ac402e8f746a58e4fcf5516484157f2aab07 perl-5.28.2.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.30.1.tar.xz.{md5,sha1,sha256}.txt
+md5    f399f3aaee90ddcff5eadd3bccdaacc0                                 perl-5.30.1.tar.xz
+sha1   4bc190b6ac368f573e6a028f91430f831d40d30a                         perl-5.30.1.tar.xz
+sha256 7336cd3ed0535eb61b76a71350effcfa7c88b44faf37d64d70952ced5d38cd35 perl-5.30.1.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.2.3/perl-cross-1.2.3.hash
-sha256 84583a1bb5f3a2c64d13d031386c114382e5c62955c6f84a27cec8318536627c perl-cross-1.2.3.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.3.1/perl-cross-1.3.1.hash
+sha256	edce0b0c2f725e2db3f203d6d8e9f3f7161256f5d1590551e40694f21200141d perl-cross-1.3.1.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index ecb21c4b8..0ab81ddb3 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,15 +5,15 @@
 ################################################################################
 
 # When updating the version here, also update utils/scancpan
-PERL_VERSION_MAJOR = 28
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION_MAJOR = 30
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.2.3
+PERL_CROSS_VERSION = 1.3.1
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
-- 
2.20.1
