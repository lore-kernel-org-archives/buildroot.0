From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:44 +0200
Subject: [Buildroot] [git commit] package/perl-http-message: New package
Message-ID: <20150419114640.652927FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=27e4a433b44b63d91f24bfa2a475386d0cd54356
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/perl-http-message/Config.in              |   12 ++++++++++++
 package/perl-http-message/perl-http-message.hash |    3 +++
 package/perl-http-message/perl-http-message.mk   |   19 +++++++++++++++++++
 4 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3da9973..2c6fd9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,6 +513,7 @@ menu "Perl libraries/modules"
 	source "package/perl-html-parser/Config.in"
 	source "package/perl-html-tagset/Config.in"
 	source "package/perl-http-date/Config.in"
+	source "package/perl-http-message/Config.in"
 	source "package/perl-io-html/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
new file mode 100644
index 0000000..9dda1ee
--- /dev/null
+++ b/package/perl-http-message/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_HTTP_MESSAGE
+	bool "perl-http-message"
+	select BR2_PACKAGE_PERL_ENCODE_LOCALE
+	select BR2_PACKAGE_PERL_HTTP_DATE
+	select BR2_PACKAGE_PERL_IO_HTML
+	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
+	select BR2_PACKAGE_PERL_URI
+	help
+	  The HTTP-Message distribution contains classes useful for representing
+	  the messages passed in HTTP style communication.
+
+	  https://github.com/libwww-perl/http-message
diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
new file mode 100644
index 0000000..ff6268d
--- /dev/null
+++ b/package/perl-http-message/perl-http-message.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e563ac516e28d33f65bc0f295f625f85 HTTP-Message-6.06.tar.gz
+sha256 087e97009c5239dca4631cf433d836771b3fc5ba5685eef1965f9d3415cbad63 HTTP-Message-6.06.tar.gz
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
new file mode 100644
index 0000000..12eda90
--- /dev/null
+++ b/package/perl-http-message/perl-http-message.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# perl-http-message
+#
+################################################################################
+
+PERL_HTTP_MESSAGE_VERSION = 6.06
+PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
+PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTTP_MESSAGE_LICENSE = Artistic or GPLv1+
+PERL_HTTP_MESSAGE_LICENSE_FILES = README
+PERL_HTTP_MESSAGE_DEPENDENCIES = \
+	perl-encode-locale \
+	perl-http-date \
+	perl-io-html \
+	perl-lwp-mediatypes \
+	perl-uri
+
+$(eval $(perl-package))
