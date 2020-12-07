From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  7 Dec 2020 11:04:39 +0100
Subject: [Buildroot] [PATCH 2/3] package/perl-devel-size: new package
In-Reply-To: <20201207100443.13727-1-patrickdepinguin@gmail.com>
References: <20201207100443.13727-1-patrickdepinguin@gmail.com>
Message-ID: <20201207100443.13727-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-devel-size/Config.in            | 11 +++++++++++
 package/perl-devel-size/perl-devel-size.hash |  6 ++++++
 package/perl-devel-size/perl-devel-size.mk   | 14 ++++++++++++++
 5 files changed, 33 insertions(+)
 create mode 100644 package/perl-devel-size/Config.in
 create mode 100644 package/perl-devel-size/perl-devel-size.hash
 create mode 100644 package/perl-devel-size/perl-devel-size.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6cd52c07c5..fceea601ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2510,6 +2510,7 @@ F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-crypt-openssl-aes/
 F:	package/perl-devel-cycle/
+F:	package/perl-devel-size/
 F:	package/perl-i18n/
 F:	package/perl-locale-maketext-lexicon/
 F:	package/perl-lwp-protocol-https/
diff --git a/package/Config.in b/package/Config.in
index 9eddd3ec01..7f3ffc6093 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -741,6 +741,7 @@ menu "Perl libraries/modules"
 	source "package/perl-dbi/Config.in"
 	source "package/perl-devel-cycle/Config.in"
 	source "package/perl-devel-globaldestruction/Config.in"
+	source "package/perl-devel-size/Config.in"
 	source "package/perl-devel-stacktrace/Config.in"
 	source "package/perl-devel-stacktrace-ashtml/Config.in"
 	source "package/perl-device-serialport/Config.in"
diff --git a/package/perl-devel-size/Config.in b/package/perl-devel-size/Config.in
new file mode 100644
index 0000000000..b545cf1844
--- /dev/null
+++ b/package/perl-devel-size/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_DEVEL_SIZE
+	bool "perl-devel-size"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Perl extension for finding the memory usage of Perl
+	  variables.
+
+	  https://metacpan.org/release/Devel-Size
+
+comment "perl-devel-size needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-devel-size/perl-devel-size.hash b/package/perl-devel-size/perl-devel-size.hash
new file mode 100644
index 0000000000..c0fbcf29c5
--- /dev/null
+++ b/package/perl-devel-size/perl-devel-size.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  0b5335d69402c75d5ab9978027ae2f66  Devel-Size-0.83.tar.gz
+sha256  757a67e0aa59ae103ea5ca092cbecc025644ebdc326731688ffab6f8823ef4b3  Devel-Size-0.83.tar.gz
+
+# computed by scancpan
+sha256  fca4ebe3a1f329aa33a4d259c0a5b136a15a40b987c60c2dd6f1007bb01a1513  README
diff --git a/package/perl-devel-size/perl-devel-size.mk b/package/perl-devel-size/perl-devel-size.mk
new file mode 100644
index 0000000000..9acc67c9ea
--- /dev/null
+++ b/package/perl-devel-size/perl-devel-size.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-devel-size
+#
+################################################################################
+
+PERL_DEVEL_SIZE_VERSION = 0.83
+PERL_DEVEL_SIZE_SOURCE = Devel-Size-$(PERL_DEVEL_SIZE_VERSION).tar.gz
+PERL_DEVEL_SIZE_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NW/NWCLARK
+PERL_DEVEL_SIZE_LICENSE = Artistic or GPL-1.0+
+PERL_DEVEL_SIZE_LICENSE_FILES = README
+PERL_DEVEL_SIZE_DISTNAME = Devel-Size
+
+$(eval $(perl-package))
-- 
2.26.2
