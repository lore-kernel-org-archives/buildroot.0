From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:10 +0200
Subject: [Buildroot] [PATCH 06/20] perl-http-multiparser: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                   |  1 +
 package/perl-http-multipartparser/Config.in         |  6 ++++++
 .../perl-http-multipartparser.hash                  |  6 ++++++
 .../perl-http-multipartparser.mk                    | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-http-multipartparser/Config.in
 create mode 100644 package/perl-http-multipartparser/perl-http-multipartparser.hash
 create mode 100644 package/perl-http-multipartparser/perl-http-multipartparser.mk

diff --git a/package/Config.in b/package/Config.in
index 3e585cdd0..8853fb795 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -706,6 +706,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-daemon/Config.in"
 	source "package/perl-http-date/Config.in"
 	source "package/perl-http-message/Config.in"
+	source "package/perl-http-multipartparser/Config.in"
 	source "package/perl-http-negotiate/Config.in"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-interface/Config.in"
diff --git a/package/perl-http-multipartparser/Config.in b/package/perl-http-multipartparser/Config.in
new file mode 100644
index 000000000..70b89a387
--- /dev/null
+++ b/package/perl-http-multipartparser/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_HTTP_MULTIPARTPARSER
+	bool "perl-http-multipartparser"
+	help
+	  HTTP MultiPart Parser
+
+	  https://metacpan.org/release/HTTP-MultiPartParser
diff --git a/package/perl-http-multipartparser/perl-http-multipartparser.hash b/package/perl-http-multipartparser/perl-http-multipartparser.hash
new file mode 100644
index 000000000..079c02f60
--- /dev/null
+++ b/package/perl-http-multipartparser/perl-http-multipartparser.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    1b07ebac54ce3288c044a23ba60196d2 HTTP-MultiPartParser-0.02.tar.gz
+sha256 5eddda159f54d16f868e032440ac2b024e55aac48931871b62627f1a16d00b12 HTTP-MultiPartParser-0.02.tar.gz
+
+# computed by scancpan
+sha256 a339d6cf9253720ba69b311423556cc02c94d5a6f76cf5cdf11af2112e14a074 README
diff --git a/package/perl-http-multipartparser/perl-http-multipartparser.mk b/package/perl-http-multipartparser/perl-http-multipartparser.mk
new file mode 100644
index 000000000..aa8b69ad0
--- /dev/null
+++ b/package/perl-http-multipartparser/perl-http-multipartparser.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-http-multipartparser
+#
+################################################################################
+
+PERL_HTTP_MULTIPARTPARSER_VERSION = 0.02
+PERL_HTTP_MULTIPARTPARSER_SOURCE = HTTP-MultiPartParser-$(PERL_HTTP_MULTIPARTPARSER_VERSION).tar.gz
+PERL_HTTP_MULTIPARTPARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHANSEN
+PERL_HTTP_MULTIPARTPARSER_LICENSE = Artistic or GPL-1.0+
+PERL_HTTP_MULTIPARTPARSER_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.17.1
