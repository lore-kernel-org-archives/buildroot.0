From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:46 -0700
Subject: [Buildroot] [PATCH 14/17] perl-x10: new package
In-Reply-To: <20180811182749.20924-1-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
Message-ID: <20180811182749.20924-15-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/perl-x10/Config.in     | 13 +++++++++++++
 package/perl-x10/perl-x10.hash |  6 ++++++
 package/perl-x10/perl-x10.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/perl-x10/Config.in
 create mode 100644 package/perl-x10/perl-x10.hash
 create mode 100644 package/perl-x10/perl-x10.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1a4eb9d5e4..d056cadf1f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -506,6 +506,7 @@ F:	package/perl-sys-meminfo
 F:	package/perl-sys-mmap
 F:	package/perl-template-toolkit
 F:	package/perl-time-parsedate
+F:	package/perl-x10
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 6ce5ccd080..4cedcec11a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -739,6 +739,7 @@ menu "Perl libraries/modules"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-uri/Config.in"
 	source "package/perl-www-robotrules/Config.in"
+	source "package/perl-x10/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax/Config.in"
diff --git a/package/perl-x10/Config.in b/package/perl-x10/Config.in
new file mode 100644
index 0000000000..984a561b05
--- /dev/null
+++ b/package/perl-x10/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PERL_X10
+	bool "perl-x10"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_ASTRO_SUNTIME
+	select BR2_PACKAGE_PERL_DEVICE_SERIALPORT
+	select BR2_PACKAGE_PERL_TIME_PARSEDATE
+	help
+	  creates a server used to receive events from an x10 client
+
+	  https://metacpan.org/release/X10
+
+comment "perl-x10 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-x10/perl-x10.hash b/package/perl-x10/perl-x10.hash
new file mode 100644
index 0000000000..5411390e3e
--- /dev/null
+++ b/package/perl-x10/perl-x10.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    20dcca2dfb978bfed3043276aa3481e5 X10-0.04.tar.gz
+sha256 3dcee9d95614b2db70de608e933d42817f93fccd5b1f2f782b0846af487d9134 X10-0.04.tar.gz
+
+# computed by scancpan
+sha256 e6f320afa82517d663be348dd2515ecb1454a7c851ba5590f13aca01d219be80 README
diff --git a/package/perl-x10/perl-x10.mk b/package/perl-x10/perl-x10.mk
new file mode 100644
index 0000000000..783fad3143
--- /dev/null
+++ b/package/perl-x10/perl-x10.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-x10
+#
+################################################################################
+
+PERL_X10_VERSION = 0.04
+PERL_X10_SOURCE = X10-$(PERL_X10_VERSION).tar.gz
+PERL_X10_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
+PERL_X10_DEPENDENCIES = perl-astro-suntime perl-device-serialport perl-time-parsedate
+PERL_X10_LICENSE = gpl_3
+PERL_X10_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.14.4
