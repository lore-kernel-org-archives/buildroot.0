From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:36:36 +0200
Subject: [Buildroot] [git commit] perl-http-multipartparser: new package
Message-ID: <20181008083554.19E118E1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32fa57d1eebb5c84b65095f7a1a77b6e769fabf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                           |  1 +
 package/perl-http-multipartparser/Config.in                 |  6 ++++++
 .../perl-http-multipartparser.hash                          |  6 ++++++
 .../perl-http-multipartparser/perl-http-multipartparser.mk  | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0b9a0cb96d..d768cb0bb5 100644
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
index 0000000000..70b89a3870
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
index 0000000000..079c02f60b
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
index 0000000000..aa8b69ad0f
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
