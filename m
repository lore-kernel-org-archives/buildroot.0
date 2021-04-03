From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Apr 2021 15:53:29 +0200
Subject: [Buildroot] [git commit] perl-html-parser: bump version to 3.76
Message-ID: <20210403132817.0A895890EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfce8c7b7e0afdbd7d40fc92f4b1d737e865ab8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added by scancpan:
- runtime dependencies
- new project URL
- new SITE

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-html-parser/Config.in             | 4 +++-
 package/perl-html-parser/perl-html-parser.hash | 4 ++--
 package/perl-html-parser/perl-html-parser.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/perl-html-parser/Config.in b/package/perl-html-parser/Config.in
index 10cd95e484..191d1b3b76 100644
--- a/package/perl-html-parser/Config.in
+++ b/package/perl-html-parser/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_PERL_HTML_PARSER
 	bool "perl-html-parser"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_HTML_TAGSET # runtime
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
+	select BR2_PACKAGE_PERL_URI # runtime
 	help
 	  HTML parser class.
 
-	  https://metacpan.org/release/HTML-Parser
+	  https://github.com/libwww-perl/HTML-Parser
 
 comment "perl-html-parser needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index 021ef26c65..36b094a7cb 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  65bf65aa8b34b35443e094010f991406  HTML-Parser-3.75.tar.gz
-sha256  ac6b5e25a8df7af54885201e91c45fb9ab6744c08cedc1a38fcc7d95d21193a9  HTML-Parser-3.75.tar.gz
+md5  60e266d5a07fbea671a0383dd8af7b6c  HTML-Parser-3.76.tar.gz
+sha256  64d9e2eb2b420f1492da01ec0e6976363245b4be9290f03f10b7d2cb63fa2f61  HTML-Parser-3.76.tar.gz
 
 # computed by scancpan
 sha256  0e57338bc10d5fb8891012ebee65a7b504b247f5bb485e121b8b48d7a118a60b  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 93e4f6745b..097564dbcb 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.75
+PERL_HTML_PARSER_VERSION = 3.76
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
-PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPOEIRAB
+PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_PARSER_LICENSE_FILES = LICENSE
 PERL_HTML_PARSER_DISTNAME = HTML-Parser
