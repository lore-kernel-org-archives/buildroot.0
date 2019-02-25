From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Feb 2019 08:54:56 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/perl: security
 bump to version 5.26.3
Message-ID: <20190225075507.3EF698E37D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bece12dffaf9a3300a3f8c57661750df585bd1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

- [CVE-2018-12015] Directory traversal in module Archive::Tar
- [CVE-2018-18311] Integer overflow leading to buffer overflow and segmentation fault
- [CVE-2018-18312] Heap-buffer-overflow write in S_regatom (regcomp.c)
- [CVE-2018-18313] Heap-buffer-overflow read in S_grok_bslash_N (regcomp.c)
- [CVE-2018-18314] Heap-buffer-overflow write in S_regatom (regcomp.c)

For more details, see perldelta:
https://metacpan.org/changes/release/SHAY/perl-5.26.3

Bump perlcross to 1.2.2 for perl 5.26.3 support.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.hash | 12 ++++++------
 package/perl/perl.mk   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index 210f6d581b..502f0db9df 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://www.cpan.org/src/5.0/perl-5.26.2.tar.xz.{md5,sha1,sha256}.txt
-md5    1fa1b53eeff76aa37b17bfc9b2771671                                 perl-5.26.2.tar.xz
-sha1   bfa5c7921ed7bf5e035dbf2f7ff81367b81e372c                         perl-5.26.2.tar.xz
-sha256 0f8c0fb1b0db4681adb75c3ba0dd77a0472b1b359b9e80efd79fc27b4352132c perl-5.26.2.tar.xz
+# Hashes from: http://www.cpan.org/src/5.0/perl-5.26.3.tar.xz.{md5,sha1,sha256}.txt
+md5    218d73f2334d2f3fdaff5a1f35358247                                 perl-5.26.3.tar.xz
+sha1   ca73432ac07288fdce2063f5e09c642e28584226                         perl-5.26.3.tar.xz
+sha256 e0a17cdaed5304aea1783e507e56bb0001dd72c46f211553ead3a580c3f38135 perl-5.26.3.tar.xz
 
-# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.9/perl-cross-1.1.9.hash
-sha256	0bbb450e48d07e7fdf867d578b1780ac8f0e8dc284d52301dac4d763b42f6041  perl-cross-1.1.9.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.2.2/perl-cross-1.2.2.hash
+sha256	e6987838f27d8cd3368ea68fc56a68cc52371505950927b8b7c5cb76e3a94caa  perl-cross-1.2.2.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 7b4a2710b1..023ef4f776 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -6,14 +6,14 @@
 
 # When updating the version here, also update utils/scancpan
 PERL_VERSION_MAJOR = 26
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
 PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.1.9
+PERL_CROSS_VERSION = 1.2.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
 PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
