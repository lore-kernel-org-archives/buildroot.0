From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Apr 2019 14:51:32 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/perl: bump to
 version 5.28.2
Message-ID: <20190426130223.9B12C80163@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca48851b8b4f289e85a8f34554a9725296bd6c54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Contains a number of bugfixes since 5.28.1. For details, see:
https://perldoc.pl/perl5282delta

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c68d2ddf923b8ad61c0a6fa147eaa8f76bdf7c1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 5716900821..4604d2715d 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.28.1.tar.xz.{md5,sha1,sha256}.txt
-md5    fbb590c305f2f88578f448581b8cf9c4                                 perl-5.28.1.tar.xz
-sha1   5fc239bebb8c484c3f5c58e663274ce668981651                         perl-5.28.1.tar.xz
-sha256 fea7162d4cca940a387f0587b93f6737d884bf74d8a9d7cfd978bc12cd0b202d perl-5.28.1.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.28.2.tar.xz.{md5,sha1,sha256}.txt
+md5    6bb75770e9ba085b32bf13e4be71e4ac                                 perl-5.28.2.tar.xz
+sha1   e7be78eca9ac5596783e6abcf957408050a7b650                         perl-5.28.2.tar.xz
+sha256 0b0189bfa4b2da20e899b4bdd746ac402e8f746a58e4fcf5516484157f2aab07 perl-5.28.2.tar.xz
 
-# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.2.1/perl-cross-1.2.1.hash
-sha256	8b706bc688ddf71b62d649bde72f648669f18b37fe0c54ec6201142ca3943498  perl-cross-1.2.1.tar.gz
+# Hashes from: https://github.com/arsv/perl-cross/releases/download/1.2.3/perl-cross-1.2.3.hash
+sha256 84583a1bb5f3a2c64d13d031386c114382e5c62955c6f84a27cec8318536627c perl-cross-1.2.3.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 9205ef64f9..ecb21c4b85 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,14 +6,14 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 28
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.2.1
+PERL_CROSS_VERSION = 1.2.3
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
