From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:22:33 +0200
Subject: [Buildroot] [git commit] perl-http-entity-parser: new package
Message-ID: <20181008143840.459348E362@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33a50b1d16ec1829142804dc01e890adec7f6339
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                    |  1 +
 package/perl-http-entity-parser/Config.in            | 11 +++++++++++
 .../perl-http-entity-parser.hash                     |  6 ++++++
 .../perl-http-entity-parser.mk                       | 20 ++++++++++++++++++++
 4 files changed, 38 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 309a9cfecc..a3f971aa55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -707,6 +707,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-cookies/Config.in"
 	source "package/perl-http-daemon/Config.in"
 	source "package/perl-http-date/Config.in"
+	source "package/perl-http-entity-parser/Config.in"
 	source "package/perl-http-message/Config.in"
 	source "package/perl-http-multipartparser/Config.in"
 	source "package/perl-http-negotiate/Config.in"
diff --git a/package/perl-http-entity-parser/Config.in b/package/perl-http-entity-parser/Config.in
new file mode 100644
index 0000000000..41883ac017
--- /dev/null
+++ b/package/perl-http-entity-parser/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_HTTP_ENTITY_PARSER
+	bool "perl-http-entity-parser"
+	select BR2_PACKAGE_PERL_HTTP_MULTIPARTPARSER
+	select BR2_PACKAGE_PERL_HASH_MULTIVALUE
+	select BR2_PACKAGE_PERL_JSON_MAYBEXS
+	select BR2_PACKAGE_PERL_STREAM_BUFFERED
+	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED
+	help
+	  PSGI compliant HTTP Entity Parser
+
+	  https://github.com/kazeburo/HTTP-Entity-Parser
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.hash b/package/perl-http-entity-parser/perl-http-entity-parser.hash
new file mode 100644
index 0000000000..cb6657413a
--- /dev/null
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    50e8418bfe27ab26818ca6e264052c95 HTTP-Entity-Parser-0.21.tar.gz
+sha256 c14d3e42bdb0845eb412640ca5e396cbd52d3a9a616a5974a32a52cab487f8d8 HTTP-Entity-Parser-0.21.tar.gz
+
+# computed by scancpan
+sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
new file mode 100644
index 0000000000..980ee92fa3
--- /dev/null
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# perl-http-entity-parser
+#
+################################################################################
+
+PERL_HTTP_ENTITY_PARSER_VERSION = 0.21
+PERL_HTTP_ENTITY_PARSER_SOURCE = HTTP-Entity-Parser-$(PERL_HTTP_ENTITY_PARSER_VERSION).tar.gz
+PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = \
+	host-perl-module-build-tiny \
+	perl-http-multipartparser \
+	perl-hash-multivalue \
+	perl-json-maybexs \
+	perl-stream-buffered \
+	perl-www-form-urlencoded
+PERL_HTTP_ENTITY_PARSER_LICENSE = Artistic or GPL-1.0+
+PERL_HTTP_ENTITY_PARSER_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
