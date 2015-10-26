From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 22:56:05 +0100
Subject: [Buildroot] [git commit] scancpan: README as default license file
Message-ID: <20151026215921.92A0881EAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2aff3d7f5446a3d59bd9a61a93a352f9ab59d40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

add this heuristic when no specific license file is found

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-db-file/perl-db-file.mk               |    1 +
 package/perl-digest-sha1/perl-digest-sha1.mk       |    1 +
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   |    1 +
 package/perl-mail-dkim/perl-mail-dkim.mk           |    1 +
 package/perl-mailtools/perl-mailtools.mk           |    1 +
 package/perl-timedate/perl-timedate.mk             |    1 +
 .../perl-xml-namespacesupport.mk                   |    1 +
 package/perl-xml-sax-base/perl-xml-sax-base.mk     |    1 +
 support/scripts/scancpan                           |    3 +++
 9 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/perl-db-file/perl-db-file.mk b/package/perl-db-file/perl-db-file.mk
index 1011632..6d611ea 100644
--- a/package/perl-db-file/perl-db-file.mk
+++ b/package/perl-db-file/perl-db-file.mk
@@ -9,5 +9,6 @@ PERL_DB_FILE_SOURCE = DB_File-$(PERL_DB_FILE_VERSION).tar.gz
 PERL_DB_FILE_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PM/PMQS
 PERL_DB_FILE_DEPENDENCIES = berkeleydb
 PERL_DB_FILE_LICENSE = Artistic or GPLv1+
+PERL_DB_FILE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-digest-sha1/perl-digest-sha1.mk b/package/perl-digest-sha1/perl-digest-sha1.mk
index 1d7601b..52b9ec3 100644
--- a/package/perl-digest-sha1/perl-digest-sha1.mk
+++ b/package/perl-digest-sha1/perl-digest-sha1.mk
@@ -8,5 +8,6 @@ PERL_DIGEST_SHA1_VERSION = 2.13
 PERL_DIGEST_SHA1_SOURCE = Digest-SHA1-$(PERL_DIGEST_SHA1_VERSION).tar.gz
 PERL_DIGEST_SHA1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_DIGEST_SHA1_LICENSE = Artistic or GPLv1+
+PERL_DIGEST_SHA1_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index fcf914c..a75d8af 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -9,5 +9,6 @@ PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPLv1+
+PERL_IO_SOCKET_SSL_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 8c7926f..03a3b74 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -8,5 +8,6 @@ PERL_MAIL_DKIM_VERSION = 0.40
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JA/JASLONG
 PERL_MAIL_DKIM_DEPENDENCIES = perl-crypt-openssl-rsa perl-mailtools perl-net-dns
+PERL_MAIL_DKIM_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index 88f3a9f..d3c049d 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -9,5 +9,6 @@ PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_DEPENDENCIES = perl-timedate
 PERL_MAILTOOLS_LICENSE = Artistic or GPLv1+
+PERL_MAILTOOLS_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index b7fcd08..4c594fb 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -8,5 +8,6 @@ PERL_TIMEDATE_VERSION = 2.30
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
 PERL_TIMEDATE_LICENSE = Artistic or GPLv1+
+PERL_TIMEDATE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index 727b9b8..31b71c1 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -8,5 +8,6 @@ PERL_XML_NAMESPACESUPPORT_VERSION = 1.11
 PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPPORT_VERSION).tar.gz
 PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN
 PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPLv1+
+PERL_XML_NAMESPACESUPPORT_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
index de47ea4..60dec31 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.mk
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -8,5 +8,6 @@ PERL_XML_SAX_BASE_VERSION = 1.08
 PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
 PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_BASE_LICENSE = Artistic or GPLv1+
+PERL_XML_SAX_BASE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 1835fea..0436d2a 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -544,6 +544,9 @@ sub find_license_files {
         next if m|/|;
         push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE)/i;
     }
+    if (scalar @license_files == 0 && $manifest =~ m/(README)[\n\s]/i) {
+        @license_files = ($1);
+    }
     return \@license_files;
 }
 
