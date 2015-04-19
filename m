From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:17:10 +0200
Subject: [Buildroot] [PATCH v2 15/25] package/perl-http-negotiate: New
	package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-16-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                    |    1 +
 package/perl-http-negotiate/Config.in                |    9 +++++++++
 package/perl-http-negotiate/perl-http-negotiate.hash |    3 +++
 package/perl-http-negotiate/perl-http-negotiate.mk   |   14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-http-negotiate/Config.in
 create mode 100644 package/perl-http-negotiate/perl-http-negotiate.hash
 create mode 100644 package/perl-http-negotiate/perl-http-negotiate.mk

diff --git a/package/Config.in b/package/Config.in
index c74d848..e09beaa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -516,6 +516,7 @@ menu "Perl libraries/modules"
 	source "package/perl-http-daemon/Config.in"
 	source "package/perl-http-date/Config.in"
 	source "package/perl-http-message/Config.in"
+	source "package/perl-http-negotiate/Config.in"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
new file mode 100644
index 0000000..2b7f7b9
--- /dev/null
+++ b/package/perl-http-negotiate/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
+	bool "perl-http-negotiate"
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE
+	help
+	  This module provides a complete implementation of the HTTP content
+	  negotiation algorithm specified in draft-ietf-http-v11-spec-00.ps
+	  chapter 12.
+
+	  http://github.com/gisle/http-negotiate
diff --git a/package/perl-http-negotiate/perl-http-negotiate.hash b/package/perl-http-negotiate/perl-http-negotiate.hash
new file mode 100644
index 0000000..f1db2ff
--- /dev/null
+++ b/package/perl-http-negotiate/perl-http-negotiate.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    1236195250e264d7436e7bb02031671b HTTP-Negotiate-6.01.tar.gz
+sha256 1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016 HTTP-Negotiate-6.01.tar.gz
diff --git a/package/perl-http-negotiate/perl-http-negotiate.mk b/package/perl-http-negotiate/perl-http-negotiate.mk
new file mode 100644
index 0000000..569ed2b
--- /dev/null
+++ b/package/perl-http-negotiate/perl-http-negotiate.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-http-negotiate
+#
+################################################################################
+
+PERL_HTTP_NEGOTIATE_VERSION = 6.01
+PERL_HTTP_NEGOTIATE_SOURCE = HTTP-Negotiate-$(PERL_HTTP_NEGOTIATE_VERSION).tar.gz
+PERL_HTTP_NEGOTIATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_NEGOTIATE_DEPENDENCIES = perl-http-message
+PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPLv1+
+PERL_HTTP_NEGOTIATE_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4
