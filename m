From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:49 -0700
Subject: [Buildroot] [PATCH 17/17] perl-termreadkey: new package
In-Reply-To: <20180811182749.20924-1-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
Message-ID: <20180811182749.20924-18-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-termreadkey/Config.in             | 10 ++++++++++
 package/perl-termreadkey/perl-termreadkey.hash |  6 ++++++
 package/perl-termreadkey/perl-termreadkey.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/perl-termreadkey/Config.in
 create mode 100644 package/perl-termreadkey/perl-termreadkey.hash
 create mode 100644 package/perl-termreadkey/perl-termreadkey.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e04058a37e..dddb9ca60d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -506,6 +506,7 @@ F:	package/perl-params-util
 F:	package/perl-sub-install
 F:	package/perl-sys-meminfo
 F:	package/perl-sys-mmap
+F:	package/perl-termreadkey
 F:	package/perl-template-toolkit
 F:	package/perl-time-parsedate
 F:	package/perl-x10
diff --git a/package/Config.in b/package/Config.in
index 5585ebcdfa..2b36b477c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -734,6 +734,7 @@ menu "Perl libraries/modules"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-sys-mmap/Config.in"
+	source "package/perl-termreadkey/Config.in"
 	source "package/perl-template-toolkit/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-time-parsedate/Config.in"
diff --git a/package/perl-termreadkey/Config.in b/package/perl-termreadkey/Config.in
new file mode 100644
index 0000000000..7157bb6f68
--- /dev/null
+++ b/package/perl-termreadkey/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_TERMREADKEY
+	bool "perl-termreadkey"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Change terminal modes, and perform non-blocking reads.
+
+	  https://metacpan.org/release/TermReadKey
+
+comment "perl-termreadkey needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-termreadkey/perl-termreadkey.hash b/package/perl-termreadkey/perl-termreadkey.hash
new file mode 100644
index 0000000000..168e37223c
--- /dev/null
+++ b/package/perl-termreadkey/perl-termreadkey.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e8ea15c16333ac4f8d146d702e83cc0c TermReadKey-2.37.tar.gz
+sha256 4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db682db241 TermReadKey-2.37.tar.gz
+
+# computed by scancpan
+sha256 9deb4e80e04cca282a98902939225bf0bedac2e04034df5dba80f12bd0a3be26 README
diff --git a/package/perl-termreadkey/perl-termreadkey.mk b/package/perl-termreadkey/perl-termreadkey.mk
new file mode 100644
index 0000000000..ba2193b66b
--- /dev/null
+++ b/package/perl-termreadkey/perl-termreadkey.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-termreadkey
+#
+################################################################################
+
+PERL_TERMREADKEY_VERSION = 2.37
+PERL_TERMREADKEY_SOURCE = TermReadKey-$(PERL_TERMREADKEY_VERSION).tar.gz
+PERL_TERMREADKEY_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JS/JSTOWE
+PERL_TERMREADKEY_LICENSE = Artistic or GPL-1.0+
+PERL_TERMREADKEY_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.14.4
