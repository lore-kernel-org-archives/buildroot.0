From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 22 Dec 2019 17:21:45 +0100
Subject: [Buildroot] [PATCH 4/5] package/perl-mime-base: remove it
In-Reply-To: <20191222162146.1947-1-francois.perrad@gadz.org>
References: <20191222162146.1947-1-francois.perrad@gadz.org>
Message-ID: <20191222162146.1947-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIME::Base64 is a Perl core module
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                              |  1 -
 package/perl-mime-base64/Config.in             | 10 ----------
 package/perl-mime-base64/perl-mime-base64.hash |  6 ------
 package/perl-mime-base64/perl-mime-base64.mk   | 14 --------------
 4 files changed, 31 deletions(-)
 delete mode 100644 package/perl-mime-base64/Config.in
 delete mode 100644 package/perl-mime-base64/perl-mime-base64.hash
 delete mode 100644 package/perl-mime-base64/perl-mime-base64.mk

diff --git a/package/Config.in b/package/Config.in
index b164a5a7e..8ab40f666 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -751,7 +751,6 @@ menu "Perl libraries/modules"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-math-prime-util/Config.in"
-	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-tools/Config.in"
 	source "package/perl-module-implementation/Config.in"
diff --git a/package/perl-mime-base64/Config.in b/package/perl-mime-base64/Config.in
deleted file mode 100644
index ecb3d2ee6..000000000
--- a/package/perl-mime-base64/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_PERL_MIME_BASE64
-	bool "perl-mime-base64"
-	depends on !BR2_STATIC_LIBS
-	help
-	  The RFC 2045 encodings; base64 and quoted-printable.
-
-	  https://metacpan.org/release/MIME-Base64
-
-comment "perl-mime-base64 needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
diff --git a/package/perl-mime-base64/perl-mime-base64.hash b/package/perl-mime-base64/perl-mime-base64.hash
deleted file mode 100644
index 77bd7b063..000000000
--- a/package/perl-mime-base64/perl-mime-base64.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    ef958dc2bf96be5f759391c6ac1debd4 MIME-Base64-3.15.tar.gz
-sha256 7f863566a6a9cb93eda93beadb77d9aa04b9304d769cea3bb921b9a91b3a1eb9 MIME-Base64-3.15.tar.gz
-
-# computed by scancpan
-sha256 08e6898e3d62619e83880832ec42ae8a2984257e4c244843db9d3b9b7fcff236 README
diff --git a/package/perl-mime-base64/perl-mime-base64.mk b/package/perl-mime-base64/perl-mime-base64.mk
deleted file mode 100644
index 201707d46..000000000
--- a/package/perl-mime-base64/perl-mime-base64.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# perl-mime-base64
-#
-################################################################################
-
-PERL_MIME_BASE64_VERSION = 3.15
-PERL_MIME_BASE64_SOURCE = MIME-Base64-$(PERL_MIME_BASE64_VERSION).tar.gz
-PERL_MIME_BASE64_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_MIME_BASE64_LICENSE = Artistic or GPL-1.0+
-PERL_MIME_BASE64_LICENSE_FILES = README
-PERL_MIME_BASE64_DISTNAME = MIME-Base64
-
-$(eval $(perl-package))
-- 
2.20.1
