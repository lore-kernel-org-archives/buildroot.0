From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  8 Jan 2020 16:10:40 +0100
Subject: [Buildroot] [PATCH v2 4/5] package/perl-mime-base64: remove it
In-Reply-To: <20200108151041.12757-1-francois.perrad@gadz.org>
References: <20200108151041.12757-1-francois.perrad@gadz.org>
Message-ID: <20200108151041.12757-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MIME::Base64 is a Perl core module (ie. bundled with perl)
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy                               |  6 ++++++
 DEVELOPERS                                     |  1 -
 package/Config.in                              |  1 -
 package/perl-mime-base64/Config.in             | 10 ----------
 package/perl-mime-base64/perl-mime-base64.hash |  6 ------
 package/perl-mime-base64/perl-mime-base64.mk   | 14 --------------
 6 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 package/perl-mime-base64/Config.in
 delete mode 100644 package/perl-mime-base64/perl-mime-base64.hash
 delete mode 100644 package/perl-mime-base64/perl-mime-base64.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 297a25994..e1e868531 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,12 @@ config BR2_PACKAGE_PERL_DIGEST_MD5
 	help
 	  Digest::MD5 is a Perl core module (ie. bundled with perl).
 
+config BR2_PACKAGE_PERL_MIME_BASE64
+	bool "perl-mime-base64 was removed"
+	select BR2_LEGACY
+	help
+	  MIME::Base64 is a Perl core module (ie. bundled with perl).
+
 comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_OPENVMTOOLS_PROCPS
diff --git a/DEVELOPERS b/DEVELOPERS
index 071095ef6..ba75f601f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -395,7 +395,6 @@ F:	package/perl-io-html/
 F:	package/perl-lwp-mediatypes/
 F:	package/perl-mail-dkim/
 F:	package/perl-mailtools/
-F:	package/perl-mime-base64/
 F:	package/perl-net-dns/
 F:	package/perl-net-http/
 F:	package/perl-netaddr-ip/
diff --git a/package/Config.in b/package/Config.in
index 6f0432a37..5dab6ba31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -752,7 +752,6 @@ menu "Perl libraries/modules"
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
