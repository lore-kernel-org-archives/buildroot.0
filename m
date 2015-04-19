From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 13:43:45 +0200
Subject: [Buildroot] [git commit] package/perl-mime-base64: New package
Message-ID: <20150419114640.B4B497FB0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90c62ef5d91a847bc3a76ec3af4c57e41ebf5707
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                              |    1 +
 package/perl-mime-base64/Config.in             |    7 +++++++
 package/perl-mime-base64/perl-mime-base64.hash |    3 +++
 package/perl-mime-base64/perl-mime-base64.mk   |   14 ++++++++++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8db52ab..27d06cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -522,6 +522,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
+	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
diff --git a/package/perl-mime-base64/Config.in b/package/perl-mime-base64/Config.in
new file mode 100644
index 0000000..7e4858f
--- /dev/null
+++ b/package/perl-mime-base64/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_MIME_BASE64
+	bool "perl-mime-base64"
+	help
+	  This package contains a base64 encoder/decoder and a quoted-printable
+	  encoder/decoder.
+
+	  http://github.com/gisle/mime-base64
diff --git a/package/perl-mime-base64/perl-mime-base64.hash b/package/perl-mime-base64/perl-mime-base64.hash
new file mode 100644
index 0000000..0cfe598
--- /dev/null
+++ b/package/perl-mime-base64/perl-mime-base64.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    ef958dc2bf96be5f759391c6ac1debd4 MIME-Base64-3.15.tar.gz
+sha256 7f863566a6a9cb93eda93beadb77d9aa04b9304d769cea3bb921b9a91b3a1eb9 MIME-Base64-3.15.tar.gz
diff --git a/package/perl-mime-base64/perl-mime-base64.mk b/package/perl-mime-base64/perl-mime-base64.mk
new file mode 100644
index 0000000..abb2704
--- /dev/null
+++ b/package/perl-mime-base64/perl-mime-base64.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mime-base64
+#
+################################################################################
+
+PERL_MIME_BASE64_VERSION = 3.15
+PERL_MIME_BASE64_SOURCE = MIME-Base64-$(PERL_MIME_BASE64_VERSION).tar.gz
+PERL_MIME_BASE64_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_MIME_BASE64_DEPENDENCIES = perl
+PERL_MIME_BASE64_LICENSE = Artistic or GPLv1+
+PERL_MIME_BASE64_LICENSE_FILES = README
+
+$(eval $(perl-package))
